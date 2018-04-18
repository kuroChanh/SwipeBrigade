//
//  GameScene.swift
//  Swipe Brigade
//
//  Created by Ngo Tuyetnhi N. on 4/5/18.
//  Copyright © 2018 Ngo Tuyetnhi N. All rights reserved.
//

import SpriteKit
import GameplayKit
import UIKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    //background
    let background = Image("background")
    //castle
    let castle = Castle()
    //time
    var lastUpdateTime: TimeInterval?
    //enemies on the ground
    private var knightFrames: [SKTexture] = []
    private var swordFrames: [SKTexture] = []
    private var warriorFrames: [SKTexture] = []
    var knight = SKSpriteNode()
    var sword = SKSpriteNode()
    var warrior = SKSpriteNode()
    //game manager
    let gameManager = GameManager()
    
    
    
    
    //test object
    let test = Knight()
    
    override func didMove(to view: SKView) {
        //background
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.xScale = 0.95
        background.yScale = 0.95
        background.zPosition = -1
        addChild(background)
        //castle
        addChild(castle)
        //animated enemies
//        buildEnemyAnim()
//        animEnemies()
        
        //add all knights to the scene
        for knightEnemy in gameManager.getKnights(){
            addChild(knightEnemy)
        }
        //add all swordsmen to the scene
        for swordsmanEnemy in gameManager.getSwordsmen(){
            addChild(swordsmanEnemy)
        }
        //add all warriors to the scene
        for warriorEnemy in gameManager.getWarriors(){
            addChild(warriorEnemy)
        }
        
        //test object for more work
        //addChild(test)
        
        //swiping
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeLeft.direction = .left
        self.view?.addGestureRecognizer(swipeLeft)
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(swiped))
        swipeRight.direction = .right
        self.view?.addGestureRecognizer(swipeRight)
    }
    
    @IBAction func swiped(gesture: UIGestureRecognizer){
        //result of swipe
        if let swipeGesture = gesture as? UISwipeGestureRecognizer{
            switch swipeGesture.direction{
            case UISwipeGestureRecognizerDirection.left:
                print("swiped left!")
                //check if the user is in the collision area of the object
                //test.swipedLeft = true
            case UISwipeGestureRecognizerDirection.right:
                print("swiped right!")
                //check if the user is in the collision area of the object
                //test.swipedRight = true
            default:
                break
            }
        }
    }
    override func update(_ currentTime: TimeInterval){
        guard let lastUpdateTime = lastUpdateTime else {
            self.lastUpdateTime = currentTime
            return
        }
        // calc deltaTime
        let deltaTime = currentTime - lastUpdateTime
        self.lastUpdateTime = currentTime
        //enemies
        knight.position.y -= 350 * CGFloat(deltaTime)
        sword.position.y -= 350 * CGFloat(deltaTime)
        warrior.position.y -= 350 * CGFloat(deltaTime)
        //game manager
        gameManager.update(deltaTime)
        //castle health
        print("Castle Health: ", castle.health as Any)
        
        //test
        //test.update(deltaTime)
    }
    func buildEnemyAnim(){
        //building the knight animation
        let knightAnim = SKTextureAtlas(named: "knight")
        var frames: [SKTexture] = []
        let numImages = knightAnim.textureNames.count
        for i in 1...numImages{
            let knightName = "knight_\(i - 1)" //
            frames.append(knightAnim.textureNamed(knightName))
        }
        knightFrames = frames
        let firstFrame = knightFrames[0]
        knight = SKSpriteNode(texture: firstFrame)
        knight.position = CGPoint(x: 1025, y: 1650)
        knight.xScale = 5
        knight.yScale = 5
        knight.zPosition = 2
        addChild(knight)
        
        //building the sword animation
        let swordAnim = SKTextureAtlas(named: "sword")
        var frames2: [SKTexture] = []
        let numImages2 = swordAnim.textureNames.count
        for i in 1...numImages2{
            let swordName = "sword_\(i - 1)" //
            frames2.append(swordAnim.textureNamed(swordName))
        }
        swordFrames = frames2
        let firstFrame2 = swordFrames[0]
        sword = SKSpriteNode(texture: firstFrame2)
        sword.position = CGPoint(x: 1025, y: 1850)
        sword.xScale = 5
        sword.yScale = 5
        sword.zPosition = 2
        addChild(sword)
        
        //building the warrior animation
        let warriorAnim = SKTextureAtlas(named: "warrior")
        var frames3: [SKTexture] = []
        let numImages3 = warriorAnim.textureNames.count
        for i in 1...numImages3{
            let warriorName = "warrior_\(i - 1)" //
            frames3.append(warriorAnim.textureNamed(warriorName))
        }
        warriorFrames = frames3
        let firstFrame3 = warriorFrames[0]
        warrior = SKSpriteNode(texture: firstFrame3)
        warrior.position = CGPoint(x: 1025, y: 2050)
        warrior.xScale = 5
        warrior.yScale = 5
        warrior.zPosition = 2
        addChild(warrior)
    }
    func animEnemies(){
        knight.run(SKAction.repeatForever(SKAction.animate(with: knightFrames, timePerFrame: 0.2, resize: false, restore: true)), withKey: "knightAnimation")
        sword.run(SKAction.repeatForever(SKAction.animate(with: swordFrames, timePerFrame: 0.2, resize: false, restore: true)), withKey: "swordAnimation")
        warrior.run(SKAction.repeatForever(SKAction.animate(with: warriorFrames, timePerFrame: 0.2, resize: false, restore: true)), withKey: "warriorAnimation")
    }
}
