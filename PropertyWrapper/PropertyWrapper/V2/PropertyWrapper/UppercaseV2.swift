//
//  UppercaseV2.swift
//  PropertyWrapper
//
//  Created by Hirendra Sharma on 15/09/24.
//

import Foundation
import SwiftUI

@propertyWrapper
struct UppercaseV2: DynamicProperty {
    @State private var value: String = ""
    
    var wrappedValue: String {
        get {
            value
        }
        nonmutating set {
            self.value = newValue.uppercased()
        }
    }
    
    var projectedValue: Binding<String> {
        Binding(
            get: { value },
            set: { self.value = $0.uppercased() }
        )
    }
    
    init(wrappedValue: String) {
        self.value = wrappedValue
    }
    
}
