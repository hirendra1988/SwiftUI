//
//  ContentView.swift
//  LaztGridDemo
//
//  Created by Hirendra Sharma on 02/08/24.
//

import SwiftUI

struct VGridContentView: View {
    let fixedColumns = [GridItem(.fixed(60), spacing: 15),
                        GridItem(.fixed(100), spacing: 15),
                        GridItem(.fixed(140), spacing: 15)]

    let adaptiveColumns = [GridItem(.adaptive(minimum: 80, maximum: 120),
                                    spacing: 15),
                           GridItem(.adaptive(minimum: 60, maximum: 100),
                                    spacing: 15),
                           GridItem(.adaptive(minimum: 30, maximum: 80),
                                    spacing: 15)]
    
    let flexibleColumns =  [GridItem(.flexible(minimum: 80, maximum: 100),
                                     spacing: 15),
                            GridItem(.flexible(minimum: 60, maximum: 150),
                                     spacing: 15),
                            GridItem(.flexible(minimum: 30, maximum: 80),
                                     spacing: 15)]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: fixedColumns, spacing: 10) {
                ForEach(0..<10) { index in
                    Color.red
                }
            }
            Spacer().frame(height: 50)
            LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                ForEach(0..<19) { index in
                    Color.red
                }
            }
            Spacer().frame(height: 50)
            LazyVGrid(columns: flexibleColumns, spacing: 10) {
                ForEach(0..<19) { index in
                    Color.red
                }
            }
        }.background(.white)
            .padding()
    }
}

#Preview {
    VGridContentView()
}
