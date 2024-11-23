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
        
        struct BottomAppBar {
            static let BTN_W: CGFloat = 56
            static let FAB_IC_W: CGFloat = 53
            static let SHADOW: CGFloat = 5
            static let BAR_PADDING: CGFloat = 16
        }
        
        struct BottomAppBarShape {
            // Slightly larger than FAB for padding
            static let FAB_RADIUS: CGFloat = 33
            static let BOTTOM_CONTROL_X: CGFloat = 40
            static let BOTTOM_CONTROL_Y: CGFloat = 0
            static let TOP_CONTROL_X: CGFloat = 40
            static let TOP_CONTROL_Y: CGFloat = 0
            static let CURVE_OFFSET: CGFloat = 0
            static let SPREAD: CGFloat = 1.7
        }
        
        struct PointsView {
            static let IC_W: CGFloat = 15
        }
        
        struct TopAppBar {
            static let BAR_H: CGFloat = 80
            static let PADDING: CGFloat = 20
            static let PROFILE_IMG_PADDING: CGFloat = 5
            static let POINTS_SPACE: CGFloat = 5
        }
    }
}
