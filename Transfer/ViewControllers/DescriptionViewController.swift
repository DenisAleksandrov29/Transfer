//
//  DescriptionViewController.swift
//  Transfer
//
//  Created by Денис Александров on 11.05.2024.
//

import UIKit

final class DescriptionViewController: UIViewController {
    
    @IBOutlet var descriptionLabel: UILabel!
    
    var bio = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGlobalGradient()
        
        descriptionLabel.text = "Denis \(bio)"
        descriptionLabel.textColor = UIColor.white
    }
}
