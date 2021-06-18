//
//  SignUpModule.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 18.06.2021.
//

protocol SignUpModule: AnyObject {
    var coordinator: LoginSubscription? { get set }
    var didFinish: (() -> Void)? { get set }
}

protocol SignUpView: View {
}

protocol SignUpPresentation: AnyObject {
    func switchToLoginScreen() 
}
