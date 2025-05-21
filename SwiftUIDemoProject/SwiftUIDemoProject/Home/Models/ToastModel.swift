//
//  ToastModel.swift
//  SwiftUIDemoProject
//
//  Created by Hirendra Sharma on 26/08/23.
//

import Foundation

struct ToastModel: Identifiable {
    let imageName: String
    let title: String
    let subTitle: String
    let starRatingVal: Int
    var id = UUID()
}
