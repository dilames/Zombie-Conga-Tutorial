//
//  SKCat.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 1/26/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation
import SpriteKit

class SKCat: SKSpriteNode {
    let movementPointsPerSec: CGFloat = GameScene.Settings.catPixelsPerSecond
    
    required init() {
        super.init(texture: SKTexture(image: R.image.cat()!),
                   color: .clear,
                   size: SKTexture(image: R.image.cat()!).size())
        
        self.name = SpriteNames.cat
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func removeFromParent() {
        super.removeFromParent()
        
        GameScene.Debug.debugPrint(object: "SKCat - Removed from GameScene.")
    }
}
