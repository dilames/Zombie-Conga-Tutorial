//
//  SKCat + Rotation.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 1/26/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation
import SpriteKit

extension SKCat {
    func wiggling() -> SKAction {
        let leftWiggle = SKAction.rotate(byAngle: CGFloat.pi/8.0, duration: 0.5)
        let rightWiggle = leftWiggle.reversed()
        let fullWiggle = SKAction.sequence([leftWiggle, rightWiggle])
        let wiggleAction = SKAction.repeat(fullWiggle, count: 10)
        return wiggleAction
    }
    
    enum scalingType {
        case appearing
        case dissapearing
    }
    func scale(scalingMode: scalingType, duration: TimeInterval) -> SKAction {
        switch scalingMode {
        case .appearing:    return SKAction.scale(to: 1.0, duration: duration)
        case .dissapearing: return SKAction.scale(to: 0, duration: duration)
        }
    }
    
    func scaleAndWiggle(count: Int) -> SKAction {
        let scaleUp = SKAction.scale(by: 1.2, duration: 0.25)
        let scaleDown = scaleUp.reversed()
        let fullScale = SKAction.sequence([scaleUp, scaleDown, scaleUp, scaleDown])
        let group = SKAction.group([fullScale, self.wiggling()])
        return SKAction.repeat(group, count: count)
    }
}
