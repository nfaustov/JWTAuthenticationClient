//
//  UserToken.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 30.06.2021.
//

import Foundation

struct UserToken {
    let accessToken: String
    let email: String
    let loggedIn: Bool
}

extension UserToken {
    init(usingEntity entity: UserTokenEntity) {
        self.accessToken = entity.accessToken ?? ""
        self.email = entity.email ?? ""
        self.loggedIn = entity.loggedIn
    }
}
