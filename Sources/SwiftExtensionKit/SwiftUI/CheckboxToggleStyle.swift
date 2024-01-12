//
//  File.swift
//  
//
//  Created by John Baker on 1/11/24.
//

import SwiftUI

@available(iOS 14.0, *)
public struct iOSCheckboxToggleStyle: ToggleStyle {
    public func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                configuration.label
            }
        })
    }
}
