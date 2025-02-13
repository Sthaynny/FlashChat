//
//  FirebaseManager.swift
//  FlashChat
//
//  Created by Igor Costa Nascimento on 12/02/25.
//

import FirebaseAuth

protocol FirebaseAuthDelegate{
    func registerAccountSuccess(_ user: User)
    func registerAccountError(_ message: String)
}

struct FirebaseAuthManager{
    var delegate: FirebaseAuthDelegate?
    
    func registerAccontUser(email: String, password: String){
        Auth.auth().createUser(withEmail: email, password: password){ result , error in
            if let error = error {
                delegate?.registerAccountError(error.localizedDescription)
                return
            }
            guard let user = result?.user else{
                print("Aconteceu um erro")
                delegate?.registerAccountError("Aconteceu um erro")
                return
            }
            delegate?.registerAccountSuccess(user)
            
        }
    }
}
