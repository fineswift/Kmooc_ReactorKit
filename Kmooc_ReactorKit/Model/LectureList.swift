//
//  LectureList.swift
//  Kmooc_ReactorKit
//
//  Created by 허광호 on 2022/12/27.
//

import Foundation

struct LectureList: Decodable {
    var count: Int?
    var numPages: Int?
    var previous: String?
    var next: String?
    var lectures: [Lecture]?
}
