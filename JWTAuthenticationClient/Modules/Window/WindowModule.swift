//
//  WindowModule.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 18.06.2021.
//

protocol WindowModule: AnyObject {
    var coordinator: (LoginSubscription & HomeSubscription)? { get set }
    var didFinish: (() -> Void)? { get set }
}

protocol WindowView: View {
}

protocol WindowPresentation: AnyObject {
    func showLogin()
    func showHome()
}
