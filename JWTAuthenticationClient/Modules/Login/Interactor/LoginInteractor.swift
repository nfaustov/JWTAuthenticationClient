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
}

extension LoginInteractor: LoginInteraction {
    func login(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
    }
}
