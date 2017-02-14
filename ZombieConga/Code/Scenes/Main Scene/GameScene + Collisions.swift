//
//  GameScene + Collisions.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 1/26/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation
import SpriteKit

extension GameScene {
    
    override func didEvaluateActions() {
        self.checkCollisions()
    }
    
    
    private func zombieHit(cat: SKCat) {
        run(Sounds.catCollisionSound)
        cat.name = SpriteNames.catTrain
        cat.removeAllActions()
        cat.setScale(1.0)
        cat.zRotation = 0.0
        
        let turnIntoGreenAction = SKAction.colorize(with: .green, colorBlendFactor: 1.0, duration: 0.2)
        cat.run(turnIntoGreenAction)
        self.catsLabel.updateLabel()
    }
    
    private func zombieHit(granny: SKGranny) {
        guard zombie.invulnerability == false else { return }
        
        run(Sounds.grannyCollisionSound)
        self.removeCatsFromTrain(countToRemove: GameScene.Settings.catsSubtractingByEnemyHit)
        zombie.lifes -= 1
        zombie.invulnerability = true
        self.catsLabel.updateLabel()
    }
    
    private func checkCollisions() {
        var hitedCats: [SKCat] = []
        enumerateChildNodes(withName: SpriteNames.cat) { node, _ in
            let cat = node as! SKCat
            if cat.frame.insetBy(dx: 40, dy: 40).intersects(self.zombie.frame) {
                hitedCats.append(cat)
            }
        }
        
        var hitedGrannies: [SKGranny] = []
        enumerateChildNodes(withName: SpriteNames.granny) { node, _ in
            let granny = node as! SKGranny
            if node.frame.insetBy(dx: 80, dy: 80).intersects(
                self.zombie.frame) {
                hitedGrannies.append(granny)
            }
        }
        
        
        for granny in hitedGrannies {
            zombieHit(granny: granny)
        }
        
        for cat in hitedCats {
            zombieHit(cat: cat)
        }
    }
}
