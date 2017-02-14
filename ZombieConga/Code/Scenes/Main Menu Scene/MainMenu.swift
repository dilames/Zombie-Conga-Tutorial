//
//  MainMenu.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 2/1/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation
import SpriteKit

class MainMenuScene : SKScene {
    
    override init(size: CGSize) {
        super.init(size: size)
        
        let background = SKSpriteNode(imageNamed: R.image.mainMenuBackground.name)
        background.position = CGPoint(x: size.width / 2, y: size.height / 2)
        self.addChild(background)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func sceneTapped(in location: CGPoint) {
        let processGameSceneAction = SKAction.run {
            let gameScene = GameScene(size: self.size)
            gameScene.scaleMode = self.scaleMode
            self.view?.presentScene(gameScene, transition: SKTransition.doorway(withDuration: 1.5))
        }
        
        self.run(SKAction.sequence([SKAction.wait(forDuration: 3.0),
                                    processGameSceneAction]))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        sceneTapped(in: touch.location(in: self))
    }
    
}
