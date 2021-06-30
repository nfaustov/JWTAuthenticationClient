//
//  HomeViewController.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 30.06.2021.
//

import UIKit

final class HomeViewController: UIViewController {
    typealias PresenterType = HomePresentation
    var presenter: PresenterType!

    let greetingLabel = UILabel()
    let activityIndicator = UIActivityIndicatorView(style: .large)

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground

        greetingLabel.font = UIFont.systemFont(ofSize: 40)
        greetingLabel.textColor = .label
        greetingLabel.numberOfLines = 0
        greetingLabel.textAlignment = .center
        view.addSubview(greetingLabel)
        view.addSubview(activityIndicator)

        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            greetingLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            greetingLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),

            activityIndicator.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        activityIndicator.startAnimating()
        presenter.getUserData()
    }
}

extension HomeViewController: HomeView {
    func greetUser(_ user: User) {
        activityIndicator.stopAnimating()
        greetingLabel.text = "Hello, \(user.name)"
    }

    func showError(error: String) {
        let alertController = UIAlertController(title: "Error", message: error, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "OK", style: .default) { _ in
            alertController.dismiss(animated: true)
        }

        alertController.addAction(confirmAction)

        activityIndicator.stopAnimating()
        present(alertController, animated: true)
    }
}
