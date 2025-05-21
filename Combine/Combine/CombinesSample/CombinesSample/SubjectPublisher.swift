//
//  SubjectPublisher.swift
//  CombinesSample
//
//  Created by Hirendra Sharma on 09/07/24.
//

import Combine

//https://medium.com/bumble-tech/understanding-publishers-in-swiftui-and-combine-27806aa78ba1
class SubjectPublisher {
    
    init() {
        currentValueSubjectPublisher()
        //passthroughSubjectPublisher()
        
        //justPublisher()
        
//        let subject = CurrentValueSubject<Int, Never>(0)
//        subject.send(completion: .finished)
//
//        let cancellable = subject.sink(
//           receiveCompletion: { _ in
//               print("Publisher completed")
//           }, receiveValue: { value in
//               print("\(value)")
//           }
//        )
    }
    
    func currentValueSubjectPublisher() {
        /*
        * Let's create a new instance.
        * You might notice that publishers need to define Result types
        * One for Success, which in our case is Int
        * and one for Failure, which should represent an Error type but
        * for the purposes of our example we will just say errors Never happen.
        */
        let subject = CurrentValueSubject<Int, Never>(0)

        // We can consult the value stored right away
        //print("\(subject.value)") // "0"
        //subject.send(completion: .finished)
        subject.send(10)
        
        // We can subscribe using `sink` and that will also be called right away
        // and also when a new value is emitted.
        let cancellable = subject.sink { newValue in
           print("\(newValue)") // "0" the first time
        }
        //cancellable.cancel()

        // Let's update the value
        subject.send(10)
        subject.send(100)
        //subject.send(completion: .finished)
        subject.send(1000)
        subject.send(10000)

        print("\(subject.value)") // "10"

        // Sink will also print "10"
    
    }
    
    func passthroughSubjectPublisher() {
        /*
         * Again, we are defining a new publisher with no error type
         * to keep the examples as simple as possible.
         * As you can see, this Publisher doesn't get an initial value
         */
        let subject = PassthroughSubject<Int, Never>()

        /*
         * It sends this value to any subscriber,
         * but because at this point in time it has none,
         * no one will ever know this happened.
         */
        subject.send(60)

        /*
         * Now we listen for new values
         * But in contrast to CurrentValueSubject nothing will happen
         * at the time of subscribing because there's no value present
         */
        let cancellable = subject.sink { newValue in
            print("\(newValue)")
        }
        
        //print(subject.values)

        subject.send(10) // print appears in console "10"
        subject.send(20)
        subject.send(completion: .finished)
        //cancellable.cancel()
        subject.send(30)
        subject.send(40)
        
        //print("\(subject.values)")
    }
    
    func justPublisher() {
        // Create a new Just publisher with an initial value
        let subject = Just<Int>(10)

        // Attach to listen to that value and process it
        let cancellable = subject.sink(
           // This is the first time completion is being mentioned.
           // More on that after this block
           receiveCompletion: { _ in
               print("Publisher completed")
           }, receiveValue: { value in // This is where the value gets send to
               print("\(value)")
           }
        )

        let cancellable2 = subject.sink(
           // This is the first time completion is being mentioned.
           // More on that after this block
           receiveCompletion: { _ in
               print("Publisher2 completed")
           }, receiveValue: { value in // This is where the value gets send to
               print("\(value)")
           }
        )
        
        // --- Console Prints
        // "10"
        // "Publisher completed"
    }
}
