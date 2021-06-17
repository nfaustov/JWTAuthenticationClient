//
//  MinimumLengthRule.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 17.06.2021.
//

final class MinimumLengthRule: Rule {
    let minLength = 3
    private var message: String

    init(message: String) {
        self.message = message
    }

    func validate(value: String) -> Bool {
        return value.count > minLength
    }

    func errorMessage() -> String {
        return message
    }
}


