//
//  CocaColaApp.swift
//  CocaCola
//
//  Created by Pierre Janineh on 22/11/2024.
//

import SwiftUI

@main
struct CocaColaApp: App {
    
    init() {
        // Force RTL at app launch
        UIView.appearance().semanticContentAttribute = .forceRightToLeft
        // Force RTL for navigation bars
        UINavigationBar.appearance().semanticContentAttribute = .forceRightToLeft
    }
    
    var body: some Scene {
        WindowGroup {
            RootView()
            // Ensure SwiftUI views respect RTL
                .environment(\.layoutDirection, .rightToLeft)
        }
    }
}
