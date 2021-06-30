//
//  AuthAPI.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 21.06.2021.
//

protocol AuthAPI {
    func signUp(
        username: String,
        email: String,
        password: String,
        success: @escaping (_ token: String) -> Void,
        failure: @escaping (_ error: String) -> Void
    )
    func login(
        email: String,
        password: String,
        success: @escaping (_ token: String) -> Void,
        failure: @escaping (_ error: String) -> Void
    )
    func validate(
        token: String,
        success: @escaping (_ user: User) -> Void,
        failure: @escaping (_ error: String) -> Void
    )
}
