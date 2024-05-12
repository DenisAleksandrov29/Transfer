//
//  WelcomeViewController.swift
//  Transfer
//
//  Created by Денис Александров on 10.05.2024.
//

import UIKit

final class WelcomeViewController: UIViewController {
    
    @IBOutlet var welcomeLabel: UILabel!
    @IBOutlet var firstNameLabel: UILabel!
    
    var user = ""
    var person = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGlobalGradient()
        
        welcomeLabel.text = "Welcome, \(user)!"
        welcomeLabel.textColor = UIColor.white
        firstNameLabel.text = "My name is, \(person)!"
    }
    
    @IBAction func cancelButtonTapped(_ sender: UIButton) {
        dismiss(animated: true)
    }
}
