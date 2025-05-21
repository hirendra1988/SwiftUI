//
//  CombineViewModel.swift
//  CombinesSample
//
//  Created by Hirendra Sharma on 26/06/24.
//

import SwiftUI
import Combine
import Foundation
import UIKit

class CombineViewModel: ObservableObject {
    
    let subjectPublisher = CurrentValueSubject<String, Never>("")
    var subscription: AnyCancellable?
    var cancellables: Set<AnyCancellable> = []
    @Published var text: Int = 0
    var attempts = 0
    
    init() {
//       testDebounce()
        //testThrottle()
        
        //SubjectPublisher()
        
    }
    
    func testSimpleSink() {
        let publisher = CurrentValueSubject<String, Never>("Test")
        //print(publisher.value)
        subscription = publisher.sink { value in
            print(value)
        }
        
        publisher.send("hi") // hi
        publisher.send("hello world") // hello world
        
        subscription?.cancel()
        //subscription = nil
        
        publisher.send("Change Value!") // Doesn't work
        //print(publisher.value)
    }

    func testReduce() {
        let numbers = [1, 2, 3, 4, 5]
        let publisher = numbers.publisher
        
//        publisher
//            .reduce(0, +)
//            .sink { val in
//                print(val)
//            }
//            .store(in: &cancellables)
        
        publisher
            .reduce(0, +)
            .sink(receiveValue: { sum in
                print("The sum is: \(sum)")
            })
            .store(in: &cancellables)
    }
    
    func testScan() {
        let numbers = [1, 2, 3, 4, 5]
        let publisher = numbers.publisher
        publisher
            .scan(0, +)
            .sink(receiveValue: { total in
                print("The running total is: \(total)")
            })
            .store(in: &cancellables)
    }
    
    func testMap() {
        let numbers = [1, 2, 3, 4, 5]
        let publisher = numbers.publisher

        publisher
            .map { $0 * $0 }
            .sink(receiveValue: { value in
                print("The squared value is: \(value)")
            })
            .store(in: &cancellables)
    }
    
    //https://chatgpt.com/c/2f0135ca-a65b-47d6-b4a6-5812457d09b6
    // A simple function that simulates fetching data from a URL
    func fetchData(from url: URL) -> AnyPublisher<Data, URLError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .eraseToAnyPublisher()
    }
    
    func testFlatMap() {
        let urls = [
            URL(string: "https://www.google.com")!,
            URL(string: "https://www.apple.com")!,
            URL(string: "https://www.google.com")!
        ]

        let urlPublisher = urls.publisher
        subscription = urlPublisher
            .flatMap { url in
                self.fetchData(from: url)
            }
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("All tasks completed")
                case .failure(let error):
                    print("Error: \(error)")
                }
            }, receiveValue: { data in
                print("Received data of length: \(data.count)")
            })
        // Output will print the length of data received from each URL.

    }
    
    func testCompactMap() {
        let numbers = [1, 2, 3, 4, 5, "Hirendra", nil] as [Any?]
        let publisher = numbers.publisher

        publisher
            .compactMap { val in
                return val
            }
            .sink(receiveValue: { value in
                print("The squared value is: \(value)")
            })
            .store(in: &cancellables)
    }
    
    func testFilter() {
        let numbers = [1, 2, 3, 4, 5]
        let publisher = numbers.publisher

        publisher
            .filter { $0 % 2 == 0 }
            .sink(receiveValue: { value in
                print("Even number: \(value)")
            })
            .store(in: &cancellables)
    }
    
    func testMerge() {
        let publisher1 = PassthroughSubject<Int, Never>()
        let publisher2 = PassthroughSubject<Int, Never>()

        let merged = Publishers.Merge(publisher1, publisher2)

        let cancellable = merged.sink { value in
            print(value)
        }

        publisher1.send(1)
        print("dsad")
        publisher2.send(2)
        publisher2.send(3)
        
//        let publisher1 = NotificationCenter.default.publisher(for: .event1)
//        let publisher2 = NotificationCenter.default.publisher(for: .event2)
        
//        let numbers = [1, 2, 3, 4, 5]
//        let publisher1 = numbers.publisher
//        let publisher2 = numbers.publisher

//        Publishers.Merge(publisher1, publisher2)
//            .sink(receiveValue: { event in
//                switch event {
//                case .event1(let value):
//                    print("Event 1: \(value)")
//                case .event2(let value):
//                    print("Event 2: \(value)")
//                }
//            })
//            .store(in: &cancellables)
    }
    
    func testMerge2() {
        let pubA = PassthroughSubject<Int, Never>()
        let pubB = PassthroughSubject<Int, Never>()
        let pubC = PassthroughSubject<Int, Never>()

        let cancellable = pubA
            .merge(with: pubB, pubC)
            .sink {
                print("\($0)", terminator: " " )
            }

        pubA.send(1)
        pubB.send(40)
        pubC.send(90)
        pubA.send(2)
        print("bsanmsbdanbd")
        pubB.send(50)
        pubC.send(100)

    }
    
    func combineLatest() {
        let publisher1 = PassthroughSubject<Int, Never>()
        let publisher2 = PassthroughSubject<String, Never>()
        let publisher3 = PassthroughSubject<String, Never>()

        //let combined = Publishers.CombineLatest(publisher1, publisher2)
        let combined = Publishers.CombineLatest3(publisher1, publisher2, publisher3)

        let cancellable = combined.sink { value in
            print(value)
        }

        publisher1.send(1)
        publisher1.send(2)
        publisher3.send("X")
        publisher2.send("A")
        publisher2.send("B")
        publisher3.send("Y")
        publisher1.send(3)
        publisher2.send("C")
        publisher3.send("Z")
    }
    
    func testZip() {
        let publisher1 = PassthroughSubject<Int, Never>()
        let publisher2 = PassthroughSubject<String, Never>()

        let zipped = Publishers.Zip(publisher1, publisher2)

        let cancellable = zipped.sink { value in
            print(value)
        }

        publisher1.send(1)
        publisher2.send("A")
        publisher1.send(2)
        publisher2.send("B")
        publisher1.send(4)
    }
    
    func testBuffer() {
        // A publisher emitting a sequence of integers
        let publisher = (1...10).publisher

        let bufferExample = publisher // Collects elements into buffers of size 4
            .buffer(size: 4, prefetch: .byRequest, whenFull: .dropOldest)
            .sink { value in
                print("Buffered Values:", value) // Prints arrays containing collected elements
            }

        //Output:
        //Buffered Values: 7
        //Buffered Values: 8
        //Buffered Values: 9
        //Buffered Values: 10
    }
    
    func testDebounce() {
        $text
            //.removeDuplicates()
            .debounce(for: .seconds(2.0),
                      scheduler: DispatchQueue.main)
            .sink(receiveValue: { [weak self] value in
                print(value)
            })
            .store(in: &cancellables)
    }
    
    func testThrottle() {
        $text
            //.removeDuplicates()
            .throttle(for: .seconds(2.0),
                      scheduler: DispatchQueue.main, latest: true)
            .sink(receiveValue: { [weak self] value in
                print(value)
            })
            .store(in: &cancellables)
    }

    func testCollect() {
        // A publisher emitting a sequence of characters
        let publisher = ["A", "B", "C", "D", "E", "F", "G"].publisher

        let collectExample = publisher
            .collect(3) // Gathers elements into arrays of size 3
            .sink { value in
                print("Collected Values:", value) // Prints arrays containing collected elements
            }

        // Output:
        // Collected Values: ["A", "B", "C"]
        // Collected Values: ["D", "E", "F"]
        // Collected Values: ["G"]
    }
    
    func retryErrorHandling() {
        let retryExample = Future<Int, Error> { promise in
            self.attempts += 1
            if self.attempts < 3 {
                promise(.failure(NSError(domain: "", code: 0, userInfo: nil))) // Simulating an error
            } else {
                promise(.success(42)) // Emits a success value after retries
            }
        }
        .retry(3) // Retry up to 3 times
        .sink(receiveCompletion: { completion in
            switch completion {
            case .finished:
                print("Sequence completed successfully.")
            case .failure(let error):
                print("Sequence terminated with error after retries:", error)
            }
        }, receiveValue: { value in
            print("Received value:", value)
        })
    }
    
    
}
