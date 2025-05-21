//
//  AssignSubscriber.swift
//  CombinesSample
//
//  Created by Hirendra Sharma on 09/07/24.
//

import Combine

//class Human: ObservableObject {
//    var name: String = "" {
//        didSet {
//            print("Current name assigned is \(name) \n")
//        }
//    }
//}


class Human: ObservableObject {
    @Published var name: String = ""
}
