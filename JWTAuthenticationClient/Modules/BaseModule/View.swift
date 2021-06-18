//
//  View.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 18.06.2021.
//

protocol View: AnyObject {
    associatedtype PresenterType
    var presenter: PresenterType! { get set }
}
