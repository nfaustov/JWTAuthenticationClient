//
//  WindowPresenter.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 17.06.2021.
//

final class WindowPresenter<V>: Presenter<V>, WindowModule where V: WindowView {
    weak var coordinator: (LoginSubscription & HomeSubscription)?
}

extension WindowPresenter: WindowPresentation {
    func showLoginScreen() {
        coordinator?.routeToLogin()
    }

    func showHomeScreen() {
        coordinator?.routeToHome()
    }
}
