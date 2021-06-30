//
//  SceneDelegate.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 16.06.2021.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var coordinator: MainCoordinator?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let dependencies: (HttpServiceDependencies & DatabaseDependencies) = DependencyContainer()
        let modules = ModulesFactory(dependencies: dependencies)
        let navigationController = UINavigationController()
        coordinator = MainCoordinator(navigationController: navigationController, modules: modules)
        window = UIWindow(windowScene: windowScene)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        coordinator?.start()
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        let dataStoreManager = UserDatabase()
        dataStoreManager.saveContext()
    }
}
