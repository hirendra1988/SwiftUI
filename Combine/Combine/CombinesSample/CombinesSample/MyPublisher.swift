//
//  MyPublisher.swift
//  CombinesSample
//
//  Created by Hirendra Sharma on 14/08/24.
//

import Combine
//<String, Never>
struct MyPublisher: Publisher {
    typealias Output = Int
    typealias Failure = Never
    let numbers: [Int]
    
    func receive<S>(subscriber: S) where S : Subscriber,
                                         MyPublisher.Failure == S.Failure,
                                         MyPublisher.Output == S.Input {
        let subscription = MySubscription(subscriber: subscriber, numbers: numbers)
        subscriber.receive(subscription: subscription)
    }
    
}

class MySubscription<S: Subscriber>: Subscription where S.Input == Int {
    private var subscriber: S?
    private let numbers: [Int]

    init(subscriber: S, numbers: [Int]) {
        self.subscriber = subscriber
        self.numbers = numbers
    }

//    func request(_ demand: Subscribers.Demand) {
//        guard let subscriber = subscriber else { return }
//        
//        // Send a value and then complete
//        _ = subscriber.receive("Hello from MyPublisher!")
//        subscriber.receive(completion: .finished)
//    }
    
    func request(_ demand: Subscribers.Demand) {
        var currentDemand = demand
        
        for number in numbers {
            if currentDemand == .none {
                break
            }
            _ = subscriber?.receive(number)
            currentDemand -= 1
        }
        
        subscriber?.receive(completion: .finished)
    }
    
    func cancel() {
        subscriber = nil
    }
}

class MyPublisherClass {
    init() {
        myPublisherTestMethod()
    }
    
    func myPublisherTestMethod() {
        let myPublisher = MyPublisher(numbers: [7,4,8,3,5,4])
        let subscriptipn = myPublisher
            .sink { completion in
                switch completion {
                case .finished:
                    print("Publisher completed successfully.")
                case .failure(let error):
                    print("Publisher failed with error: \(error)")
                }
            } receiveValue: { value in
                print("Received value: \(value)")
            }
    }
}






struct MyPublishers32: Publisher {
    
    typealias Output = Int
    typealias Failure = Never
    let numbers: [Int]
    
    func receive<S>(subscriber: S)
    where S : Subscriber,
          MyPublishers32.Failure == S.Failure,
          MyPublishers32.Output == S.Input {
              let subscription = MySubscription32(numbers: numbers, subscriber: subscriber)
              subscriber.receive(subscription: subscription)
    }
    
}

class MySubscription32<S: Subscriber>: Subscription where S.Input == Int {
    private var numbers: [Int]
    private var subscriber: S?
    
    init(numbers: [Int], subscriber: S) {
        self.numbers = numbers
        self.subscriber = subscriber
    }
    
    func request(_ demand: Subscribers.Demand) {
        var currentDemand = demand
        for number in numbers {
            if currentDemand == .none {
                break
            }
            currentDemand -= 1
            _ = subscriber?.receive(number)
        }
        subscriber?.receive(completion: .finished)
    }
    
    func cancel() {
        subscriber = nil
    }
}

class Test32 {
    
    init() {
        var cancellable = Set<AnyCancellable>()
        let publisher = MyPublishers32(numbers: [5,4,6,7,8,8])
        let cancel = publisher
            .sink { val in
                print(val)
            }
            .store(in: &cancellable)
    }
    
}
