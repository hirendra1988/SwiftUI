//
//  ContentView.swift
//  GestureDemo
//
//  Created by Hirendra Sharma on 03/07/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            HStack {
                Color.red
                    .frame(width: 200, height: 200)
            }
            .gesture(
                TapGesture()
                    .onEnded({
                        print("onEnded")
                    })
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .contentShape(Rectangle())
                .onTapGesture(count: 1) {
                    print("onTapGesture")
                }
//        .onLongPressGesture(perform: {
//            print("onLongPressGesture")
//        })
        
        .background(.orange)
    }
}

#Preview {
    ContentView()
}

// MARK: Created ViewModifier for Tap Gesture
private struct ExpandAreaTap: ViewModifier {
    func body(content: Content) -> some View {
        ZStack {
            Rectangle()
                .foregroundColor(Color.white)
                .contentShape(Rectangle())
            content
        }
    }
}

extension View {
    func expandTap(tap: @escaping () -> ()) -> some View {
        self.modifier(ExpandAreaTap()).onTapGesture(perform: tap)
    }
}
