//
//  PointsView.swift
//  CocaCola
//
//  Created by Pierre Janineh on 22/11/2024.
//

import SwiftUI

struct PointsView: View {
    typealias S = Constants.Strings.PointsView
    typealias D = Constants.Dimensions.PointsView
    
    private let image: Image
    private let color: Color
    private let value: Int
    
    init(type: Type, value: Int) {
        switch type {
        case .angels:
            self.image = Image(systemName: S.IC_ANGEL)
            self.color = .white
        case .lids:
            self.image = Image(.profile)
            self.color = .action
        }
        self.value = value
    }
    
    var body: some View {
        HStack {
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundStyle(color)
                .frame(width: D.IC_W)
            
            Text(value.description)
                .font(.customBody)
        }
    }
    
    enum `Type` {
        case angels, lids
    }
}

#Preview {
    PointsView(type: .angels, value: 2)
}
