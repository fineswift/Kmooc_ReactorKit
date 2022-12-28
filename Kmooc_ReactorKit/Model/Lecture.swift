//
//  Lecture.swift
//  Kmooc_ReactorKit
//
//  Created by 허광호 on 2022/12/27.
//

import Foundation

struct Lecture: Decodable {
    /// 아이디
    var id: String?
    /// 강좌 번호
    var number: String?
    /// 강좌명
    var name: String?
    /// 강좌 분류
    var classfyName: String?
    /// 강좌 분류2
    var middleClassfyName: String?
    /// 강좌 썸네일 (media>image>small)
    var couresImage: String?
    /// 강화 이미지 (media>image>large)
    var couresImageLarge: String?
    /// 짧은 설명
    var shortDescription: String?
    /// 운영 기관
    var orgName: String?
    /// 운영 기관 시작
    var start: Date?
    /// 운영 기관 종료
    var end: Date?
    /// 교수진
    var teachers: String?
    /// 상세 정보 (html)
    var overview: String?
}
