//
//  ModulesFactory.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 18.06.2021.
//

import UIKit

final class ModulesFactory: Modules {
    private let dependencies: (HttpServiceDependencies & DatabaseDependencies)

    init(dependencies: (HttpServiceDependencies & DatabaseDependencies) ) {
        self.dependencies = dependencies
    }

    func login() -> (UIViewController, LoginModule) {
        let view = LoginViewController()
        let interactor = LoginInteractor()
        interactor.authAPI = dependencies.authService
        interactor.authDatabase = dependencies.authDatabase
        let presenter = LoginPresenter(view: view, interactor: interactor)

        return (view, presenter)
    }

    func signUp() -> (UIViewController, SignUpModule) {
        let view = SignUpViewController()
        let interactor = SignUpInteractor()
        interactor.authAPI = dependencies.authService
        interactor.authDatabase = dependencies.authDatabase
        let presenter = SignUpPresenter(view: view, interactor: interactor)

        return (view, presenter)
    }

    func home() -> (UIViewController, HomeModule) {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        interactor.authAPI = dependencies.authService
        interactor.authDatabase = dependencies.authDatabase
        let presenter = HomePresenter(view: view, interactor: interactor)

        return (view, presenter)
    }
}
