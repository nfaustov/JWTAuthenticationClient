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

    let statusLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

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
