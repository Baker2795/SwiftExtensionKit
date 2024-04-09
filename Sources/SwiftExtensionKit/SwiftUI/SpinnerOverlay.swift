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

    var allowsBackgroundTaps: Bool
    var shadesBackground: Bool = true

    public func body(content: Content) -> some View {
        content
            .overlay {
                if isLoading {
                    ZStack {
                        Color.white.opacity(shadesBackground ? 0.5 : 0.001)
                            .allowsHitTesting(!allowsBackgroundTaps)
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
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
    }
}

@available(iOS 15.0, *)
public extension View {
    func spinnerOverlay(isLoading: Binding<Bool>, allowsBackgroundTaps: Bool = false, shadesBackground: Bool = true, spinnerColor: Color = .white, backgroundColor: Color = .gray) -> some View {
        self.modifier(SpinnerOverlayModifier(isLoading: isLoading, spinnerColor: spinnerColor, backgroundColor: backgroundColor, allowsBackgroundTaps: allowsBackgroundTaps, shadesBackground: shadesBackground))
    }
}

@available(iOS 17.0, *)
struct SpinnerPreview: PreviewProvider {


    @available(iOS 17.0, *)
    static var previews: some View {
        VStack {
            HStack {
                Button("ll") { }
                Spacer()
            }.background {
                RoundedRectangle(cornerRadius: 15)
                    .fill(.red)
                    .frame(width: 180, height: 50)
            }
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

}
