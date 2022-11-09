//
//  ContentView.swift
//  Palera1nApp
//
//  Created by exerhythm on 08.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var console = Console()
    
    @State var bounds: CGSize? = nil
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                LinearGradient(gradient: Gradient(colors: [.init(hex: "071B33"), .init(hex: "833F46"), .init(hex: "FFB123")]), startPoint: .topTrailing, endPoint: .bottomLeading)
                    .ignoresSafeArea()
                content
                    .onAppear {
                        self.bounds = geo.size
                        self.splashTimeout = Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                            withAnimation(.spring()) {
                                splash = false
                            }
                        }
                    }
            }
        }
    }
    
    @State var isJailbreaking: Bool = false
    
    @State var splash = true
    @State var splashTimeout: Timer? = nil
    
    @ViewBuilder
    var content: some View {
        VStack {
            titlebar
                .padding(.top, 20)
            
            consoleview
                .opacity(splash ? 0 : 1)
                .frame(maxHeight: splash ? 0 : .infinity)
                .padding(.horizontal)
                .padding(.top)
            
            footerbar
                .opacity(splash ? 0 : 1)
                .frame(maxHeight: splash ? 0 : 50)
        }
        .foregroundColor(.white)
        .padding()
        .padding(.bottom)
    }
    
    @ViewBuilder
    var titlebar: some View {
        VStack {
            HStack {
                Image("palera1n-white")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 64)
                Text("Palera1n")
                    .font(.system(size: 48, weight: .bold))
            }
            .padding(8)
            Text("Team: nebula, mineek, nathan\nApp: sourceloc & llsc12")
            .font(.footnote)
                .multilineTextAlignment(.center)
        }
    }
    
    @ViewBuilder
    var consoleview: some View {
        VStack {
            ScrollView {
                ForEach(self.console.consoleData) { item in
                    logItemView(item)
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: splash ? 0 : ( bounds?.height ?? 1 / 1.9 ))
        .background(Color("CellBackground"))
        .cornerRadius(20)
        .padding(.bottom)
    }
    
    @ViewBuilder
    func logItemView(_ item: LogItem) -> some View {
        HStack {
            Text(item.string)
                .foregroundColor(Console.logTypeToColor(item.type))
                .font(.custom("Menlo", size: 13))
            Spacer()
        }
    }
    
    @ViewBuilder
    var footerbar: some View {
        // buttons
        VStack {
            Button {
                isJailbreaking = true
                jailbreakpressed()
            } label: {
                Text("Jailbreak")
                    .font(.body)
                    .foregroundLinearGradient(colors: [.init(hex: "071B33"), .init(hex: "833F46"), .init(hex: "FFB123")], startPoint: .leading, endPoint: .trailing)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                    }
            }
            .buttonStyle(.plain)
            .padding(.horizontal)
            .disabled(isJailbreaking)
        }
    }
    
    
    func jailbreakpressed() {
        #warning("Jailbreak implementation here")
        console.log("Jailbreak currently not implemented")
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false, block: { timer in
            withAnimation(.easeInOut) {
                isJailbreaking = false
            }
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
