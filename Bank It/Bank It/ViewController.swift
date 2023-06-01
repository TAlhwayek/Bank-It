//
//  ViewController.swift
//  Bank It
//
//  Created by Tony Alhwayek on 5/17/23.
//

import UIKit

extension ViewController: HighScoreDelegate {
    func updateHighScore(score: Int) {
        // Update the high score label with the new score
        highScoreLabel.text = "High score: \(score)"
    }
}

class ViewController: UIViewController {
    
    // Help button IBOutlet
    @IBOutlet weak var helpButton: UIImageView!
    
    // High score label on start page
    @IBOutlet weak var highScoreLabel: UILabel!
    
    override func viewDidLoad() {
        // Retrieve saved high score
        if let highScore = UserDefaults.standard.value(forKey: "HighScore") as? Int {
            highScoreLabel.text = "High Score: \(highScore)"
        } else {
            let defaultHighScore = 0
            highScoreLabel.text = "High Score: \(defaultHighScore)"
        }
        super.viewDidLoad()
        
        // Help button section
        // Make image tappable
        helpButton.isUserInteractionEnabled = true
        // Create a tap gesture recognizer
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped))
        helpButton.addGestureRecognizer(tapGesture)
        
        // Change back button to "Exit"
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Exit", style: .plain, target: nil, action: nil)
    }
    
    // Start button pressed
    @IBAction func startButton(_ sender: Any) {
        // Open main game
        let gameVC = storyboard?.instantiateViewController(withIdentifier: "gameViewController") as! gameViewController
        gameVC.delegate = self
        // Navigate to game
        navigationController?.pushViewController(gameVC, animated: true)
    }
   
    // Popover help section
    @objc func imageTapped() {
        if let helpMenuNavigationController = storyboard?.instantiateViewController(withIdentifier: "helpMenuNavigationController") {
            helpMenuNavigationController.modalPresentationStyle = .popover
            present(helpMenuNavigationController, animated: true, completion: nil)
        }
    }
}

