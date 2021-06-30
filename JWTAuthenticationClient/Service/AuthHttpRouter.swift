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
    case validate(token: String)
}

extension AuthHttpRouter: HttpRouter {
    var baseURL: String {
        // Test
        "http://127.0.0.1:8080/users"
        // Prod
        // ""
    }

    var path: String {
        switch self {
        case .login:
            return "login"
        case .signUp:
            return "create"
        case .validate:
            return "me"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .login, .signUp:
            return .post
        case .validate:
            return .get
        }
    }

    var headers: HTTPHeaders? {
        switch self {
        case .login, .signUp:
            return [
                "Content-Type": "application/json; charset=UTF-8"
            ]
        case .validate(let token):
            return [
                "Authorization": "Bearer \(token)"
            ]
        }
    }

    func body() throws -> Data? {
        switch self {
        case .login(let user), .signUp(let user):
            return try JSONEncoder().encode(user)
        case .validate:
            return nil
        }
    }
}
