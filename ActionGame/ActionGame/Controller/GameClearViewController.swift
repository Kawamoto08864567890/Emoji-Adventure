//
//  GameClearViewController.swift
//  ActionGame
//
//  Created by Takeshi Kawamoto on 2022/06/02.
//

import UIKit

class GameClearViewController: UIViewController {

    @IBOutlet weak var enemyIcon: UILabel!
    @IBOutlet weak var enemyMessage: UILabel!

    
    var playerBrain: PlayerBrain?
    var enemyBrain: EnemyBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        enemyIcon.text = enemyBrain!.getIcon()
        enemyMessage.text = enemyBrain!.getMessage()
    }

}
