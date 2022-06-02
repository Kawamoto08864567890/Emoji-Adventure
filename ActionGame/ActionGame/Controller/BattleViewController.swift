//
//  ViewController.swift
//  ActionGame
//
//  Created by Takeshi Kawamoto on 2022/05/31.
//

import UIKit

class BattleViewController: UIViewController {
    
    @IBOutlet weak var enemyTextLabel: UILabel!
    @IBOutlet weak var enemyHealthLabel: UILabel!
    @IBOutlet weak var enemyHealthProgress: UIProgressView!
    @IBOutlet weak var enemyFaceLabel: UILabel!
    @IBOutlet weak var playerTextLabel: UILabel!
    @IBOutlet weak var playerAttackLabel: UIButton!
    @IBOutlet weak var playerHealLabel: UIButton!
    @IBOutlet weak var playerHealthLabel: UILabel!
    @IBOutlet weak var playerMoneyLabel: UILabel!
    @IBOutlet weak var healButton: UIButton!
    @IBOutlet weak var playerHealthIcon: UILabel!
    
    var playerBrain =  PlayerBrain()
    var enemyBrain = EnemyBrain()
    
    override func viewWillAppear(_ animated: Bool) {
        if playerBrain.getHP() == playerBrain.getMaxHP() {
            healButton.isEnabled = false
        }
        enemyTextLabel.text = "\(enemyBrain.getName())が現れた！"
        enemyFaceLabel.text = enemyBrain.getIcon()
        enemyHealthProgress.progress = Float(enemyBrain.getHP()) / Float(enemyBrain.getMaxHealth())
        enemyHealthProgress.tintColor = .green
        enemyHealthLabel.text = String(enemyBrain.getHP())
        playerTextLabel.text = "行動を選択してください"
        playerAttackLabel.setTitle("          攻撃 : \(playerBrain.getATC())", for: .normal)
        playerHealLabel.setTitle("          回復 : \(playerBrain.getHeal())", for: .normal)
        playerHealthLabel.text = String(playerBrain.getHP())
        playerMoneyLabel.text = String(playerBrain.getMoney())
        playerHealthIcon.text = playerBrain.getPlayerIcon()
    }
      
    @IBAction func attackPressed(_ sender: UIButton) {
        playerTextLabel.text = "\(playerBrain.getATC())のダメージを与えた！"
        enemyBrain.gotDamaged(damage: playerBrain.getATC())
        
        if enemyBrain.getHP() == 0 && enemyBrain.getEnemyArrayNumber() == 4 {
            performSegue(withIdentifier: "goToGameClear", sender: self)
        } else {
            
            // defeat enemy
            if enemyBrain.getHP() == 0 {
                playerBrain.defeatEnemy(earnmoney: enemyBrain.getMoney())
                performSegue(withIdentifier: "goToResult", sender: self)
            } else {
                commonUpdateUI()
                
                // player dead
                if playerBrain.getHP() == 0 {
                    performSegue(withIdentifier: "goToGameOver", sender: self)
                }
            }
        }
        
    }
    
    @IBAction func healPressed(_ sender: UIButton) {
        if playerBrain.getCanHealFlag() {
            playerTextLabel.text = "体力を\(playerBrain.gotHealed())回復した！"
        }
        commonUpdateUI()
        if playerBrain.getHP() == 0 {
            performSegue(withIdentifier: "goToGameOver", sender: self)
        }
    }
    
    func commonUpdateUI() {
        enemyTextLabel.text = "\(enemyBrain.getName())は\(playerBrain.gotDamaged(damage: enemyBrain.getATC()))のダメージを与えた！"
        enemyFaceLabel.text = enemyBrain.getIcon()
        enemyHealthProgress.progress = Float(enemyBrain.getHP()) / Float(enemyBrain.getMaxHealth())
        switch enemyHealthProgress.progress {
        case ...0.2:
            enemyHealthProgress.tintColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        case ...0.4:
            enemyHealthProgress.tintColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        case ...0.6:
            enemyHealthProgress.tintColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        default:
            break
        }
        enemyHealthLabel.text = String(enemyBrain.getHP())
        playerHealthLabel.text = String(playerBrain.getHP())
        playerHealthIcon.text = playerBrain.getPlayerIcon()
        healButton.isEnabled = playerBrain.getCanHealFlag()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.playerBrain = playerBrain
            destinationVC.enemyBrain = enemyBrain
        } else if segue.identifier == "goToGameOver" {
            let destinationVC = segue.destination as! GameOverViewController
            destinationVC.playerBrain = playerBrain
            destinationVC.enemyBrain = enemyBrain
        } else if segue.identifier == "goToGameClear" {
            let destinationVC = segue.destination as! GameClearViewController
            destinationVC.playerBrain = playerBrain
            destinationVC.enemyBrain = enemyBrain
        }
    }
}
