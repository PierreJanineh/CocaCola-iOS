//
//  CircularScrollView.swift
//  CocaCola
//
//  Created by Pierre Janineh on 22/11/2024.
//
import SwiftUI

struct CircularScrollView: View {
    typealias D = Constants.Dimensions.CircularScrollView
    
    private let buffer: CircularBuffer<SingleAd>
    @State private var currentPage: Int
    
    init(items: [SingleAd]) {
        self.buffer = CircularBuffer(elements: items)
        self._currentPage = State(initialValue: 1)
    }
    
    var body: some View {
        GeometryReader { geometry in
            PagingView(
                currentPage: $currentPage,
                axis: .horizontal,
                itemSize: CGSize(width: geometry.size.width * D.WIDTH_MULTIPLIER,
                                 height: geometry.size.height * D.HEIGHT_MULTIPLIER),
                parentSize: geometry.size
            ) {
                var list = [AnyView]()
                for i in 0..<buffer.totalCount {
                    list.append(
                        AnyView(
                            SingleAdCellView(singleAd: buffer[i])
                        )
                    )
                }
                return list
            }
        }
        .offset(y: D.OFFSET_Y)
    }
}
