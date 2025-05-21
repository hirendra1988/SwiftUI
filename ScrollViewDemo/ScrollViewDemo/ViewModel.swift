//
//  ViewModel.swift
//  ScrollViewDemo
//
//  Created by Hirendra Sharma on 27/06/24.
//

import Foundation
import Observation

struct ViewModel: Identifiable {
    var id = UUID()
    var name: String
    var phoneNumber: Int
}

extension ViewModel {
    static func getDetails() ->[ViewModel] {
        var res = [ViewModel]()
        for i in 1...50 {
            let detail = ViewModel(name: "Hirendra\(i)", phoneNumber: 1234567890)
            res.append(detail)
        }
        return res
    }
}

@Observable
class NewViewModel {
    var name: String = ""
}
