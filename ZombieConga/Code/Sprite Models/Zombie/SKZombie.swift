//
//  SKZombie.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 1/23/17.
//  Copyright © 2017 com. All rights reserved.
//

import SpriteKit
import UIKit

class SKZombie: SKSpriteNode {
    var targetLocation: CGPoint? {
        didSet {
            guard let location = targetLocation else { return }
            guard let parentScene = self.scene as? GameScene else { return }
            self.moveTowards(location: location, deltaTime: parentScene.deltaTime)
        }
    }
    var invulnerability: Bool = false {
        willSet {
            if newValue { self.invulnerableAnimation() }
            GameScene.Debug.debugPrint(object: "Zombie - Invulnerability state: \(newValue)")
        }
    }
    internal var velocity = CGPoint.zero
    let movePointsPerSecond: CGFloat = GameScene.Settings.zombiePixelsPerSecond
    let rotationInRadiansPerSecond: CGFloat = GameScene.Settings.zombieRotationPerSecond
    var lifes = GameScene.Settings.zombieStarterLifes {
        didSet {
            guard let scene = self.scene as? GameScene else { return }
            guard !scene.gameOver else { return }
            if lifes <= 0 { scene.gameOver = true }
            
            GameScene.Debug.debugPrint(object: "Zombie - Lifes left: \(lifes)")
            scene.lifesLabel.updateLabel(lifesCount: lifes)
        }
    }
    
    required init() {
        super.init(texture: SKTexture(image: R.image.zombie1()!),
                   color: UIColor.clear,
                   size: SKTexture(image: R.image.zombie1()!).size())
        
        self.name = SpriteNames.zombie
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
