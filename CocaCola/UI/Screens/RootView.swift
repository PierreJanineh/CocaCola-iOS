//
//  RootView.swift
//  CocaCola
//
//  Created by Pierre Janineh on 22/11/2024.
//

import SwiftUI

struct RootView: View {
    
    private let tabItems: [TabItem] = [
        .init(label: Label("home", systemImage: "house.fill")) {
            HomeView()
        },
        .init(label: Label("gift_shop", systemImage: "gift.fill")) {
            GiftShopView()
        },
        .init(label: Label("volunteering", systemImage: "face.smiling.fill")) {
            VolunteeringView()
        },
        .init(label: Label("games", systemImage: "gamecontroller.fill")) {
            GamesView()
        }
    ]
    
    var body: some View {
        BottomAppBar(tabItems: tabItems) {
            // TODO: Handle fab touch gesture
        }
        .foregroundStyle(.onAccent)
    }
}

#Preview {
    RootView()
}
