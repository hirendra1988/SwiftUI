//
//  ContentView.swift
//  PreferenceKeyDemo
//
//  Created by Hirendra Sharma on 06/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var value: String = "Hello"
    @State private var counter: Int = 0
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text(value)
                    .background(.red)
                Text("\(counter)")
                NavigationLink("Click me") {
                    DetailContentView()
                }
                .onAppear {
                        print("on appear called. \(counter)")
                    }
                Button("Click me22") {
                    counter += 1
                }
                .task {
                    print("on task called. \(counter)")
                }
            }
            
            ViewThatFits {
                    Text("The rain dwew ewq ew dsds ds das")
                    Text("in Spain")
                    Text("falls mainly")
                    Text("on the Spaniards")

//                VStack {
//                    Text("The rain")
//                    Text("in Spain")
//                    Text("falls mainly")
//                    Text("on the Spaniards")
//                }
            }
            .font(.title)
            
        }.onPreferenceChange(TitlePreferenceKey.self) { val in
            value = val
        }
        
        .padding()
    }
}

struct DetailContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .preference(key: TitlePreferenceKey.self, value: "New value from child")
        .padding()
    }
}


struct TitlePreferenceKey: PreferenceKey {
    static var defaultValue: String = "Default Value"
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}


#Preview {
    ContentView()
}

