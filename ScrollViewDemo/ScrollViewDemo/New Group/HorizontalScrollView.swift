//
//  HorizontalScrollView.swift
//  ScrollViewDemo
//
//  Created by Hirendra Sharma on 28/06/24.
//

import SwiftUI

struct HorizontalScrollView: View {
    @State var items = ViewModel.getDetails()
    @State private var scrollID: Int? = 0

    var body: some View {
        let _ = Self._printChanges()
        
        Button("Scroll to 50") {
            self.scrollID = 50
        }
        
        GeometryReader { proxy in
            let size = proxy.size
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(items, id: \.id) { item in
                        VStack(spacing: 5) {
                            Text(item.name)
                                .font(.title)
                                .foregroundStyle(.white)
                                .frame(width: 240, height: 100)
                                .background(.red)
                            Text(String(item.phoneNumber))
                                .background(.black)
                                .foregroundColor(.white)
                        }.frame(maxWidth: .infinity)
                            .frame(height: 120)
                            .background(.blue)
                            .clipShape(.rect(cornerRadius: 15))
                    }
                }.padding(.horizontal, (size.width - 240) / 2)
                    .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
            .safeAreaPadding(.all)
            .scrollPosition(id: $scrollID)
            .scrollTargetBehavior(.paging)
        }
    }
}

struct ManuallyScrollHorizontalScrollView: View {
    @State var items = ViewModel.getDetails()
    
    var body: some View {
        ScrollViewReader { proxy in
            Button("Scroll to 40") {
                proxy.scrollTo(40)
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 5) {
                    ForEach(0..<self.items.count, id: \.self) { i in
                        VStack(spacing: 5) {
                            Button("Scroll to row \(items.count - i)") {
                                proxy.scrollTo(items.count-i-1)
                            }.foregroundColor(.white)
                                .buttonStyle(.borderedProminent)
                            let item = items[i]
                            Text(item.name)
                                .font(.title)
                                .foregroundStyle(.white)
                                .frame(width: 240, height: 100)
                                .background(.red)
                            Text(String(item.phoneNumber))
                                .background(.black)
                                .foregroundColor(.white)
                        }.frame(maxWidth: .infinity)
                            .frame(height: 200)
                            .background(.gray)
                            .clipShape(.rect(cornerRadius: 15))
                        .id(i)
                    }
                }
            }
        }
    }
}

#Preview {
    HorizontalScrollView(items: ViewModel.getDetails())
}

//Manual Scroll
struct ManualScroll: View {
    var body: some View {
        ScrollViewReader { proxy in
            ScrollView {
                VStack(spacing: 10) {
                    ForEach(0..<100) { i in
                        VStack {
                            Button("Scroll to row \(99 - i)") {
                                proxy.scrollTo(99-i)
                            }
                            Text("Row No : \(i)")
                                .frame(height: 32)
                                .id(i)  //Set the Id
                        }
                    }.background(.gray)
                }
            }
        }
    }
}
