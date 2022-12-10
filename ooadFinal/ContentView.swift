//
//  ContentView.swift
//  ooadFinal
//
//  Created by Emmett Easter on 11/15/22.
//

import SwiftUI
import SpriteKit
import GameplayKit
import PythonKit
import Foundation
import NIO


struct ContentView: View {
    
    var scene: SKScene {
        

        let levelInt: Int = 1
        let allLevels = Levels()
        var _: [Int: [(Sprite, Double)]]?
        let scene = gamePlayingScene()
        let safeFrame = UIApplication.shared.windows[0].safeAreaLayoutGuide.layoutFrame
        let padding = UIApplication.shared.windows[0].safeAreaInsets
        scene.size = CGSize(width: safeFrame.width, height: safeFrame.height-(padding.top + padding.bottom))
        scene.scaleMode = .fill
        scene.backgroundColor = SKColor.lightGray
        scene.userData = NSMutableDictionary()
    
        if scene.userData == nil { scene.userData = ["levelInt" : 1]} else {scene.userData?.setObject(levelInt, forKey: "levelInt" as NSCopying)}

        scene.userData?.setObject(KeysInLevelIterator(dataSource: allLevels.listOfLevels[levelInt]!).makeIterator(), forKey: "iter" as NSCopying)
            
            return scene
        }
    
    @State var show = false
        var body: some View {
            Button(action: {
                show.toggle()
            }) {
                Text("Go to Game Scene")
            }.fullScreenCover(isPresented: $show) {
                
                SpriteView(scene: scene)
                    .frame(width: UIApplication.shared.windows[0].safeAreaLayoutGuide.layoutFrame.width, height: UIApplication.shared.windows[0].safeAreaLayoutGuide.layoutFrame.height-(UIApplication.shared.windows[0].safeAreaInsets.top + UIApplication.shared.windows[0].safeAreaInsets.bottom))
                    .ignoresSafeArea()
            }
        }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
