//
//  SignUpViewController.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 17.06.2021.
//

import UIKit

final class SignUpViewController: UIViewController {
    typealias PresenterType = SignUpPresentation
    var presenter: PresenterType!

    let nameAccountControl = AccountFieldControl()
    let emailAccountControl = AccountFieldControl()
    let passwordAccountControl = AccountFieldControl()

    let signUpButton = UIButton()
    let statusLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension SignUpViewController: SignUpView {
}
