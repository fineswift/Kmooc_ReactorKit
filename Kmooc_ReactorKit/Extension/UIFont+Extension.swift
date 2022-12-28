//
//  UIFont+Extension.swift
//  Kmooc_ReactorKit
//
//  Created by 허광호 on 2022/12/27.
//

import UIKit

extension UIFont {
    enum Style: String {
        case regular = "NotoSansKR-Regular"
        case medium = "NotoSansKR-Medium"
        case bold = "NotoSansKR-Bold"
    }
    
    static func notoSans(_ style: Style = .regular, size: CGFloat) -> UIFont {
        return UIFont(name: style.rawValue, size: size)!
    }
}
