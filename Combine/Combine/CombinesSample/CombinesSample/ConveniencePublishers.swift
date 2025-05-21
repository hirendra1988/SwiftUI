//
//  ConveniencePublishers.swift
//  CombinesSample
//
//  Created by Hirendra Sharma on 14/08/24.
//

import Combine
import Foundation

enum MyError: Error {
    case somethingWentWrong
}

enum CustomError: Error {
    case networkError
    case dataParsingError
}

class ConveniencePublishers {
    
    var subscription: AnyCancellable?
    
    init() {
        //MyPublisherClass()
        Test34()
    }
    
    func justPublisher() {
        let justPublisher = Just("Hello, Combine!")
        justPublisher.sink(
            receiveCompletion: { print("Completed: \($0)") },
            receiveValue: { print("Received: \($0)") }
        )
        // Output: "Hello, Combine!"
    }
    
    func emptyPublisher() {
        let emptyPublisher = Empty<Int, Never>()
        //let emptyPublisher = Empty<Int, Never>(completeImmediately: false)
        //let emptyPublisher = Empty<Int, MyError>()
        emptyPublisher.sink(
            receiveCompletion: { print("Completed: \($0)") },
            receiveValue: { print("Received: \($0)") }
        )
        // Output: "Completed: finished"
    }
    
    func failPublisher() {
        let failPublisher = Fail<String, MyError>(error: .somethingWentWrong)
        failPublisher.sink(
            receiveCompletion: { print("Completed: \($0)") },
            receiveValue: { print("Received: \($0)") }
        )
        // Output: "Completed: failure(somethingWentWrong)"
        
//        enum MyError: Error {
//            case somethingWentWrong
//        }

//        let failPublisher = Fail<String, MyError>(error: .somethingWentWrong)
//
//        failPublisher
//            .sink(
//                receiveCompletion: { completion in
//                    switch completion {
//                    case .finished:
//                        print("Completed")
//                    case .failure(let error):
//                        print("Failed with error: \(error)") // Output: Failed with error: somethingWentWrong
//                    }
//                },
//                receiveValue: { value in
//                    print(value) // Will not execute
//                }
//            )
    }
    
    func deferredPublisher() {
        let deferredPublisher = Deferred {
            Just(Date())
        }
        deferredPublisher.sink { date in
            print("Current date1: \(date)")
        }
        
        sleep(2)
        
        deferredPublisher.sink { date in
            print("Current date2: \(date)")
        }
    }
    
    func futurePublisher() {
        let futurePublisher = fetchData()

        subscription = futurePublisher.sink(
            receiveCompletion: { completion in
                switch completion {
                case .finished:
                    print("Operation completed successfully")
                case .failure(let error):
                    print("Operation failed with error: \(error)")
                }
            },
            receiveValue: { value in
                print("Received value: \(value)")
            }
        )
    }
    
    func fetchData() -> Future<String, CustomError> {
        return Future { [weak self] promise in
            DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
                let success = Bool.random()
                if success {
                    promise(.success("Fetched data successfully"))
                } else {
                    promise(.failure(.networkError))
                }
            }
        }
    }
    
    func timerPublisher() {
        let timerPublisher = Timer.publish(every: 1.0, on: .main, in: .default)
            .autoconnect()

        subscription = timerPublisher.sink { time in
            print("Current time: \(time)")
        }
        //subscription?.cancel()
    }
    
    func recordPublisher() {
        let recordPublisher = Record<String, Never>(output: ["A", "B", "C"], completion: .finished)
        recordPublisher.sink(
            receiveCompletion: { print("Completed: \($0)") },
            receiveValue: { print("Received: \($0)") }
        )
    }
    
    func AnyPublisherExampple(from url: URL) -> AnyPublisher<Data, URLError> {
        URLSession.shared.dataTaskPublisher(for: url)
            .map { $0.data }
            .eraseToAnyPublisher()
    }
    
    // MARK: Schedulars
    //https://www.vadimbulavin.com/understanding-schedulers-in-swift-combine-framework/
    func subscribeOnOptions() {
        let aQueue = DispatchQueue(label: "s")
        
        //To see in what thread we are:
        print("Now we are in thread \(Thread.current)")
        let s = [1, 2, 3, 4, 5].publisher
            .subscribe(on: aQueue)
            .sink(receiveValue: {
                print("Recieved \($0) on thread \(Thread.current)")
            })
    }
    
    func receiveOnOptions() {
        
        // Main Queue
        let mainQueue = DispatchQueue.main
        // A serial queue
        let someSerialQueue = DispatchQueue(label: "serial")
        // A parallel queue
        let someParallelQueue = DispatchQueue(label: "parallel", attributes: .concurrent)

        let opQueue = OperationQueue()
        // Only an operation per time
        opQueue.maxConcurrentOperationCount = 1
    
        //To see in what thread we are:
        print("Now we are in thread \(Thread.current)")
        let s = [1, 2, 3, 4, 5].publisher
            .receive(on: someParallelQueue)
            .sink(receiveValue: {
                print("Recieved \($0) on thread \(Thread.current)")
            })
    }
    
    func schedular() {
//        let immediateScheduler = ImmediateScheduler.shared
//        let aPublisher = [1, 2, 3, 4, 5].publisher
//            .receive(on: immediateScheduler)
//            .sink(receiveValue: {
//            print("Recieved \($0) on thread \(Thread.current)")
//        })
        
        subscription = [1, 2, 3, 4, 5].publisher
            .receive(on: RunLoop.current)
            .sink(receiveValue: {
            print("Recieved \($0) on thread \(Thread.current)")
        })
    }
    
}












struct MyPublisher34: Publisher {
    typealias Output = Int
    typealias Failure = Never
    let numbers: [Int]
    
    func receive<S>(subscriber: S)where S : Subscriber,
                                         MyPublisher34.Failure == S.Failure,
                                         MyPublisher34.Output == S.Input {
                                             let subscription = MySubscription34(subscriber: subscriber,
                                                                                 numbers: numbers)
                                             subscriber.receive(subscription: subscription)
    }
    
}

class MySubscription34<S: Subscriber>: Subscription where S.Input == Int {
    private var subscriber: S?
    var numbers: [Int]
    
    init(subscriber: S, numbers: [Int]) {
        self.subscriber = subscriber
        self.numbers = numbers
    }
    
    func request(_ demand: Subscribers.Demand) {
        var currDemand = demand
        for number in numbers {
            if currDemand == .none {
                break
            }
            _ = subscriber?.receive(number)
            currDemand -= 1
        }
        self.subscriber?.receive(completion: .finished)
    }
    
    func cancel() {
        subscriber = nil
    }
    
}

class Test34 {
    
    init() {
        let publisher = MyPublisher34(numbers: [1,2,6,4,3])
        let subscription = publisher.sink { result in
            switch result {
            case .finished:
                print("Finish")
            case .failure(let error):
                print(error)
            }
        } receiveValue: { val in
            print("val: \(val)")
        }

    }
    
}

