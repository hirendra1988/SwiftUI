//
//  ToastView.swift
//  SwiftUIDemoProject
//
//  Created by Hirendra Sharma on 26/08/23.
//

import SwiftUI

struct ToastView: View {
    let toastModel: ToastModel
    
    init(toastModel: ToastModel) {
        self.toastModel = toastModel
    }
    
    var body: some View {
        HStack {
            Image(toastModel.imageName)
                .resizable()
                .frame(width: 70, height: 70)
                .clipShape(Circle())
                .shadow(color: .yellow, radius: 5)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(toastModel.title)
                    .fontWeight(.bold)
                    .font(.system(size: 15))
                    .lineLimit(1)
                Text(toastModel.subTitle)
                    .font(.system(size: 12))
                    .lineLimit(1)
            }.padding(.horizontal)
            
            Spacer(minLength: 1)
            
            HStack(spacing: 2) {
                ForEach(0..<toastModel.starRatingVal, id: \.self) { val in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
                
                ForEach(0..<5 - toastModel.starRatingVal, id: \.self) { val in
                    Image(systemName: "star")
                        .foregroundColor(.yellow)
                }
            }
        }
    }
}

struct ToastView_Previews: PreviewProvider {
    static var previews: some View {
        ToastView(toastModel: ToastModel(imageName: "Toast1", title: "Toast Title", subTitle: "Toast Desc", starRatingVal: 3))
    }
}
