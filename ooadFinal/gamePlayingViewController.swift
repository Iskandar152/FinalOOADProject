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
                
        
        if let view = self.view as! SKView? {
            if let scene = SKScene(fileNamed: "gamePlayingScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
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
