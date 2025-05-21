//
//  ContentView.swift
//  IntegrationWithUIKIT
//
//  Created by Hirendra Sharma on 07/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var counter: Int = 0
    @State var textVal: String = ""
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            CustomLabelFromSwift(labelDetail: "Custom Label: \(String(counter))")
                .frame(width: 200, height: 100)
            Button("Increase Count") {
                self.counter += 1
            }
            Spacer().frame(height: 100)
            
            CustomTextFieldFromSwift(text: $textVal)
                .frame(width: 200, height: 50)
            Text("You typed: \(textVal)")
                .background(.green)
            
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


struct ContentView2: View {
    
    @State var counter: Int = 0
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(0..<10) { index in
                    Text("ScrollView\(index + 1)")
                }
            }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.red)
    }
}
