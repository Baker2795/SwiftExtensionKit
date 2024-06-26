//
//  DelayedDisableButtonModifier.swift
//
//
//  Created by John Baker on 3/29/24.
//

import SwiftUI

@available(iOS 13.0, *)
public struct DelayedDisableButtonModifier: ViewModifier {
    let delaySeconds: Int
    @State private var isDisabled = false

    public func body(content: Content) -> some View {
        content
            .disabled(isDisabled)
            .onTapGesture {
                isDisabled = true
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delaySeconds)) {
                    isDisabled = false
                }
            }
    }
}

@available(iOS 13.0, *)
public extension View {
    func delayedDisableButton(_ delaySeconds: Int) -> some View {
        self.modifier(DelayedDisableButtonModifier(delaySeconds: delaySeconds))
    }
}
