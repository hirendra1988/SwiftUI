//
//  ContentView.swift
//  NavigationStackSample
//
//  Created by Hirendra Sharma on 04/07/24.
//

import SwiftUI

struct SimpleNavigationView11: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                
                NavigationLink(value: "Home") {
                    Text("Home Click")
                }
                
                NavigationLink(value: 1) {
                    Text("Detail Click")
                }
            }.navigationDestination(for: String.self) { val in
//                if val == "Detail" {
//                    UserView(navTitle: "Detail screen")
//                } else 
                if val == "Home" {
                    //UserView(navTitle: "Home screen", items: [1,3,4,])
                }
            }
            .navigationDestination(for: Int.self) { val in
                if val == 1 {
                    //UserView(navTitle: "Detail screen")
                }
            }
        }
    }
}

struct SimpleNavigationView: View {
    @State private var isClickedUser: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                
                Button("Click me") {
                    self.isClickedUser = true
                }
            }
            .sheet(isPresented: $isClickedUser, content: {
                UserView(isClickedUser: $isClickedUser, navTitle: "Home screen")
            })
//            .popover(isPresented: $isClickedUser, content: {
//                UserView(isClickedUser: $isClickedUser, navTitle: "Home screen")
//            })
//            .fullScreenCover(isPresented: $isClickedUser, content: {
//                UserView(isClickedUser: $isClickedUser, navTitle: "Home screen")
//            })
        }
    }
}

#Preview {
    SimpleNavigationView()
}


struct UserView: View {
    @Binding var isClickedUser: Bool
    var navTitle: String = ""
    var body: some View {
        VStack {
            Text(navTitle)
            Button("Dismiss") {
                self.isClickedUser = false
            }
        }
    }
}
