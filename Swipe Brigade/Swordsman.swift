//
//  Swordsman.swift
//  Swipe Brigade
//
//  Created by Ngo Tuyetnhi N. on 4/5/18.
//  Copyright © 2018 Ngo Tuyetnhi N. All rights reserved.
//
//  Swordsman class
//  Has its own range of stats

import Foundation
import SpriteKit

class Swordsman: Image, Enemy{
    var attribute: Stats
    var swipedLeft: Bool
    var swipedRight: Bool
    
    required init() {
        //init attributes
        attribute = Stats(speed: 0, attack: 0, defense: 0)
        swipedLeft = false
        swipedRight = false
        //init image
        super.init("sword_0")
        //randomize stats for the enemy
        attribute.speed = randSpeed()
        attribute.attack = randAtk()
        attribute.defense = randDef()
        position = CGPoint(x: 1025, y: CGFloat(1650 + arc4random_uniform(200) + 100))
    }
    
    func randSpeed() -> CGFloat {
        //knight has high range (7, 8, 9)
        return CGFloat(arc4random_uniform(3) + 7)
    }
    func randAtk() -> Float {
        //knight has low/medium range (4, 5, 6)
        return Float(arc4random_uniform(3) + 4)
    }
    func randDef() -> Float {
        //knight has high/low range (1, 2, 3)
        return Float(arc4random_uniform(3) + 1)
    }
    func update(_ deltaTime: TimeInterval) {
        //check for swipe
        swipe(deltaTime)
        //check collisions
        collisionCheck()
    }
    func reset(){
        position = CGPoint(x: 1025, y: 1650)
        swipedLeft = false
        swipedRight = false
    }
    func swipe(_ deltaTime: TimeInterval){
        if(swipedLeft){
            position.x -= 350 * CGFloat(deltaTime)
        }
        else if(swipedRight){
            position.x += 350 * CGFloat(deltaTime)
        }
        else{
            position.y -= 350 * CGFloat(deltaTime)
        }
    }
    func collisionCheck(){
        //check if enemy goes out of screen bounds
        if(position.x <= 0 || position.x >= 2050){
            reset()
        }
    }
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been found")
    }    
    required init(_ imagePath: String) {
        fatalError("init has not been implemented")
    }
}
