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

    func login() -> (UIViewController, LoginModule) {
        let view = LoginViewController()
        let presenter = LoginPresenter(view: view)

        return (view, presenter)
    }

    func signUp() -> (UIViewController, SignUpModule) {
        let view = SignUpViewController()
        let presenter = SignUpPresenter(view: view)

        return (view, presenter)
    }

    func home() {
    }
}
