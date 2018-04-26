//
//  GameManager.swift
//  Swipe Brigade
//
//  Created by Ngo Tuyetnhi N. on 4/17/18.
//  Copyright © 2018 Ngo Tuyetnhi N. All rights reserved.
//

import Foundation
import SpriteKit

enum swipeCounter{
    case swipeLeft
    case swipeRight
    case noSwipe
}

class GameManager{
    let enemies = EnemyFactory()
    var castle = Castle()
    var swipe: swipeCounter?
    var leftCounter = 0
    var rightCounter = 0
    var scene = SKScene()
    var left = false
    var right = false
    
    func update(_ deltaTime: TimeInterval){
        enemies.update(deltaTime)
        castle.update(deltaTime)
        castleHealth()
        jailCheck()
    }
    func jailCheck(){
        for checkKnight in getKnights(){
            if(checkKnight.swipedLeft == true){
                swipe = swipeCounter.swipeLeft
                jailCounter()
                swipe = swipeCounter.noSwipe
            }
            else if(checkKnight.swipedRight == true){
                swipe = swipeCounter.swipeRight
                jailCounter()
                swipe = swipeCounter.noSwipe
            }
        }
        for checkSwordsman in getSwordsmen(){
            if(checkSwordsman.swipedLeft == true){
                swipe = swipeCounter.swipeLeft
                jailCounter()
                swipe = swipeCounter.noSwipe
            }
            else if(checkSwordsman.swipedRight == true){
                swipe = swipeCounter.swipeRight
                jailCounter()
                swipe = swipeCounter.noSwipe
            }
        }
        for checkWarrior in getWarriors(){
            if(checkWarrior.swipedLeft == true){
                swipe = swipeCounter.swipeLeft
                jailCounter()
                swipe = swipeCounter.noSwipe
            }
            else if(checkWarrior.swipedRight == true){
                swipe = swipeCounter.swipeRight
                jailCounter()
                swipe = swipeCounter.noSwipe
            }
        }
    }
    func jailCounter(){
        switch swipe{
        case .swipeLeft?:
            leftCounter += 1
            if(leftCounter >= 80){
                leftParticle()
                
                leftCounter = 0
            }
        case .swipeRight?:
            rightCounter += 1
            if(rightCounter >= 80){
                rightParticle()
                rightCounter = 0
            }
        default:
            break
        }
    }
    func leftParticle(){
        left = true
    }
    func rightParticle(){
        right = true
    }
    func castleHealth(){
        for checkKnight in getKnights(){
            if(checkKnight.hitCastle == true){
                castle.health -= Float(checkKnight.attribute.attack)
            }
        }
        for checkSwordsman in getSwordsmen(){
            if(checkSwordsman.hitCastle == true){
                castle.health -= Float(checkSwordsman.attribute.attack)
            }
        }
        for checkWarrior in getWarriors(){
            if(checkWarrior.hitCastle == true){
                castle.health -= Float(checkWarrior.attribute.attack)
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
