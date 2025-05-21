//
//  ContentView.swift
//  CombinesSample
//
//  Created by Hirendra Sharma on 26/06/24.
//

import SwiftUI

struct PublishersContentView: View {
    
    var viewModel = ConveniencePublishers()
    
    var body: some View {
        VStack {
            ScrollView {
                Button("Test Just Publisher") {
                    viewModel.justPublisher()
                }.padding(5)
                
                Button("Test Empty Publisher") {
                    viewModel.emptyPublisher()
                }.padding(5)
                
                Button("Test Fail Publisher") {
                    viewModel.failPublisher()
                }.padding(5)
                
                Button("Test Deferred Publisher") {
                    viewModel.deferredPublisher()
                }.padding(5)
                
                Button("Test Future Publisher") {
                    viewModel.futurePublisher()
                }.padding(5)
                
                Button("Test Timer Publisher") {
                    viewModel.timerPublisher()
                }.padding(5)
                
                Button("Test Record Publisher") {
                    viewModel.recordPublisher()
                }.padding(5)
                
                Button("Test subscribeOnOptions") {
                    viewModel.subscribeOnOptions()
                }.padding(5)
                
                Button("Test receiveOnOptions") {
                    viewModel.receiveOnOptions()
                }.padding(5)
                
                Button("Test Schedular") {
                    viewModel.schedular()
                }.padding(5)
            }
        }.padding()
    }
}

#Preview {
    ContentView()
}
