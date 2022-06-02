//
//  Enemy.swift
//  ActionGame
//
//  Created by Takeshi Kawamoto on 2022/05/31.
//

import Foundation

struct Enemy {
    let name: String
    var health: Int
    let attackStatus: Int
    let icon: String
    let maxHealth: Int
    let money: Int
    let message: String
    
    init(name: String, health: Int, attack: Int,icon: String, money: Int, messasge: String) {
        self.name = name
        self.health = health
        self.icon = icon
        self.attackStatus = attack
        self.maxHealth = health
        self.money = money
        self.message = messasge
    }

}
