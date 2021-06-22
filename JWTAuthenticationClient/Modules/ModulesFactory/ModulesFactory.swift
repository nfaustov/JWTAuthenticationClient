//
//  ModulesFactory.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 18.06.2021.
//

import UIKit

final class ModulesFactory: Modules {
    func window(frame: CGRect) -> (UIWindow, WindowModule) {
        let view = Window(frame: frame)
        let presenter = WindowPresenter(view: view)

        return (view, presenter)
    }

    func account() -> (UIViewController, AccountModule) {
        let view = AccountViewController()
        let presenter = AccountPresenter(view: view)

        return (view, presenter)
    }

    func login() -> (UIViewController, LoginModule) {
        let view = LoginViewController()
        let interactor = LoginInteractor()
        let presenter = LoginPresenter(view: view, interactor: interactor)

        return (view, presenter)
    }

    func signUp() -> (UIViewController, SignUpModule) {
        let view = SignUpViewController()
        let interactor = SignUpInteractor()
        let presenter = SignUpPresenter(view: view, interactor: interactor)

        return (view, presenter)
    }

    func home() {
    }
}
