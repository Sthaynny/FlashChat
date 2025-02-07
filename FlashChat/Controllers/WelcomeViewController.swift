//
//  WelcomeViewController.swift
//  FlashChat
//
//  Created by Igor Costa Nascimento on 07/02/25.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    //MARK: Atributs
    var coordinator: Coordinator?
    
    //MARK: Components View
    private lazy var initLabel: UILabel = {
        let label = UILabel( )
        label.font = .systemFont(ofSize: 50, weight: .bold)
        label.text = "⚡️FlashChat"
        label.textColor = .brandBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        
        return button
    }()
    //MARK: Load View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    //MARK: SETUP PAGE
    
    func addSubViews(){
        view.addSubview(initLabel)
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            initLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            initLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

}
