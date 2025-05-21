//
//  ContentView.swift
//  ScrollViewDemo
//
//  Created by Hirendra Sharma on 27/06/24.
//

import SwiftUI

struct VerticalScrollContentView: View {
    @State var items = ViewModel.getDetails()
    
    var body: some View {
        
        Text("Fixed at the top")
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(.green)
                .foregroundStyle(.white)
        
        ScrollView {
            VStack(spacing: 5) {
                ForEach(items, id: \.id) { item in
                    HStack(spacing: 25) {
                        Text(item.name)
                            .font(.title)
                            .foregroundStyle(.white)
                            .frame(width: 180, height: 100)
                            .background(.red)
                        //Text("\(item.phoneNumber)")
                        Text(String(item.phoneNumber))
                            .background(.black)
                            .foregroundColor(.white)
                    }.frame(maxWidth: .infinity)
                        .frame(height: 120)
                        .background(.blue)
                        .clipShape(.rect(cornerRadius: 15))
                        .scrollTransition(.animated.threshold(.visible(0.5))) { content, phase in
                            content
                                .opacity(phase.isIdentity ? 1 : 0)
                                .scaleEffect(phase.isIdentity ? 1 : 0.7)
                                .blur(radius: phase.isIdentity ? 0 : 10)
                                //.hueRotation(.degrees(45 * phase.value))
                        }
                }
            }.scrollTargetLayout()
        }//.padding()
            //.scrollTargetBehavior(.paging)
            .safeAreaPadding(.all)
            //.scrollClipDisabled()
            //.defaultScrollAnchor(.center)
            //.contentMargins(.trailing, 20, for: .scrollContent)
            //.scrollIndicatorsFlash(onAppear: false)
        
        Text("Fixed at the bottom")
                .frame(maxWidth: .infinity)
                .frame(height: 100)
                .background(.green)
                .foregroundStyle(.white)
       
    }
}

#Preview {
    VerticalScrollContentView(items: ViewModel.getDetails())
}
