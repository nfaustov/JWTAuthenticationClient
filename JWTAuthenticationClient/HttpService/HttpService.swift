//
//  HttpService.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 21.06.2021.
//

import Alamofire

protocol HttpService {
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest
}
