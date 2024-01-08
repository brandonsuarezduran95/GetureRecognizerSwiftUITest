//
//  ContentView.swift
//  GetureRecognizerSwiftUITest
//
//  Created by Brandon Suarez on 1/7/24.
//

import SwiftUI

fileprivate enum Constants {
    static let text: String = "Tap once the square view to change the color of it."
}

struct ContentView: View {
    @State var fillColor: Color = .init(uiColor: .systemRed)
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    Text(Constants.text)
                        .offset(x: 15, y: 0)
                        .fontWeight(.medium)
                        .font(.body)
                    Spacer()
                }
                
                Spacer(minLength: 0)
                
                RoundedRectangle(cornerRadius: 25)
                    .fill(fillColor)
                    .frame(width: 200, height: 200, alignment: .center)
                    .onTapGesture(count: 1, perform: {
                        if fillColor == .init(uiColor: .systemRed) {
                            fillColor = .init(uiColor: .systemGreen)
                        } else {
                            fillColor = .init(uiColor: .systemRed)
                        }
                        print("One Tap")
                    })
                
                Spacer()
            }
            .navigationTitle("Tap Gesture")
        }
    }
}

#Preview {
    ContentView()
}
