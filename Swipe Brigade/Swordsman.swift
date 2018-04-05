//
//  Swordsman.swift
//  Swipe Brigade
//
//  Created by Ngo Tuyetnhi N. on 4/5/18.
//  Copyright © 2018 Ngo Tuyetnhi N. All rights reserved.
//

import Foundation
import SpriteKit

class Swordsman: Enemy{
    var attribute: Stats
    
    required init() {
        //init attributes
        attribute = Stats(speed: 0, attack: 0, defense: 0)
        //randomize stats for the enemy
        attribute.speed = randSpeed()
        attribute.attack = randAtk()
        attribute.defense = randDef()
        print("Swordsman Speed: ", attribute.speed)
        print("Swordsman Attack: ", attribute.attack)
        print("Swordsman Defense: ", attribute.defense)
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
}
