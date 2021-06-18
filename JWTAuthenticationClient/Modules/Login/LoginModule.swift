//
//  LoginModule.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 18.06.2021.
//

protocol LoginModule: AnyObject {
    var coordinator: SignUpSubscription? { get set }
    var didFinish: (() -> Void)? { get set }
}

protocol LoginView: View {
}

protocol LoginPresentation: AnyObject {
    func switchToSignUpScreen()
}
