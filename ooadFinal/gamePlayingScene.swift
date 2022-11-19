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
    
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    var scoreBoard:SKLabelNode?
    var block1:SKSpriteNode?
    var block2:SKSpriteNode?
    var tiles = [SKSpriteNode]()
    var tiles2 = [SKSpriteNode]()
    var testBlock: SKSpriteNode?
    var whiteCount = -1
    var blackCount = -1
    var velocity = -300
    var score = 0
    let test:gamePlayingViewController = gamePlayingViewController()
    let factory:KeyFlyweight = KeyFlyweight()
    

    
    override func update(_ currentTime: TimeInterval) {
        
        let randBool1 = Bool.random()
        //let randBool2 = Bool.random()
        var x:Double;
                
        if(randBool1) {
            x = 187.5;
        }
        else {
            x = -187.5;
        }
        let dictKey = factory.returnDictKey(color: .white, x: x, y: 617)
        let whiteTileSprite = factory.getKey(dictKey: dictKey).createSprite()
        self.addChild(whiteTileSprite.returnSpriteNode())
        whiteTileSprite.moveSprite()
    }
    
    func createWhiteTile(x:Double)
    {
        whiteCount+=1
        
        let whiteKey = SKSpriteNode(color: .black, size: CGSize(width: 75, height: 50))
        whiteKey.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        tiles.append(whiteKey)
        tiles[whiteCount].name = "white"
        //tiles[whiteCount].size = CGSize(width: 375, height: 100)
        tiles[whiteCount].position = CGPoint(x:x,y:617)
    
        self.addChild(tiles[whiteCount])
        tiles[whiteCount].physicsBody = SKPhysicsBody( rectangleOf: CGSize(width:75, height: 50))

        tiles[whiteCount].physicsBody?.affectedByGravity = false
        tiles[whiteCount].physicsBody?.friction = CGFloat(0)
        tiles[whiteCount].physicsBody?.linearDamping = CGFloat(0)
        tiles[whiteCount].physicsBody?.velocity = CGVector(dx:0,dy:velocity)
        
        
    }
    
    func createBlackTile(x:Double)
    {
        blackCount+=1
        
        let blackKey = SKSpriteNode(color: .black, size: CGSize(width: 75, height: 50))
        blackKey.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        
        tiles2.append(blackKey)
        tiles2[blackCount].name = "black"
         tiles2[blackCount].size = CGSize(width: 375, height: 100)
         tiles2[blackCount].position = CGPoint(x:x,y:617)

         self.addChild(tiles2[blackCount])
         tiles2[blackCount].physicsBody = SKPhysicsBody( rectangleOf: CGSize(width:75, height: 50))

         tiles2[blackCount].physicsBody?.affectedByGravity = false
         tiles2[blackCount].physicsBody?.friction = CGFloat(0)
         tiles2[blackCount].physicsBody?.linearDamping = CGFloat(0)
         tiles2[blackCount].physicsBody?.velocity = CGVector(dx:0,dy:velocity)
        
        
    }
    
    func updateScore(amountToUpdate:Int)
    {
        score+=amountToUpdate;
        scoreBoard?.text = String(score)
    }
    
    func touchDown(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.green
            self.addChild(n)
        }
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.blue
            self.addChild(n)
        }
    }
    
    func touchUp(atPoint pos : CGPoint) {
        if let n = self.spinnyNode?.copy() as! SKShapeNode? {
            n.position = pos
            n.strokeColor = SKColor.red
            self.addChild(n)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch:UITouch = touches.first!;
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        
        if let name = touchedNode.name
        {
            if name == "black"
            {
                print("touch")
                updateScore(amountToUpdate: 1);
            }
            if name == "white"
            {
                print("touch")
                updateScore(amountToUpdate: -1);
            }
        }
        
        
        /*if tiles2.contains(touch.location(in: self)){
            
        }
        */
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    /*override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }*/
}
