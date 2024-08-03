//
//  EnvironmentContentView.swift
//  NavigationStackSample
//
//  Created by Hirendra Sharma on 04/07/24.
//

import SwiftUI

struct EnvironmentContentView: View {
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        VStack {
            Text("This is luight view")
                .onChange(of: scenePhase) { newValue in
                    if newValue == .active {
                        print("active1")
                    } else if newValue == .background {
                        print("background1")
                    } else if newValue == .inactive {
                        print("inactive1")
                    }
                }
        }
    }
}

#Preview {
    EnvironmentContentView()
}
