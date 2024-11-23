//
//  PagingView+PagingSnapBehavior.swift
//  CocaCola
//
//  Created by Pierre Janineh on 23/11/2024.
//

import SwiftUI

extension PagingView {
    final class PagingSnapBehavior {
        private let itemSize: CGSize
        private let spacing: CGFloat
        
        init(itemSize: CGSize, spacing: CGFloat) {
            self.itemSize = itemSize
            self.spacing = spacing
        }
        
        func calculateTargetOffset(for offsetX: CGFloat) -> CGPoint {
            let pageWidth = itemSize.width + spacing
            let proportionalOffset = offsetX / pageWidth
            let indexFloat = proportionalOffset.rounded()
            let nextIndex = Int(indexFloat)
            
            return CGPoint(x: CGFloat(nextIndex) * pageWidth, y: 0)
        }
    }
}
