//
//  Window.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 17.06.2021.
//

import UIKit

final class Window: UIWindow {
    typealias PresenterType = WindowPresentation
    var presenter: PresenterType!

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension Window: WindowView { }
