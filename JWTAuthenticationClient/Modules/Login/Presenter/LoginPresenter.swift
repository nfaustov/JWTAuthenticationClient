//
//  LoginPresenter.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 18.06.2021.
//

final class LoginPresenter<V, I>: PresenterInteractor<V, I>, LoginModule where V: LoginView, I: LoginInteraction {
    weak var coordinator: (SignUpSubscription & HomeSubscription)?

    var didFinish: (() -> Void)?
}

extension LoginPresenter: LoginPresentation {
    func switchToSignUpScreen() {
        coordinator?.routeToSignUp()
    }

    func validate(usingFields fields: [FieldValidatable], completion: (Bool) -> Void) {
        var isValid = true

        fields.forEach { field in
            field.validationRules.forEach { rule in
                isValid = rule.validate(value: field.validationText)
            }
        }

        view?.updateInvalidFields()

        if isValid {
            view?.updateProgress(isCompleted: false)
        }

        completion(isValid)
    }

    func login(email: String, password: String) {
        interactor.login(email: email, password: password)
    }
}

extension LoginPresenter: LoginInteractorDelegate {
    func successLogin(token: String) {
        let successText = "Login is successful"
        view?.updateStatus(usingViewModel: AuthStatusViewModel(title: successText, color: StatusColor.success))
        view?.updateProgress(isCompleted: true)
        coordinator?.routeToHome()
    }

    func failureLogin(error: String) {
        view?.updateStatus(usingViewModel: AuthStatusViewModel(title: error, color: StatusColor.failure))
        view?.updateProgress(isCompleted: true)
    }
}
