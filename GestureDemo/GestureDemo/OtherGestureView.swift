//
//  OtherGestureView.swift
//  GestureDemo
//
//  Created by Hirendra Sharma on 03/07/24.
//

import SwiftUI

struct OtherGestureView: View {
    
    @GestureState var dragAmount = CGSize.zero
    
    var body: some View {
        VStack {
            //Text("Hello, World!")
            Image("crop-circle")
                .resizable()
                .frame(width: 100, height: 100)
                .offset(dragAmount)
                .onTapGesture {
                    print("Circle tapped")
                }
                .gesture(
                    DragGesture().updating($dragAmount) { val, state, transaction in
                        state = val.translation
                    }
                )
                //.onTapGesture { print("Tap") }
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
//            .simultaneousGesture(
//                TapGesture()
//                    .onEnded { _ in
//                        print("VStack tapped")
//                    }
//            )
            .contentShape(Rectangle())
            .onTapGesture {
                print("VStach tapped")
            }
    }
}

#Preview {
    OtherGestureView()
}
