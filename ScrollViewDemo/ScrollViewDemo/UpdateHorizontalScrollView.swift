//
//  UpdateHorizontalScrollView.swift
//  ScrollViewDemo
//
//  Created by Hirendra Sharma on 28/06/24.
//

import SwiftUI

struct UpdateHorizontalScrollView: View {
    
    @State var items = ViewModel.getDetails()
    
    var body: some View {
        //let _ = Self._printChanges()
        
        Button("Test Logs") {
            items[0].name = "fjsdjfh"
        }
        
        GeometryReader { proxy in
            let size = proxy.size
            ScrollView(.horizontal) {
                HStack {
                    ForEach(items, id: \.id) { item in
                        VStack {
                            Text(item.name)
                                .font(.title)
                                .background(.red)
                                .frame(width: 240, height: 100)
                            Text(String(item.phoneNumber))
                                .background(.gray)
                        }.frame(maxWidth: .infinity)
                            .background(.blue)
                            .cornerRadius(15)
                            .clipShape(Rectangle())
                    }
                }.scrollTargetLayout()
                    .padding(.horizontal, (size.width - 240) / 2)
            }.scrollTargetBehavior(.viewAligned)
            //.contentMargins(.trailing, 20, for: .scrollContent)
            //.defaultScrollAnchor(.bottom)
                .scrollClipDisabled()
                .safeAreaPadding(.all)
                //.printOutput("Value changed")
        }
    }
}

struct UpdateHorizontalScrollView2: View {
    
    @State var items = ViewModel.getDetails()
    
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView(.horizontal) {
                HStack {
                    ForEach(0..<items.count, id: \.self) { i in
                        VStack {
                            let item = items[i]
                            Button("Scroll to row \(50-i)") {
                                proxy.scrollTo(50-i-1)
                            }.buttonStyle(.borderedProminent)
                            Text(item.name)
                                .font(.title)
                                .background(.red)
                                .frame(width: 240, height: 100)
                            Text(String(item.phoneNumber))
                                .background(.gray)
                        }.frame(maxWidth: .infinity)
                            .background(.blue)
                            .cornerRadius(15)
                            .clipShape(Rectangle())
                            .id(i)
                    }
                }
            }.safeAreaPadding(.all)
        }
    }
}

struct DebuggingTest: View {
    
    @State var items = ViewModel.getDetails()
    
    var body: some View {
        VStack {
            Text("Hello")
            Button("Test") {
                items[0].name = "fjsdjfh"
            }
        }.debugType()
    }
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

#Preview {
    UpdateHorizontalScrollView()
}

