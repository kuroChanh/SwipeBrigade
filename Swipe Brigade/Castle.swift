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
    let health: Int?
    required init() {
        //init
        health = 100
        //init image
        super.init("castle")
        //set position
        position = CGPoint(x: 1025, y: 100)
        xScale = 2
        yScale = 2
        zPosition = 5
    }
    required init(_ imagePath: String) {
        fatalError("init has not been implemented")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
