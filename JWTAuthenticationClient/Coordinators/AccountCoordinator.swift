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
        let (viewController, module) = modules.account()
        module.coordinator = self
        navigationController.pushViewController(viewController, animated: true)
    }
}

extension AccountCoordinator: LoginSubscription {
    func routeToLogin() {
    }
}

extension AccountCoordinator: SignUpSubscription {
    func routeToSignUp() {
    }
}
