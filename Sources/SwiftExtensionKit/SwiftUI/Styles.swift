//
//  File.swift
//  
//
//  Created by John Baker on 10/16/23.
//

import SwiftUI

@available(iOS 17, *)
public struct PulsatingNeonGlowModifier: ViewModifier {
    @State private var isPulsating: Bool = false {
        didSet {
            DispatchQueue.main.asyncAfter(deadline: .now() + pulseDuration) {
                withAnimation {
                    isPulsating.toggle()
                }
            }
        }
    }
    var pulseDuration: Double = 1.5
    var glowColor: Color = .blue

    public func body(content: Content) -> some View {
        content
            .shadow(color: isPulsating ? glowColor : .clear, radius: isPulsating ? 8 : 0)
            .onAppear {
                isPulsating.toggle()
            }
    }
}

@available(iOS 17, *)
public extension View {
    func addPulsatingNeonGlow(pulseDuration: Double = 1.5, glowColor: Color = .blue) -> some View {
        self.modifier(PulsatingNeonGlowModifier(pulseDuration: pulseDuration, glowColor: glowColor))
    }
}
