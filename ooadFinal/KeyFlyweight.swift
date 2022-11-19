//
//  KeyFlyweight.swift
//  ooadFinal
//
//  Created by Emmett Easter on 11/18/22.
//

import Foundation

import SwiftUI
import UIKit
import SpriteKit


class Key {
    var dictKey: KeySpecifier
    var width: Double
    var height: Double
    init(color: UIColor, x: Double, y: Double, width: Double, height: Double) {
        self.dictKey = KeySpecifier(color:color, x:x, y:y)
        self.width = width
        self.height = height
    }
    
    
    
    func createSprite() -> Sprite{
        
        let sprite = Sprite(color: dictKey.getColor(), x: dictKey.getX(), y: dictKey.getY(), width:width, height:height)
        return sprite
        
        
    }
}

struct KeySpecifier : Hashable {
    var color: UIColor
    var x: Double
    var y: Double

    init(color: UIColor, x: Double, y: Double) {
        self.color = color
        self.x = x
        self.y = y
    }
    
    func getColor() -> UIColor {
        return color
    }
    
    func getX() -> Double {
        return x
    }
    
    func getY() -> Double {
        return y
    }
}

class KeyFlyweight {
    var keys: [KeySpecifier: Key] = [KeySpecifier: Key]()
    
    func returnDictKey(color: UIColor, x: Double, y: Double) -> KeySpecifier {
        if let key = keys[KeySpecifier(color: color, x: x, y: y)] {
            return key.dictKey
        } else {
            let dictKey = KeySpecifier(color: color, x: x, y: y)
            return dictKey
        }
    }
    func getKey(dictKey: KeySpecifier, width: Double, height: Double) -> Key {
        if let key = keys[dictKey] {
            return key
        } else {
            let key = Key(color: dictKey.getColor(), x: dictKey.getX(), y: dictKey.getY(), width:width, height:height)
            keys[dictKey] = key
            return key
        }
    }
}

func uiColorAsString(color: UIColor) -> String {
    
    if color == .black{
        return "black"
    }
    return "white"
    
}


class Sprite {
    var keySprite: SKSpriteNode
    
    init(color: UIColor, x: Double, y: Double, width: Double, height: Double){
        let key = SKSpriteNode(color: color, size: CGSize(width: width, height: height))
        key.name = uiColorAsString(color: color)
        key.position = CGPoint(x: x, y: y)
        self.keySprite = key
    }
    
    func returnSpriteNode() -> SKSpriteNode{
        let key = self.keySprite
        key.physicsBody = SKPhysicsBody( rectangleOf: CGSize(width:key.size.width, height: key.size.height))

        key.physicsBody?.affectedByGravity = false
        key.physicsBody?.friction = CGFloat(0)
        key.physicsBody?.linearDamping = CGFloat(0)
        key.physicsBody?.velocity = CGVector(dx:0,dy:-300)
        return key
    }
}
