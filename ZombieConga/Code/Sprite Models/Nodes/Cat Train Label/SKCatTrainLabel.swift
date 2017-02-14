//
//  CatTrainLabel.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 2/13/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit
import SpriteKit

class SKCatTrainLabel: SKLabelNode {
    convenience init(camera: SKCamera) {
        self.init(fontNamed: "Chalkduster")
        guard let scene = camera.scene as? GameScene else { GameScene.Debug.debugPrint(object: "SK - Camera don't installed"); return }
        
        self.text = "Devoured cats: \(0)"
        self.fontColor = .black
        self.fontSize = 100
        self.zPosition = 150
        self.position = CGPoint(x: scene.playableRect.size.width / 2 + CGFloat(-20),
                                y: -scene.playableRect.size.height / 2 + CGFloat(20))
        self.horizontalAlignmentMode = .right
        self.verticalAlignmentMode = .bottom
        camera.addChild(self)
    }
    
    open func updateLabel() {
        var catsCount = 0
        guard let camera = self.parent as? SKCamera else { return }
        guard let scene = camera.scene as? GameScene else { return }
        scene.enumerateChildNodes(withName: SpriteNames.catTrain) { (node, stop) in catsCount += 1 }
        self.text = "Devoured cats: \(catsCount)"
    }
}
