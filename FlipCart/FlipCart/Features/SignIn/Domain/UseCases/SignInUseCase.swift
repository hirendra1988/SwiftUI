//
//  SignInUseCase.swift
//  FlipCart
//
//  Created by Sharma, Hirendra on 12/11/24.
//

import Combine

final class SignInUseCase {
    private let repository: AuthRepository
    
    init(repository: AuthRepository) {
        self.repository = repository
    }

    func execute(credentials: AuthCredentials) -> AnyPublisher<Bool, Error> {
        repository.signIn(credentials: credentials)
    }
}

