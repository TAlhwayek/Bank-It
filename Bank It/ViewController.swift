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
        
        // Add the tap gesture recognizer to the image view
        helpButton.addGestureRecognizer(tapGesture)
    }
    
    // Start button pressed
    @IBAction func startButton(_ sender: Any) {
        // Open main game
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destinationVC = segue.destination as UIViewController
            destinationVC.title = "gameView"
        }
    }
    
    @objc func imageTapped() {
        performSegue(withIdentifier: "helpMenu", sender: self)
    }
}

