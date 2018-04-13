//
//  Warrior.swift
//  Swipe Brigade
//
//  Created by Ngo Tuyetnhi N. on 4/5/18.
//  Copyright © 2018 Ngo Tuyetnhi N. All rights reserved.
//
//  Warrior class
//  Has its own range of stats

import Foundation
import SpriteKit

class Warrior: Image, Enemy{
    var attribute: Stats
    var swipedLeft: Bool
    var swipedRight: Bool
    
    required init() {
        //init attributes
        attribute = Stats(speed: 0, attack: 0, defense: 0)
        swipedLeft = false
        swipedRight = false
        //init image
        super.init("warrior_0")
        //randomize stats for the enemy
        attribute.speed = randSpeed()
        attribute.attack = randAtk()
        attribute.defense = randDef()
        print("Warrior Speed: ", attribute.speed)
        print("Warrior Attack: ", attribute.attack)
        print("Warrior Defense: ", attribute.defense)
        //set position
        position = CGPoint(x: 1025, y: 1650)
        xScale = 5
        yScale = 5
        print("Position: ", position)
    }
    
    func randSpeed() -> CGFloat {
        //knight has low range (1, 2, 3)
        return CGFloat(arc4random_uniform(3) + 1)
    }
    func randAtk() -> Float {
        //knight has low/medium/high range (7, 8, 9)
        return Float(arc4random_uniform(3) + 7)
    }
    func randDef() -> Float {
        //knight has high/low/medium range (4, 5, 6)
        return Float(arc4random_uniform(3) + 4)
    }
    func update(_ deltaTime: TimeInterval) {
        //the enemy moves down the screen
        if(swipedLeft){
            if(position.y < 375){
                position.x -= 350 * CGFloat(deltaTime)
            }
            else{
                swipedLeft = false;
            }
        }
        else if(swipedRight){
            if(position.y < 375){
                position.x += 350 * CGFloat(deltaTime)
            }
            else{
                swipedRight = false;
            }
        }
        else{
            position.y -= 350 * (attribute.speed / 4) * CGFloat(deltaTime)
        }
    }
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been found")
    }    
    required init(_ imagePath: String) {
        fatalError("init has not been implemented")
    }
}
