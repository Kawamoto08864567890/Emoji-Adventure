//
//  EnemyBrain.swift
//  ActionGame
//
//  Created by Takeshi Kawamoto on 2022/05/31.
//

import Foundation

class EnemyBrain {
    
    var enemyArrayNumber: Int = 0
    var enemyNumber = Int.random(in: 0...1)
    
    var enemies = [
        [
            Enemy(name: "コウモリ", health: 50, attack: 6, icon: "🦇", money: 2, messasge: "冒険はこれから..."),
            Enemy(name: "スカンク", health: 50, attack: 6, icon: "🦨", money: 2, messasge: "冒険はこれから...")
        ],
        [
            Enemy(name: "毒ガエル", health: 100, attack: 10, icon: "🐸", money: 3, messasge: "ケロケロ..."),
            Enemy(name: "毒ヘビ", health: 100, attack: 10, icon: "🐍", money: 3, messasge: "シャーッ..."),
            Enemy(name: "サソリ", health: 100, attack: 10, icon: "🦂", money: 3, messasge: "カサカサッ...")
        ],
        [
            Enemy(name: "ワニ", health: 200, attack: 20, icon: "🐊", money: 4, messasge: "俺は強い..."),
            Enemy(name: "オバケ", health: 200, attack: 20, icon: "👻", money: 4, messasge: "..."),
            Enemy(name: "ワシ", health: 200, attack: 20, icon: "🦅", money: 4, messasge: "また会おう...")
        ],
        [
            Enemy(name: "クラーケン", health: 300, attack: 30, icon: "🦑", money: 5, messasge: "陸は不利なんです..."),
            Enemy(name: "ライオン", health: 300, attack: 30, icon: "🦁", money: 5, messasge: "最後の戦いの準備をしろ...")
        ],
        [
            Enemy(name: "ティラノ", health: 400, attack: 40, icon: "🦖", money: 100, messasge: "俺は強い..."),
            Enemy(name: "ドラゴン", health: 400, attack: 40, icon: "🐉", money: 100, messasge: "認めてやろう..."),
            Enemy(name: "吸血鬼", health: 400, attack: 40, icon: "🧛🏼", money: 100, messasge: "私は認めない...")
        ]
    ]
    
    
    func gotDamaged(damage: Int) {
        enemies[enemyArrayNumber][enemyNumber].health -= damage
        
        if enemies[enemyArrayNumber][enemyNumber].health <= 0 {
            enemies[enemyArrayNumber][enemyNumber].health = 0
            
        }
    }
    
    func createNextNumber() {
        enemyArrayNumber += 1
        enemyNumber = Int.random(in: 0..<(enemies[enemyArrayNumber].count))
    }
    //    // Heal random (+1 ~ max)
    //    mutating func gotHealed() {
    //        enemies[enemyNumber].health += Int.random(in: 1...(enemies[enemyNumber].maxHealth - enemies[enemyNumber].health))
    //    }
    
    func getName() -> String {
        return enemies[enemyArrayNumber][enemyNumber].name
    }
    
    func getHP() -> Int{
        return enemies[enemyArrayNumber][enemyNumber].health
    }
    
    func getATC() -> Int {
        let atc = enemies[enemyArrayNumber][enemyNumber].attackStatus
        let randATC = atc + Int.random(in: -5...5)
        return randATC
    }
    
    func getIcon() -> String {
        return enemies[enemyArrayNumber][enemyNumber].icon
    }
    
    func getMaxHealth() -> Int {
        return enemies[enemyArrayNumber][enemyNumber].maxHealth
    }
    
    func getMoney() -> Int {
        return enemies[enemyArrayNumber][enemyNumber].money
    }
    
    func getMessage() -> String {
        return enemies[enemyArrayNumber][enemyNumber].message
    }
    
    func getEnemyNumber() -> Int {
        return enemyNumber
    }
    
    func getEnemyArrayNumber() -> Int {
        return enemyArrayNumber
    }
}
