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
    func updateInvalidFields()
    func updateProgress(isCompleted: Bool)
}

protocol LoginPresentation: AnyObject {
    func switchToSignUpScreen()
    func validate(usingFields fields: [FieldValidatable], completion: (Bool) -> Void)
}

protocol LoginInteraction: Interactor {
    func login(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void)
}

protocol LoginInteractorDelegate: AnyObject {
}
