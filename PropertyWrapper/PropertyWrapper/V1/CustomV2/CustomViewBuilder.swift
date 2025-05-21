//
//  CustomViewBuilder.swift
//  PropertyWrapper
//
//  Created by Hirendra Sharma on 07/07/24.
//

import SwiftUI

struct VHStack<Content: View>: View {
    @Environment(\.verticalSizeClass) var verticalSizeClasses
    let content: () -> Content
    
    init(@ViewBuilder _ content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        if verticalSizeClasses == .compact {
            HStack {
                content()
            }
        } else {
            VStack {
                content()
            }
        }
    }
}

struct VHStack2<Content: View>: View {
    let content: Content
    init(@ViewBuilder _ content: @escaping () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        content
            .background(.red)
    }
}
