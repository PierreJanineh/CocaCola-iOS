//
//  SingleAdCellView.swift
//  CocaCola
//
//  Created by Pierre Janineh on 23/11/2024.
//

import SwiftUI

struct SingleAdCellView: View {
    typealias D = Constants.Dimensions.SingleAdCellView
    
    let singleAd: SingleAd
    
    var body: some View {
        BackgroundImage()
            .overlay(alignment: .bottom) {
                OverlayHeader()
                    .overlay(alignment: .topLeading) {
                        LidIcon()
                    }
            }
            .makeSingleAdCard()
    }
    
    @ViewBuilder
    private func LidIcon() -> some View {
        Image(.profile)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: D.IC_LID_W)
            .offset(y: -D.IC_LID_W / 2)
            .foregroundStyle(.white)
            .padding(.leading, D.HEADER_PADDING / 2)
    }
    
    @ViewBuilder
    private func OverlayHeader() -> some View {
        VStack {
            Text(singleAd.title)
                .font(.customTitle)
                .foregroundStyle(.white)
            
            Text(singleAd.subtitle)
                .font(.customBody)
                .foregroundStyle(.white)
        }
        .makeHeader()
    }
    
    @ViewBuilder
    private func BackgroundImage() -> some View {
        VStack {
            AsyncImage(url: singleAd.image){ phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(maxWidth: 0)
                default:
                    EmptyView()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    SingleAdCellView(singleAd: .init(title: "", subtitle: "", image: URL(string: "")))
}
