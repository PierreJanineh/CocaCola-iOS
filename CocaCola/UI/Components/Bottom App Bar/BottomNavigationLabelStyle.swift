//
//  BottomNavigationLabelStyle.swift
//  CocaCola
//
//  Created by Pierre Janineh on 22/11/2024.
//

import SwiftUI

struct BottomNavigationLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        VStack {
            configuration.icon
            configuration.title
                .font(.subheadline)
        }
    }
}

extension LabelStyle where Self == BottomNavigationLabelStyle {
    static var bottomNavigation: BottomNavigationLabelStyle {
        BottomNavigationLabelStyle()
    }
}
