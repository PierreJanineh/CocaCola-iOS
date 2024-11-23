//
//  SingleAd.swift
//  CocaCola
//
//  Created by Pierre Janineh on 23/11/2024.
//

import Foundation

struct SingleAd: Identifiable {
    let id: UUID = .init()
    let title: String
    let subtitle: String
    let image: URL?
}
