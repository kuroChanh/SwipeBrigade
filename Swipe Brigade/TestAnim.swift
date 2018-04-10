//
//  Knight.swift
//  Swipe Brigade
//
//  Created by Ngo Tuyetnhi N. on 4/5/18.
//  Copyright © 2018 Ngo Tuyetnhi N. All rights reserved.
//
//  Knight class
//  Has its own range of stats

import Foundation
import SpriteKit

class TestAnim: SKSpriteNode{
    private var knightFrames: [SKTexture] = []
    var ugly2 = SKSpriteNode()
    
    required init() {
        let tex = SKTexture(imageNamed: "knight_0")
        super.init(texture: tex, color: .clear, size: tex.size())
        //set position
        ugly2.position = CGPoint(x: 1025, y: 1650)
        ugly2.xScale = 5
        ugly2.yScale = 5
        ugly2.zPosition = 2
        addChild(ugly2)
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
        ugly2.position = CGPoint(x: frame.midX, y: frame.midY)
        ugly2.xScale = 5
        ugly2.yScale = 5
    }
    func animKnight(){
        ugly2.run(SKAction.repeatForever(SKAction.animate(with: knightFrames, timePerFrame: 0.2, resize: false, restore: true)), withKey: "knightAnimation")
    }
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been found")
    }
}

