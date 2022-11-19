//
//  KeysInLevelIterator.swift
//  ooadFinal
//
//  Created by Emmett Easter on 11/18/22.
//

import Foundation
import SwiftUI
import SpriteKit

protocol LevelIterator {
    func next() -> (SKSpriteNode, Double)?
}

class ArrayLevelIterator: LevelIterator {

    private let values: [(SKSpriteNode, Double)]
    private var index: Int?

    init(_ values: [(SKSpriteNode, Double)]) {
        self.values = values
    }

    private func nextIndex(index: Int?) -> Int? {
        if index != nil && index! < self.values.count - 1 {
            return (index! + 1)
        }
        else if index == nil && !self.values.isEmpty {
            return 0
        }
        return nil
    }

    func next() -> (SKSpriteNode, Double)? {
        if let indexNew = self.nextIndex(index: self.index) {
            self.index = indexNew
            return self.values[indexNew]
        }
        return nil
    }
}


protocol Iterable {
    func makeIterator() -> LevelIterator
}

class KeysInLevelIterator: Iterable {

    private var dataSource: [(SKSpriteNode, Double)]

    init(dataSource: [(SKSpriteNode, Double)]) {
        self.dataSource = dataSource
    }

    func makeIterator() -> LevelIterator {
        return ArrayLevelIterator(self.dataSource)
    }
}

