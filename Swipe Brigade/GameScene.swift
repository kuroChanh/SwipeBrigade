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
    //var ugly2 = SKSpriteNode(imageNamed: "warrior_0")
    var ugly2 = SKSpriteNode()
    
    let ugly = TestAnim()
    
    override func didMove(to view: SKView) {
        //background
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.xScale = 0.95
        background.yScale = 0.95
        background.zPosition = -1
        addChild(background)
        
        //test
//        addChild(test1)
        addChild(ugly)

        ugly2.zPosition = 2
        ugly2.xScale = 5
        ugly2.yScale = 5
        ugly2.position = CGPoint(x: size.width/2, y: size.height/2)
        buildKnightAnim()
        addChild(ugly2)
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
        //addChild(ugly2)
    }
    func animKnight(){
        ugly2.run(SKAction.repeatForever(SKAction.animate(with: knightFrames, timePerFrame: 0.2, resize: false, restore: true)), withKey: "knightAnimation")
    }
}
