//
//  ContentView.swift
//  AlignmentDemo
//
//  Created by Hirendra Sharma on 02/08/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
//                AlignmentOne()
//                AlignmentTwo()
//                AlignmentThree()
                AlignmentFour()
//                AlignmentFive()
//                AvocadoExampleAlignmentView()
//                WeekdayAlignmentView()
            }
        }
        .padding()
    }
}


struct AlignmentOne: View {
    var body: some View {
        Text("This example includes a label next to the slider and a text view to display the current value.")
            .font(.headline)
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity)
            .background(.red)
    }
}

struct AlignmentTwo: View {
    var body: some View {
        Text("This example")
            .font(.headline)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(.red)
    }
}

struct AlignmentThree: View {
    var body: some View {
        HStack(alignment: .lastTextBaseline) {
            Text("Hello, world!")
                .frame(height: 60)
                .background(.red)
                .font(.title3)
            Text("This is a longer line of text")
                .frame(height: 60)
                .background(.green)
                .font(.title3)
        }
    }
}

//struct AlignmentFour: View {
//    var body: some View {
//        VStack(alignment: .leading) {
//              ForEach(0..<5) { position in
//                  Text("Number \(position)")
//                      .alignmentGuide(.leading) { d in
//                          Double(position) * -20
//                      }
//              }
//          }
//          .background(.red)
//          .frame(width: 400, height: 400)
//          .background(.blue)
//    }
//}


//struct AlignmentFour: View {
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("Hello22")
//                .background(.green)
//                .alignmentGuide(HorizontalAlignment.leading) { d in
//                    d[HorizontalAlignment.leading]
//                }
//            
//            Text("Hello22")
//                .background(.purple)
//                .alignmentGuide(HorizontalAlignment.leading) { d in
//                    d.width
//                }
//            
//            Text("Hello22")
//                .background(.orange)
//                .alignmentGuide(HorizontalAlignment.leading) { d in
//                    d[HorizontalAlignment.trailing] + d.width
//                }
//        }
//        .background(.red)
//    }
//}

struct AlignmentFour: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Hirendra")
                .background(.green)
                .alignmentGuide(.leading) { d in
                    d[.leading]
                }
            
            Text("Vinayaka Bhai")
                .background(.purple)
                .alignmentGuide(.leading) { d in
                    d[HorizontalAlignment.trailing]
                }
            
            Text("Yatin Bhai")
                .background(.orange)
                .alignmentGuide(.leading) { d in
                    d[HorizontalAlignment.trailing] - d.width
                }
        }
        .background(.red)
    }
}

//struct AlignmentFour: View {
//    var body: some View {
//        VStack(alignment: .leading) {
//            Text("Hello22")
//                .background(.green)
//                .alignmentGuide(.leading) { d in
//                    d[.leading]
//                }
//            
//            Text("Hello22")
//                .background(.purple)
//                .alignmentGuide(.leading) { d in
//                    d.width
//                }
//            
//            Text("Hello22")
//                .background(.orange)
//                .alignmentGuide(.leading) { d in
//                    d[.trailing] + d.width
//                }
//        }
//        .background(.red)
//    }
//}

struct AvocadoExampleAlignmentView: View {
    var body: some View {
        VStack(spacing: 50) {
            
            HStack(alignment: .lastTextBaseline) {
                Text("Delicious")
                Image("avocado_large")
                    .border(Color.yellow)
                    .alignmentGuide(.lastTextBaseline) { viewDimensions in
                        viewDimensions.height * 0.5
                    }
                
                Text("Avocado Toast")
                    .font(.largeTitle)
            }
            
            HStack(alignment: .lastTextBaseline) {
                Text("Delicious")
                Image("avocado_large")
                    .border(Color.yellow)
                    .alignmentGuide(.lastTextBaseline) { viewDimensions in
                        viewDimensions[.lastTextBaseline] - 10
                    }
                
                Text("Avocado Toast")
                    .font(.largeTitle)
            }
            
            VStack(alignment: .leading) {
                
                Text("Moved")
                    .alignmentGuide(.leading) { viewDimensions in
                        viewDimensions.width * 0.75
                    }
                    .background(
                        HStack(spacing: 0) {
                            Color.purple
                            Color.red
                            Color.orange
                            Color.yellow
                        })
                
                Text("Delicious")
                    .border(Color.yellow)
                Image("avocado_large")
                    .border(Color.yellow)
                    .alignmentGuide(.leading) { viewDimensions in
                        viewDimensions[.trailing]
                    }
                
                Text("Avocado Toast")
                    .font(.largeTitle)
                    .border(Color.yellow)
            }
            
        }
    }
}

struct AlignmentFive: View {
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            CatView()
                .edgesIgnoringSafeArea(.top)
            
            CatClosup()
                .frame(width: 200, height: 200)
                .padding(.leading, 20)
                .alignmentGuide(.bottom) { viewDimensions in
                    viewDimensions.height * 0.5
                }
            //                .alignmentGuide(.leading) { viewDimensions in
            //                    viewDimensions[.leading] - 20
            //                }
        }
        Text("something something")
    }
}

struct WeekdayAlignmentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(Weekday.allCases) { weekday in
                Text(weekday.name())
                    .padding(5)
                    .font(.headline)
                    .foregroundColor(.white)
                    .background(
                        Capsule().fill(Color(red: 0, green: 0.75, blue: Double(weekday.numberValue()) / 7))
                    )
                    .alignmentGuide(.leading) { viewDimensions in
                        if weekday.numberValue() % 2 == 0 {
                            return viewDimensions[.trailing]
                        } else {
                            return viewDimensions[.leading]
                        }
                    }
            }
        }
    }
}


#Preview {
    ContentView()
}
