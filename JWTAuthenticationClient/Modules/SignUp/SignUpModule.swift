//
//  SignUpModule.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 18.06.2021.
//

protocol SignUpModule: AnyObject {
    var coordinator: (LoginSubscription & HomeSubscription)? { get set }
    var didFinish: (() -> Void)? { get set }
}

protocol SignUpView: View {
    func updateInvalidFields()
    func updateProgress(isCompleted: Bool)
    func updateStatus(usingViewModel viewModel: AuthStatusViewModel)
}

protocol SignUpPresentation: AnyObject {
    func switchToLoginScreen()
    func validate(usingFields fields: [FieldValidatable], completion: (Bool) -> Void)
    func signUp(username: String, email: String, password: String)
}

protocol SignUpInteraction: Interactor {
    func signUp(username: String, email: String, password: String)
}

protocol SignUpInteractorDelegate: AnyObject {
    func successSignUp(token: String)
    func failureSignUp(error: String)
}
