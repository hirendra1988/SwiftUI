//
//  Router.swift
//  NavigationStackSample
//
//  Created by Hirendra Sharma on 04/07/24.
//

import Foundation
import SwiftUI

class Router: ObservableObject {
    
    public enum ClassType {
        case home
        case details
    }
    
    @Published var navPath = NavigationPath()
    
    func goToNextController(classType: ClassType) {
        navPath.append(classType)
    }
    
    func goBack() {
        self.navPath.removeLast()
    }
    
    func gotoRootController() {
        self.navPath.removeLast(navPath.count)
    }
    
}
