//
//  Test.swift
//  PropertyWrapper
//
//  Created by Hirendra Sharma on 23/06/24.
//

import SwiftUI

struct customModifier3: ViewModifier {
    func body(content: Content) -> some View {
        content
            .cornerRadius(12)
    }
}

extension View {
    func customM() -> some View {
        modifier(customModifier3())
    }
}

@propertyWrapper
struct Capitalized: DynamicProperty {
    private var value2: String = ""
    var wrappedValue: String {
        get {
            return value2
        }
        set {
            value2 = newValue.capitalized
        }
    }
    
//    var projectedValue: String {
//        get {
//            return value2
//        }
//        set {
//            value2 = newValue.capitalized
//        }
//    }
}
