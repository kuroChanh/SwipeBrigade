//
//  Image.swift
//  Swipe Brigade
//
//  Created by Ngo Tuyetnhi N. on 4/5/18.
//  Copyright © 2018 Ngo Tuyetnhi N. All rights reserved.
//
//  This class will be used for images

import Foundation
import SpriteKit

class Image : SKSpriteNode{
    var tex: SKTexture!
    required init(_ imagePath: String) {
        //init the image
        tex = SKTexture(imageNamed: imagePath)
        super.init(texture: tex, color: .clear, size: tex.size())
        //setting attributes
        zPosition = 1
        xScale = 0.6
        yScale = 0.75
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
