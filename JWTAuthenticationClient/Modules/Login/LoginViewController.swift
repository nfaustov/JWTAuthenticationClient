//
//  LoginViewController.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 17.06.2021.
//

import UIKit

final class LoginViewController: UIViewController {
    let emailAccountControl = AccountFieldControl()
    let passwordAccountControl = AccountFieldControl()

    let loginButton = UIButton()
    let statusLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
