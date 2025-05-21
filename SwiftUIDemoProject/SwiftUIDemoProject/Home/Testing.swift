//
//  Testing.swift
//  SwiftUIDemoProject
//
//  Created by Hirendra Sharma on 28/08/23.
//

import SwiftUI


struct Testing_Previews: PreviewProvider {
    static var previews: some View {
        Testing()
    }
}

struct Testing: View {
    let items = [
        Nature(name: "Leaf", image: "Toast2"),
        Nature(name: "Atom", image: "Toast2")
    ]
    var body: some View {
        List(items) { nature in
//            HStack {
                Image(nature.image)
                    .resizable()
                    .frame(width: 50, height: 50)
                    .scaledToFill()
                    .clipped()
                Text(nature.name)
//            }
        }
    }
}

struct Nature: Identifiable {
    let id = UUID()
    let name: String
    let image: String
}
