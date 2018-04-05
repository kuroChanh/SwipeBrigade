//
//  Enemy.swift
//  Swipe Brigade
//
//  Created by Ngo Tuyetnhi N. on 4/5/18.
//  Copyright © 2018 Ngo Tuyetnhi N. All rights reserved.
//
// This is the base enemy class
// Knight, Swordsman, and Warrior will inherit this base class

import Foundation
import SpriteKit

//struct
struct Stats{
    var speed: CGFloat
    var attack: Float
    var defense: Float
}

protocol Enemy {
    ///variables
    //relates to screen movement
    var attribute: Stats{get set }
    //var speed: CGFloat{ get set }
    //combat variables
    //var attack: Float{ get set }
    //var defense: Float{ get set }
    
    //functions
    func randSpeed() -> CGFloat
    func randAtk() -> Float
    func randDef() -> Float
}
