//
//  HomePresenter.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 30.06.2021.
//

final class HomePresenter<V, I>: PresenterInteractor<V, I>, HomeModule where V: HomeView, I: HomeInteraction {
    weak var coordinator: LoginSubscription?

    var didFinish: (() -> Void)?
}

extension HomePresenter: HomePresentation {
    func getUserData() {
        interactor.validateToken()
    }
}

extension HomePresenter: HomeInteractorDelegate {
    func didRecievedUserData(_ userData: User) {
        view?.greetUser(userData)
    }

    func failedTokenValidation(error: String) {
        view?.showError(error: error)
    }

    func login() {
        coordinator?.routeToLogin()
    }
}
