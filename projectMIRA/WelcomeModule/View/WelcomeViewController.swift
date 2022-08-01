//
//  WelcomeViewController.swift
//  projectMIRA
//
//  Created by Илья Шаповалов on 01.08.2022.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    //MARK: - Public properties
    var presenter: WelcomeViewPresenter!
    
    //MARK: - Private properties
    private let welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Progect MIRA"
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let loginTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Login"
        textField.backgroundColor = .white
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.backgroundColor = .white
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.backgroundColor = .systemBlue
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
        setConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        navigationController?.navigationBar.isHidden = false
    }
    
//MARK: - Private Methods
    private func setupView() {
        view.backgroundColor = .white
        view.addSubview(welcomeLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
    }
    
    @objc private func loginButtonTapped() {
        presenter.login()
    }

}

//MARK: - Set Constraints
private extension WelcomeViewController {
    func setConstraints() {
        NSLayoutConstraint.activate([
            // Login text field constraints
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            // Welcome Label constraints
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.bottomAnchor.constraint(equalTo: loginTextField.topAnchor, constant: -10),
            // Password text field constraints
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 10),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            // Login button constraints
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 10),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}
