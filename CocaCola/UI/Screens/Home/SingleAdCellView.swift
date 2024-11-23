//
//  SingleAdCellView.swift
//  CocaCola
//
//  Created by Pierre Janineh on 23/11/2024.
//

import SwiftUI

struct SingleAdCellView: View {
    
    let singleAd: SingleAd
    
    var body: some View {
        VStack {
            Text(singleAd.title)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.red)
        .cornerRadius(15)
    }
}

#Preview {
    SingleAdCellView(singleAd: .init(title: "", subtitle: ""))
}
