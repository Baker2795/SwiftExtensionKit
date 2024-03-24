//
//  OnTimerFireModifier.swift
//
//
//  Created by John Baker on 3/24/24.
//

import SwiftUI

@available(iOS 13.0, *)
public struct OnTimerFireModifier: ViewModifier {
    let interval: TimeInterval
    let action: () -> Void
    
    public func body(content: Content) -> some View {
        content.onAppear {
            let timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
                action()
            }
            
            RunLoop.current.add(timer, forMode: .common)
            NotificationCenter.default.addObserver(forName: UIApplication.willResignActiveNotification, object: nil, queue: .main) { _ in
                timer.invalidate()
            }
        }
        .onDisappear {
            NotificationCenter.default.removeObserver(self)
        }
    }
}

@available(iOS 13.0, *)
public extension View {
    func onTimerFire(_ interval: TimeInterval, action: @escaping () -> Void) -> some View {
        self.modifier(OnTimerFireModifier(interval: interval, action: action))
    }
}
