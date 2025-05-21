//
//  CustomModifierV2.swift
//  PropertyWrapper
//
//  Created by Hirendra Sharma on 07/07/24.
//

import SwiftUI
import Foundation

struct CustomModifierV2: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.red)
            .foregroundColor(.green)
    }
}

extension View {
    func customModifierV2() -> some View {
        modifier(CustomModifierV2())
    }
}















