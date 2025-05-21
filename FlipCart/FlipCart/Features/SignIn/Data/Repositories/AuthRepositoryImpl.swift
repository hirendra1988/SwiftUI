//
//  AuthRepositoryImpl.swift
//  FlipCart
//
//  Created by Sharma, Hirendra on 12/11/24.
//

import Combine

final class AuthRepositoryImpl: AuthRepository {
    func signIn(credentials: AuthCredentials) -> AnyPublisher<Bool, Error> {
        let endpoint = APIEndpoint.signIn(credentials: credentials)
        
        return NetworkService.shared.request(endpoint, responseType: SignInResponse.self)
            .map { $0.success }
            .eraseToAnyPublisher()
    }
}

