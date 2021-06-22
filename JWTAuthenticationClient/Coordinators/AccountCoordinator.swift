//
//  WindowCoordinator.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 18.06.2021.
//

import UIKit

final class AccountCoordinator: Coordinator {
    weak var parentCoordinator: MainCoordinator?
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController

    private let modules: Modules

    init(navigationController: UINavigationController, modules: Modules) {
        self.navigationController = navigationController
        self.modules = modules
    }

    func start() {
        let (viewController, module) = modules.login()
        module.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }

    func didFinishAccount() {
        parentCoordinator?.childDidFinish(self)
//        parentCoordinator?.routeToHome()
    }
}

extension AccountCoordinator: LoginSubscription {
    func routeToLogin() {
        let (viewController, module) = modules.login()
        module.coordinator = self
        navigationController.setViewControllers([viewController], animated: true)
    }
}

extension AccountCoordinator: SignUpSubscription {
    func routeToSignUp() {
        let (viewController, module) = modules.signUp()
        module.coordinator = self
        navigationController.setViewControllers([viewController], animated: true)
    }
}
