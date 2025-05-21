//
//  ToastViewDetail.swift
//  SwiftUIDemoProject
//
//  Created by Hirendra Sharma on 26/08/23.
//

import SwiftUI

struct ToastViewDetail: View {
    let toastModel: ToastModel
    
    init(toastModel: ToastModel) {
        self.toastModel = toastModel
    }
    
    var body: some View {
        VStack {
            Image(toastModel.imageName)
                .resizable()
                .scaleEffect(2, anchor: .leading)
                .scaledToFill()
                .frame(height: 100)
                .clipped()
            
                .overlay {
                    VStack(alignment: .leading) {
                        Text(toastModel.title)
                            .fontWeight(.bold)
                        Text(toastModel.subTitle)
                            .fontWeight(.medium)
                    }.foregroundColor(.white)
                        .padding(.leading).padding(5)
                        .background(Color.black.opacity(0.2).blur(radius: 2))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .background(.green)
        }
    }
}

struct ToastViewDetail_Previews: PreviewProvider {
    static var previews: some View {
        ToastViewDetail(toastModel: ToastModel(imageName: "Toast2", title: "Toast Title", subTitle: "Toast Desc", starRatingVal: 3))
    }
}



