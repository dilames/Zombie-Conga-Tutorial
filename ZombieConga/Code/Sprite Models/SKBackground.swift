//
//  SKBackground.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 1/23/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit
import SpriteKit

class SKBackground: SKSpriteNode {
    
    convenience init() {
        self.init(texture: nil, color: .clear, size: .zero)
        
        let firstBackground = SKSpriteNode(imageNamed: R.image.firstBackground.name)
        firstBackground.anchorPoint = CGPoint.zero
        firstBackground.position = CGPoint(x: 0, y: 0)
        self.addChild(firstBackground)
        
        let secondBackground = SKSpriteNode(imageNamed: R.image.secondBackground.name)
        secondBackground.anchorPoint = CGPoint.zero
        secondBackground.position = CGPoint(x: firstBackground.size.width, y: 0)
        self.addChild(secondBackground)
        
        self.size = CGSize(width: firstBackground.size.width + secondBackground.size.width, height: firstBackground.size.height)
        self.zPosition = -1
        self.anchorPoint = CGPoint.zero
        self.name = SpriteNames.background
    }
    
    class func assembleEndlessBackground(on scene: GameScene) {
        for idx in 0...1 {
            let background = SKBackground()
            background.position = CGPoint(x: CGFloat(idx) * background.size.width, y: 0)
            scene.addChild(background)
        }
    }
    
}
