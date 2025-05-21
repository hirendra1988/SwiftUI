//
//  Uppercase.swift
//  PropertyWrapper
//
//  Created by Hirendra Sharma on 01/07/23.
//

import Foundation
import SwiftUI

// Create property wrapper
//@propertyWrapper
//struct Uppercase {
//    private(set) var value: String = ""
//    var wrappedValue: String {
//        get {
//            return value
//        }
//        set {
//            value = newValue.uppercased()
//        }
//    }
//}

// Create property wrapper
@propertyWrapper
struct Uppercase: DynamicProperty {
    @State private var value: String = "Mumbai"
    var wrappedValue: String {
        get {
            return value
        }
        nonmutating set {
            value = newValue.uppercased()
        }
    }
}
