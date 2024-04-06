//
//  AutoResizeSheetDetentModifier.swift
//
//
//  Created by John Baker on 4/6/24.
//

import SwiftUI

@available(iOS 16.0, *)
public struct AutoResizeSheetDetentModifier: ViewModifier {
    @State var sheetContentHeight: CGFloat = 0.0
    
    public func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .onAppear {
                            DispatchQueue.main.async {
                                sheetContentHeight = proxy.size.height
                            }
                        }
                }
            )
            .presentationDetents([.height(sheetContentHeight)])
    }
}

@available(iOS 16.0, *)
public extension View {
    /// If there is a text that wraps to multiline:
    /// Add `.fixedSize(horizontal: false, vertical: true)` to each wrapping text element
    func autoResizeSheetDetentHeight() -> some View {
        self.modifier(AutoResizeSheetDetentModifier())
    }
}
