//
//  ContentView.swift
//  Palera1nApp
//
//  Created by exerhythm on 08.11.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.init(red: <#T##Double#>, green: <#T##Double#>, blue: <#T##Double#>), .black]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            VStack {
                Image("palera1n-white")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                Text("Hello, world!")
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
