//
//  AccountPresenter.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 18.06.2021.
//

final class AccountPresenter<V>: Presenter<V>, AccountModule where V: AccountView {
    weak var coordinator: (LoginSubscription & SignUpSubscription)?

    var didFinish: (() -> Void)?
}

extension AccountPresenter: AccountPresentation {
    func showLogin() {
    }

    func showSignUp() {
    }
}
