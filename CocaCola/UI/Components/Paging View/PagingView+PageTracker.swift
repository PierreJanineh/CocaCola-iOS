//
//  PagingView+PageTracker.swift
//  CocaCola
//
//  Created by Pierre Janineh on 23/11/2024.
//

import SwiftUI

extension PagingView {
    final class PageTracker {
        private var currentPage: Int
        private let onPageChange: (Int) -> Void
        
        init(initialPage: Int, onPageChange: @escaping (Int) -> Void) {
            self.currentPage = initialPage
            self.onPageChange = onPageChange
        }
        
        func updateCurrentPage(for indexPath: IndexPath) {
            guard currentPage != indexPath.row else { return }
            currentPage = indexPath.row
            onPageChange(currentPage)
        }
    }
}
