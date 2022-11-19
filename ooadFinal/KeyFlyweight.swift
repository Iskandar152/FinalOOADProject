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

protocol Keys {
    var dictKey: KeySpecifier { get }
    
    func createSprite() -> Sprite
    //-> SKSpriteNode
}

class Key: Keys {
    var dictKey: KeySpecifier
//    var color: UIColor
//    var x: Double
//    var y: Double
    init(color: UIColor, x: Double, y: Double) {
        self.dictKey = KeySpecifier(color:color, x:x, y:y)
//        self.color = color
//        self.x = x
//        self.y = y
    }
    
    
    
    func createSprite() -> Sprite{
        
        let sprite = Sprite(color: dictKey.getColor, x: dictKey.getX, y: dictKey.getY)
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
    
    var getColor: UIColor {
        return color
    }
    
    var getX: Double {
        return x
    }
    
    var getY: Double {
        return y
    }

//    var hashValue: Int {
//        return hash(into:description)
//    }

//    var description: String {
//        return "\(col)(\row)"
//    }
}

class KeyFlyweight {
    var keys: [KeySpecifier: Keys] = [KeySpecifier: Keys]()
    
    func returnDictKey(color: UIColor, x: Double, y: Double) -> KeySpecifier {
        if let key = keys[KeySpecifier(color: color, x: x, y: y)] {
            return key.dictKey
        } else {
            let dictKey = KeySpecifier(color: color, x: x, y: y)
            return dictKey
        }
    }
    func getKey(dictKey: KeySpecifier) -> Keys {
        if let key = keys[dictKey] {
            return key
        } else {
            let key = Key(color: dictKey.getColor, x: dictKey.getX, y: dictKey.getY)
            keys[dictKey] = key
            return key
        }
    }
}

class Sprite {
    var keySprite: SKSpriteNode
    
    init(color: UIColor, x: Double, y: Double){
        let key = SKSpriteNode(color: color, size: CGSize(width: 75, height: 50))
        key.name = "white"
        key.position = CGPoint(x: x, y: y)
        self.keySprite = key
    }
    
    func returnSpriteNode() -> SKSpriteNode{
        return self.keySprite
    }
    
    func moveSprite(){
        let key = self.keySprite
        
        //tiles[whiteCount].size = CGSize(width: 375, height: 100)
//        tiles[whiteCount].position = CGPoint(x:x,y:617)
    
//        self.addChild(tiles[whiteCount])
        key.physicsBody = SKPhysicsBody( rectangleOf: CGSize(width:75, height: 50))

        key.physicsBody?.affectedByGravity = false
        key.physicsBody?.friction = CGFloat(0)
        key.physicsBody?.linearDamping = CGFloat(0)
        key.physicsBody?.velocity = CGVector(dx:0,dy:-300)
        print(key)
        //return key
    }
}
