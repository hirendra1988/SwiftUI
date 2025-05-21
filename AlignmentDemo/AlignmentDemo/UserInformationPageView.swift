//
//  UserInformationPageView.swift
//  AlignmentDemo
//
//  Created by Hirendra Sharma on 02/08/24.
//

import SwiftUI

struct UserInformationPageView: View {
    
    let firstBorderColor = Color.red
    let secondBorderColor = Color.yellow
    
    var body: some View {
        VStack(alignment: .customTrailing, spacing: 20) {
            
            Image(systemName: "person.fill.questionmark")
                .font(.system(size: 40))
                .foregroundColor(.blue)
            
            HStack {
                Text("Full Name")
                    .bold()
                    .border(firstBorderColor)
                    .customTrailingAlignment()
                
                Text("John Doe")
                    .border(secondBorderColor)
            }
            
            HStack {
                Text("Street")
                    .bold()
                    .border(firstBorderColor)
                    .customTrailingAlignment()
                
                Text("One Apple Park Way")
                    .border(secondBorderColor)
            }
            
            HStack(alignment: .firstTextBaseline) {
                Text("Zip")
                    .bold()
                    .border(firstBorderColor)
                    .customTrailingAlignment()
                
                VStack(alignment: .leading) {
                    Text("95014")
                        .border(secondBorderColor)
                    Text("Cupertino")
                }
                
            }
            
            Text("Details")
                .bold()
                .border(firstBorderColor)
        }
        
    }
}

extension View {
    func customTrailingAlignment() -> some View {
        self.alignmentGuide(.customTrailing) { viewDimensions in
            viewDimensions[.trailing]
        }
    }
}

extension HorizontalAlignment {
    struct CustomTrailing: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[HorizontalAlignment.trailing]
        }
    }
    
    static let customTrailing: HorizontalAlignment = HorizontalAlignment(CustomTrailing.self)
    
}

#Preview {
    UserInformationPageView()
}

