//
//  SKLifesNode.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 2/13/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit
import SpriteKit

class SKLifesNode: SKLabelNode {
    
    convenience init(camera: SKCamera) {
        self.init(fontNamed: "Chalkduster")
        guard let scene = camera.scene as? GameScene else { GameScene.Debug.debugPrint(object: "SKLifesNode - Camera don't installed"); return }
        
        self.text = "Lifes: \(GameScene.Settings.zombieStarterLifes)"
        self.fontColor = .black
        self.fontSize = 100
        self.zPosition = 150
        self.position = CGPoint(x: -scene.playableRect.size.width / 2 + CGFloat(20),
                                          y: -scene.playableRect.size.height / 2 + CGFloat(20))
        self.horizontalAlignmentMode = .left
        self.verticalAlignmentMode = .bottom
        camera.addChild(self)
    }
    
    open func updateLabel(lifesCount: Int) {
        self.text = "Lifes: \(lifesCount)"
    }
    
}
