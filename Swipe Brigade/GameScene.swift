//
//  GameScene.swift
//  Swipe Brigade
//
//  Created by Ngo Tuyetnhi N. on 4/5/18.
//  Copyright © 2018 Ngo Tuyetnhi N. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    //background
    //let background = Image("shiba")
    //
    var lastUpdateTime: TimeInterval?
    //test
    let test1 = Knight()
    
    override func didMove(to view: SKView) {
        //background
        //addChild(background)
        //background.position = CGPoint(x: size.width/2, y: size.height/2)
        
        
        
        //addChild(test4)
        //test4.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(test1)
        //test1.position = CGPoint(x: size.width/2, y: size.height/2)
    }
    override func update(_ currentTime: TimeInterval){
        guard let lastUpdateTime = lastUpdateTime else {
            self.lastUpdateTime = currentTime
            return
        }
        // calc deltaTime
        let deltaTime = currentTime - lastUpdateTime
        self.lastUpdateTime = currentTime
        test1.update(deltaTime)
    }
}
