//
//  ViewController.swift
//  
//
//  Created by 최준영 on 6/19/24.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        
        let initialLabel = UILabel()
        
        initialLabel.text = "Hello world"
        
        view.backgroundColor = .white
        
        view.addSubview(initialLabel)
        initialLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            initialLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            initialLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

