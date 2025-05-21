//
//  CombineViewModel+FlatMap.swift
//  CombinesSample
//
//  Created by Hirendra Sharma on 10/07/24.
//

import Combine
import Foundation

extension CombineViewModel {
    
    struct User: Decodable {
        let id: Int?
        let name: String?
    }

    struct Post: Decodable {
        let userId: Int?
        let id: Int?
        let title: String?
        let body: String?
    }

    // Function to fetch user details
    func fetchUser(userId: Int) -> AnyPublisher<User, Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/users/\(1)")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: User.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }

    // Function to fetch posts for a user
    func fetchPosts(for userId: Int) -> AnyPublisher<[Post], Error> {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts?userId=\(1)")!
        return URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: [Post].self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    func testFlatMap2() {
        let userIds = [1, 2, 3].publisher
        let cancellable = userIds
            .flatMap { userId in
                self.fetchUser(userId: userId)
            }
            .flatMap { user in
                self.fetchPosts(for: user.id ?? 1)
            }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("All tasks completed")
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { posts in
                print("Received \(posts.count) posts")
            })
    }

}
