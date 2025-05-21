//
//  Uppercase2.swift
//  PropertyWrapper
//
//  Created by Hirendra Sharma on 23/06/24.
//

import SwiftUI

//@propertyWrapper
//class Lowercase {
//    private(set) var value: String = ""
//    var wrappedValue: String {
//        set {
//            value = newValue.lowercased()
//        }
//        get {
//            return value
//        }
//    }
//}

@propertyWrapper
struct Lowercase: DynamicProperty {
    @State private var value: String = ""
    var wrappedValue: String {
        get {
            return value
        }
        nonmutating set {
            value = newValue.lowercased()
        }
    }
}
