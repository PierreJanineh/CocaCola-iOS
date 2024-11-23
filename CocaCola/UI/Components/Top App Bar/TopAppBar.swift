//
//  TopAppBar.swift
//  CocaCola
//
//  Created by Pierre Janineh on 22/11/2024.
//

import SwiftUI

struct TopAppBar: View {
    typealias D = Constants.Dimensions.TopAppBar
    
    private let viewModel: ViewModel = .init()
    
    var body: some View {
        HStack {
            ProfileDetailsView()
                .padding(.leading, D.PADDING)
            
            Image(.logo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.action)
                .padding(D.PADDING)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(height: D.BAR_H)
        .background(.accent)
    }
    
    @ViewBuilder
    private func ProfileDetailsView() -> some View {
        HStack {
            ProfileImage()
            
            VStack(alignment: .leading, spacing: D.POINTS_SPACE) {
                PointsView(type: .lids, value: viewModel.lidsCount)
                PointsView(type: .angels, value: viewModel.angelsCount)
            }
        }
    }
    
    @ViewBuilder
    private func ProfileImage() -> some View {
        Circle()
            .fill(.mint)
            .stroke(.onAccent)
            .overlay {
                Image(.profile)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundStyle(.action)
                    .padding()
            }
            .padding(D.PROFILE_IMG_PADDING)
    }
}

#Preview {
    TopAppBar()
}
