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
    var swipedLeft: Bool
    var swipedRight: Bool
    var inArea: Bool
    var hitCastle: Bool
    
    required init() {
        //init attributes
        attribute = Stats(speed: 0, attack: 0, defense: 0)
        swipedLeft = false
        swipedRight = false
        inArea = false
        hitCastle = false
        //init image
        super.init("knight_0")
        //randomize stats for the enemy
        attribute.speed = randSpeed()
        attribute.attack = randAtk()
        attribute.defense = randDef()
        position = CGPoint(x: 1025, y: 1650)
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
        if(position.x <= 500 || position.x >= 1600){
            reset()
        }
        //if enemy goes into the DEATH PIT
        if((position.x <= 725 && position.y < 400 && position.y > 300) || (position.x >= 1300 && position.y < 400 && position.y > 300)){
            reset()
        }
        //if the enemy is in the swipe area
        if(position.y < 400 && position.y > 300){
            inArea = true
        }
        else{
            inArea = false
        }
        //if the enemy hits the castle
        if(position.y < 200 && position.y > 190){
            hitCastle = true
        }
        else{
            hitCastle = false
        }
    }
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been found")
    }
    required init(_ imagePath: String) {
        fatalError("init has not been implemented")
    }
}
