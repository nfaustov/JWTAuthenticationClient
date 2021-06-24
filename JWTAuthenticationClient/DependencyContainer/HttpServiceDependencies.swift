//
//  HttpServiceDependencies.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 24.06.2021.
//

protocol HttpServiceDependencies {
    var authService: AuthAPI { get }
}
