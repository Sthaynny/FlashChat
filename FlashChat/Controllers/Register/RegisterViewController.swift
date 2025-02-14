//
//  RegisterViewController.swift
//  FlashChat
//
//  Created by Igor Costa Nascimento on 07/02/25.
//

import UIKit
import Combine

class RegisterViewController: UIViewController {
    
    //MARK: Atributs
    
    var viewModel = RegisterViewModel(firebase: FirebaseAuthManager())
    var coordinator: MainCoordinator?
    private var cancellables = Set<AnyCancellable>()
    
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
        setupBindings()
    }
    
    private func setupBindings() {
        viewModel.$userApp
            .receive(on: RunLoop.main)
            .sink { [weak self] user in
                guard  user != nil else { return }
                self?.coordinator?.goToHomeAplication()
            }.store(in: &cancellables)
        
        viewModel.$errorMessage
            .receive(on: RunLoop.main)
            .sink { [weak self] errorMessage in
                if let errorMessage = errorMessage {
                    let alert = UIAlertController(title: "Ops! Aconteceu um erro!", message: errorMessage, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default))
                    self?.present(alert, animated: true)
                    
                }
            }
            .store(in: &cancellables)
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
        viewModel.registerUser(email: email, password: password)
    }
    
}
