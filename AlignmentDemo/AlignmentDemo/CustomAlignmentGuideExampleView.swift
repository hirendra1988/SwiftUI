//
//  CustomAlignmentGuideExampleView.swift
//  AlignmentDemo
//
//  Created by Hirendra Sharma on 02/08/24.
//

import SwiftUI

struct CustomAlignmentGuideExampleView: View {
    var body: some View {
        HStack(alignment: .firstThird, spacing: 1) {
            HorizontalStripes()
                .frame(height: 100)
            HorizontalStripes()
                .frame(height: 50)
            HorizontalStripes()
                .frame(height: 130)
        }
        .background(.green)
        .padding()
    }
}

struct HorizontalStripes: View {
    var body: some View {
        VStack(spacing: 1) {
            Color.yellow
            Color.orange
            Color.red
            Color.blue
        }
    }
}

private struct FirstThirdAlignment: AlignmentID {
    static func defaultValue(in context: ViewDimensions) -> CGFloat {
        context.height / 3
    }
}

extension VerticalAlignment {
    static let firstThird = VerticalAlignment(FirstThirdAlignment.self)
}

#Preview {
    CustomAlignmentGuideExampleView()
}
