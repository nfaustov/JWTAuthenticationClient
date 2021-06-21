//
//  Rule.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 16.06.2021.
//

protocol Rule {
    func validate(value: String) -> Bool
    func errorMessage() -> String
}
