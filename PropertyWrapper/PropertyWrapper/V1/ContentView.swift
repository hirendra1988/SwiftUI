//
//  ContentView.swift
//  PropertyWrapper
//
//  Created by Hirendra Sharma on 01/07/23.
//

import SwiftUI

struct ContentView: View {
    @Uppercase var cityName: String
        
//    init(cityName: String) {
//        self.cityName = cityName
//    }
    
    var body: some View {
        VStack {
            Text(cityName)
                .customModifierV2()
        }
        
        Button("Click") {
            self.cityName = "Bangalore"
        }
        
        VHStack {
            Text("Hirendra")
            Text("Hirendra2")
            Text("Hirendra3")
            Text("Hirendra4")
            Text("Hirendra5")
        }
        .padding()
    }
}

struct ContentViewDetail2: View {
    @Uppercase var cityName: String
   
    var body: some View {
        VStack {
            Text(cityName)
                .customModifierV2()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

struct ContentViewWithCustomModifier: View {
    var body: some View {
        VStack {
            Text("Warning Label")
                .modifier(WarningLabel())
            Text("Error Label!")
                .modifier(ErrorLabel())
            Text("Info Label")
                .modifier(InfoLabel())
           ThemeCTAButton(title: "Share") {
              print("Share button Tapped")
           }.customModifierV2()
        }
}
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(cityName: "Bangalore")
//    }
//}
