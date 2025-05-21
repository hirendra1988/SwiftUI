//
//  AuthRepository.swift
//  FlipCart
//
//  Created by Sharma, Hirendra on 12/11/24.
//

import Combine

protocol AuthRepository {
    func signIn(credentials: AuthCredentials) -> AnyPublisher<Bool, Error>
}

