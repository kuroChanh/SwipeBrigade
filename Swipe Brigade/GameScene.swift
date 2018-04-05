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
    //test variables
    let test1 = Warrior()
    let test4 = Image("shiba")
    
    override func didMove(to view: SKView) {
        //addChild(test4)
        //test4.position = CGPoint(x: size.width/2, y: size.height/2)
        addChild(test1)
        //test1.position = CGPoint(x: size.width/2, y: size.height/2)
    }
}
