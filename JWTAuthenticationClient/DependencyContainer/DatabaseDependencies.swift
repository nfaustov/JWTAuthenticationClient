//
//  DatabaseDependencies.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 30.06.2021.
//

protocol DatabaseDependencies {
    var authDatabase: AuthDB { get }
}
