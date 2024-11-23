//
//  RootView.swift
//  CocaCola
//
//  Created by Pierre Janineh on 22/11/2024.
//

import SwiftUI

struct RootView: View {
    typealias S = Constants.Strings.RootView
    
    private let tabItems: [TabItem] = [
        .init(label: Label(S.HOME, systemImage: S.IC_HOME)) {
            HomeView()
        },
        .init(label: Label(S.GIFT_SHOP, systemImage: S.IC_GIFT_SHOP)) {
            GiftShopView()
        },
        .init(label: Label(S.VOLUNTEERING, systemImage: S.IC_VOLUNTEERING)) {
            VolunteeringView()
        },
        .init(label: Label(S.GAMES, systemImage: S.IC_GAMES)) {
            GamesView()
        }
    ]
    
    var body: some View {
        VStack(spacing: 0) {
            TopAppBar()
            
            BottomAppBar(tabItems: tabItems) {
                // TODO: Handle fab touch gesture
            }
        }
        .foregroundStyle(.onAccent)
    }
}

#Preview {
    RootView()
}
