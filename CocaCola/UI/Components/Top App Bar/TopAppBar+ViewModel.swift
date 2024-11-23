//
//  TopAppBar+ViewModel.swift
//  CocaCola
//
//  Created by Pierre Janineh on 23/11/2024.
//

import Foundation

extension TopAppBar {
    class ViewModel: ObservableObject {
        @Published var lidsCount: Int = 172
        @Published var angelsCount: Int = 2
    }
}
