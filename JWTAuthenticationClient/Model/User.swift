//
//  User.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 30.06.2021.
//

import Foundation

struct User: Codable {
    let id: UUID?
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case name = "username"
    }
}

extension User {
    init(usingEntity entity: UserEntity) {
        self.id = entity.id
        self.name = entity.name ?? ""
    }
}
