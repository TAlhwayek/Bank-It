//
//  gameViewController.swift
//  Bank It
//
//  Created by Tony Alhwayek on 5/30/23.
//

import UIKit

class gameViewController: UIViewController {
    // Bank object
    var newGame: BankClass?
    // Create a new alert
    
    
    // Labels
    @IBOutlet weak var scoreLabel: UILabel!
    // Test
    @IBOutlet weak var numberLabel: UILabel!
    
    
    override func viewDidLoad() {
        // Create new object
        newGame = BankClass()
        // Update UI
        updateUI()
        // Load view
        super.viewDidLoad()
        
        
    }
    
    // Updates score and number labels each time
    func updateUI() {
        numberLabel.text = String(newGame?.getNewNumber() ?? 0)
        scoreLabel.text = "Score: " + String(newGame?.getScore() ?? 0)
        // If user ran out of lives
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
