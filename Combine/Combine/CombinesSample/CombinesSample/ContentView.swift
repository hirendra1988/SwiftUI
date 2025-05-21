//
//  ContentView.swift
//  CombinesSample
//
//  Created by Hirendra Sharma on 26/06/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel = CombineViewModel()
    var testPublisher = CustomPublisher()
    //@StateObject private var dogViewModel = DogViewModel()
    
    var body: some View {
        VStack {
            ScrollView {
                Button("Test Simple Sink") {
                    viewModel.testSimpleSink()
                }.padding(5)
                Button("Test Reduce") {
                    viewModel.testReduce()
                }.padding(5)
                Button("Test Scan") {
                    viewModel.testScan()
                }.padding(5)
                Button("Test Map") {
                    viewModel.testMap()
                }.padding(5)
                Button("Flat Map") {
                    viewModel.testFlatMap()
                }.padding(5)
                Button("Flat Map2") {
                    viewModel.testFlatMap2()
                }.padding(5)
                Button("Compact Map") {
                    viewModel.testCompactMap()
                }.padding(5)
                Button("Test Filter") {
                    viewModel.testFilter()
                }.padding(5)
                Button("Test Merge") {
                    viewModel.testMerge()
                }.padding(5)
                Button("Test Merge2") {
                    viewModel.testMerge2()
                }.padding(5)
                Button("Test CombineLatest") {
                    viewModel.combineLatest()
                }.padding(5)
                Button("Test Zip") {
                    viewModel.testZip()
                }.padding(5)
                
                Button("Flat Buffer") {
                    viewModel.testBuffer()
                }.padding(5)
                Button("Test Debounce") {
                    viewModel.text += 1
                }.padding(5)
                Button("Test Throttle") {
                    viewModel.text += 1
                }.padding(5)
                Button("Test Collect") {
                    viewModel.testCollect()
                }.padding(5)
                
                Button("Test Retry") {
                    viewModel.retryErrorHandling()
                }.padding(5)
            }
        }
        .onAppear(perform: {
            print("OnAppear")
            //dogViewModel.fetchDogList()
        })
        .padding()
    }
}

#Preview {
    ContentView()
}


struct ContentView11: View {
    let items = ["Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry","Apple", "Banana", "Cherry"]

    var body: some View {
        VStack {
             ScrollView {
                ForEach(items, id: \.self) { item in
                    Text(item)
                }
            }
        }
    }
}
