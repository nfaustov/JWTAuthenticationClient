//
//  LoginPresenter.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 18.06.2021.
//

final class LoginPresenter<V>: Presenter<V>, LoginModule where V: LoginView {
    weak var coordinator: SignUpSubscription?

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
            //
        }
    }
}
