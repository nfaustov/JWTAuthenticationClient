//
//  AuthHttpRouter.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 21.06.2021.
//

import Alamofire
import Foundation

enum AuthHttpRouter {
    case login
    case signUp
}

extension AuthHttpRouter/*: HttpRouter*/ {
}
