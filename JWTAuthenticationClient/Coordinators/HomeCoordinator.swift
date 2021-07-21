//
//  HomeCoordinator.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 18.06.2021.
//

import UIKit

final class HomeCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    private let modules: Modules

    init(navigationController: UINavigationController, modules: Modules) {
        self.navigationController = navigationController
        self.modules = modules
    }

    func start() {
        let (viewController, module) = modules.home()
        module.coordinator = self
        navigationController.setViewControllers([viewController], animated: true)
    }
}

extension HomeCoordinator: LoginSubscription {
    func routeToLogin() {
        parentCoordinator?.childDidFinish(self)
        parentCoordinator?.routeToLogin()
    }
}
