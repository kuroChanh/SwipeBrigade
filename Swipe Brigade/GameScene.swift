//
//  GameScene.swift
//  Swipe Brigade
//
//  Created by Ngo Tuyetnhi N. on 4/5/18.
//  Copyright © 2018 Ngo Tuyetnhi N. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    //background
    let background = Image("background")
    var lastUpdateTime: TimeInterval?
    
    //test
    let test1 = Knight()
    private var knight = SKSpriteNode()
    private var knightFrames: [SKTexture] = []
    private var swordFrames: [SKTexture] = []
    private var warriorFrames: [SKTexture] = []
    //var ugly2 = SKSpriteNode(imageNamed: "warrior_0")
    var ugly2 = SKSpriteNode()
    var ugly3 = SKSpriteNode()
    var ugly4 = SKSpriteNode()
    
    override func didMove(to view: SKView) {
        //background
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.xScale = 0.95
        background.yScale = 0.95
        background.zPosition = -1
        addChild(background)
        
        //test
//        addChild(test1)
        
        buildKnightAnim()
        animKnight()
    }
    override func update(_ currentTime: TimeInterval){
        guard let lastUpdateTime = lastUpdateTime else {
            self.lastUpdateTime = currentTime
            return
        }
        // calc deltaTime
        let deltaTime = currentTime - lastUpdateTime
        self.lastUpdateTime = currentTime
        
        //test
        test1.update(deltaTime)
        
        ugly2.position.y -= 350 * CGFloat(deltaTime)
        ugly3.position.y -= 350 * CGFloat(deltaTime)
        ugly4.position.y -= 350 * CGFloat(deltaTime)
    }
    
    //test
    func buildKnightAnim(){
        let knightAnim = SKTextureAtlas(named: "knight")
        var frames: [SKTexture] = []
        
        let numImages = knightAnim.textureNames.count
        for i in 1...numImages{
            let knightName = "knight_\(i - 1)" //
            frames.append(knightAnim.textureNamed(knightName))
        }
        knightFrames = frames
        
        let firstFrame = knightFrames[0]
        ugly2 = SKSpriteNode(texture: firstFrame)
        ugly2.position = CGPoint(x: 1025, y: 1650)
        ugly2.xScale = 5
        ugly2.yScale = 5
        ugly2.zPosition = 2
        addChild(ugly2)
        ///
        let swordAnim = SKTextureAtlas(named: "sword")
        var frames2: [SKTexture] = []
        
        let numImages2 = swordAnim.textureNames.count
        for i in 1...numImages2{
            let swordName = "sword_\(i - 1)" //
            frames2.append(swordAnim.textureNamed(swordName))
        }
        swordFrames = frames2
        
        let firstFrame2 = swordFrames[0]
        ugly3 = SKSpriteNode(texture: firstFrame2)
        ugly3.position = CGPoint(x: 1025, y: 1850)
        ugly3.xScale = 5
        ugly3.yScale = 5
        ugly3.zPosition = 2
        addChild(ugly3)
        ///
        let warriorAnim = SKTextureAtlas(named: "warrior")
        var frames3: [SKTexture] = []
        
        let numImages3 = warriorAnim.textureNames.count
        for i in 1...numImages3{
            let warriorName = "warrior_\(i - 1)" //
            frames3.append(warriorAnim.textureNamed(warriorName))
        }
        warriorFrames = frames3
        
        let firstFrame3 = warriorFrames[0]
        ugly4 = SKSpriteNode(texture: firstFrame3)
        ugly4.position = CGPoint(x: 1025, y: 2050)
        ugly4.xScale = 5
        ugly4.yScale = 5
        ugly4.zPosition = 2
        addChild(ugly4)
    }
    func animKnight(){
        ugly2.run(SKAction.repeatForever(SKAction.animate(with: knightFrames, timePerFrame: 0.2, resize: false, restore: true)), withKey: "knightAnimation")
        ugly3.run(SKAction.repeatForever(SKAction.animate(with: swordFrames, timePerFrame: 0.2, resize: false, restore: true)), withKey: "swordAnimation")
        ugly4.run(SKAction.repeatForever(SKAction.animate(with: warriorFrames, timePerFrame: 0.2, resize: false, restore: true)), withKey: "warriorAnimation")
    }
}
