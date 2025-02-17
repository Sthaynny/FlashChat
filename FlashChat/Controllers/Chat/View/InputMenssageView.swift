//
//  InputMenssageView.swift
//  FlashChat
//
//  Created by Igor Costa Nascimento on 17/02/25.
//

import UIKit

class InputMenssageView: UIView {
    
    //MARK: Create Components
    
    private lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.font = .systemFont(ofSize: 25)
        textField.textColor = .brandBlue
        textField.isUserInteractionEnabled = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray.withAlphaComponent(0.6), // Cor do placeholder
            .font: UIFont.italicSystemFont(ofSize: 16) // Opcional: Cursor personalizada
        ]
        textField.keyboardType = .emailAddress
        textField.autocorrectionType = .no
        textField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: attributes)
        
        return textField
    }()
    
    
    private lazy var sendButtonView: UIButton = {
        let button = UIButton()
        let image = UIImage(systemName: "paperplane.fill")
        button.setImage(image, for: .normal)
        button.contentMode = .scaleToFill
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: Init Page
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: SETUP PAGE
    func addSubViews(){
        addSubview(searchTextField)
        addSubview(sendButtonView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            searchTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            searchTextField.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            searchTextField.heightAnchor.constraint(equalToConstant: 40),
            sendButtonView.leadingAnchor.constraint(equalTo: searchTextField.trailingAnchor, constant: 8),
            sendButtonView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            sendButtonView.heightAnchor.constraint(equalToConstant: 40),
            sendButtonView.widthAnchor.constraint(equalToConstant: 40),
            sendButtonView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
        ])
    }

}
