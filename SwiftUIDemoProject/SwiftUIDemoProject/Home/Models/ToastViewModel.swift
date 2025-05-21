//
//  ToastViewModel.swift
//  SwiftUIDemoProject
//
//  Created by Hirendra Sharma on 26/08/23.
//

import SwiftUI

class ToastViewModel: ObservableObject {
    @Published var toastList: [ToastModel]
    
    init() {
        self.toastList = [ToastModel]()
        for i in 0..<15 {
            let randomInt = Int.random(in: 1...5)
            toastList.append(ToastModel(imageName: "Toast2", title: "Blue Barrel \(i+1)", subTitle: "Nutella, Sea Sal \(i+1)", starRatingVal: randomInt))
        }
    }
}
