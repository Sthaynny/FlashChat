//
//  MainCordinator.swift
//  FlashChat
//
//  Created by Igor Costa Nascimento on 07/02/25.
//

import UIKit



class MainCoordinator: Coordinator{
    var navigationController: UINavigationController
    
    var coordinators: [any Coordinator] = []
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        let welcomeView = RegisterViewController()
        welcomeView.coordinator = self
        navigationController.pushViewController(welcomeView, animated:true)
    }
    
    func goToRegistration(){
        let view = RegisterViewController()
        view.coordinator = self
        navigationController.pushViewController(view, animated:true)
    }
    
    func goToLoginApp(){
        let view = LoginViewController()
        view.coordinator = self
        navigationController.pushViewController(view, animated:true)
    }
    
    func goToHomeAplication(){
        let view = ChatViewController()
        view.coordinator = self
        navigationController.pushViewController(view, animated:true)
    }
    
}
