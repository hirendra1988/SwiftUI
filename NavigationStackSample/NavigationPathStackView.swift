//
//  NavigationPathStackView.swift
//  NavigationStackSample
//
//  Created by Hirendra Sharma on 04/07/24.
//

import SwiftUI

struct NavigationPathStackView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack {
            Button("Click Home") {
                router.goToNextController(classType: .home)
            }
            
            Button("Click Home Details") {
                router.goToNextController(classType: .details)
            }
            .navigationDestination(for: Router.ClassType.self) { type in
                switch type {
                case .home:
                    HomeContentView()
                case .details:
                    DetailsContentView()
                }
            }
        }
    }
}

#Preview {
    NavigationPathStackView()
}

struct DetailsContentView: View {
    @EnvironmentObject var router: Router
    var body: some View {
        VStack {
            Text("DetailsContentView")
        }
    }
}

struct HomeContentView: View {
    @EnvironmentObject var router: Router
    @Environment(\.scenePhase) var scenePhase

    var body: some View {
        VStack {
            Text("HomeContentView")
            Button("Go Back") {
                router.goBack()
            }
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
