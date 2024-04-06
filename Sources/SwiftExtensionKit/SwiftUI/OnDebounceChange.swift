//
//  File.swift
//  
//
//  Created by John Baker on 12/6/23.
//

import SwiftUI
import Combine

@available(iOS 14.0, *)
public struct DebouncedChangeModifier<Value>: ViewModifier where Value: Equatable {
    @Binding private var value: Value
    private let delay: TimeInterval
    private let action: (Value) -> Void
    @State private var cancellable: AnyCancellable?

    public init(of value: Binding<Value>, delay: TimeInterval, action: @escaping (Value) -> Void) {
        self.delay = delay
        self.action = action
        self._value = value
    }

    public func body(content: Content) -> some View {
        if #available(iOS 17, *) {
        content
            .onChange(of: value) { oldValue, newValue in
                self.cancellable?.cancel()
                let cancellable = Just(newValue)
                    .delay(for: .seconds(delay), scheduler: RunLoop.main)
                    .sink { _ in
                        action(newValue)
                    }
                self.cancellable = cancellable
            }
        } else {
            content
                .onChange(of: value) { newValue in
                    self.cancellable?.cancel()
                    let cancellable = Just(newValue)
                        .delay(for: .seconds(delay), scheduler: RunLoop.main)
                        .sink { _ in
                            action(newValue)
                        }
                    self.cancellable = cancellable
                }
        }
    }
}

@available(iOS 14.0, *)
public extension View {
    func onDebouncedChange<Value>(of value: Binding<Value>, delay: TimeInterval, action: @escaping (Value) -> Void) -> some View where Value: Equatable {
        self.modifier(DebouncedChangeModifier(of: value, delay: delay, action: action))
    }
}
