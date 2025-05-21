//
//  CatView.swift
//  AlignmentDemo
//
//  Created by Hirendra Sharma on 02/08/24.
//

import SwiftUI

struct CatView: View {
    var body: some View {
        Image("cats")
            .resizable()
            .scaledToFit()
    }
}

struct CatClosup: View {
    var body: some View {
        Image("matilda")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .mask(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 5))
            .shadow(radius: 20)
    }
}
