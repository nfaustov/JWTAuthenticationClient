//
//  Modules.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 18.06.2021.
//

import UIKit

protocol Modules {
    func window(frame: CGRect) -> (UIWindow, WindowModule)
    func account() -> (UIViewController, AccountModule)
    func login()
    func signUp()
    func home()
}
