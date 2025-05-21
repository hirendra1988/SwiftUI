//
//  ViewBuilder.swift
//  PropertyWrapper
//
//  Created by Hirendra Sharma on 23/06/24.
//

import SwiftUI

struct CustomViewBuilder<Content: View>: View {
    let content: () -> Content
    init(@ViewBuilder content: @escaping() -> Content) {
        self.content = content
    }
    var body: some View {
        content()
            .background(.red)
    }
}

struct NewViewBuilder<Content: View>: View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping() -> Content) {
        self.content = content
    }
    
    var body: some View {
        content()
            .cornerRadius(13)
    }
}
