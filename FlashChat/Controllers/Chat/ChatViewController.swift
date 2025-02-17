//
//  ChatViewController.swift
//  Flash Chat iOS13
//

import UIKit
import Combine

class ChatViewController: UIViewController {
    
    //MARK: Atributs
    var coordinator: Coordinator?
    var viewModel = ChatViewModel()
    private var cellDataSource: [ChatTableViewCell] = []
    private var cancellables = Set<AnyCancellable>()
    
    //MARK: Components View
    
    let inputMessegeView = InputMenssageView()
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .clear
        tableView.register(ChatTableViewCell.self, forCellReuseIdentifier: "ChatCell")
        tableView.showsVerticalScrollIndicator = false
        return tableView
    }()
    
    //MARK: Load View
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .brandPurple
        inputMessegeView.translatesAutoresizingMaskIntoConstraints = false
        addSubViews()
        setupConstraints()
        // Do any additional setup after loading the view.
    }
    
    //MARK: SETUP PAGE
    func addSubViews(){
        view.addSubview(inputMessegeView)
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            inputMessegeView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            inputMessegeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            inputMessegeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            inputMessegeView.heightAnchor.constraint(equalToConstant: 60),
            tableView.bottomAnchor.constraint(equalTo: inputMessegeView.topAnchor),
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
        ])
    }
    
    //MARK: ACTION COMPONENT
   func sendPressed(_ sender: UIButton) {
       
   }

    //MARK: actions view model
    
    private func bindLoading() {
        viewModel.$isLoading
            .receive(on: RunLoop.main)
            .sink { [weak self] isLoading in
                guard let self = self else { return }
                DispatchQueue.main.async {
                    if isLoading {
                        //                    self.activityIndicatorView.startAnimating()
                    } else {
                        //                    self.activityIndicatorView.stopAnimating()
                    }
                }
            }
            .store(in: &cancellables)
    }
    

}
