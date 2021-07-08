//
//  TokenResponse.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 08.07.2021.
//

import Foundation

struct TokenResponse: Codable {
    enum CodingKeys: String, CodingKey {
        case value = "token"
    }

    let value: String
}
