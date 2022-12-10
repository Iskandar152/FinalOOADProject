//
//  KeyCollumns.swift
//  ooadFinal
//
//  Created by Emmett Easter on 11/18/22.
//

import Foundation
import SwiftUI

class KeyCollumns{
    let screenWidth: Double
    let screenHeight: Double
    var keyWidth: Double = 0.0
    var listOfCollumns: [Int] = []
    
    
    func makeListOfCollumns(){
        
        let tileLength = ((screenWidth-20)/12)
        self.keyWidth = tileLength
        var currX = (tileLength/2) + 10
        
        while (currX < screenWidth - (tileLength/2) + 10){
            listOfCollumns.append(Int(currX))
            currX = currX + tileLength
        }
        
    }
    
    init(){
        let window = UIApplication.shared.windows[0]
        let safeFrame = window.safeAreaLayoutGuide.layoutFrame
        
        self.screenWidth = safeFrame.width
        self.screenHeight = safeFrame.height
        
        makeListOfCollumns()
    }
    
    
}
