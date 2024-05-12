//
//  InformationViewController.swift
//  Transfer
//
//  Created by Денис Александров on 11.05.2024.
//

import UIKit

final class InformationViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var lastNameLabel: UILabel!
    @IBOutlet var jobLabel: UILabel!
    @IBOutlet var positionLabel: UILabel!
    
    @IBOutlet var selfieImageView: UIImageView!
    
    var person = ""
    var lastPerson = ""
    var jobPerson = ""
    var positionPerson = ""
    var bioPerson = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addGlobalGradient()
        selfieImageView.layer.cornerRadius = 60
        
        nameLabel.text = "Имя: \(person)"
        lastNameLabel.text = "Фамилия: \(lastPerson)"
        jobLabel.text = "Компания: \(jobPerson)"
        positionLabel.text = "Должность: \(positionPerson)"
    }
    
    @IBAction func goDescription(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "Description", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Description" {
            if let destinationVC = segue.destination as? DescriptionViewController {
                destinationVC.bio = bioPerson
            }
        }
    }
}
