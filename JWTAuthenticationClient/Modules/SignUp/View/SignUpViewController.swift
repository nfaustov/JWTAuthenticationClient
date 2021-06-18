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

    let statusLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

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
