//
//  User.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 30.06.2021.
//

struct User: Codable {
    let id: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case name = "username"
    }
}
