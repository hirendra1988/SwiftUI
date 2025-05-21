//
//  buttonTest.swift
//  SwiftUIDemoProject
//
//  Created by Hirendra Sharma on 29/08/23.
//

import SwiftUI

struct buttonTest: View {
    var body: some View {
        VStack {
            
            Button("Click!") {
                
            }.buttonStyle(.plain)
        }
    }
}

struct buttonTest_Previews: PreviewProvider {
    static var previews: some View {
        buttonTest()
    }
}
