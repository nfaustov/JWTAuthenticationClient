//
//  Interactor.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 18.06.2021.
//

protocol Interactor: AnyObject {
    associatedtype Delegate
    var delegate: Delegate? { get set }
}
