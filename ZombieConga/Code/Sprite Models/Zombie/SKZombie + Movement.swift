//
//  SKZombie + Movement.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 1/26/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation
import SpriteKit

// MARK: Zombie Movement
extension SKZombie {
    func move(withTime deltaTime: TimeInterval) {
        guard targetLocation != nil else { return } // Will stop if non target
        self.startAnimation()
        let amountToMove = velocity * CGFloat(deltaTime)
        let amountToTarget = targetLocation! - position
        if amountToMove.length > amountToTarget.length {
            self.position += amountToTarget
            self.targetLocation = nil
            self.stopAnimation()
            return
        } else {
            self.position += amountToMove
        }
        self.rotate(direction: velocity, radiansPerSecond: rotationInRadiansPerSecond, deltaTime: deltaTime)
    }
    
    func moveTowards(location: CGPoint, deltaTime: TimeInterval) {
        let offset = location - position
        let direction = offset.normalized
        velocity = direction * movePointsPerSecond
        self.move(withTime: deltaTime)
    }
    
    func boundsCheckZombie() {
        guard let scene = super.scene as? GameScene else { GameScene.Debug.debugPrint(object: "SKZombie - GameScene don't installed."); return }
        guard let camera = scene.camera as? SKCamera else { GameScene.Debug.debugPrint(object: "SKZombie - GameScene.Camera don't installed.");return }
        let bottomLeft = CGPoint(x: camera.cameraRect.minX, y: camera.cameraRect.minY)
        let topRight = CGPoint(x: camera.cameraRect.maxX, y: camera.cameraRect.maxY)
        if position.x <= bottomLeft.x {
            position.x = bottomLeft.x
            velocity.x = abs(velocity.x)
        }
        if position.x >= topRight.x {
            position.x = topRight.x
            velocity.x = -velocity.x
        }
        if position.y <= bottomLeft.y {
            position.y = bottomLeft.y
            velocity.y = -velocity.y
        }
        if position.y >= topRight.y {
            position.y = topRight.y
            velocity.y = -velocity.y
        }
    }
}
