//
//  ContentView.swift
//  FlipCart
//
//  Created by Sharma, Hirendra on 12/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            SignInView(viewModel: SignInViewModel(signInUseCase:
                                                    SignInUseCase(repository: AuthRepositoryImpl())))
        }
    }
}

