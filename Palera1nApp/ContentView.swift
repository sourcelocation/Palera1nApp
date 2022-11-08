//
//  ContentView.swift
//  Palera1nApp
//
//  Created by exerhythm on 08.11.2022.
//

import SwiftUI

struct ContentView: View {
    @State var logsText: String = ""
    
    init() {
        UITextView.appearance().backgroundColor = .clear
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.init(hex: "071B33"), .init(hex: "833F46"), .init(hex: "FFB123")]), startPoint: .topTrailing, endPoint: .bottomLeading)
                .ignoresSafeArea()
            VStack {
                VStack {
                    HStack {
                        Image("palera1n-white")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80)
                        Text("Palera1n")
                            .font(.system(size: 48, weight: .bold))
                    }
                    .padding(8)
                    Text("by nebula, mineek, nathan")
                        .font(.body)
                    
                    TextEditor(text: $logsText)
                        .background(Color.clear)
                        .colorMultiply(.red)
                }
            }
            .foregroundColor(.white)
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
