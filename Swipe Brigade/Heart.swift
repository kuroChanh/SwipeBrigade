//
//  Heart.swift
//  Swipe Brigade
//
//  Created by Ngo Tuyetnhi N. on 4/25/18.
//  Copyright © 2018 Ngo Tuyetnhi N. All rights reserved.
//

import Foundation
import SpriteKit

class Heart : Image{
    required init() {
        //init image
        super.init("heart")
        position = CGPoint(x: 1025, y: 300)
        zPosition = 10
        xScale = 3
        yScale = 3
    }
    required init(_ imagePath: String) {
        fatalError("init has not been implemented")
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
