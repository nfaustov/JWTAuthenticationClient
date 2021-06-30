//
//  LoginInteractor.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 21.06.2021.
//

final class LoginInteractor {
    typealias Delegate = LoginInteractorDelegate
    weak var delegate: Delegate?

    var authAPI: AuthAPI?
    var authDatabase: AuthDB?
}

extension LoginInteractor: LoginInteraction {
    func login(email: String, password: String) {
        authAPI?.login(
            email: email,
            password: password,
            success: { [delegate, authDatabase] token in
                authDatabase?.saveToken(userToken: UserToken(accessToken: token, email: email, loggedIn: true))
                delegate?.successLogin(token: token)
            },
            failure: { [delegate] error in delegate?.failureLogin(error: error) }
        )
    }
}
