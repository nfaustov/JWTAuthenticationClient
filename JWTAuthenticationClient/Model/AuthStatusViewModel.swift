//
//  AuthStatusViewModel.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 29.06.2021.
//

import UIKit

enum StatusColor {
    static let success = #colorLiteral(red: 0, green: 0.6, blue: 0, alpha: 1)
    static let failure = #colorLiteral(red: 0.8980392157, green: 0, blue: 0, alpha: 1)
}

struct AuthStatusViewModel {
    let title: String
    let color: UIColor
}
