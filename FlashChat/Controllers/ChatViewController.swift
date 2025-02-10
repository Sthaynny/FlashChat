//
//  ChatViewController.swift
//  Flash Chat iOS13
//

import UIKit

class ChatViewController: UIViewController {
    
    //MARK: Atributs
    var coordinator: Coordinator?
    
    //MARK: Components View
    
    //MARK: Load View
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    //MARK: SETUP PAGE
    func addSubViews(){
        
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
        ])
    }
    
    //MARK: ACTION COMPONENT
   func sendPressed(_ sender: UIButton) {
       
   }
    

}
