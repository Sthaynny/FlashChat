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
        label.textColor = .brandBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Resgistar-se", for: .normal)
        button.setTitleColor(.brandBlue, for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .brandBlue.withAlphaComponent(0.2)
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log in", for: .normal)
        button.layer.cornerRadius = 12
        button.backgroundColor = .brandBlue
        button.tintColor = .white
        button.titleLabel?.font = .systemFont(ofSize: 24, weight: .bold)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    //MARK: Load View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brandLightPurple
        addSubViews()
        setupConstraints()
        setupAnimation()
        // Do any additional setup after loading the view.
    }
    
    //MARK: SETUP PAGE
    
    func addSubViews(){
        view.addSubview(initLabel)
        view.addSubview(registerButton)
        view.addSubview(loginButton)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            initLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            initLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            loginButton.heightAnchor.constraint(equalToConstant: 54),
            registerButton.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -8),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            registerButton.heightAnchor.constraint(equalToConstant: 54),
            
        ])
    }
    
    func setupAnimation( ){
        initLabel.text = ""
        let title = "⚡️FlashChat"
        var charIndex = 0
        for char in title{
            Timer.scheduledTimer(withTimeInterval: 0.1 * Double(charIndex), repeats: false) { timer in
                self.initLabel.text?.append(char)
            }
            charIndex += 1
        }
    }

}
