//
//  CustomModifier.swift
//  PropertyWrapper
//
//  Created by Hirendra Sharma on 15/04/24.
//

import Foundation
import SwiftUI


struct ThemeCTAButton: View {
    let title: String
    let action: (()-> Void)?
    var body: some View {
        HStack {
            Image(systemName: "square.and.arrow.up.circle")
            Button(title) {
                if let handler = action {
                    handler()
                }
            }
        }
        .modifier(ThemeButton())
    }
}

// Create Modifier
struct ThemeButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(8)
            .background(Color.green)
            .foregroundColor(Color.white)
            .font(.body)
            .cornerRadius(8.0)
    }
}

struct InfoLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(8)
            .background(Color.gray)
            .foregroundColor(Color.white)
            .font(.body)
            .cornerRadius(8.0)
    }
}

struct ErrorLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.red)
            .foregroundColor(Color.white)
            .font(.body)
    }
}

struct WarningLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.yellow)
            .foregroundColor(Color.white)
            .font(.largeTitle)
    }
}


