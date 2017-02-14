//
//  Sounds.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 2/2/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation
import SpriteKit

class Sounds {
    static let catCollisionSound    = SKAction.playSoundFileNamed(R.file.hitCatWav.name, waitForCompletion: false)
    static let grannyCollisionSound = SKAction.playSoundFileNamed(R.file.hitGrannyWav.name, waitForCompletion: false)
    static let victorySound         = SKAction.playSoundFileNamed(R.file.winWav.name,   waitForCompletion: false)
    static let defeatSound          = SKAction.playSoundFileNamed(R.file.loseWav.name,  waitForCompletion: false)
}
