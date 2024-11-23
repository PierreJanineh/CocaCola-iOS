//
//  PagingView+EndlessScrollController.swift
//  CocaCola
//
//  Created by Pierre Janineh on 23/11/2024.
//

import SwiftUI

extension PagingView {
    final class EndlessScrollController {
        typealias D = Constants.Dimensions.PagingView
        
        private let itemSize: CGSize
        private let spacing: CGFloat
        private let contentCount: Int
        
        private(set) var isRepositioning = false
        
        init(itemSize: CGSize, spacing: CGFloat, contentCount: Int) {
            self.itemSize = itemSize
            self.spacing = spacing
            self.contentCount = contentCount
        }
        
        func repositionIfNeeded(_ scrollView: UIScrollView) {
            let pageWidth = itemSize.width + spacing
            let currentOffset = scrollView.contentOffset.x
            let sectionSize = pageWidth * CGFloat(contentCount / D.BUFFER_MULTIPLIER)
            
            guard currentOffset < sectionSize * D.REPOSITION_THRESHOLD else { return }
            
            isRepositioning = true
            let targetOffset = currentOffset.truncatingRemainder(dividingBy: sectionSize) + sectionSize
            
            scrollView.setContentOffset(CGPoint(x: targetOffset, y: 0), animated: false)
            scrollView.layoutIfNeeded()
            isRepositioning = false
        }
    }
}
