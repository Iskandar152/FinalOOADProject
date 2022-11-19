//
//  gamePlayingScene.swift
//  ooadFinal
//
//  Created by Emmett Easter on 11/15/22.
//

import SwiftUI
import UIKit
import SpriteKit
import GameplayKit


class gamePlayingScene: SKScene {
    
    private var spinnyNode : SKShapeNode?
    var score = 0
    let test:gamePlayingViewController = gamePlayingViewController()
    var lastFrameTime : Double = 0.0
    let iterator = KeysInLevelIterator(dataSource: Levels().listOfLevels[3]!).makeIterator()
    
    
    
    
    override func update(_ currentTime: TimeInterval) {
        
        
        let deltaTime = currentTime - lastFrameTime
        var timeNeeded = 1.0
        
        
        if(deltaTime > timeNeeded){
            if let next = iterator.next() {
                self.addChild(next.0)
                timeNeeded = next.1
                lastFrameTime = currentTime
            }
        }
        
    }
    
    

    
    func updateScore(points:Int)
    {
        score+=points;
    }
    
    
    
//    func touchDown(atPoint pos : CGPoint) {
//        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
//            n.position = pos
//            n.strokeColor = SKColor.green
//            self.addChild(n)
//        }
//    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch:UITouch = touches.first!;
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if touchedNode.name != nil
        {
            print("touch")
            updateScore(points: 1);
        }
        
        
        //for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    
//    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
//    }
//

    
}
