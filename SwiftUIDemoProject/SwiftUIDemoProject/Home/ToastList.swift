//
//  ToastList.swift
//  SwiftUIDemoProject
//
//  Created by Hirendra Sharma on 26/08/23.
//

import SwiftUI

struct ToastList: View {
    
    @ObservedObject var toast: ToastViewModel = ToastViewModel()
    
    var body: some View {
        List {
            ForEach(toast.toastList, id: \.id) { toast in
                NavigationLink(destination: ToastViewDetail(toastModel: toast)) {
                    ToastView(toastModel: toast)
                }
            }
        }.listStyle(.inset)
            .onAppear() {
                print("On Appear....")
            }
            .task {
                print("Task...")
            }
        
    }
}

struct ToastList_Previews: PreviewProvider {
    static var previews: some View {
        ToastList()
    }
}


