//
//  APIEndpoint.swift
//  FlipCart
//
//  Created by Sharma, Hirendra on 12/11/24.
//

import Foundation

enum APIEndpoint {
    case signIn(credentials: AuthCredentials)
    
    private var baseURL: String {
        return "https://api.example.com"
    }
    
    var url: URL {
        switch self {
        case .signIn:
            return URL(string: "\(baseURL)/auth/signin")!
        }
    }
    
    var httpMethod: String {
        switch self {
        case .signIn:
            return "POST"
        }
    }
    
    var headers: [String: String] {
        return [
            "Content-Type": "application/json",
            "Accept": "application/json"
        ]
    }
    
    var body: Data? {
        switch self {
        case .signIn(let credentials):
            let body = [
                "email": credentials.email,
                "password": credentials.password
            ]
            return try? JSONSerialization.data(withJSONObject: body)
        }
    }
}

