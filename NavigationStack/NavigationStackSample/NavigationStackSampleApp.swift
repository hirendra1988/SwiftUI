//
//  NavigationStackSampleApp.swift
//  NavigationStackSample
//
//  Created by Hirendra Sharma on 04/07/24.
//

import SwiftUI

@main
struct NavigationStackSampleApp: App {
    
    @ObservedObject var router = Router()
    @Environment(\.scenePhase) var scenePhase
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.navPath) {
                NavigationPathStackView()
            }.environmentObject(router)
        }.onChange(of: scenePhase) { newValue, oldValue in
            print(oldValue)
            print(newValue)
            if newValue == .active {
                //print("active")
            } else if newValue == .background {
                //print("background")
            } else if newValue == .inactive {
                //print("inactive")
            }
        }
    }
}
