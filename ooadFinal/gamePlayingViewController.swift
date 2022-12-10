//
//  gamePlayingViewController.swift
//  ooadFinal
//
//  Created by Emmett Easter on 11/15/22.
//

import SwiftUI
import UIKit
import SpriteKit
import GameplayKit


class gamePlayingViewController: UIViewController {

    
    override func viewDidLoad() {

        super.viewDidLoad()

        
        var body: some View {
            Button(action: {
                ContentView().scene.sceneDidLoad()
            }) {
                Text("Go to next Game Scene")
            }
        }
        
        
    }
    

    override var shouldAutorotate: Bool {
        return true
    }
    
    
    
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
