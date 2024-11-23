//
//  AppBackground.swift
//  CocaCola
//
//  Created by Pierre Janineh on 23/11/2024.
//

import SwiftUI

struct AppBackground: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Gradient(colors: [.black, .accent]))
    }
}

extension View {
    func paintAppBackground() -> some View {
        modifier(AppBackground())
    }
}
