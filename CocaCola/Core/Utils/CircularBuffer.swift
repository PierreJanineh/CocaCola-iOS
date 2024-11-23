//
//  CircularBuffer.swift
//  CocaCola
//
//  Created by Pierre Janineh on 23/11/2024.
//

import Foundation

class CircularBuffer<T> {
    private var buffer: [T]
    private var sectionSize: Int
    
    init(elements: [T]) {
        self.buffer = elements
        self.sectionSize = elements.count
    }
    
    var count: Int {
        return sectionSize
    }
    
    var totalCount: Int {
        return buffer.count * Constants.Dimensions.PagingView.BUFFER_MULTIPLIER
    }
    
    subscript(virtualIndex: Int) -> T {
        let realIndex = virtualIndex % buffer.count
        return buffer[realIndex]
    }
}
