//
//  RegisterViewModel.swift
//  FlashChat
//
//  Created by Igor Costa Nascimento on 13/02/25.
//

import Foundation
import FirebaseAuth


struct RegisterViewModel{
    private var firebase: FirebaseAuthManager
    
    init(firebase: FirebaseAuthManager) {
        self.firebase = firebase
        self.firebase.delegate = self
    }
}

extension RegisterViewModel: FirebaseAuthDelegate{
    func registerAccountSuccess(_ user: FirebaseAuth.User) {
        
    }
    
    func registerAccountError(_ message: String) {
        
    }
    
    
}
