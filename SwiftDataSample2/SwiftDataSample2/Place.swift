//
//  Place.swift
//  SwiftDataSample2
//
//  Created by Hirendra Sharma on 06/07/24.
//

import SwiftData
import SwiftUI
import MapKit

//https://www.hackingwithswift.com/quick-start/swiftdata/how-to-create-many-to-many-relationships
@Model
final class Place {
    //#Unique<Place>([\.name, \.longitude, \.latitude])
    
//    @Attribute(.unique) var name: String
    var name: String
    var latitude: Double
    var longitude: Double
    var interested: Bool
    
    //@Relationship(deleteRule: .nullify, inverse: \PlaceDetails.placeAddress) var placeDetail: PlaceDetails?
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var image: Image {
        //Image(name.lowercased().replacingOccurrences(of: " ", with: ""))
        Image("bellagio")
    }
    
    init(name: String, latitude: Double, longitude: Double, interested: Bool) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
        self.interested = interested
    }
    
    @MainActor
    static var preview: ModelContainer {
        let container = try! ModelContainer(for: Place.self, configurations: ModelConfiguration(isStoredInMemoryOnly: false))
        for place in previewPlaces {
            container.mainContext.insert(place)
        }
        return container
    }
    
    static var previewPlaces: [Place] {
        [
            Place(name: "Bellagio", latitude: 36.1129, longitude: -115.1765, interested: true),
            Place(name: "Paris", latitude: 36.1125, longitude: -115.1707, interested: true),
            Place(name: "Treasure Island", latitude: 36.1247, longitude: -115.1721, interested: false),
            Place(name: "Stratosphere", latitude: 36.1475, longitude: -115.1566, interested: false),
            Place(name: "Luxor", latitude: 36.0955, longitude: -115.1761, interested: true),
            Place(name: "Excalibur", latitude: 36.0988, longitude: -115.1754, interested: false),
        ]
    }
}

@Model
class PlaceDetails {
    var placeAddress: String
    var placeLocation: Double
    
    init(placeAddress: String, placeLocation: Double) {
        self.placeAddress = placeAddress
        self.placeLocation = placeLocation
    }
}
