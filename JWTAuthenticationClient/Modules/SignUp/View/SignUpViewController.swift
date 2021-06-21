//
//  SignUpViewController.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 17.06.2021.
//

import UIKit

final class SignUpViewController: UIViewController {
    typealias PresenterType = SignUpPresentation
    var presenter: PresenterType!

    let nameAccountControl = AccountFieldControl()
    let emailAccountControl = AccountFieldControl()
    let passwordAccountControl = AccountFieldControl()

    let signUpButton = UIButton()
    let switchToLoginButton = UIButton()

    let statusLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        nameAccountControl.configure(
            title: "Name",
            validationRules: [RequiredRule()],
            contentType: .username
        )
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

        signUpButton.setTitle("Sign Up", for: .normal)
        signUpButton.titleLabel?.font = UIFont.systemFont(ofSize: 22)
        signUpButton.setTitleColor(.white, for: .normal)
        signUpButton.backgroundColor = .systemGreen
        signUpButton.addTarget(self, action: #selector(signUp), for: .touchUpInside)

        switchToLoginButton.setTitle("Already have an account? Login now", for: .normal)
        switchToLoginButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        switchToLoginButton.setTitleColor(.systemGreen, for: .normal)
        switchToLoginButton.addTarget(self, action: #selector(switchToLogin), for: .touchUpInside)

        configureStack()
    }

    private func configureStack() {
        let stackView = UIStackView(
            arrangedSubviews: [
                nameAccountControl,
                emailAccountControl,
                passwordAccountControl,
                signUpButton,
                switchToLoginButton,
                statusLabel
            ]
        )
        stackView.spacing = 8
        stackView.setCustomSpacing(4, after: passwordAccountControl)
        stackView.setCustomSpacing(4, after: signUpButton)
        stackView.axis = .vertical
        view.addSubview(stackView)

        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),

            nameAccountControl.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            nameAccountControl.heightAnchor.constraint(equalToConstant: 90),

            emailAccountControl.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            emailAccountControl.heightAnchor.constraint(equalToConstant: 90),

            passwordAccountControl.widthAnchor.constraint(equalTo: stackView.widthAnchor),
            passwordAccountControl.heightAnchor.constraint(equalToConstant: 90)
        ])
    }

    @objc private func signUp() {
        presenter.validate(usingFields: [nameAccountControl, emailAccountControl, passwordAccountControl]) { isValid in
            if isValid {
                // Proceed with signup API
            }
        }
    }

    @objc private func switchToLogin() {
        presenter.switchToLoginScreen()
    }
}

extension SignUpViewController: SignUpView {
    func updateInvalidFields() {
        nameAccountControl.setErrorMessage()
        emailAccountControl.setErrorMessage()
        passwordAccountControl.setErrorMessage()
    }

    func updateProgress(isCompleted: Bool) {
        signUpButton.isEnabled = isCompleted
        signUpButton.setTitle(isCompleted ? "" : "", for: .normal)
        if isCompleted {
            nameAccountControl.clearFieldText()
            emailAccountControl.clearFieldText()
            passwordAccountControl.clearFieldText()
        }
    }
}
