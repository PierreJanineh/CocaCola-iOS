//
//  SingleAdCard.swift
//  CocaCola
//
//  Created by Pierre Janineh on 23/11/2024.
//

import SwiftUI

struct SingleAdCard: ViewModifier {
    typealias D = Constants.Dimensions.SingeAdCard
    
    func body(content: Content) -> some View {
        content
            .background(.red)
            .cornerRadius(D.CORNER_RADIUS)
    }
}

extension View {
    public func makeSingleAdCard() -> some View {
        self.modifier(SingleAdCard())
    }
}
