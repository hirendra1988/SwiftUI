//
//  NavigationStack.swift
//  PropertyWrapper
//
//  Created by Hirendra Sharma on 23/06/24.
//

import SwiftUI

// before IOS 16
//struct NavigationContentView: View {
//    var body: some View {
//        NavigationView {
//            VStack {
//                NavigationLink("This is screen number 1") {
//                    Text("Go to screen 1")
//                }
//                Spacer().frame(height: 10)
//                NavigationLink("This is screen number 2") {
//                    Text("Go to screen 2")
//                }
//            }
//        }
//        .navigationViewStyle(.stack)
//    }
//}

// In iOS 16
//struct NavigationContentView: View {
//    var body: some View {
//        NavigationView {
//            VStack {
//                NavigationLink("This is screen number 1") {
//                    Text("Go to screen 1")
//                }
//                Spacer().frame(height: 10)
//                NavigationLink("This is screen number 2") {
//                    Text("Go to screen 2")
//                }
//            }
//        }
//    }
//}

// After iOS 16
//struct NavigationContentView: View {
//    var body: some View {
//        NavigationStack {
//            VStack {
//                NavigationLink("Go to screen 1", value: "1")
//                Spacer().frame(height: 20)
//                NavigationLink("Go to screen 2", value: "2")
//            }
//            .navigationDestination(for: String.self) { value in
//                Text("This is screen number \(value)")
//            }
//        }
//    }
//}

struct NavigationContentView: View {
    @State private var showDetails = false
    var body: some View {
        NavigationStack {
            VStack {
                Button("Update detail") {
                    showDetails = true
                }
            }
            .navigationDestination(isPresented: $showDetails) {
                VStack {
                    Text("Deails was updated")
                    Button("close") {
                        showDetails = false
                    }
                }
            }
        }
    }
}
