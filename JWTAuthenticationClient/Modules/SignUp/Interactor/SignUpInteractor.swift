//
//  SignUpInteractor.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 21.06.2021.
//

final class SignUpInteractor {
    typealias Delegate = SignUpInteractorDelegate
    weak var delegate: Delegate?

    var authAPI: AuthAPI?
}

extension SignUpInteractor: SignUpInteraction {
    func signUp(
        username: String,
        email: String,
        password: String
    ) {
        authAPI?.signUp(
            username: username,
            email: email,
            password: password,
            success: { [delegate] token in delegate?.successSignUp(token: token) },
            failure: { [delegate] error in delegate?.failureSignUp(error: error) }
        )
    }
}
