//
//  ExtensionColor.swift
//  Transfer
//
//  Created by Денис Александров on 11.05.2024.
//

import UIKit

extension UIViewController {
    func addGlobalGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        
        let startColor = UIColor(red: 1.0, green: 0.0, blue: 0.0, alpha: 0.5).cgColor
        let endColor = UIColor(red: 0.0, green: 0.0, blue: 1.0, alpha: 0.5).cgColor
        
        gradientLayer.colors = [startColor, endColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}
