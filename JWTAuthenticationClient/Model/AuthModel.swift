//
//  AuthModel.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 23.06.2021.
//

struct AuthModel: Codable {
    let name: String
    let email: String
    let password: String

    init(name: String = "", email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}
