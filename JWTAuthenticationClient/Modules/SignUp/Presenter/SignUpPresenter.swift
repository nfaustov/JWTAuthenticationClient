//
//  SignUpPresenter.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 18.06.2021.
//

final class SignUpPresenter<V, I>: PresenterInteractor<V, I>, SignUpModule where V: SignUpView, I: SignUpInteraction {
    weak var coordinator: (LoginSubscription & HomeSubscription)?

    var didFinish: (() -> Void)?
}

extension SignUpPresenter: SignUpPresentation {
    func switchToLoginScreen() {
        coordinator?.routeToLogin()
    }

    func validate(usingFields fields: [FieldValidatable], completion: (Bool) -> Void) {
        var isValid = true

        fields.forEach { field in
            field.validationRules.forEach { rule in
                if !rule.validate(value: field.validationText) {
                    isValid = false
                    return
                }
            }
        }

        view?.updateInvalidFields()

        if isValid {
            view?.updateProgress(isCompleted: false)
        }

        completion(isValid)
    }

    func signUp(username: String, email: String, password: String) {
        interactor.signUp(username: username, email: email, password: password)
    }
}

extension SignUpPresenter: SignUpInteractorDelegate {
    func successSignUp(token: String) {
        let successText = "Sign Up is successful"
        view?.updateStatus(usingViewModel: AuthStatusViewModel(title: successText, color: StatusColor.success))
        view?.updateProgress(isCompleted: true)
        coordinator?.routeToHome()
    }

    func failureSignUp(error: String) {
        view?.updateStatus(usingViewModel: AuthStatusViewModel(title: error, color: StatusColor.failure))
        view?.updateProgress(isCompleted: true)
    }
}
