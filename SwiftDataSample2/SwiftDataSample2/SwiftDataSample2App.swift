//
//  SwiftDataSample2App.swift
//  SwiftDataSample2
//
//  Created by Hirendra Sharma on 06/07/24.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataSample2App: App {
    var body: some Scene {
        WindowGroup {
            PlaceList()
        }.modelContainer(for: Place.self)
    }
}
