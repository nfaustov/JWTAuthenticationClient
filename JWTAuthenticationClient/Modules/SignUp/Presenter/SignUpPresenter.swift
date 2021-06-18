//
//  SignUpPresenter.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 18.06.2021.
//

final class SignUpPresenter<V>: Presenter<V>, SignUpModule where V: SignUpView {
    weak var coordinator: LoginSubscription?

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
                isValid = rule.validate(value: field.validationText)
            }
        }

        view?.updateInvalidFields()

        if isValid {
            //
        }
    }
}
