//
//  File.swift
//  
//
//  Created by John Baker on 10/16/23.
//

import SwiftUI

public struct PulsatingNeonGlowModifier: ViewModifier {
    @State private var isPulsating: Bool = false
    var pulseDuration: Double = 1.5
    var glowColor: Color = .blue

    public func body(content: Content) -> some View {
        content
            .shadow(color: isPulsating ? glowColor : .clear, radius: isPulsating ? 8 : 0)
            .animation(
                Animation.easeInOut(duration: pulseDuration)
                    .repeatForever(autoreverses: true)
            )
            .onAppear {
                withAnimation {
                    self.isPulsating.toggle()
                }
            }
    }
}

public extension View {
    func addPulsatingNeonGlow(pulseDuration: Double = 1.5, glowColor: Color = .blue) -> some View {
        self.modifier(PulsatingNeonGlowModifier(pulseDuration: pulseDuration, glowColor: glowColor))
    }
}
