//
//  SignUpInteractor.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 21.06.2021.
//

enum AuthResult<T> {
    case success(result: T)
    case failure(error: String)
}

final class SignUpInteractor {
    typealias Delegate = SignUpInteractorDelegate
    weak var delegate: Delegate?

    var authAPI: AuthAPI?
}

extension SignUpInteractor: SignUpInteraction {
    func signUp(
        username: String,
        email: String,
        password: String,
        completion: @escaping (AuthResult<String>) -> Void
    ) {
        authAPI?.signUp(
            username: username,
            email: email,
            password: password,
            success: { token in completion(.success(result: token)) },
            failure: { error in completion(.failure(error: error)) }
        )
    }
}
