//
//  PlayerBrain.swift
//  ActionGame
//
//  Created by Takeshi Kawamoto on 2022/05/31.
//

import Foundation

class PlayerBrain {
    
    var player = Player()
    
    func gotDamaged(damage: Int) -> Int {
        print("damage = \(damage)")
        print("before HP = \(player.health)")
        player.health -= damage
        print("after HP = \(player.health)")
        return damage
    }
    
    func getCanHealFlag() -> Bool {
        if player.maxHealth == player.health {
            return false
        } else {
            return true
        }
    }
    
    func gotHealed() -> Int {
        let healedValue: Int
        
        if player.health + player.healStatus > player.maxHealth {
            healedValue = player.maxHealth - player.health
            player.health = player.maxHealth
        } else {
            healedValue = player.healStatus
            player.health += player.healStatus
        }
        return healedValue
    }
    
    func getHP() -> Int {
        if player.health < 0 {
            player.health = 0
        }
        return player.health
    }
    
    func getATC() -> Int {
        return player.attackStatus
    }
    
    func getMoney() -> Int {
        return player.money
    }
    
    func getMaxHP() -> Int{
        return player.maxHealth
    }
    
    func getHeal() -> Int {
        return player.healStatus
    }
    
    
    func getPlayerIcon() -> String {
        
        switch player.health {
        case ...10:
            return "โค๏ธโ๐ฉน"
        case ...20:
            return "โค๏ธ"
        case ...40:
            return "๐งก"
        case ...60:
            return "๐"
        default:
            return "๐"
            
        }
    }
    
    
    func setAttackStatus(attack: Int) {
        player.attackStatus += attack
    }
    
    func setHealStatus(heal: Int) {
        player.healStatus += heal
    }
    
    func setMoney(money: Int) {
        player.money = money
    }
    
    func defeatEnemy(earnmoney: Int) {
        player.money += earnmoney
    }
    
    
    
}
