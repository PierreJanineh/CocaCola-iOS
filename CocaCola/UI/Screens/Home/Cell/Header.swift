//
//  Header.swift
//  CocaCola
//
//  Created by Pierre Janineh on 23/11/2024.
//

import SwiftUI

struct Header: ViewModifier {
    typealias D = Constants.Dimensions.SingleAdCellView
    
    func body(content: Content) -> some View {
        content
            .padding(.top, D.IC_LID_W / 2)
            .padding([.horizontal, .bottom], D.HEADER_PADDING)
            .frame(maxWidth: .infinity, maxHeight: D.HEADER_MAX_H)
            .background(.action.opacity(0.7))
            .clipShape(UnevenRoundedRectangle(topTrailingRadius: D.HEADER_RADIUS))
    }
}

extension View {
    func makeHeader() -> some View {
        modifier(Header())
    }
}
