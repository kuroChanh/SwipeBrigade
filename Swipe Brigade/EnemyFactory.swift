//
//  EnemyFactory.swift
//  Swipe Brigade
//
//  Created by Ngo Tuyetnhi N. on 4/17/18.
//  Copyright © 2018 Ngo Tuyetnhi N. All rights reserved.
//

import Foundation
import SpriteKit

protocol Factory {
    func makeKnight() ->Knight
    func makeSwordsman() -> Swordsman
    func makeWarrior() -> Warrior
}

class EnemyFactory: Factory{
    let maxEnemySet = 3
    var knights:[Knight] = []
    var swordsmen:[Swordsman] = []
    var warriors:[Warrior] = []
    
    required init() {
        //set initial positions of the enemies
        var i = 0
        while(i < maxEnemySet){
            let knight = makeKnight()
            knight.position.y += CGFloat(900 * i)
            knights.append(knight)
            
            let swordsman = makeSwordsman()
            swordsman.position.y += CGFloat(900 * i)
            swordsmen.append(swordsman)
            
            let warrior = makeWarrior()
            warrior.position.y += CGFloat(900 * i)
            warriors.append(warrior)
            
            i += 1
        }
    }
    func update(_ deltaTime: TimeInterval){
        //update all enemies
        for knight in knights{
            knight.update(deltaTime)
        }
        for swordsman in swordsmen{
            swordsman.update(deltaTime)
        }
        for warrior in warriors{
            warrior.update(deltaTime)
        }
    }
    func getAllKnights()->Array<Knight>{
        return knights
    }
    func getAllSwordsmen()->Array<Swordsman>{
        return swordsmen
    }
    func getAllWarriors()->Array<Warrior>{
        return warriors
    }
    func makeKnight() -> Knight {
        return Knight()
    }
    func makeSwordsman() -> Swordsman {
        return Swordsman()
    }
    func makeWarrior() -> Warrior {
        return Warrior()
    }
}
