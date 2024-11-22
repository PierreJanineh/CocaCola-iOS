//
//  AnyTransition+MoveAndFade.swift
//  CocaCola
//
//  Created by Pierre Janineh on 22/11/2024.
//

import SwiftUI

extension AnyTransition {
    static func moveAndFade(from: Int, to: Int) -> AnyTransition {
        let isMovingForward = to > from
        return .asymmetric(
            insertion: .move(edge: isMovingForward ? .trailing : .leading)
                .combined(with: .opacity),
            removal: .move(edge: isMovingForward ? .leading : .trailing)
                .combined(with: .opacity)
        )
    }
}
