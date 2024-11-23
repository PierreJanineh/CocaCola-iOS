//
//  Font+CustomFont.swift
//  CocaCola
//
//  Created by Pierre Janineh on 22/11/2024.
//

import SwiftUI

extension Font {
    static func customFont(size: CGFloat, weight: FontWeight = .Regular) -> Font {
        return .custom(Constants.Strings.FONT.appending(weight.rawValue), size: size)
    }
    
    static let customTitle = customFont(size: 28, weight: .Bold)
    static let customHeadline = customFont(size: 20, weight: .Bold)
    static let customSubheadline = customFont(size: 15, weight: .Bold)
    static let customBody = customFont(size: 16)
    static let customCaption = customFont(size: 12)
}

enum FontWeight: String {
    case Regular, Bold, Black
}
