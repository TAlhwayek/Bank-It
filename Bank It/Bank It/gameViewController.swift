//
//  gameViewController.swift
//  Bank It
//
//  Created by Tony Alhwayek on 5/30/23.
//

import UIKit

// Protocol used for high score
protocol HighScoreDelegate: AnyObject {
    func updateHighScore(score: Int)
}

class gameViewController: UIViewController {
    // Bank object
    var newGame: BankClass?
    
    // High score delegate
    weak var HSDelegate: HighScoreDelegate?
    var highScore: Int = 0

    
    
    // Labels
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var livesLabel: UILabel!
    
    override func viewDidLoad() {
        // Create new object
        newGame = BankClass()
        
        // Update games played
        let updatedGamesPlayed = newGame?.updateGamesPlayed() ?? 0
        
        // Update and save games played
        UserDefaults.standard.set(updatedGamesPlayed, forKey: "GamesPlayed")
        UserDefaults.standard.synchronize()
        
        // Update UI
        updateUI()
        // Load view
        super.viewDidLoad()
    }
    
    // Updates score and number labels each time
    func updateUI() {
        // Update labels
        numberLabel.text = String(newGame?.getNewNumber() ?? 0)
        scoreLabel.text = "Score: " + String(newGame?.getScore() ?? 0)
        // Lives text. Defaults to 3 just in case
        livesLabel.text = "Lives: " + String(newGame?.getLives() ?? 3)

        // Update high score
        let updatedHighScore = newGame?.updateHighScore() ?? 0
        HSDelegate?.updateHighScore(score: updatedHighScore)
        
        // Save high score
        UserDefaults.standard.set(updatedHighScore, forKey: "HighScore")
       // UserDefaults.standard.synchronize()
        
        
        // Save games played
        
        // If user ran out of lives, display an alert
        if(newGame?.getLives() == 0) {
            showAlertButton()
        }
    }

    
    // If "higher" is pressed
    @IBAction func higherButtonPressed(_ sender: UIButton) {
        // Check if answer is correct
        if(newGame!.checkNumbers(userPressedHigher: true)) {
            // Update score is answer is correct
            newGame?.score += 1
        }
        updateUI()
    }
    
    // If lower is pressed
    @IBAction func lowerButtonPressed(_ sender: UIButton) {
        // Check if answer is correct
        if(newGame!.checkNumbers(userPressedHigher: false)){
            // Update score is answer is correct
            newGame?.score += 1
        }
        updateUI()
    }
    
    // Game over alert
    func showAlertButton() {
        // Create alert controller with a game over message
        let alertController = UIAlertController(title: "Game Over", message: "You have run out of lives", preferredStyle: .alert)
        
        // Add "ok" button
        let okAction = UIAlertAction(title: "OK", style: .default) { [weak self] _ in
            // Go back to the previous view controller
            self?.navigationController?.popViewController(animated: true)
        }
        alertController.addAction(okAction)
        // Present the alert
        present(alertController, animated: true, completion: nil)
    }
    

}
