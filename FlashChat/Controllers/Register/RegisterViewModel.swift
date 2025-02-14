//
//  RegisterViewModel.swift
//  FlashChat
//
//  Created by Igor Costa Nascimento on 13/02/25.
//

import Foundation
import FirebaseAuth


class RegisterViewModel{
    private var firebase: FirebaseAuthManager
    @Published var userApp: User?
    @Published var errorMessage: String?
    
    
    init(firebase: FirebaseAuthManager) {
        self.firebase = firebase
        self.firebase.delegate = self
    }
    
    func registerUser(email: String , password: String){
        firebase.registerAccontUser(email: email, password: password)
    }
    
}

extension RegisterViewModel: FirebaseAuthDelegate{
    func registerAccountSuccess(_ user: FirebaseAuth.User) {
        DispatchQueue.main.async { [self] in
            userApp = user
        }
    }
    
    func registerAccountError(_ message: String) {
        errorMessage = message
    }
    
    
}
