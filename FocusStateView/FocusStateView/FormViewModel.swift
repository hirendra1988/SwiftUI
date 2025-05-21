//
//  FormViewModel.swift
//  FocusStateView
//
//  Created by Hirendra Sharma on 06/07/24.
//

import SwiftUI

class FormViewModel: ObservableObject {
    @Published var name: String = ""
    @Published var email: String = ""
    @Published var comment: String = ""
}
