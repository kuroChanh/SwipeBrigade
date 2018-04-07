//
//  GameViewController.swift
//  Swipe Brigade
//
//  Created by Ngo Tuyetnhi N. on 4/5/18.
//  Copyright © 2018 Ngo Tuyetnhi N. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    override func loadView(){
        let view = UIView()
        view.backgroundColor = .white
        view.sizeToFit()
        //the background image ;w; to be changed
        let image = UIImage(named: "shiba.png")
        let imageV = UIImageView(image: image)
        imageV.center = CGPoint(x: 200, y: 250)
        view.addSubview(imageV)
        //play button
        let play = UIButton(type: .roundedRect) as UIButton
        play.setTitle("PLAY", for: .normal)
        play.setTitleColor(UIColor.white, for: .normal)
        play.frame = CGRect(x: 135, y: 500, width: 150, height: 45)
        play.backgroundColor = UIColor.darkGray
        play.addTarget(self, action: #selector(playGame), for: .touchUpInside)
        //play.center = view.center ;w; ask
        view.addSubview(play)
        //this will render everything onto the screen
        self.view = view
    }
    @IBAction func playGame() {
        let scene = GameScene(size: CGSize(width: 2048, height: 1536))
        let skView = SKView()
        skView.showsFPS = true
        skView.showsNodeCount = true
        skView.ignoresSiblingOrder = true
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)
        self.view = skView
    }
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
