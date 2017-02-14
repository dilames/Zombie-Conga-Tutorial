//
//  GameScene + Game Conditions.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 2/1/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation
import SpriteKit

extension GameScene {
    struct Settings {
        static let screenSize                   = CGSize(width: 2048, height: 1536)
        
        static let catsRequiredForVictory       = 100
        static let catsSubtractingByEnemyHit    = 3
        static let catPixelsPerSecond           = CGFloat(240.0)
        
        static let zombiePixelsPerSecond        = CGFloat(240.0)
        static let zombieRotationPerSecond      = CGFloat(1.0 * .pi)
        static let zombieStarterLifes           = 100
        
        static let grannySpawnCooldown          = 8.0
        static let catsSpawnCooldown            = 4.0
        
        static let cameraMovePointsPerSec       = CGFloat(100.0)
    }
    
    func showVictoryScene() {
        self.pauseBackgroundMusic()
        GameScene.Debug.debugPrint(object: "Victory")
        let gameOverScene = GameOverScene(size: size, won: true)
        gameOverScene.scaleMode = scaleMode
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        self.view?.presentScene(gameOverScene, transition: reveal)
    }
    
    func showDefeatScene() {
        self.pauseBackgroundMusic()
        GameScene.Debug.debugPrint(object: "Defeat")
        let gameOverScene = GameOverScene(size: size, won: false)
        gameOverScene.scaleMode = scaleMode
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        self.view?.presentScene(gameOverScene, transition: reveal)
    }
    
}
