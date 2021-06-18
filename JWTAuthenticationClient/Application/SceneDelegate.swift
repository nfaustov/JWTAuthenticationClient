//
//  SceneDelegate.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 16.06.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var coordinator: MainCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard (scene as? UIWindowScene) != nil else { return }

        let navigationController = UINavigationController()
        let modules = ModulesFactory()
        coordinator = MainCoordinator(navigationController: navigationController, modules: modules)
        coordinator?.start()
    }
}
