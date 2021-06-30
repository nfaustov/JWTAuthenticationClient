//
//  AuthService.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 21.06.2021.
//

import Alamofire
import Foundation

final class AuthService {
    private let httpService: AuthHttpService

    init(httpService: AuthHttpService = AuthHttpService()) {
        self.httpService = httpService
    }
}

extension AuthService: AuthAPI {
    func signUp(
        username: String,
        email: String,
        password: String,
        success: @escaping (String) -> Void,
        failure: @escaping (String) -> Void
    ) {
        do {
            try AuthHttpRouter
                .signUp(AuthModel(name: username, email: email, password: password))
                .request(usingHttpService: httpService)
                .responseJSON { response in
                    guard response.response?.statusCode == 200 else {
                        do {
                            if let data = response.data {
                                let authError = try JSONDecoder().decode(SignUpError.self, from: data)
                                if let nameError = authError.validationErrors.name {
                                    failure(nameError)
                                    return
                                }
                                if let emailError = authError.validationErrors.email {
                                    failure(emailError)
                                    return
                                }
                                if let passwordError = authError.validationErrors.password {
                                    failure(passwordError)
                                    return
                                }
                            }
                        } catch {
                            print("Sign up parsing failed with error: \(error.localizedDescription)")
                            failure("Sign up failed")
                        }
                        return
                    }

                    guard let token = response.value as? String else {
                        print("Sign up token parsing failed")
                        return
                    }

                    success(token)
                }
        } catch {
            print("Sign up failed with error: \(error.localizedDescription)")
            failure("Sign up failed with error")
        }
    }

    func login(
        email: String,
        password: String,
        success: @escaping (String) -> Void,
        failure: @escaping (String) -> Void
    ) {
        do {
            try AuthHttpRouter
                .login(AuthModel(email: email, password: password))
                .request(usingHttpService: httpService)
                .responseJSON { response in
                    guard response.response?.statusCode == 200 else {
                        if let data = response.data {
                            do {
                                let loginError = try JSONDecoder().decode(LoginError.self, from: data)
                                failure(loginError.error)
                            } catch {
                                print("Login error: \(error)")
                                failure("Login failed")
                            }
                        }
                        return
                    }

                    guard let token = response.value as? String else {
                        print("Login token parding failed")
                        return
                    }

                    success(token)
                }
        } catch {
            print("Login failed with error: \(error.localizedDescription)")
            failure("Login failed with error")
        }
    }

    func validate(
        token: String,
        success: @escaping (User) -> Void,
        failure: @escaping (String) -> Void
    ) {
        do {
            try AuthHttpRouter
                .validate(token: token)
                .request(usingHttpService: httpService)
                .responseJSON { response in
                    guard response.response?.statusCode == 200 else {
                        if let data = response.data {
                            do {
                                let logoutError = try JSONDecoder().decode(ValidationError.self, from: data)
                                failure(logoutError.reason)
                            } catch {
                                print("Token validation failed: \(error.localizedDescription)")
                                failure("Token validation failed")
                            }
                        }
                        return
                    }

                    if let userData = response.data {
                        do {
                            let user = try JSONDecoder().decode(User.self, from: userData)
                            success(user)
                        } catch {
                            failure("Token validation failed")
                        }
                    }
                }
        } catch {
            print("Token validation failed with error: \(error.localizedDescription)")
            failure("Token validation failed with error")
        }
    }
}
