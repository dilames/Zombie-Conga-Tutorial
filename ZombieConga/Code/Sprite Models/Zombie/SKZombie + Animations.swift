//
//  SKZombie + Animations.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 1/26/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation
import SpriteKit

// MARK: Zombie Animation
extension SKZombie {
    private var animationKey: String { return "ZombieAnimation" }
    private var animation: SKAction {
        var textures = [SKTexture]()
        textures.append(SKTexture(image: R.image.zombie1()!))
        textures.append(SKTexture(image: R.image.zombie2()!))
        textures.append(SKTexture(image: R.image.zombie3()!))
        textures.append(SKTexture(image: R.image.zombie4()!))
        textures.append(SKTexture(image: R.image.zombie3()!))
        textures.append(SKTexture(image: R.image.zombie2()!))
        
        return SKAction.animate(with: textures, timePerFrame: 0.1)}
    
    func startAnimation() {
        if self.action(forKey: animationKey) == nil {
            self.run(animation, withKey: animationKey)
        }
    }
    
    func stopAnimation() {
        self.removeAction(forKey: animationKey)
    }
    
    func invulnerableAnimation() {
        let blinkTimes = 10.0
        let duration = 3.0
        let blinkAction = SKAction.customAction(
        withDuration: duration) { node, elapsedTime in
            let slice = duration / blinkTimes
            let remainder = Double(elapsedTime).truncatingRemainder(
                dividingBy: slice)
            node.isHidden = remainder > slice / 2
        }
        self.run(blinkAction, completion: { self.invulnerability = false })
    }
}
