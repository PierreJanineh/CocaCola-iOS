//
//  BottomAppBar.swift
//  CocaCola
//
//  Created by Pierre Janineh on 22/11/2024.
//

import SwiftUI

struct BottomAppBar: View {
    typealias D = Constants.Dimensions.BottomAppBar
    
    let tabItems: [TabItem]
    let fabIcon: Image
    let fabAction: () -> Void
    
    @State private var selectedTab: Int = 0
    @State private var previousTab: Int = 0
    
    init(tabItems: [TabItem],
         fabIcon: Image = Image(.FAB),
         fabAction: @escaping () -> Void = {}) {
        self.tabItems = tabItems
        self.fabIcon = fabIcon
        self.fabAction = fabAction
    }
    
    var body: some View {
        TabPresentation()
            .overlay(alignment: .bottom) {
                AppBar()
                    .overlay {
                        FAB()
                    }
            }
            .ignoresSafeArea(edges: .bottom)
    }
    
    @ViewBuilder
    private func TabPresentation() -> some View {
        VStack {
            tabItems[selectedTab]
                .content
                .transition(.moveAndFade(from: previousTab,
                                         to: selectedTab))
                .id(selectedTab)
        }
        .animation(.spring(duration: 0.3), value: selectedTab)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .paintAppBackground()
    }
    
    @ViewBuilder
    private func AppBar() -> some View {
        VStack {
            Spacer()
            
            ZStack {
                BottomAppBarShape()
                    .fill(.accent)
                    .shadow(radius: D.SHADOW)
                
                Tabs()
                    .padding(.horizontal)
                    .frame(height: D.BTN_W)
            }
        }
        .frame(height: D.BTN_W + D.BAR_PADDING)
    }
    
    @ViewBuilder
    private func FAB() -> some View {
        Button(action: fabAction) {
            fabIcon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.action)
                .frame(width: D.FAB_IC_W, height: D.FAB_IC_W)
        }
        .frame(width: D.BTN_W, height: D.BTN_W)
        .background(Color.white)
        .clipShape(Circle())
        .shadow(radius: D.SHADOW)
        // Half of FAB height to center it on the bar
        .offset(y: -(D.BTN_W / 2))
    }
    
    @ViewBuilder
    private func Tabs() -> some View {
        HStack {
            ForEach(0...tabItems.count - 1, id: \.self) { i in
                Spacer()
                
                tabItems[i]
                    .label
                    .labelStyle(.bottomNavigation)
                    .foregroundStyle(selectedTab == i ? Color.action : Color.onAccent)
                    .onTapGesture {
                        withAnimation {
                            previousTab = selectedTab
                            selectedTab = i
                        }
                    }
                
                // Handle spacing in the middle (in place of fab)
                let isMiddle = i == (tabItems.count / 2) - 1
                ForEach(0...(isMiddle ? 4 : 1), id: \.self) { _ in
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    BottomAppBar(tabItems: [TabItem(label: Label("home", systemImage: "house.fill"),
                                    content: { AnyView(HomeView()) })])
}
