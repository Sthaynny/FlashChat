//
//  RegisterViewController.swift
//  FlashChat
//
//  Created by Igor Costa Nascimento on 07/02/25.
//

import UIKit

class RegisterViewController: UIViewController {
    
    //MARK: Atributs
    var coordinator: Coordinator?
    
    //MARK: Components View
    
    var credeantialView = CredentialView()
    

    //MARK: Load View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brandLightBlue
        credeantialView.delegate = self
        credeantialView.translatesAutoresizingMaskIntoConstraints = false
        addSubViews()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    //MARK: SETUP PAGE
    
    func addSubViews(){
        view.addSubview(credeantialView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            credeantialView.topAnchor.constraint(equalTo: view.topAnchor),
            credeantialView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            credeantialView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            credeantialView.heightAnchor.constraint(equalToConstant: 400),
        ])
    }

}

extension RegisterViewController: CredentialDelegate{
    func didActionButtonCredential(email: String, password: String) {
        
    }
    
}
