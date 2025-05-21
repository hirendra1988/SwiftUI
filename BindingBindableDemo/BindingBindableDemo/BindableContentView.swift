//
//  BindableContentView.swift
//  BindingBindableDemo
//
//  Created by Hirendra Sharma on 07/07/24.
//

import SwiftUI

struct BindableContentView: View {
    
    @State private var viewModel = BindableViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                
                ViewThatFits {
                    Text("Mango1")
                        .background(.green)
                    Text("Mango2")
                        .background(.orange)
                    Text("Mango3")
                    Text("Mango44")
                }.background(.red)
                    .frame(maxWidth: .infinity)
                
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text(String(viewModel.counter))
                
                Button("Increase") {
                    viewModel.counter += 1
                }
                
                //NavigationLink("Go to Detail") {
                BindableContentDetailView(viewModel: viewModel)
                //}
            }
        }
        .padding()
    }
}

struct BindableContentDetailView: View {
    
    @Bindable var viewModel: BindableViewModel
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(String(viewModel.counter))
            
            Button("Increase") {
                viewModel.counter += 1
            }
        }
        .padding()
    }
}

#Preview {
    BindableContentView()
}
