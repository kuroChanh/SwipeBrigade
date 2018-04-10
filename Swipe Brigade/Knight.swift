//
//  Knight.swift
//  Swipe Brigade
//
//  Created by Ngo Tuyetnhi N. on 4/5/18.
//  Copyright © 2018 Ngo Tuyetnhi N. All rights reserved.
//
//  Knight class
//  Has its own range of stats

import Foundation
import SpriteKit

class Knight: Image, Enemy{
    var attribute: Stats
    
    required init() {
        //init attributes
        attribute = Stats(speed: 0, attack: 0, defense: 0)
        //init image
        super.init("knight_0")
        //randomize stats for the enemy
        attribute.speed = randSpeed()
        attribute.attack = randAtk()
        attribute.defense = randDef()
        print("Knight Speed: ", attribute.speed)
        print("Knight Attack: ", attribute.attack)
        print("Knight Defense: ", attribute.defense)
        //set position
        position = CGPoint(x: 1025, y: 1650)
        xScale = 5
        yScale = 5
        zPosition = 2
    }
    func randSpeed() -> CGFloat {
        //knight has medium range (4, 5, 6)
        return CGFloat(arc4random_uniform(3) + 4)
    }
    func randAtk() -> Float {
        //knight has low range (1, 2, 3)
        return Float(arc4random_uniform(3) + 1)
    }
    func randDef() -> Float {
        //knight has high range (7, 8, 9)
        return Float(arc4random_uniform(3) + 7)
    }
    func update(_ deltaTime: TimeInterval) {
        //the enemy moves down the screen
        //;w; temp placement, change later
        position.y -= 350 * CGFloat(deltaTime)
        //when they're sent to jail, their positions will reset or be DESTROYED
    }
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been found")
    }
    required init(_ imagePath: String) {
        fatalError("init has not been implemented")
    }
}
