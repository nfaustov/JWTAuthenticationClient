//
//  RequiredRule.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 21.06.2021.
//

final class RequiredRule: Rule {
    private var message: String

    init(message: String = "Required") {
        self.message = message
    }

    func validate(value: String) -> Bool {
        !value.isEmpty
    }

    func errorMessage() -> String {
        message
    }
}
