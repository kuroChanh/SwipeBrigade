//
//  GameManager.swift
//  Swipe Brigade
//
//  Created by Ngo Tuyetnhi N. on 4/17/18.
//  Copyright © 2018 Ngo Tuyetnhi N. All rights reserved.
//

import Foundation

class GameManager{
    let enemies = EnemyFactory()
    
    func update(_ deltaTime: TimeInterval){
        enemies.update(deltaTime)
    }
    func getKnights()->Array<Knight>{
        return enemies.getAllKnights()
    }
    func getSwordsmen()->Array<Swordsman>{
        return enemies.getAllSwordsmen()
    }
    func getWarriors()->Array<Warrior>{
        return enemies.getAllWarriors()
    }
}
