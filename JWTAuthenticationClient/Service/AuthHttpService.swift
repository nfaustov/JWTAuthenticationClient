//
//  AuthHttpService.swift
//  JWTAuthenticationClient
//
//  Created by Nikolai Faustov on 21.06.2021.
//

import Alamofire

final class AuthHttpService: HttpService {
    func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
        Session.default.request(urlRequest).validate(statusCode: 200..<400)
    }
}
