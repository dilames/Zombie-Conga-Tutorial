//
//  SKGranny.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 1/26/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation
import SpriteKit

class SKGranny: SKSpriteNode {
    required init() {
        super.init(texture: SKTexture(image: R.image.women()!),
                   color: UIColor.clear,
                   size: SKTexture(image: R.image.women()!).size())
        
        self.name = SpriteNames.granny
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func removeFromParent() {
        super.removeFromParent()
        
        GameScene.Debug.debugPrint(object: "SKGranny - Removed from GameScene.")
    }
}
