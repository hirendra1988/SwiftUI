//
//  AddPlaceView.swift
//  SwiftDataSample2
//
//  Created by Hirendra Sharma on 06/07/24.
//

import SwiftData
import SwiftUI

struct AddPlaceView: View {
    
    @State private var placeName: String = ""
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    @Bindable var place: Place
    
    var body: some View {
        VStack {
            HStack {
                Text("Place name")
                    .padding()
                Spacer()
            }
            TextField("Enter place name", text: $placeName)
                .padding([.leading, .trailing])
                .textFieldStyle(.roundedBorder)
            
            Spacer().frame(height: 100)
            
            if place.name == "" {
                Button("Save") {
                    let place = Place(name: placeName, latitude: 36.1129, longitude: -115.1765, interested: true)
                    modelContext.insert(place)
                }.buttonStyle(.borderedProminent)
            } else {
                Button("Update") {
                    place.name = placeName
                }.buttonStyle(.borderedProminent)
            }
            
            Button("Back button") {
                dismiss()
            }
               
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .navigationTitle(place.name == "" ? "Adding Place" : "Updating Place")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear() {
                placeName = place.name
            }
    }
}

//#Preview {
//    AddPlaceView()
//}
