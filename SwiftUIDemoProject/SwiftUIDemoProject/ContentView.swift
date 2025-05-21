//
//  ContentView.swift
//  SwiftUIDemoProject
//
//  Created by Hirendra Sharma on 26/08/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selection: Int = 0
    @State private var shouldShowDetails: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack(alignment: .top) {
                    Picker(selection: $selection) {
                        Text("Toast List").tag(0)
                        Text("Toast Detail").tag(1)
                    } label: {
                        Text("Picker")
                    }.pickerStyle(SegmentedPickerStyle())
                }.background(.orange)
                
                if selection == 0 {
                    ToastList()
                } else {
                    Spacer()
                    ToastViewDetail(toastModel: ToastModel(imageName: "Toast2", title: "Toast Title", subTitle: "Toast Desc", starRatingVal: 3))
                        .padding(.top)
                        .background(.red)
                        .frame(width: 300, height: 300, alignment: .top)
                }
            }
            .navigationTitle("Top Toast")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                Image(systemName: "plus")
                    .foregroundColor(.yellow)
                    .fontWeight(.bold)
                    .onTapGesture {
                        print("On tap gesture")
                        self.shouldShowDetails = true
                    }
            }
            .onAppear() {
                self.shouldShowDetails = false
            }
            
            NavigationLink("", destination: ToastViewDetail(toastModel: ToastModel(imageName: "Toast2", title: "Toast Title", subTitle: "Toast Desc", starRatingVal: 3)), isActive: self.$shouldShowDetails)
        }
    }
}

//struct ContentView: View {
//    var body: some View {
//        TabView {
//            ToastList()
//                .tag(1)
//                .tabItem {
//                    Text("Home")
//                    Image(systemName: "homekit")
//                }
//
//            ToastViewDetail(toastModel: ToastModel(imageName: "Toast2", title: "Toast Title", subTitle: "Toast Desc", starRatingVal: 3))
//                .tag(2)
//                .tabItem {
//                    Text("Detail")
//                    Image(systemName: "folder")
//                }
//
//        }.tabViewStyle(PageTabViewStyle())
//    }
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
