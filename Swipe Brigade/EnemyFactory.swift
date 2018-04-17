//
//  EnemyFactory.swift
//  Swipe Brigade
//
//  Created by Ngo Tuyetnhi N. on 4/17/18.
//  Copyright © 2018 Ngo Tuyetnhi N. All rights reserved.
//

import Foundation

protocol Factory {
    func makeKnight() ->Knight
    func makeSwordsman() -> Swordsman
    func makeWarrior() -> Warrior
}

class EnemyFactory: Factory{
    func makeKnight() -> Knight {
        return Knight()
    }
    func makeSwordsman() -> Swordsman {
        return Swordsman()
    }
    func makeWarrior() -> Warrior {
        return Warrior()
    }
}
