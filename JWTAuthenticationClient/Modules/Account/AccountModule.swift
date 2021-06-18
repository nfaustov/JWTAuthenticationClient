//
//  AccountModule.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 18.06.2021.
//

protocol AccountModule: AnyObject {
    var coordinator: (LoginSubscription & SignUpSubscription)? { get set }
    var didFinish: (() -> Void)? { get set }
}

protocol AccountView: View {
}

protocol AccountPresentation: AnyObject {
    func showLogin()
    func showSignUp()
}
