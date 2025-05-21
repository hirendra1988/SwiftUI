//
//  ContentViewV2.swift
//  PropertyWrapper
//
//  Created by Hirendra Sharma on 15/09/24.
//

import SwiftUI

struct ContentViewV2: View {
    
    @UppercaseV2 var name: String = "Hirendra"
    
    var body: some View {
        Text(name)
        Button("Click me") {
            name = "Hirendra Sharma"
        }
        ContentViewDetailsV2(name: $name)
    }
}

struct ContentViewDetailsV2: View {
    
    @Binding var name: String
    
    var body: some View {
        Text(name)
        Button("Click me") {
            name = "Hirendra Kaushik"
        }
    }
}

#Preview {
    ContentViewV2()
}
