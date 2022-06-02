//
//  GameOverViewController.swift
//  ActionGame
//
//  Created by Takeshi Kawamoto on 2022/06/02.
//

import UIKit

class GameOverViewController: UIViewController {
    
    @IBOutlet weak var moneyLabel: UILabel!
    @IBOutlet weak var enemyIcon: UILabel!
    @IBOutlet weak var enemyProgress: UIProgressView!
    @IBOutlet weak var enemyHP: UILabel!
    
    var playerBrain: PlayerBrain?
    var enemyBrain: EnemyBrain?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        enemyIcon.text = enemyBrain!.getIcon()
        enemyProgress.progress = Float(enemyBrain!.getHP()) / Float(enemyBrain!.getMaxHealth())
        enemyHP.text = String(enemyBrain!.getHP())
        moneyLabel.text = String(playerBrain!.getMoney())
        
    }


}
