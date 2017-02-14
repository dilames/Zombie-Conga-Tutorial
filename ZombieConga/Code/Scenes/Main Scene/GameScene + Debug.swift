//
//  GameScene+Debug.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 1/24/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation
import SpriteKit

extension GameScene {
    
    enum DebugNames: String {
        case cameraRect = "cameraRect"
        case zombieRect = "zombieRect"
        case catRect    = "catRect"
        case grannyRect = "grannyRect"
        case trainRect  = "trainRect"
    }
    
    class Debug {
        fileprivate(set) static var enableDebug = true
        
        class func debugUpdateFunc() {
            guard self.enableDebug == true else { return }
            self.drawCameraRect()
            self.drawZombieRect()
            self.drawCatsRect()
            self.drawCatsInTrainRect()
            self.drawGrannyRect()
            self.drawZombieViewLine()
        }
        
        class func debugPrint(object: Any) {
            guard self.enableDebug == true else { return }
            print(object)
        }
        
        fileprivate class func drawLine(from firstPoint: CGPoint, target secondPoint: CGPoint, with name: String, zRotation: CGFloat?) {
            guard self.enableDebug == true else { return }
            guard let scene = GameScene.default else { return }
            
            let debugName = "\(name)Line"
            scene.enumerateChildNodes(withName: debugName) { (node, stop) in node.removeFromParent() }
            let line = SKShapeNode()
            let path = CGMutablePath()
            
            path.move(to: firstPoint)
            if let zRotation = zRotation { path.addLine(to: secondPoint, transform: CGAffineTransform(rotationAngle: zRotation)) }
            else { path.addLine(to: secondPoint) }
            line.path = path
            line.strokeColor = SKColor.red
            line.lineWidth = 4.0
            line.name = debugName
            
            scene.addChild(line)
        }
        
        fileprivate class func drawRect(rect: CGRect, withDebugName debugName: String) {
            guard self.enableDebug == true else { return }
            guard let scene = GameScene.default else { return }
            scene.enumerateChildNodes(withName: debugName) { (node, stop) in node.removeFromParent() }
            let shape = SKShapeNode()
            let path = CGMutablePath()
            path.addRect(rect)
            shape.path = path
            shape.strokeColor = SKColor.red
            shape.lineWidth = 4.0
            shape.name = debugName
            scene.addChild(shape)
        }
        
        fileprivate class func drawRect(rect: CGRect, withDebugName debugName: DebugNames) {
            self.drawRect(rect: rect, withDebugName: debugName.rawValue)
        }
        
        fileprivate class func drawRect(rect: CGRect, withDebugName debugName: DebugNames, idx: Int) {
            let debugNameStr = "\(debugName.rawValue)\(idx)"
            self.drawRect(rect: rect, withDebugName: debugNameStr)
        }
    }
}

extension GameScene.Debug {
    class func drawCameraRect() {
        guard let scene = GameScene.default else { return }
        guard let camera = scene.camera as? SKCamera else { return }
        self.drawRect(rect: camera.cameraRect, withDebugName: .cameraRect)
    }
    
    class func drawZombieRect() {
        guard let scene = GameScene.default else { return }
        self.drawRect(rect: scene.zombie.frame, withDebugName: .zombieRect)
        
        guard let targetLoc = scene.zombie.targetLocation else { return }
        self.drawLine(from: scene.zombie.position, target: targetLoc, with: GameScene.DebugNames.zombieRect.rawValue, zRotation: nil)
        
    }
    
    class func drawZombieViewLine() {
        guard self.enableDebug == true else { return }
        guard let scene = GameScene.default else { return }
        self.drawLine(from: scene.zombie.position,
                      target: CGPoint(x: scene.zombie.position.x + 1000,
                                      y: 0),
                      with: "\(GameScene.DebugNames.zombieRect.rawValue)View",
                      zRotation: scene.zombie.zRotation)
    }
    
    class func drawCatsRect() {
        guard let scene = GameScene.default else { return }
        var idx = 0
        scene.enumerateChildNodes(withName: SpriteNames.cat) { (node, stop) in
            self.drawRect(rect: node.frame, withDebugName: .catRect, idx: idx)
            idx += 1
        }
    }
    
    class func drawCatsInTrainRect() {
        guard let scene = GameScene.default else { return }
        var idx = 0
        scene.enumerateChildNodes(withName: SpriteNames.catTrain) { (node, stop) in
            self.drawRect(rect: node.frame, withDebugName: .trainRect, idx: idx)
            idx += 1
        }
    }
    
    class func drawGrannyRect() {
        guard let scene = GameScene.default else { return }
        scene.enumerateChildNodes(withName: SpriteNames.granny) { (node, stop) in
            self.drawRect(rect: node.frame, withDebugName: .grannyRect)
        }
    }
}

extension GameScene {
    fileprivate func moveByCardioid(angle: inout Double) {
        let maxX = Double(size.width) / 2
        let maxY = Double(size.height) / 2
        
        if angle <= 2.0 * Double.pi {
            let x = 4.0 * cos(angle) * (1 + cos(angle))
            let y = 4.0 * sin(angle) * (1 + cos(angle))
            let moveToX = maxX + round(120 * x + 1)
            let moveToY = maxY + round(120 * y + 1)
            zombie.position = CGPoint(x: moveToX, y: moveToY)
            angle += 0.1
        } else { angle = 0.0 }
    }
}
