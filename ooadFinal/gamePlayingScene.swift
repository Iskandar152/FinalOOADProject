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
import NIO
let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)




class gamePlayingScene: SKScene {
    
    var score = 0
    var lastFrameTime : Double = 0.0
    
    
    
    override func update(_ currentTime: TimeInterval) {
        
        let levelInt = self.userData?.value(forKey: "levelInt") as! Int

        
        
        let deltaTime = currentTime - lastFrameTime
        var timeNeeded = 1.0
        let iterator = self.userData?.value(forKey: "iter") as! LevelIterator
        
        
        if(deltaTime > timeNeeded){
            if let next = iterator.next() {
                self.addChild(next.0.returnSpriteNode())
                timeNeeded = next.1
                lastFrameTime = currentTime
            } else if (deltaTime > timeNeeded + 5){
                lastFrameTime = currentTime
                print("done")

            }
        }
        
    }
    
    

    
    func updateScore(points:Int)
    {
        score+=points;
    }

    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch:UITouch = touches.first!;
        let positionInScene = touch.location(in: self)
        let touchedNode = self.atPoint(positionInScene)
        let safeToTapUpper = (2*KeyCollumns().screenHeight)/5
        let safeToTapLower = (KeyCollumns().screenHeight)/5
        
        
        if touchedNode.name != nil, positionInScene.y < safeToTapUpper, positionInScene.y > safeToTapLower
        {
            let xpoint = Int(touchedNode.position.x)
            let positions = KeyCollumns().screenWidth
            let bigString = String(xpoint) + ":" + String(positions)
            print(bigString)
            
            do{
                let client = try ClientBootstrap(group: group)
                    .connect(host: "10.202.147.104", port: 9999)
                    .wait()




                try client.writeAndFlush(ByteBuffer(string: bigString)).flatMap {
                    client.close()
                }.wait()
            } catch{
            }
            
            
            print("touch")
            updateScore(points: 1)
        }
        
    }
    
    
}
