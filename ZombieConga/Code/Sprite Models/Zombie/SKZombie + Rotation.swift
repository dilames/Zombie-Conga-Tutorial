//
//  SKZombie + Rotation.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 1/26/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation
import SpriteKit

// MARK: Rotation
extension SKZombie {
    func rotate(direction: CGPoint, radiansPerSecond: CGFloat, deltaTime: TimeInterval) {
        let shortestAngle = shortestAngleBetween(currentAngle: self.zRotation, destinationAngle: direction.angle)
        let amountToRotate = min(radiansPerSecond * CGFloat(deltaTime), abs(shortestAngle))
        self.zRotation += shortestAngle.sign() * amountToRotate
    }
}
