//
//  Weekday.swift
//  AlignmentDemo
//
//  Created by Hirendra Sharma on 02/08/24.
//

import Foundation

enum Weekday: String, CaseIterable, Identifiable {
    case monday
    case tuesday
    case wednesday
    case thursday
    case friday
    case saturday
    case sunday
    
    var id: String {
        return self.rawValue
    }
    
    func name() -> String {
        switch self {
            case .monday:
                return "Monday"
            case .tuesday:
                return "Thuesday"
            case .wednesday:
                return "Wednesday"
            case .thursday:
                return "Thursday"
            case .friday:
                return "Friday"
            case .saturday:
                return "Saturday"
            case .sunday:
                return "Sunday"
        }
    }
    
    func numberValue() -> Int {
        switch self {
            case .monday:
                return 1
            case .tuesday:
                return 2
            case .wednesday:
                return 3
            case .thursday:
                return 4
            case .friday:
                return 5
            case .saturday:
                return 6
            case .sunday:
                return 7
        }
    }
}
