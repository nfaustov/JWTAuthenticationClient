//
//  LoginViewController.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 17.06.2021.
//

import UIKit

final class LoginViewController: UIViewController {
    typealias PresenterType = LoginPresentation
    var presenter: PresenterType!

    let emailAccountControl = AccountFieldControl()
    let passwordAccountControl = AccountFieldControl()

    let loginButton = UIButton()
    let switchToSignUpButton = UIButton()

    let statusLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        configureHierarchy()
    }

    private func configureHierarchy() {
        emailAccountControl.configure(
            title: "Email",
            validationRules: [RequiredRule(), EmailRule()],
            contentType: .emailAddress
        )
        passwordAccountControl.configure(
            title: "Password",
            validationRules: [RequiredRule(), PasswordRule()],
            contentType: .password
        )

        loginButton.setTitle("Login", for: .normal)
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.backgroundColor = .systemGreen
        loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)

        switchToSignUpButton.setTitle("Don't have an account? Sign up", for: .normal)
        switchToSignUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        switchToSignUpButton.setTitleColor(.systemGreen, for: .normal)
        switchToSignUpButton.addTarget(self, action: #selector(switchToSignUp), for: .touchUpInside)

        let stackView = UIStackView(
            arrangedSubviews: [
                emailAccountControl, passwordAccountControl, loginButton, switchToSignUpButton, statusLabel
            ]
        )
        stackView.spacing = 8
        stackView.setCustomSpacing(4, after: passwordAccountControl)
        stackView.setCustomSpacing(4, after: loginButton)
        stackView.axis = .vertical
        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),

            emailAccountControl.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            emailAccountControl.heightAnchor.constraint(equalToConstant: 90),

            passwordAccountControl.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            passwordAccountControl.heightAnchor.constraint(equalToConstant: 90)
        ])
    }

    @objc private func login() {
        presenter.validate(usingFields: [emailAccountControl, passwordAccountControl]) { isValid in
            if isValid {
                // Proceed with login API
            }
        }
    }

    @objc private func switchToSignUp() {
        presenter.switchToSignUpScreen()
    }
}

extension LoginViewController: LoginView {
    func updateInvalidFields() {
        emailAccountControl.setErrorMessage()
        passwordAccountControl.setErrorMessage()
    }

    func updateProgress(isCompleted: Bool) {
        loginButton.isEnabled = isCompleted
        loginButton.setTitle(isCompleted ? "Login" : "Logging in ...", for: .normal)
        if isCompleted {
            emailAccountControl.clearFieldText()
            passwordAccountControl.clearFieldText()
        }
    }
}
