//
//  TextLimit.swift
//
//
//  Created by John Baker on 2/14/24.
//

import SwiftUI
import Combine

@available(iOS 14.0, *)
public extension TextField {
    func characterLimit(_ limit: Int, value: Binding<String>) -> some View {
        self.modifier(CharacterLimitModifier(limit: limit, text: value))
    }
}

@available(iOS 14.0, *)
public struct CharacterLimitModifier: ViewModifier {
    let limit: Int
    @Binding var text: String

    public func body(content: Content) -> some View {
        content
            .onChange(of: text) { newValue in
                self.text = String(newValue.prefix(limit))
            }
    }
}
