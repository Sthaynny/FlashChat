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
        let welcomeView = WelcomeViewController()
        welcomeView.coordinator = self
        navigationController.pushViewController(welcomeView, animated:true)
    }
    
    
}
