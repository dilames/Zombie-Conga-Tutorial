//
//  SKGranny + Movement.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 1/26/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation
import SpriteKit

extension SKGranny {
    enum movementType {
        case left
        case right
    }
    func moveTo(movementSide: movementType, duration: TimeInterval) -> SKAction {
        guard let scene = self.scene as? GameScene else { GameScene.Debug.debugPrint(object: "SKGranny - moveTo(): Scene don't installed"); return SKAction() }
        guard let camera = scene.camera as? SKCamera else { GameScene.Debug.debugPrint(object: "SKGranny - moveTo(): Camera don't installed"); return SKAction() }
        
        switch movementSide {
        case .left:     return SKAction.move(to: CGPoint(x: camera.position.x - camera.cameraRect.width / 2, y: self.position.y), duration: duration)
        case .right:    return SKAction.move(to: CGPoint(x: camera.position.x + camera.cameraRect.width / 2, y: self.position.y), duration: duration)
        }
    }
}
