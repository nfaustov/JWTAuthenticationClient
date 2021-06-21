//
//  MainCoordinator.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 18.06.2021.
//

import UIKit

final class MainCoordinator: Coordinator {
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    private let modules: Modules

    init(navigationController: UINavigationController, modules: Modules) {
        self.navigationController = navigationController
        self.modules = modules
    }

    func start() {
//        let (window, module) = modules.window(frame: UIScreen.main.bounds)
//        window.rootViewController = navigationController
//        window.makeKeyAndVisible()
//        module.coordinator = self
        accountCoordinator()
    }

    func childDidFinish(_ child: Coordinator?) {
        for (index, coordinator) in childCoordinators.enumerated() where coordinator === child {
            childCoordinators.remove(at: index)
        }
    }

    private func accountCoordinator() {
        let child = AccountCoordinator(navigationController: navigationController, modules: modules)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }

    private func homeCoordinator() {
        let child = HomeCoordinator(navigationController: navigationController, modules: modules)
        child.parentCoordinator = self
        childCoordinators.append(child)
        child.start()
    }
}

extension MainCoordinator: HomeSubscription {
    func routeToHome() {
        homeCoordinator()
    }
}

extension MainCoordinator: LoginSubscription {
    func routeToLogin() {
        accountCoordinator()
    }
}
