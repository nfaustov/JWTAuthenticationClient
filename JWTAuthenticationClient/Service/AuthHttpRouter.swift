//
//  AuthHttpRouter.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 21.06.2021.
//

import Alamofire
import Foundation

enum AuthHttpRouter {
    case login(AuthModel)
    case signUp(AuthModel)
}

extension AuthHttpRouter: HttpRouter {
    var baseURL: String {
        "http://127.0.0.1:8080/users"
    }

    var path: String {
        switch self {
        case .login:
            return "login"
        case .signUp:
            return "create"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .login, .signUp:
            return .post
        }
    }

    var headers: HTTPHeaders? {
        switch self {
        case .login, .signUp:
            return [
                "Content-Type": "application/json; charset=UTF-8"
            ]
        }
    }

    func body() throws -> Data? {
        switch self {
        case .login(let user), .signUp(let user):
            return try JSONEncoder().encode(user)
        }
    }
}
