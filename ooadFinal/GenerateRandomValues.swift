//
//  GenerateRandomValues.swift
//  ooadFinal
//
//  Created by Emmett Easter on 11/18/22.
//

import Foundation
import SwiftUI




//FACTORY

///////////////////////???????????????


protocol GenerateRandomValues {
    var value: AnyHashable { get }
}





class CollumnRandomValue: GenerateRandomValues {
    var value: AnyHashable {
        let optionsX = KeyCollumns().listOfCollumns
        return optionsX.randomElement()
    }
}
 
class ColorRandomValue: GenerateRandomValues {
    var value: AnyHashable {
        if (Bool.random()){
            return UIColor.black
        }
        return UIColor.white
    }
}
 
class TimeGapRandomValue: GenerateRandomValues {
    var value: AnyHashable {
        return Double.random(in: 0.01 ..< 0.2)
    }
}

class HeightRandomValue: GenerateRandomValues {
    var value: AnyHashable {
        return Double.random(in: 75.0 ..< 100.0)
    }
}




//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~




protocol GenerateRandomValuesFactory {
    func generateRandomValue() -> GenerateRandomValues
}






class CollumnRandomValueFactory: GenerateRandomValuesFactory {
    func generateRandomValue() -> GenerateRandomValues {
        CollumnRandomValue()
    }
}
 
class ColorRandomValueFactory: GenerateRandomValuesFactory {
    func generateRandomValue() -> GenerateRandomValues {
        ColorRandomValue()
    }
}
 
class TimeGapRandomValueFactory: GenerateRandomValuesFactory {
    func generateRandomValue() -> GenerateRandomValues {
        TimeGapRandomValue()
    }
}

class HeightRandomValueFactory: GenerateRandomValuesFactory {
    func generateRandomValue() -> GenerateRandomValues {
        HeightRandomValue()
    }
}

