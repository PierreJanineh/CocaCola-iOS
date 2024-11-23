//
//  HomeViewModel.swift
//  CocaCola
//
//  Created by Pierre Janineh on 23/11/2024.
//

import SwiftUI

extension HomeView {
    class ViewModel: ObservableObject {
        @Published var items: [SingleAd] = [
            .init(title: "Item 1", subtitle: "Subtitle 1"),
            .init(title: "Item 2", subtitle: "Subtitle 2"),
            .init(title: "Item 3", subtitle: "Subtitle 3"),
            .init(title: "Item 4", subtitle: "Subtitle 4")
        ]
    }
}
