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
    var castle = Castle()
    
    func update(_ deltaTime: TimeInterval){
        enemies.update(deltaTime)
        castleHealth()
    }
    func castleHealth(){
        for checkKnight in getKnights(){
            if(checkKnight.hitCastle == true){
                castle.health -= Float(checkKnight.attribute.attack)
                print("Health: ", castle.health)
            }
        }
        for checkSwordsman in getSwordsmen(){
            if(checkSwordsman.hitCastle == true){
                castle.health -= Float(checkSwordsman.attribute.attack)
                print("Health: ", castle.health)
            }
        }
        for checkWarrior in getWarriors(){
            if(checkWarrior.hitCastle == true){
                castle.health -= Float(checkWarrior.attribute.attack)
                print("Health: ", castle.health)
            }
        }
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
