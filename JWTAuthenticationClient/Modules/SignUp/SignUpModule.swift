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
    func updateInvalidFields()
    func updateProgress(isCompleted: Bool)
}

protocol SignUpPresentation: AnyObject {
    func switchToLoginScreen()
    func validate(usingFields fields: [FieldValidatable], completion: (Bool) -> Void)
}
