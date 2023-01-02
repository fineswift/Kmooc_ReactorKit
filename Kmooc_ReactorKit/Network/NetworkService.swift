//
//  NetworkService.swift
//  Kmooc_ReactorKit
//
//  Created by 허광호 on 2022/12/28.
//

import Foundation
import RxSwift
import Alamofire

class NetworkService {
    static let shared = NetworkService()
    
    let baseUrl = "http://apis.data.go.kr/B552881/kmooc"
    let serviceKey = "E6Z%2BQ4XLKM5o2qxNeecdD14gTSq14vQa%2FhdUKsNI%2BfsW18cMs3CR1FVovkFlfCjsh2xpDbpMfJzrliYSYseCdg%3D%3D"
}

extension NetworkService {
    func getJson(path: String, params: [String: Any], completed: @escaping (Result<String, Error>) -> Void) {
        DispatchQueue.global(qos: .background).async {
            let queryParams = params.map { key, value in "\(key)=\(value)" }.joined(separator: "&")
            
            var fullPath = path.hasPrefix("http") ? path : self.baseUrl + path
            if !queryParams.isEmpty {
                fullPath += "?" + queryParams
            }
            
            do {
                let url = URL(string: fullPath)
                let json = try String(contentsOf: url!, encoding: .utf8)
                DispatchQueue.main.async {
                    completed(Result.success(json))
                }
            } catch {
                DispatchQueue.main.async {
                    completed(Result.failure(error))
                }
            }
        }
    }
    
    func list(completed: @escaping (LectureList) -> Void) {
        getJson(path: "/courseList", params: ["serviceKey": serviceKey, "Mobile": 1]) { result in
            if let json = try? result.get() {
                completed(self.parseLectureList(self.jsonObject(json)))
            }
        }
    }
    
    func next(currentPage: LectureList, completed: @escaping (LectureList) -> Void) {
        let nextPageUrl = currentPage.next
        getJson(path: nextPageUrl!, params: [:]) { result in
            if let json = try? result.get() {
                completed(self.parseLectureList(self.jsonObject(json)))
            }
        }
    }
    
    func detail(couresId: String, completed: @escaping (Lecture) -> Void) {
        getJson(path: "/courseDetail", params: ["CourseId": couresId, "serviceKey": serviceKey]) { result in
            if let json = try? result.get() {
                completed(self.paresLecture(self.jsonObject(json)))
            }
        }
    }
    
    func jsonObject(_ json: String) -> [String: Any] {
        let data = json.data(using: .utf8)!
        return try! JSONSerialization.jsonObject(with: data) as! [String: Any]
    }
    
    func parseLectureList(_ jsonObject: [String: Any]) -> LectureList {
        return LectureList(count: (jsonObject["pagination"] as! [String: Any])["count"] as? Int,
                           numPages: (jsonObject["pagination"] as! [String: Any])["num_Pages"] as? Int,
                           previous: (jsonObject["pagination"] as! [String: Any])["previous"] as? String,
                           next: (jsonObject["pagination"] as! [String: Any])["next"] as? String,
                           lectures: (jsonObject["results"] as! [[String: Any]]).map(paresLecture))
    }
    
    func paresLecture(_ jsonObject: [String: Any]) -> Lecture {
        return Lecture(id: jsonObject["id"] as? String,
                       number: jsonObject["number"] as? String,
                       name: jsonObject["name"] as? String,
                       classfyName: jsonObject["classfy_name"] as? String,
                       middleClassfyName: jsonObject["middle_classfy"] as? String,
                       courseImage: ((jsonObject["media"] as! [String: Any])["image"] as! [String: Any])["small"] as? String,
                       courseImageLarge: ((jsonObject["media"] as! [String: Any])["image"] as! [String: Any])["large"] as? String,
                       shortDescription: jsonObject["short_description"] as? String,
                       orgName: jsonObject["org_name"] as? String,
                       start: Date().parseDate(jsonObject["start"] as! String),
                       end: Date().parseDate(jsonObject["end"] as! String),
                       teachers: jsonObject["teachers"] as? String,
                       overview: jsonObject["overview"] as? String)
    }
}
