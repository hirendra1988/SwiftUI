//
//  ContentView.swift
//  DebuggingCode
//
//  Created by Hirendra Sharma on 27/06/24.
//

import SwiftUI

//MARK: Using View Extension to print it
//struct ContentView: View {
//    
//    @State private var isToggle: Bool = false
//    
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//            Button("Click me") {
//                isToggle.toggle()
//            }
//            Text(isToggle ? "ToggleON" : "ToggleOFF")
//            
//            DetailContentView(isToggle: $isToggle)
//        }.printOutput("Value changed")
//        .padding()
//    }
//}

//MARK: Using _printChanges to print it
struct ContentView: View {
    
    @State var isToggle: Bool = false
    var counter: Int = 3
    
    var body: some View {
        let _ = Self._printChanges()
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!") + Text("Hello, world!") + Text("Hello, world!")
            Button("Click me") {
                isToggle.toggle()
            }
            if isToggle {
                Text("ToggleON")
            } else {
                Text("ToggleOFF")
            }
            
            HStack(spacing: 16) {
                Text("Hello")
                Text("World")
                Text("!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
                    .layoutPriority(1)
            }
            .font(.largeTitle)
            .lineLimit(1)

            
            DetailContentView(isToggle: $isToggle)
        }.accessibilityElement(children: .combine)
        .padding()
    }
}

struct ContentView1: View {
    
    @State private var isToggle: Bool = false
    var counter: Int = 3
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            Button("Click me") {
                isToggle.toggle()
            }
            Text(isToggle ? "ToggleON" : "ToggleOFF")
            //DetailContentView(isToggle: $isToggle)
            
        }
        .accessibilityElement(children: .combine)
        .debugType()
        .padding()
    }
}

struct DetailContentView: View {
    @Binding var isToggle: Bool
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("DetailContentView")
        }
        .task {
            print("task")
        }
        .onAppear() {
            print("onAppear")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

extension View {
    func printOutput(_ value: Any) -> Self {
        print(value)
        return self
    }
    
    func debugType() -> Self {
        let type = Mirror(reflecting: self).subjectType
        print(type)
        return self
    }
}
