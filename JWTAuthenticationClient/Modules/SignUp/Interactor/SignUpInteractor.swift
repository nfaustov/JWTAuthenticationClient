//
//  SignUpInteractor.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 21.06.2021.
//

import Foundation

final class SignUpInteractor {
    typealias Delegate = SignUpInteractorDelegate
    weak var delegate: Delegate?
}

extension SignUpInteractor: SignUpInteraction {
    func signUp(
        username: String,
        email: String,
        password: String,
        completion: @escaping (Result<String, Error>) -> Void
    ) {
    }
}
