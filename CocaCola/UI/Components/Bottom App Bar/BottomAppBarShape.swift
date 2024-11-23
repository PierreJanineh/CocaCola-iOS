//
//  BottomAppBarShape.swift
//  CocaCola
//
//  Created by Pierre Janineh on 22/11/2024.
//

import SwiftUI

/// Custom shape for the bottom app bar with notch
struct BottomAppBarShape: Shape {
    typealias D = Constants.Dimensions.BottomAppBarShape
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height
        let centerX = width / 2
        let fabWidth = D.FAB_RADIUS * 2
        
        // P1
        path.move(to: CGPoint(x: 0, y: 0))
        
        // P2
        let curveStart = ((width - fabWidth * D.SPREAD) / 2)
        path.addLine(to: CGPoint(x: curveStart, y: 0))
        
        // P3
        let p3 = CGPoint(x: centerX, y: fabWidth / 2)
        path.addCurve(to: p3,
                      // C1
                      control1: CGPoint(x: curveStart + D.TOP_CONTROL_X,
                                        y: D.TOP_CONTROL_Y),
                      // C2
                      control2: CGPoint(x: p3.x - D.BOTTOM_CONTROL_X,
                                        y: p3.y - D.BOTTOM_CONTROL_Y))
        
        // P4
        let p4 = CGPoint(x: (width + fabWidth * D.SPREAD) / 2, y: 0)
        path.addCurve(to: p4,
                      // C3
                      control1: CGPoint(x: p3.x + D.BOTTOM_CONTROL_X,
                                        y: p3.y - D.BOTTOM_CONTROL_Y),
                      // C4
                      control2: CGPoint(x: p4.x - D.TOP_CONTROL_X,
                                        y: D.TOP_CONTROL_Y))
        
        // P5
        path.addLine(to: CGPoint(x: width, y: 0))
        
        // P6
        path.addLine(to: CGPoint(x: width, y: height))
        
        // P7
        path.addLine(to: CGPoint(x: 0, y: height))
        
        path.closeSubpath()
        
        return path
    }
}

#Preview {
    BottomAppBarShape()
}
