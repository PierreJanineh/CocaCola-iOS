//
//  TopAppBar.swift
//  CocaCola
//
//  Created by Pierre Janineh on 22/11/2024.
//

import SwiftUI

struct TopAppBar: View {
    var body: some View {
        HStack {
            ProfileDetailsView()
                .padding(.leading, 20)
            
            Image(.logo)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(.action)
                .padding(20)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .frame(height: 80)
        .background(.accent)
    }
    
    @ViewBuilder
    private func ProfileDetailsView() -> some View {
        HStack {
            ProfileImage()
            
            VStack(alignment: .leading, spacing: 5) {
                PointsView(type: .lids, value: 172)
                PointsView(type: .angels, value: 2)
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
            .padding(5)
    }
}

#Preview {
    TopAppBar()
}
