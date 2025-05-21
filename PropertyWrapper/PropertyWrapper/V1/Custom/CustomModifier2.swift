//
//  CustomModifier2.swift
//  PropertyWrapper
//
//  Created by Hirendra Sharma on 23/06/24.
//

import SwiftUI

struct NewContentView: View {
    
    @State var buttonIsActive = false
    @Capitalized var name: String
    
    init(name: String) {
        self.name = name
    }
    
    var body: some View {
        CustomViewBuilder {
            VStack {
                Button("My Button") {
                    withAnimation {
                        buttonIsActive.toggle()
                    }
                }
                Text(name)
                    .customStyle(isActive: buttonIsActive)
                    .customM()
                Text("ABC")
                Text("XYZ")
            }
        }
    }
}

// Passing parameters to a custom modifier
struct CustomModifier2: ViewModifier {
    let isActive: Bool
    func body(content: Content) -> some View {
        content
            .font(.title)
            .background(isActive ? .red : .green)
            
    }
}

extension View {
    func customStyle(isActive: Bool) -> some View {
        modifier(CustomModifier2(isActive: isActive))
    }
}



// scrollTargetLayout
@available(iOS 17.0, *)
struct NewContentView2: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack {
                ForEach(0..<10) { i in
                    RoundedRectangle(cornerRadius: 25)
                        .fill(Color(hue: Double(i) / 10, saturation: 1, brightness: 1).gradient)
                        .frame(width: 300, height: 100)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.viewAligned)
        .safeAreaPadding(.horizontal, 40)
    }
}
