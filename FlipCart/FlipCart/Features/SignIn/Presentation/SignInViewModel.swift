//
//  SignInViewModel.swift
//  FlipCart
//
//  Created by Sharma, Hirendra on 12/11/24.
//

import Combine
import SwiftUI

final class SignInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var isSignedIn = false
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    private let signInUseCase: SignInUseCase
    
    init(signInUseCase: SignInUseCase) {
        self.signInUseCase = signInUseCase
    }
    
    func signIn() {
        let credentials = AuthCredentials(email: email, password: password)
        signInUseCase.execute(credentials: credentials)
            .sink(receiveCompletion: { completion in
                if case .failure(let error) = completion {
                    self.errorMessage = error.localizedDescription
                }
            }, receiveValue: { [weak self] success in
                self?.isSignedIn = success
            })
            .store(in: &cancellables)
    }
}

