//
//  AlignViewsAcrossStacksExampleView.swift
//  AlignmentDemo
//
//  Created by Hirendra Sharma on 02/08/24.
//

import SwiftUI

struct AlignViewsAcrossStacksExampleView: View {
    var body: some View {
        HStack(alignment: .imageTitleAlignmentGuide) {
              VStack {
                  
                  Image("minime")
                      .resizable()
                      .scaledToFit()
                      .alignmentGuide(.imageTitleAlignmentGuide) { viewDimension in
                          viewDimension[.bottom]
                      }
                  Text("Bell Peppers")
                      .font(.title)
              }
              VStack {
                  Image("mountain")
                      .resizable()
                      .scaledToFit()
                      .alignmentGuide(.imageTitleAlignmentGuide) { viewDimension in
                          viewDimension[.bottom]
                      }
                  
                  Text("Chili Peppers")
                      .font(.title)
                  Text("Higher levels of capsicum")
                      .font(.caption)
              }
          }
    }
}

private struct ImageTitleAlignment: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        context[VerticalAlignment.bottom]
    }
}

extension VerticalAlignment {
    static let imageTitleAlignmentGuide = VerticalAlignment(
        ImageTitleAlignment.self
    )
}

#Preview {
    AlignViewsAcrossStacksExampleView()
}

