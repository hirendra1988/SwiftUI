//
//  ContentView.swift
//  BindingBindableDemo
//
//  Created by Hirendra Sharma on 07/07/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text(String(viewModel.counter))
                
                //NavigationLink("Go to Detail") {
                    ContentDetailView(viewModel: viewModel)
                //}
            }
        }
        .padding()
    }
}

struct ContentDetailView: View {
    
    @ObservedObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
            
            Button("Increase") {
                viewModel.counter += 1
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct ScrollFlickeringContentView11: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(0..<20) { _ in
                        Color.blue.frame(width: 350, height: 200)
                    }
                }
            }
            .padding(.top, 1)
            .navigationBarTitle("Testing", displayMode: .automatic)
        }
        
    }
}

struct ScrollFlickeringContentView: View {
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Color.red.frame(width: 100, height: 100, alignment: .center)

                    ForEach(0..<5) { i in

                        Text("\(i)")
                            .frame(maxWidth: .infinity)
                            .background(Color.green)
                        
                        Spacer()
                    }

                    Color.red.frame(width: 100, height: 100, alignment: .center)
                }
            }
            .fixFlickering { scrollView in
                
                scrollView
                    .background(Color.yellow)
            }
            .navigationBarTitle(Text("Example"))
        }
    }
}

extension ScrollView {
    
    public func fixFlickering() -> some View {
        
        return self.fixFlickering { (scrollView) in
            
            return scrollView
        }
    }
    
    public func fixFlickering<T: View>(@ViewBuilder configurator: @escaping (ScrollView<AnyView>) -> T) -> some View {
        
        GeometryReader { geometryWithSafeArea in
            GeometryReader { geometry in
                configurator(
                ScrollView<AnyView>(self.axes, showsIndicators: self.showsIndicators) {
                    AnyView(
                    VStack {
                        self.content
                    }
                    .padding(.top, geometryWithSafeArea.safeAreaInsets.top)
                    .padding(.bottom, geometryWithSafeArea.safeAreaInsets.bottom)
                    .padding(.leading, geometryWithSafeArea.safeAreaInsets.leading)
                    .padding(.trailing, geometryWithSafeArea.safeAreaInsets.trailing)
                    )
                }
                )
            }
            .edgesIgnoringSafeArea(.all)
        }
    }
}
