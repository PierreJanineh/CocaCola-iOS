//
//  PagingView.swift
//  CocaCola
//
//  Created by Pierre Janineh on 23/11/2024.
//

import SwiftUI

struct PagingView<Content: View>: UIViewControllerRepresentable {
    @Binding var currentPage: Int
    let axis: Axis
    let itemSize: CGSize
    let parentSize: CGSize
    let spacing: CGFloat
    let content: [Content]
    
    init(currentPage: Binding<Int>,
         axis: Axis = .horizontal,
         itemSize: CGSize,
         parentSize: CGSize,
         spacing: CGFloat = 0,
         content: () -> [Content]) {
        self._currentPage = currentPage
        self.axis = axis
        self.itemSize = itemSize
        self.parentSize = parentSize
        self.spacing = spacing
        self.content = content()
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIViewController {
        let collectionView = createCollection(with: createLayout(), context: context)
        scrollToStart(of: collectionView, with: context)
        
        context.coordinator.collectionView = collectionView
        
        let viewController = UIViewController()
        viewController.view = collectionView
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        guard let _ = uiViewController.view as? UICollectionView else { return }
        context.coordinator.parent = self
    }
    
    private func createLayout() -> UICollectionViewFlowLayout {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = axis == .horizontal ? .horizontal : .vertical
        layout.itemSize = itemSize
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = 0
        
        let horizontalInset = (parentSize.width - itemSize.width) / 2
        layout.sectionInset = UIEdgeInsets(top: 0, left: horizontalInset, bottom: 0, right: horizontalInset)
        return layout
    }
    
    private func createCollection(with layout: UICollectionViewFlowLayout, context: Context) -> UICollectionView {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.isUserInteractionEnabled = true
        collectionView.bounces = true
        collectionView.delegate = context.coordinator
        collectionView.dataSource = context.coordinator
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.decelerationRate = .fast
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        
        return collectionView
    }
    
    private func scrollToStart(of collectionView: UICollectionView, with context: Context) {
        DispatchQueue.main.async {
            let leadingOffset = CGFloat(content.count - 1) * (itemSize.width + spacing)
            collectionView.setContentOffset(CGPoint(x: leadingOffset, y: 0), animated: false)
            collectionView.layoutIfNeeded()
            context.coordinator.scrollViewDidScroll(collectionView)
        }
    }
}
