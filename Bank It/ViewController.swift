//
//  ViewController.swift
//  Bank It
//
//  Created by Tony Alhwayek on 5/17/23.
//

import UIKit

class ViewController: UIViewController {
    
    // Help button IBOutlet
    @IBOutlet weak var helpButton: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Help button section
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
        // Navigate to game
        navigationController?.pushViewController(gameVC, animated: true)
    }
   
    @objc func imageTapped() {
        let helpMenuVC = storyboard?.instantiateViewController(withIdentifier: "helpMenuViewController")
        helpMenuVC?.modalPresentationStyle = .popover
        present(helpMenuVC!, animated: true, completion: nil)
    }
}

