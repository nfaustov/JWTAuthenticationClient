//
//  FieldValidatable.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 21.06.2021.
//

protocol FieldValidatable {
    var validationRules: [Rule] { get }
    var validationText: String { get }
}
