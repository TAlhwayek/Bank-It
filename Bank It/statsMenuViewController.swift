//
//  statsViewController.swift
//  Bank It
//
//  Created by Tony Alhwayek on 6/3/23.
//

import UIKit

class statsViewController: UIViewController {

    // Popup title label (Stats)
    @IBOutlet weak var titleLabel: UILabel!
    // Games played label
    @IBOutlet weak var gamesPlayedLabel: UILabel!
    
    var receivedGamesPlayed: Int = 0
    
    override func viewDidLoad() {
        
        let receivedGamesPlayed: Int = UserDefaults.standard.integer(forKey: "GamesPlayedKey")
        
        super.viewDidLoad()

        // Configure the title
        titleLabel.text = "Stats"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 20)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        // Use the received variable
        gamesPlayedLabel.text = "Games Played: \(receivedGamesPlayed)"
        

        gamesPlayedLabel.textAlignment = .center
        gamesPlayedLabel.font = UIFont.systemFont(ofSize: 18)
        gamesPlayedLabel.translatesAutoresizingMaskIntoConstraints = false

        // Add the label to the view
        view.addSubview(titleLabel)
        view.addSubview(gamesPlayedLabel)

        // Set the labels' constraints
        // Title label
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40),
            // Games Played label
            gamesPlayedLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gamesPlayedLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}
