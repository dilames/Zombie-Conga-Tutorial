//
//  GameScene + Background Music.swift
//  ZombieConga
//
//  Created by Andrew Chersky on 2/1/17.
//  Copyright © 2017 com. All rights reserved.
//

import Foundation
import AVFoundation

fileprivate var backgroundMusicPlayer: AVAudioPlayer!

extension GameScene {
    func playBackgroundMusic() {
        do {
            try backgroundMusicPlayer = AVAudioPlayer(contentsOf: R.file.backgroundMusicMp3()!)
            backgroundMusicPlayer.numberOfLoops = -1
            backgroundMusicPlayer.prepareToPlay()
            backgroundMusicPlayer.play()
        } catch {
            GameScene.Debug.debugPrint(object: "Error in backgroundAudioPlayer")
            return
        }
    }
    
    func pauseBackgroundMusic() {
        guard let player = backgroundMusicPlayer else { GameScene.Debug.debugPrint(object: "Error while pause music"); return }
        player.pause()
    }
    
    func resumeBackgroundMusic() {
        guard let player = backgroundMusicPlayer else { GameScene.Debug.debugPrint(object: "Error while resume music"); return }
        player.play()
    }
}
