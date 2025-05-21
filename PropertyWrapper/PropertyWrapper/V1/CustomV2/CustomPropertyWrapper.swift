
//
//  CustomPropertyWrapper.swift
//  PropertyWrapper
//
//  Created by Hirendra Sharma on 07/07/24.
//

import SwiftUI

@propertyWrapper
struct CustomPropertyWrapper {
    var value = ""
    var wrappedValue: String {
        set {
            value = newValue.uppercased()
        }
        get {
            return value
        }
    }
}

@propertyWrapper
struct abc {
    private(set) var value: String = ""
    
    var wrappedValue: String {
        set {
            value = newValue
        }
        get {
            return value
        }
    }
}
