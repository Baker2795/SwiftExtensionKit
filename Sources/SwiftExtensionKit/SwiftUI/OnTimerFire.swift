//
//  OnTimerFire.swift
//
//
//  Created by John Baker on 3/24/24.
//

import SwiftUI

@available(iOS 13.0, *)
public struct OnTimerFireModifier: ViewModifier {
    let interval: TimeInterval
    let action: () -> Void
    
    @State private var timer: Timer?
    
    public func body(content: Content) -> some View {
        content
            .onAppear {
                self.timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
                    action()
                }
                RunLoop.current.add(self.timer!, forMode: .common)
                
                // invalidate timer on move app to background
                NotificationCenter.default.addObserver(forName: UIApplication.willResignActiveNotification, object: nil, queue: .main) { _ in
                    self.timer?.invalidate()
                }
                
                // restart timer on move app to foreground
                NotificationCenter.default.addObserver(forName: UIApplication.didBecomeActiveNotification, object: nil, queue: .main) { _ in
                    var isTimerValid: Bool = self.timer?.isValid ?? false
                    if !isTimerValid {
                        self.timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { _ in
                            action()
                        }
                        RunLoop.current.add(self.timer!, forMode: .common)
                    }
                }
            }
            .onDisappear {
                NotificationCenter.default.removeObserver(self)
                self.timer?.invalidate()
            }
    }
}

@available(iOS 13.0, *)
public extension View {
    func onTimerFire(_ interval: TimeInterval, action: @escaping () -> Void) -> some View {
        self.modifier(OnTimerFireModifier(interval: interval, action: action))
    }
}
