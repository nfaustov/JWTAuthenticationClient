//
//  SignUpError.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 24.06.2021.
//

import Foundation

struct SignUpError: Codable, Error {
    enum CodingKeys: String, CodingKey {
        case validationErrors = "validation_errors"
    }

    let validationErrors: ValidationErrors
}

struct ValidationErrors: Codable {
    let name, email, password: String?
}
