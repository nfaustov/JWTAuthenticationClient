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
}
