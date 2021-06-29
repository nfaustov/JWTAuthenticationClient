//
//  LoginModule.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 18.06.2021.
//

protocol LoginModule: AnyObject {
    var coordinator: (SignUpSubscription & HomeSubscription)? { get set }
    var didFinish: (() -> Void)? { get set }
}

protocol LoginView: View {
    func updateInvalidFields()
    func updateProgress(isCompleted: Bool)
    func updateStatus(usingViewModel viewModel: AuthStatusViewModel)
}

protocol LoginPresentation: AnyObject {
    func switchToSignUpScreen()
    func validate(usingFields fields: [FieldValidatable], completion: (Bool) -> Void)
    func login(email: String, password: String)
}

protocol LoginInteraction: Interactor {
    func login(email: String, password: String)
}

protocol LoginInteractorDelegate: AnyObject {
    func successLogin(token: String)
    func failureLogin(error: String)
}
