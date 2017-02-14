//
//  GameViewController.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 1/21/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let scene = MainMenuScene(size: GameScene.Settings.screenSize)
        let skView = self.view as! SKView
        skView.showsFPS = GameScene.Debug.enableDebug
        skView.showsNodeCount = GameScene.Debug.enableDebug
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
    }
    
    override var prefersStatusBarHidden: Bool { return true }
}
