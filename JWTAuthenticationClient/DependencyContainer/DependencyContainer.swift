//
//  DependencyContainer.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 24.06.2021.
//

final class DependencyContainer: HttpServiceDependencies {
    lazy var authService: AuthAPI = AuthService()
}
