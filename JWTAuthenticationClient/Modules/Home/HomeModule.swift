//
//  HomeModule.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 30.06.2021.
//

protocol HomeModule: AnyObject {
    var coordinator: HomeCoordinator? { get set }
    var didFinish: (() -> Void)? { get set }
}

protocol HomeView: View {
    func greetUser(_ user: User)
    func showError(error: String)
}

protocol HomePresentation: AnyObject {
    func getUserData()
}

protocol HomeInteraction: Interactor {
    func validateToken()
}

protocol HomeInteractorDelegate: AnyObject {
    func didRecievedUserData(_ userData: User)
    func failedUserData(error: String)
}
