//
//  HomeView.swift
//  CocaCola
//
//  Created by Pierre Janineh on 22/11/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel: ViewModel = .init()
    
    var body: some View {
        CircularScrollView(items: viewModel.items)
    }
}

#Preview {
    HomeView()
}
