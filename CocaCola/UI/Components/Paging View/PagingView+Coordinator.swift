//
//  PagingView+Coordinator.swift
//  CocaCola
//
//  Created by Pierre Janineh on 23/11/2024.
//

import SwiftUI

extension PagingView {
    class Coordinator: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {
        private let snapBehavior: PagingSnapBehavior
        private let scaleAnimator: PagingScaleAnimator
        private let endlessController: EndlessScrollController
        private let pageTracker: PageTracker
        
        var parent: PagingView
        weak var collectionView: UICollectionView?
        
        init(_ parent: PagingView) {
            self.parent = parent
            self.snapBehavior = PagingSnapBehavior(itemSize: parent.itemSize, spacing: parent.spacing)
            self.scaleAnimator = PagingScaleAnimator()
            self.endlessController = EndlessScrollController(
                itemSize: parent.itemSize,
                spacing: parent.spacing,
                contentCount: parent.content.count
            )
            self.pageTracker = PageTracker(initialPage: parent.currentPage) { newPage in
                parent.currentPage = newPage
            }
            super.init()
        }
        
        // MARK: - UICollectionViewDataSource
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            configureCellContent(cell, at: indexPath)
            return cell
        }
        
        private func configureCellContent(_ cell: UICollectionViewCell, at indexPath: IndexPath) {
            cell.contentView.subviews.forEach { $0.removeFromSuperview() }
            
            let host = UIHostingController(rootView: parent.content[indexPath.row])
            if let view = host.view {
                view.frame = cell.contentView.bounds
                view.backgroundColor = .clear
                cell.contentView.addSubview(view)
            }
        }
        
        // MARK: - UIScrollViewDelegate
        func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
            targetContentOffset.pointee = snapBehavior.calculateTargetOffset(for: targetContentOffset.pointee.x)
        }
        
        func scrollViewDidScroll(_ scrollView: UIScrollView) {
            guard let collectionView = collectionView,
                  !endlessController.isRepositioning else { return }
            
            endlessController.repositionIfNeeded(scrollView)
            
            let centerPoint = CGPoint(x: scrollView.contentOffset.x + scrollView.bounds.width / 2,
                                      y: scrollView.bounds.height / 2)
            
            if let indexPath = collectionView.indexPathForItem(at: centerPoint) {
                pageTracker.updateCurrentPage(for: indexPath)
            }
            
            scaleAnimator.updateCellTransforms(in: collectionView, scrollView: scrollView, centerPoint: centerPoint)
        }
        
        // MARK: - UICollectionViewDataSource
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return parent.content.count
        }
    }
}
