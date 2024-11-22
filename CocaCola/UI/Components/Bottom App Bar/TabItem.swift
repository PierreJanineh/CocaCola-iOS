//
//  TabItem.swift
//  CocaCola
//
//  Created by Pierre Janineh on 22/11/2024.
//

import SwiftUI

struct TabItem {
    let id = UUID()
    let label: Label<Text, Image>
    let content: AnyView
    
    init<Content: View>(
        label: Label<Text, Image>,
        @ViewBuilder content: @escaping () -> Content
    ) {
        self.label = label
        self.content = AnyView(content())
    }
}
