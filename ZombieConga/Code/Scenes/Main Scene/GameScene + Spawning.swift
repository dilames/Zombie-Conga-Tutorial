//
//  GameScene + Spawning.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 1/26/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation
import SpriteKit

// MARK: Spawner
extension GameScene {
    
    enum objectTypes {
        case granny
        case cat
    }
    
    func spawner(object: objectTypes, forDuration: TimeInterval) {
        run(SKAction.repeatForever(
            SKAction.sequence([SKAction.run() { [weak self] in
                switch object {
                case .granny:   self?.spawnGranny()
                case .cat:      self?.spawnCat()
                }}, SKAction.wait(forDuration: forDuration)])))
    }
}

// MARK: Spawning by object
extension GameScene {
    fileprivate func spawnGranny() {
        guard let camera = self.camera as? SKCamera else { GameScene.Debug.debugPrint(object: "GameScene - Spawn Granny: Camera don't installed"); return }
        let granny = SKGranny()
        granny.position = CGPoint(x: camera.position.x + camera.cameraRect.size.width + granny.size.width/2,
                                  y: CGFloat.random(min: camera.cameraRect.minY + granny.size.height/2,
                                                    max: camera.cameraRect.maxY - granny.size.height/2))
        addChild(granny)
        
        granny.run(SKAction.sequence([granny.moveTo(movementSide: .left, duration: 6.0),
                                      SKAction.removeFromParent()]))
        GameScene.Debug.debugPrint(object: "GameScene - Object Granny Spawned, Position [x: \(granny.position.x), y:\(granny.position.y)]")
    }
    
    fileprivate func spawnCat() {
        guard let camera = self.camera as? SKCamera else { GameScene.Debug.debugPrint(object: "GameScene - Spawn Cat: Camera don't installed"); return }
        let cat = SKCat()
        cat.position = CGPoint(
            x: CGFloat.random(min: camera.cameraRect.minX,
                              max: camera.cameraRect.maxX),
            y: CGFloat.random(min: camera.cameraRect.minY,
                              max: camera.cameraRect.maxY))
        cat.setScale(0)
        addChild(cat)
        
        let actions = [cat.scale(scalingMode: .appearing, duration: 2.0),
                       cat.scaleAndWiggle(count: 3),
                       cat.scale(scalingMode: .dissapearing, duration: 2.0),
                       SKAction.removeFromParent()]
        cat.run(SKAction.sequence(actions))
        
        GameScene.Debug.debugPrint(object: "GameScene - Object Cat Spawned, Position [x: \(cat.position.x), y:\(cat.position.y)]")
    }
}
