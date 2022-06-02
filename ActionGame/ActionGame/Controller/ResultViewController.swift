//
//  ResultViewController.swift
//  ActionGame
//
//  Created by Takeshi Kawamoto on 2022/06/01.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var gotMoneyLabel: UILabel!
    @IBOutlet weak var attackedEnemyLabel: UILabel!
    @IBOutlet weak var currentHealthLabel: UILabel!
    @IBOutlet weak var currentMoneyLabel: UILabel!
    @IBOutlet weak var playerIcon: UILabel!
    @IBOutlet weak var enemyMessageLabel: UILabel!

    var playerBrain: PlayerBrain?
    var enemyBrain: EnemyBrain?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        currentMoneyLabel.text = String("\(playerBrain!.getMoney())")
    }
    
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//        enemyBrain!.createNextNumber()
//    }
    
    func updateUI() {
        enemyMessageLabel.text = enemyBrain!.getMessage()
        gotMoneyLabel.text = String("\(enemyBrain!.getMoney())コイン獲得")
        attackedEnemyLabel.text = enemyBrain!.getIcon()
        currentHealthLabel.text = String("\(playerBrain!.getHP())")
        currentMoneyLabel.text = String("\(playerBrain!.getMoney())")
        playerIcon.text = playerBrain!.getPlayerIcon()
    }
    
    @IBAction func adventurePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
        enemyBrain!.createNextNumber()
    }
    
    @IBAction func skillupPressed(_ sender: UIButton) {
        performSegue(withIdentifier: "goToSkillup", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToSkillup" {
            let destinationVC = segue.destination as! SkillupViewController
            destinationVC.playerBrain = playerBrain
            destinationVC.enemyBrain = enemyBrain
        }
    }
}
