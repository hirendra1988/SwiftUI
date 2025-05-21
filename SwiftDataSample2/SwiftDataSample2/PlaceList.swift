
//
//  ContentView.swift
//  SwiftDataSample2
//
//  Created by Hirendra Sharma on 06/07/24.
//

import SwiftUI
import SwiftData

struct PlaceList: View {
    
    @Query private var places: [Place]
    //@Query(sort: \Place.name) private var places: [Place]
    @State private var searchText: String = ""
    @State private var filteredByInterest: Bool = false
    //@Namespace var nameSpace
    //@Environment(\.modelContext) var context
    @Environment(\.modelContext) private var modelContext
    
    private var predicate: Predicate<Place> {
        #Predicate<Place> {
            if !searchText.isEmpty && $0.interested {
                $0.name.localizedStandardContains(searchText) && $0.interested
            } else if !searchText.isEmpty {
                $0.name.localizedStandardContains(searchText)
            } else if filteredByInterest {
                $0.interested
            } else {
                true
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List((try? places.filter(predicate)) ?? places) { place in
                NavigationLink(value: place) {
                    HStack {
                        place.image
                            .resizable()
                            .scaledToFit()
                            .clipShape(.rect(cornerRadius: 7))
                            .frame(width: 100, height: 100)
                        
                        Text(place.name)
                            .font(.headline)
                            .padding(5)
                        
                        Spacer()
                        
                        ForEach(0..<5) { _ in
                            StarRating(place: place)
                        }
                    }
                }
                //.matchedTransitionSource(id: 1, in: nameSpace)
                .swipeActions(edge: .leading) {
                    Button("Delete") {
                        modelContext.delete(place)
                    }
                    .tint(.red)
                }
            }.listStyle(.inset)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        let imageName = filteredByInterest ? "star.fill" : "star"
                        Button("Rating", systemImage: imageName) {
                            withAnimation {
                                filteredByInterest.toggle()
                            }
                        }.tint(.yellow)
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        NavigationLink("Add") {
                            AddPlaceView(place: Place(name: "", latitude: 0, longitude: 0, interested: false))
                        }
//                        Button("Add") {
//                            let place = Place(name: "placeName", latitude: 36.1129, longitude: -115.1765, interested: true)
//                            modelContext.insert(place)
//                        }
                    }
                }
                .navigationTitle("Places")
                .navigationBarTitleDisplayMode(.large)
                .navigationDestination(for: Place.self, destination: { place in
                    AddPlaceView(place: place)
                        //.navigationTransition(.zoom(sourceID: 1, in: nameSpace))
                })
        }
        .onAppear() {
            print(places)
        }
        .searchable(text: $searchText, prompt: "Search a place")
        .animation(.default, value: searchText)
    }
}

struct StarRating: View {
    @Bindable var place: Place
    var body: some View {
        HStack {
            if place.interested {
                Image(systemName: "star.fill")
                    .foregroundStyle(.yellow)
                    //.padding(.trailing)
                    .frame(width: 16)
            } else {
                Image(systemName: "star")
                    .foregroundStyle(.yellow)
                    //.padding(.trailing)
                    .frame(width: 15)
            }
        }
    }
}

#Preview {
    PlaceList()
        .modelContainer(Place.preview)
}
