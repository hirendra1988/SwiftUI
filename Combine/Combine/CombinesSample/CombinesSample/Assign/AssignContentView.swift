//
//  AssignContentView.swift
//  CombinesSample
//
//  Created by Hirendra Sharma on 09/07/24.
//

import SwiftUI

//struct AssignContentView: View {
//    @StateObject var object = Human()
//    var body: some View {
//        VStack {
//            Text(object.name)
//            Button("Click me") {
//                object.name = "Alice1"
//            }
//        }.onAppear() {
//            let publisher = ["Alice", "Bob", "Nikunj1"].publisher
//            _ = publisher
//                .assign(to: \.name, on: object)
//        }
//    }
//}

struct AssignContentView: View {
    @StateObject var object = Human()
    var body: some View {
        VStack {
            Text(object.name)
            Button("Click me") {
                object.name = "Alice1"
            }
        }.onAppear() {
            object.name.publisher.sink { response in
                print("sdsasd")
            } receiveValue: { val in
                print(val)
            }
            
//            $object.$name.sink { receivedValue in
//                print("Current name assigned is \(receivedValue) \n")
//            }
            let namePublisher = ["Alice", "Bob", "Nikunj"].publisher
            namePublisher.assign(to: &object.$name)
        }
    }
}

#Preview {
    AssignContentView()
}
