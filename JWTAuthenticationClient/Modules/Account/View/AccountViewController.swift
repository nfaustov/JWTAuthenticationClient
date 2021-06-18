//
//  AccountViewController.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 16.06.2021.
//

import UIKit

final class AccountViewController: UIViewController {
    typealias PresenterType = AccountPresentation
    var presenter: PresenterType!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
    }
}

extension AccountViewController: AccountView {
}
