//
//  PagingView+PageScaleAnimator.swift
//  CocaCola
//
//  Created by Pierre Janineh on 23/11/2024.
//

import SwiftUI

extension PagingView {
    final class PagingScaleAnimator {
        typealias D = Constants.Dimensions.PagingView
        
        func updateCellTransforms(in collectionView: UICollectionView, scrollView: UIScrollView, centerPoint: CGPoint) {
            collectionView.visibleCells.forEach { cell in
                let distance = abs(cell.center.x - centerPoint.x)
                let scale = calculateScale(distance: distance, viewWidth: scrollView.bounds.width)
                
                cell.transform = CGAffineTransform(scaleX: scale, y: scale)
            }
        }
        
        private func calculateScale(distance: CGFloat, viewWidth: CGFloat) -> CGFloat {
            max(D.MAX_SCALE - (distance / viewWidth) * D.SCALE_MULTIPLIER, D.MIN_SCALE)
        }
    }
}
