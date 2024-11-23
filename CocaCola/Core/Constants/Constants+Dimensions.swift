//
//  Constants+Dimensions.swift
//  CocaCola
//
//  Created by Pierre Janineh on 23/11/2024.
//

import SwiftUI

extension Constants {
    struct Dimensions {
        struct PagingView {
            static let MIN_SCALE: CGFloat = 0.7
            static let MAX_SCALE: CGFloat = 1.0
            static let REPOSITION_THRESHOLD: CGFloat = 0.5
            static let SCALE_MULTIPLIER: CGFloat = 0.2
            static let BUFFER_MULTIPLIER: Int = 2
        }
        
        struct CircularScrollView {
            static let WIDTH_MULTIPLIER: CGFloat = 0.8
            static let HEIGHT_MULTIPLIER: CGFloat = 0.6
        }
    }
}
