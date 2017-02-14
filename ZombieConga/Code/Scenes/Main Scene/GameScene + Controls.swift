//
//  GameScene+Controls.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 1/26/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation
import SpriteKit

// MARK: Controls
extension GameScene {
    func sceneTouched(location: CGPoint) {
        zombie.targetLocation = location
    }
    
    func moveCatsTrain() {
        var targetPosition = self.zombie.position
        var catsInTrain = 0
        
        self.enumerateChildNodes(withName: SpriteNames.catTrain, using: { node, stop in
            guard let catTrainNode = node as? SKCat else { return }
            if !catTrainNode.hasActions() {
                let actionDuration = 0.3
                let offset = targetPosition - catTrainNode.position
                let direction = offset.normalized
                let velocity = direction * catTrainNode.movementPointsPerSec
                let amountToMove = velocity * CGFloat(actionDuration)
                let moveAction = SKAction.moveBy(x: amountToMove.x, y: amountToMove.y, duration: actionDuration)
                node.run(moveAction)
                targetPosition = catTrainNode.position
                
                catsInTrain += 1
                if catsInTrain >= GameScene.Settings.catsRequiredForVictory && !self.gameOver { self.gameOver = true }
            }
        })
    }
    
    func removeCatsFromTrain(countToRemove: Int) {
        var loseCount = 0
        enumerateChildNodes(withName: SpriteNames.catTrain, using: { node, stop in
            guard let camera = self.camera as? SKCamera else { return }
            var randomSpot = node.position
            randomSpot.x = CGFloat.random(min: camera.cameraRect.minX, max: camera.cameraRect.maxX)
            randomSpot.y = CGFloat.random(min: camera.cameraRect.minY, max: camera.cameraRect.maxY)
            
            node.name = SpriteNames.none
            node.run(SKAction.sequence([
                SKAction.move(to: randomSpot, duration: 3.0),
                SKAction.group([
                    SKAction.rotate(byAngle: .pi * 4, duration: 3.0),
                    SKAction.scale(to: 0, duration: 3.0)
                    ]),
                SKAction.removeFromParent()
                ]))
            loseCount += 1
            if loseCount >= countToRemove {
                stop[0] = true
            }
        })
    }
}

// MARK: Touches
extension GameScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        self.sceneTouched(location: location)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        self.sceneTouched(location: location)
    }
}
