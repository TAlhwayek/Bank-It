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


class ViewController: UIViewController, UIViewControllerTransitioningDelegate, UIPopoverPresentationControllerDelegate {
    
    // Help button (image view) IBOutlet
    @IBOutlet weak var helpButton: UIImageView!
    
    // Stats button (image view) IBOutlet
    @IBOutlet weak var statsButton: UIImageView!
    
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
        let helpTapGesture = UITapGestureRecognizer(target: self, action: #selector(helpTapped))
        helpButton.addGestureRecognizer(helpTapGesture)
        
        // Stats section
        // Also make image tappable
        statsButton.isUserInteractionEnabled = true
        let statsTapGesture = UITapGestureRecognizer(target: self, action: #selector(statsTapped))
        statsButton.addGestureRecognizer(statsTapGesture)
        
        // Change back button to "Exit"
        navigationItem.backBarButtonItem = UIBarButtonItem(
            title: "Exit", style: .plain, target: nil, action: nil)
    }
    
    // Start button pressed
    @IBAction func startButton(_ sender: Any) {
        // Open main game
        let gameVC = storyboard?.instantiateViewController(withIdentifier: "gameViewController") as! gameViewController
        gameVC.HSDelegate = self
        // Navigate to game
        navigationController?.pushViewController(gameVC, animated: true)
    }
   
    // Popover help section
    @objc func helpTapped() {
        if let helpMenuNavigationController = storyboard?.instantiateViewController(withIdentifier: "helpMenuNavigationController") {
            helpMenuNavigationController.modalPresentationStyle = .popover
            
            present(helpMenuNavigationController, animated: true, completion: nil)
        }
    }
    
    // Pop up stats section
    @objc func statsTapped() {
        if let statsMenuViewController = storyboard?.instantiateViewController(withIdentifier: "statsMenuViewController") {
            statsMenuViewController.modalPresentationStyle = .popover
            statsMenuViewController.preferredContentSize = CGSize(width: 200, height: 150) 

            if let popoverPresentationController = statsMenuViewController.popoverPresentationController {
                popoverPresentationController.delegate = self
                popoverPresentationController.sourceView = self.view
                popoverPresentationController.sourceRect = CGRect(x: self.view.bounds.midX, y: self.view.bounds.midY, width: 0, height: 0)
                popoverPresentationController.permittedArrowDirections = []
                
                present(statsMenuViewController, animated: true, completion: nil)
            }
        }
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController, traitCollection: UITraitCollection) -> UIModalPresentationStyle {
        return .none 
    }

}

