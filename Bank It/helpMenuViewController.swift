//
//  helpMenuViewController.swift
//  Bank It
//
//  Created by Tony Alhwayek on 5/31/23.
//

import UIKit

class helpMenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add a close button to the help popup
        navigationController?.setNavigationBarHidden(false, animated: false)
        let closeButton = UIButton(type: .system)
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: closeButton)
    }

    // Dismiss popup when X is pressed
    @objc func closeButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
}
