//
//  SwiftUI.swift
//
//
//  Created by John Baker on 9/21/23.
//

import SwiftUI

@available(iOS 13, *)
public extension View {
    /// Conditionally applies a modifier to the view based on a provided condition.
    ///
    /// - Parameters:
    ///   - condition: The condition that determines whether to apply the modifier.
    ///   - modifier: The modifier to apply if the condition is true.
    /// - Returns: A view modified by the specified modifier if the condition is true.
    @ViewBuilder
    func `if`<V: View>(_ condition: Bool, modifier: (Self) -> V) -> some View {
        if condition {
            modifier(self)
        } else {
            self
        }
    }
    
    /// Conditionally applies a modifier to the view if a given optional value is non-nil.
    ///
    /// - Parameters:
    ///   - value: The optional value to check.
    ///   - modifier: The modifier to apply if the value is non-nil.
    /// - Returns: A view modified by the specified modifier if the value is non-nil.
    @ViewBuilder
    func ifLet<T, V: View>(_ value: T?, modifier: (Self, T) -> V) -> some View {
        if let unwrappedValue = value {
            modifier(self, unwrappedValue)
        } else {
            self
        }
    }
}
