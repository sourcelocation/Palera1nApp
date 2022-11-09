import Foundation
import SwiftUI

struct PaleAnimatedBG: View {
    @State var start = UnitPoint(x: 0, y: -2)
    @State var end = UnitPoint(x: 4, y: 0)
    
    let timer = Timer.publish(every: 1, on: .main, in: .default).autoconnect()
    let colors = [
        Color.yellow,
        .init(hex: "FFB123"),
        .init(hex: "833F46"),
        .init(hex: "071B33"),
        .init(hex: "833F46"),
    ]
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: start, endPoint: end)
        // .animation(Animation.easeInOut(duration: 6).repeatForever())
            .onReceive(timer, perform: { _ in
                withAnimation(.easeInOut(duration: 6).repeatForever()) {
                    self.start = UnitPoint(x: 4, y: 0)
                    self.end = UnitPoint(x: 0, y: 2)
                    self.start = UnitPoint(x: -4, y: 20)
                    self.end = UnitPoint(x: 4, y: 0)
                }
            })
    }
}
