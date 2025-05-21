//
//  AnyPublisher.swift
//  CombinesSample
//
//  Created by Hirendra Sharma on 09/07/24.
//

import Combine

class AnyObserverClass {
    
    init() {
        // Create an instance of TemperatureSensor
        let sensor = TemperatureSensor()
        
        // Subscribe to temperature updates
        let subscriber = sensor.temperatureUpdates.sink { temperature in
            print("Temperature updated: \(temperature) degrees Celsius")
        }
        
        // Simulate temperature changes (accessible only to the owner of the sensor)
        sensor.simulateTemperatureChange()
        sensor.simulateTemperatureChange()
        sensor.simulateTemperatureChange()
    }
}

class TemperatureSensor {
    // Private publisher for sending temperature updates
    private let temperaturePublisher = PassthroughSubject<Double, Never>()
    
    // Public publisher for subscribing to temperature updates
    var temperatureUpdates: AnyPublisher<Double, Never> {
        return temperaturePublisher.eraseToAnyPublisher()
    }
    
    // Simulate a sensor reading and send temperature updates
    func simulateTemperatureChange() {
        let newTemperature = Double.random(in: 0.0...100.0)
        temperaturePublisher.send(newTemperature)
    }
}


