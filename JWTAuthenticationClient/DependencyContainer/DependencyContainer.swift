//
//  DependencyContainer.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 24.06.2021.
//

final class DependencyContainer: HttpServiceDependencies, DatabaseDependencies {
    // MARK: - HttpService
    lazy var authService: AuthAPI = AuthService()

    // MARK: - Database
    lazy var authDatabase: AuthDB = UserDatabase()
}
