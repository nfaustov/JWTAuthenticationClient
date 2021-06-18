//
//  AccountFieldControl.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 16.06.2021.
//

import UIKit

final class AccountFieldControl: UIControl {
    private var rules: [Rule] = []

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = UIFont.systemFont(ofSize: 15, weight: .light)
        label.textColor = .secondaryLabel
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    private let errorLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        label.textColor = .systemRed
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    private let inputTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.adjustsFontSizeToFitWidth = true
        return textField
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)

        let stackView = UIStackView(arrangedSubviews: [titleLabel, inputTextField, errorLabel])
        stackView.spacing = 6
        addSubview(stackView)
        let contentInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        stackView.frame = bounds.inset(by: contentInsets)
        stackView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(title: String, validationRules: [Rule], contentType: UITextContentType) {
        titleLabel.text = title
        inputTextField.textContentType = contentType
        inputTextField.isSecureTextEntry = (contentType == .password)
        setRules(validationRules)
        inputTextField.delegate = self
    }
}

extension AccountFieldControl: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        return false
    }
}

extension AccountFieldControl: FieldValidatable {
    var validationRules: [Rule] {
        get {
            rules
        }
        set {
            rules = newValue
        }
    }

    var validationText: String {
        inputTextField.text ?? ""
    }

    private func setRules(_ rules: [Rule]) {
        validationRules.removeAll()
        validationRules.append(contentsOf: rules)
    }

    private func setErrorMessage() {
        errorLabel.text = rules
            .filter { !$0.validate(value: validationText) }
            .first
            .map { $0.errorMessage() }
    }
}
