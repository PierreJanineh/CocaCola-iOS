//
//  BottomAppBar.swift
//  CocaCola
//
//  Created by Pierre Janineh on 22/11/2024.
//

import SwiftUI

struct BottomAppBar: View {
    let tabItems: [TabItem]
    let fabIcon: Image
    let fabAction: () -> Void
    
    @State private var selectedTab: Int = 0
    
    init(tabItems: [TabItem],
         fabIcon: Image = Image("FAB"),
         fabAction: @escaping () -> Void = {}) {
        self.tabItems = tabItems
        self.fabIcon = fabIcon
        self.fabAction = fabAction
    }
    
    var body: some View {
        VStack {
            tabItems[selectedTab].content
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.accent)
        .overlay(alignment: .bottom) {
            AppBar()
                .overlay {
                    FAB()
                }
        }
        .ignoresSafeArea(edges: .bottom)
    }
    
    @ViewBuilder
    private func AppBar() -> some View {
        VStack {
            Spacer()
            
            ZStack {
                BottomAppBarShape()
                    .fill(.accent)
                    .shadow(radius: 5)
                
                HStack {
                    Content()
                }
                .padding(.horizontal)
                .frame(height: 56)
            }
        }
        .frame(height: 56 + 16)
    }
    
    @ViewBuilder
    private func FAB() -> some View {
        Button(action: fabAction) {
            fabIcon
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.action)
                .frame(width: 53, height: 53)
        }
        .frame(width: 56, height: 56)
        .background(Color.white)
        .clipShape(Circle())
        .shadow(radius: 4)
        // Half of FAB height to center it on the bar
        .offset(y: -28)
    }
    
    @ViewBuilder
    private func Content() -> some View {
        ForEach(0...tabItems.count - 1, id: \.self) { i in
            Spacer()
            
            tabItems[i]
                .label
                .labelStyle(.bottomNavigation)
                .foregroundStyle(selectedTab == i ? Color.action : Color.onAccent)
                .onTapGesture {
                    selectedTab = i
                }
            
            Spacer()
            
            if i == (tabItems.count / 2) - 1 {
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }
        }
    }
}

#Preview {
    BottomAppBar(tabItems: [TabItem(label: Label("home", systemImage: "house.fill"),
                                    content: { AnyView(HomeView()) })])
}
