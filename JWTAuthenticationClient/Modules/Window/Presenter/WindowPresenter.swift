//
//  WindowPresenter.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 17.06.2021.
//

final class WindowPresenter<V>: Presenter<V>, WindowModule where V: WindowView {
    weak var coordinator: (LoginSubscription & HomeSubscription)?

    var didFinish: (() -> Void)?
}

extension WindowPresenter: WindowPresentation {
    func showLogin() {
        coordinator?.routeToLogin()
    }

    func showHome() {
        coordinator?.routeToHome()
    }
}
