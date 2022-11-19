//
//  Levels.swift
//  ooadFinal
//
//  Created by Emmett Easter on 11/18/22.
//

import Foundation
import SwiftUI
import SpriteKit



func makeListOfKeys(num: Int, optionsX:KeyCollumns, factory: KeyFlyweight) -> [(SKSpriteNode, Double)]{
    
    var listOfKeys:[(SKSpriteNode, Double)] = []
    let numOfTiles = (num*5) + 10
    var i = 0
    
    while(i < numOfTiles){
        let width = optionsX.keyWidth
        let startingHeight = optionsX.screenHeight
        let randomX = CollumnRandomValueFactory().generateRandomValue().value as! Double
        let randomColor = ColorRandomValueFactory().generateRandomValue().value as! UIColor
        let randomTimeGap = TimeGapRandomValueFactory().generateRandomValue().value as! Double
        let randomHeight = HeightRandomValueFactory().generateRandomValue().value as! Double
        
        let dictKey = factory.returnDictKey(color: randomColor, x: randomX , y: startingHeight)
        let keySprite = factory.getKey(dictKey: dictKey, width: width, height: randomHeight).createSprite()
        
        listOfKeys.append((keySprite.returnSpriteNode(), randomTimeGap))
        i = i + 1
        
    }
    
    return listOfKeys
    
}

class Levels{
    let factory:KeyFlyweight = KeyFlyweight()
    let optionsX = KeyCollumns()
    var listOfLevels: [Int: [(SKSpriteNode, Double)]] = [Int: [(SKSpriteNode, Double)]]()
    
    
    
    
    init(){
        var levelNumber:Int = 1
        
        while(levelNumber < 10){
            
            let keysList = makeListOfKeys(num: levelNumber, optionsX: optionsX, factory: factory)
            listOfLevels[levelNumber] = keysList
            levelNumber = levelNumber + 1
            
        }
    }
    
    
}



