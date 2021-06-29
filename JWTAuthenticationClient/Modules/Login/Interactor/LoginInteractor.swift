//
//  LoginInteractor.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 21.06.2021.
//

import Foundation

final class LoginInteractor {
    typealias Delegate = LoginInteractorDelegate
    weak var delegate: Delegate?

    var authAPI: AuthAPI?
}

extension LoginInteractor: LoginInteraction {
    func login(email: String, password: String) {
        authAPI?.login(
            email: email,
            password: password,
            success: { [delegate] token in delegate?.successLogin(token: token) },
            failure: { [delegate] error in delegate?.failureLogin(error: error) }
        )
    }
}
