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

    func login() {
    }

    func signUp() {
    }

    func home() {
    }
}
