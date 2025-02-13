//
//  EmailView.swift
//  FlashChat
//
//  Created by Igor Costa Nascimento on 12/02/25.
//

import UIKit

protocol CredentialDelegate {
    func didActionButtonCredential(email : String, password: String)
}

class CredentialView: UIView {
    
    var delegate: CredentialDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var titleButton: String? {
        didSet {
            buttonActionCredential.setTitle(titleButton, for: .normal)
        }
    }
    
    
    private lazy var backgroundEmail : UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "textfield")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true 
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var backgroundPassword:  UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "textfield")
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 25)
        textField.textColor = .black
        textField.isUserInteractionEnabled = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray.withAlphaComponent(0.6), // Cor do placeholder
            .font: UIFont.italicSystemFont(ofSize: 16) // Opcional: Cursor personalizada
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: attributes)
        
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 25)
        textField.textColor = .black
        textField.isUserInteractionEnabled = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.isSecureTextEntry = true
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray.withAlphaComponent(0.6), // Cor do placeholder
            .font: UIFont.italicSystemFont(ofSize: 16) // Opcional: Cursor personalizada
        ]
        textField.attributedPlaceholder = NSAttributedString(string: "Senha", attributes: attributes)
        return textField
    }()

    private lazy var buttonActionCredential: UIButton = {
        let button = UIButton()
        button.setTitle("Registrar", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 32)
        button.backgroundColor = .brandBlue
        button.layer.cornerRadius = 24
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(actionButton), for: .touchUpInside)
        return button
    }()
    
    @objc private func actionButton(){
        print(emailTextField.text)
        delegate?.didActionButtonCredential(email: emailTextField.text ?? "", password: passwordTextField.text ?? "")
    }
    
    func addSubViews(){
        addSubview(backgroundEmail)
        addSubview(emailTextField)
        addSubview(backgroundPassword)
        addSubview(passwordTextField)
        addSubview(buttonActionCredential)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundEmail.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backgroundEmail.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            backgroundEmail.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            backgroundEmail.heightAnchor.constraint(equalToConstant: 120),
            
            emailTextField.centerXAnchor.constraint(equalTo: backgroundEmail.centerXAnchor),
            emailTextField.widthAnchor.constraint(equalTo: backgroundEmail.widthAnchor, multiplier: 0.7),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            emailTextField.bottomAnchor.constraint(equalTo: backgroundEmail.bottomAnchor, constant: -55),
            
            backgroundPassword.topAnchor.constraint(equalTo: backgroundEmail.bottomAnchor, constant: -32),
            backgroundPassword.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            backgroundPassword.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            backgroundPassword.heightAnchor.constraint(equalToConstant: 120),
            
            passwordTextField.centerXAnchor.constraint(equalTo: backgroundPassword.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: backgroundPassword.widthAnchor, multiplier: 0.7),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.bottomAnchor.constraint(equalTo: backgroundPassword.bottomAnchor, constant: -55),
            
            buttonActionCredential.topAnchor.constraint(equalTo: backgroundPassword.bottomAnchor),
            buttonActionCredential.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            buttonActionCredential.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -32),
            buttonActionCredential.heightAnchor.constraint(equalToConstant: 53),
            
        ])
    }

}
