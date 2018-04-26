//
//  Castle.swift
//  Swipe Brigade
//
//  Created by Ngo Tuyetnhi N. on 4/12/18.
//  Copyright © 2018 Ngo Tuyetnhi N. All rights reserved.
//

import Foundation
import SpriteKit

class Castle : Image{
    var health: Float
    //array of hearts
    var hearts:[Heart] = []
    required init() {
        //init
        health = 90 //multiple of 3 to show 3 hearts for UI
        //array of hearts
        var i = 0
        while(i < 3){
            let heart = Heart()
            heart.position.x = CGFloat(925 + (100 * i))
            hearts.append(heart)
            i += 1
        }
        //init image
        super.init("castle")
        //set position
        position = CGPoint(x: 1025, y: 100)
        xScale = 2
        yScale = 2
        zPosition = 5
    }
    func update(_ deltaTime: TimeInterval){
        //check health
        if(health <= 60){
            hearts[2].position.y = 3000
        }
        if(health <= 30){
            hearts[1].position.y = 3000
        }
        if(health <= 0){
            hearts[0].position.y = 3000
            gameOver()
        }
    }
    func gameOver(){
        //display game over scene
        //;w; check the menu stuff to change the scene
        print("GAMEOVER")
    }
    func getHearts() -> Array<Heart>{
        return hearts
    }
    required init(_ imagePath: String) {
        fatalError("init has not been implemented")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
