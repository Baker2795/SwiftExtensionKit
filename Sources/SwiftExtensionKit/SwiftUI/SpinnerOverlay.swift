//
//  File.swift
//  
//
//  Created by John Baker on 3/10/24.
//

import SwiftUI

@available(iOS 15.0, *)
public struct SpinnerOverlayModifier: ViewModifier {
    @Binding var isLoading: Bool
    
    @State var spinnerColor: Color
    @State var backgroundColor: Color

    public func body(content: Content) -> some View {
        content
            .overlay {
                if isLoading {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(backgroundColor.opacity(0.7))
                        .frame(width: 120, height: 120)
                        .overlay(
                            ProgressView()
                                .tint(spinnerColor)
                                .progressViewStyle(CircularProgressViewStyle())
                                .scaleEffect(1.5)
                                .foregroundColor(.white)
                        )
                    .frame(width: 120, height: 120)
                }
            }
    }
}

@available(iOS 15.0, *)
public extension View {
    func spinnerOverlay(isLoading: Binding<Bool>, spinnerColor: Color = .white, backgroundColor: Color = .gray) -> some View {
        self.modifier(SpinnerOverlayModifier(isLoading: isLoading, spinnerColor: spinnerColor, backgroundColor: backgroundColor))
    }
}

@available(iOS 17.0, *)
#Preview {
    VStack {
        RoundedRectangle(cornerRadius: 15)
            .fill(.red)
            .frame(width: 180, height: 50)
        
        RoundedRectangle(cornerRadius: 15)
            .fill(.green)
            .frame(width: 180, height: 50)
        
        RoundedRectangle(cornerRadius: 15)
            .fill(.yellow)
            .frame(width: 180, height: 50)
    }
    .spinnerOverlay(isLoading: .constant(true))
}
