//
//  ContentView.swift
//  ooadFinal
//
//  Created by Emmett Easter on 11/15/22.
//

import SwiftUI
import SpriteKit
import GameplayKit

struct ContentView: View {
    var scene: SKScene {
            let scene = gamePlayingScene()
            scene.size = CGSize(width: 1000, height: 600)
            scene.scaleMode = .fill
            scene.backgroundColor = SKColor.lightGray
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
                    .frame(width: 1000, height: 600)
                    .ignoresSafeArea()
            }
        }
    

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
