//
//  ShopViewController.swift
//  ActionGame
//
//  Created by Takeshi Kawamoto on 2022/05/31.
//

import UIKit

class SkillupViewController: UIViewController {
    
    @IBOutlet weak var attackStatusLabel: UILabel!
    @IBOutlet weak var healStatusLabel: UILabel!
    @IBOutlet weak var healthLabel: UILabel!
    @IBOutlet weak var moneyLabel: UILabel!
    
    var attackStatus: Int!
    var healStatus: Int!
    var moneyCount: Int!
    var attackPressCount = 0
    var healPressCount = 0
    
    var playerBrain: PlayerBrain?
    var enemyBrain: EnemyBrain?

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moneyCount = playerBrain!.getMoney()
        attackStatus = playerBrain!.getATC()
        healStatus = playerBrain!.getHeal()
        attackStatusLabel.text = String(playerBrain!.getATC())
        healStatusLabel.text = String(playerBrain!.getHeal())
        healthLabel.text = String(playerBrain!.getHP())
        moneyLabel.text = String(playerBrain!.getMoney())
        
    }

    @IBAction func attackPlusPressed(_ sender: UIButton) {
        
        if moneyCount > 0 {
            
            attackPressCount += 1
            moneyCount -= 1
            attackStatus += 10
            updateUI()
        }
    }
    
    @IBAction func attackMinusPressed(_ sender: UIButton) {
        
        if attackPressCount > 0 {
            
            attackPressCount -= 1
            moneyCount += 1
            attackStatus -= 10
            updateUI()
        }
    }
    
    @IBAction func healPlusPressed(_ sender: UIButton) {
        
        if moneyCount > 0 {
            
            healPressCount += 1
            moneyCount -= 1
            healStatus += 10
            updateUI()
        }
    }
    
    @IBAction func healMinusPressed(_ sender: UIButton) {
        
        if healPressCount > 0 {
            
            healPressCount -= 1
            moneyCount += 1
            healStatus -= 10
            updateUI()
        }
    }
    
    func updateUI() {
        attackStatusLabel.text = String(attackStatus)
        healStatusLabel.text = String(healStatus)
        moneyLabel.text = String(moneyCount)

    }

    @IBAction func returnButton(_ sender: UIButton) {
        playerBrain!.setAttackStatus(attack: attackStatus)
        playerBrain!.setHealStatus(heal: healStatus)
        playerBrain!.setMoney(money: moneyCount)
        dismiss(animated: true, completion: nil)
        
    }
    
}
