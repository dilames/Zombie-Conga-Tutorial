//
//  SKCamera.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 2/1/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit
import SpriteKit

class SKCamera: SKCameraNode {
    static let cameraMovePointsPerSec: CGFloat = GameScene.Settings.cameraMovePointsPerSec
    
    var cameraRect: CGRect {
        guard let scene = self.scene as? GameScene else { GameScene.Debug.debugPrint(object: "SKCamera Rect error: Parent scene don't installed"); return CGRect.null }
        let x = self.position.x - scene.size.width / 2 + (scene.size.width - scene.playableRect.width) / 2
        let y = self.position.y - scene.size.height / 2 + (scene.size.height - scene.playableRect.height) / 2
        
        return CGRect(x: x, y: y, width: scene.playableRect.width, height: scene.playableRect.height)
    }
    
    init(position: CGPoint) {
        super.init()
        
        self.position = position
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func moveCamera(with deltaTime: TimeInterval) {
        guard let scene = self.scene as? GameScene else { GameScene.Debug.debugPrint(object: "SKCamera Movement error: Parent scene don't installed"); return }
        let backgroundVelocity = CGPoint(x: SKCamera.cameraMovePointsPerSec, y: 0)
        let amountToMove = backgroundVelocity * CGFloat(deltaTime)
        self.position += amountToMove
        
        scene.enumerateChildNodes(withName: SpriteNames.background) { (node, stop) in
            guard let background = node as? SKBackground else { return }
            if background.position.x + background.size.width < self.cameraRect.origin.x {
                background.position = CGPoint(x: background.position.x + background.size.width * 2,
                                              y: background.position.y)
            }
        }
    }
    
}
