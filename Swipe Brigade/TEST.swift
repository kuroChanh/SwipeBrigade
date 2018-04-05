//
//  TEST.swift
//  Swipe Brigade
//
//  Created by Ngo Tuyetnhi N. on 4/5/18.
//  Copyright © 2018 Ngo Tuyetnhi N. All rights reserved.
//

import Foundation
import UIKit

class TEST: UIViewController{
    override func loadView(){
        let view = UIView()
        view.backgroundColor = .white
        //the background image ;w; to be changed
        let image = UIImage(named: "shiba.png")
        let imageV = UIImageView(image: image)
        imageV.center = CGPoint(x: 200, y: 250)
        view.addSubview(imageV)
        //play button
        let play = UIButton(type: .roundedRect)
        play.tintColor = .blue
        view.addSubview(play)
        
        
        //this will render everything onto the screen
        self.view = view
    }
}
