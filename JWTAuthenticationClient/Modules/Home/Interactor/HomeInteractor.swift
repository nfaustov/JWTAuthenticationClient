//
//  HomeInteractor.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 30.06.2021.
//

final class HomeInteractor {
    typealias Delegate = HomeInteractorDelegate
    weak var delegate: Delegate?

    var authAPI: AuthAPI?
    var authDatabase: AuthDB?
}

extension HomeInteractor: HomeInteraction {
    func validateToken() {
        guard let tokenEntity = authDatabase?.getToken(),
              let token = tokenEntity.accessToken else {
            delegate?.failedUserData(error: "Cannot find access token.")
            return
        }

        authAPI?.validate(
            token: token,
            success: { [delegate, authDatabase] user in
                authDatabase?.saveUser(user: user)
                delegate?.didRecievedUserData(user)
            },
            failure: { [delegate] error in delegate?.failedUserData(error: error) }
        )
    }
}
