//
//  AuthDB.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 30.06.2021.
//

protocol AuthDB {
    func saveToken(userToken: UserToken)
    func getToken() -> UserTokenEntity?
    func saveUser(user: User)
}
