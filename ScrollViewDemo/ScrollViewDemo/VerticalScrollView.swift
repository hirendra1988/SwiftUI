//
//  VerticalScrollView.swift
//  ScrollViewDemo
//
//  Created by Hirendra Sharma on 28/06/24.
//

import SwiftUI

struct VerticalScrollView: View {
    
    @State var items = ViewModel.getDetails()
    
    var body: some View {
        
        Text("Fixed at the top")
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(.green)
                .foregroundStyle(.white)
        
        ScrollView(showsIndicators: true) {
            LazyVStack {
                ForEach(items, id: \.id) { item in
                    HStack {
                        Text(item.name)
                            .font(.title)
                            .background(.red)
                            .frame(width: 200, height: 100)
                        Text(String(item.phoneNumber))
                            .background(.gray)
                    }.frame(maxWidth: .infinity)
                        .background(.blue)
                        .cornerRadius(15)
                        .clipShape(Rectangle())
//                        .scrollTransition { content, phase in
//                            content
//                                .opacity(phase.isIdentity ? 1 : 0)
//                                .scaleEffect(phase.isIdentity ? 1 : 0.3)
//                                .blur(radius: phase.isIdentity ? 0 : 10)
//                                //.hueRotation(.degrees(45 * phase.value))
//                        }
                }
            }.scrollTargetLayout()
        }.scrollTargetBehavior(.viewAligned)
            //.contentMargins(.trailing, 20, for: .scrollContent)
            //.defaultScrollAnchor(.bottom)
            .scrollClipDisabled()
            .safeAreaPadding(.all)
        
        Text("Fixed at the bottom")
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(.green)
                .foregroundStyle(.white)
    }
}

#Preview {
    VerticalScrollView()
}
