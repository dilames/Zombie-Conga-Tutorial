//
//  GameScene.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 1/21/17.
//  Copyright © 2017 com. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    static var `default` : GameScene?
    internal let playableRect: CGRect
    private var currentTime: TimeInterval = 0
    private var lastUpdateTime: TimeInterval = 0
    internal var deltaTime: TimeInterval {
        get {
            var dt: TimeInterval
            if lastUpdateTime > 0 { dt = currentTime - lastUpdateTime }
            else { dt = 0 }
            lastUpdateTime = currentTime
            return dt
        }
    }
    var gameOver = false {
        didSet {
            guard gameOver == true else { return }
            guard zombie.lifes > 0 else { self.showDefeatScene(); return }
            self.showVictoryScene()
        }
    }
    
    let zombie = SKZombie()
    var lifesLabel: SKLifesNode!
    var catsLabel: SKCatTrainLabel!
    
    override init(size: CGSize) {
        let maximumAspectRatio: CGFloat = 16.0 / 9.0
        let playableHeight = size.width / maximumAspectRatio
        let playableMargin = (size.height - playableHeight) / 2.0
        playableRect = CGRect(x: 0, y: playableMargin, width: size.width, height: playableHeight)
        super.init(size: size)
        
        let camera = SKCamera(position: CGPoint(x: self.size.width / 2, y: self.size.height / 2))
        self.addChild(camera)
        self.camera = camera
        
        lifesLabel = SKLifesNode(camera: camera)
        catsLabel = SKCatTrainLabel(camera: camera)
        
        GameScene.default = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        self.playBackgroundMusic()
        
        SKBackground.assembleEndlessBackground(on: self)
        zombie.position = CGPoint(x: playableRect.size.width / 2, y: playableRect.size.height / 2)
        zombie.zPosition = 100
        self.addChild(zombie)
        
        spawner(object: .granny, forDuration: GameScene.Settings.grannySpawnCooldown)
        spawner(object: .cat, forDuration: GameScene.Settings.catsSpawnCooldown)
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        GameScene.Debug.debugUpdateFunc()
        
        self.currentTime = currentTime
        let updateDt = self.deltaTime
        self.zombie.move(withTime: updateDt)
        self.zombie.boundsCheckZombie()
        self.moveCatsTrain()
        
        if let camera = self.camera as? SKCamera { camera.moveCamera(with: updateDt) }
    }
}
