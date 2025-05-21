//
//  ContentView.swift
//  LaztGridDemo
//
//  Created by Hirendra Sharma on 02/08/24.
//

import SwiftUI

struct HGridContentView: View {
    let fixedColumns = [GridItem(.fixed(50), spacing: 5),
                        GridItem(.fixed(50), spacing: 5)]

    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: fixedColumns, alignment: .center, spacing: 10) {
                ForEach(0..<100) { index in
                    Image(systemName: "\(index+1).circle.fill")
                        .font(.largeTitle)
                }
            }.frame(height: 150)
        }.background(.white)
            .padding()
    }
}

#Preview {
    HGridContentView()
}
