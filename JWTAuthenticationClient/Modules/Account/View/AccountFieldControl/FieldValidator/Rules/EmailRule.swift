//
//  EmailRule.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 17.06.2021.
//

import Foundation

final class EmailRule: Rule {
    static let regex = "[A-Z0-9a-z._%+-]+ @[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
    private var message: String

    init(message: String = "Invalid Email") {
        self.message = message
    }

    func validate(value: String) -> Bool {
        let pattern = NSPredicate(format: "SELF MATCHES %@", EmailRule.regex)
        return pattern.evaluate(with: value)
    }

    func errorMessage() -> String {
        message
    }
}
