//
//  File.swift
//  
//
//  Created by John Baker on 1/13/24.
//

import Foundation
import SwiftUI

/// Provides a fix for using Labels within Navigation toolbar
@available(iOS 14.0, *)
public struct VerticalLabelStyle: LabelStyle {
    @State var isFlipped: Bool
    public init(isFlipped: Bool = false) {
        self._isFlipped = State(initialValue: isFlipped)
    }
    public func makeBody(configuration: Configuration) -> some View {
        VStack {
            if isFlipped {
                configuration.title.font(.subheadline)
                configuration.icon.font(.headline)
            } else {
                configuration.icon.font(.headline)
                configuration.title.font(.subheadline)
            }
        }
    }
}

/// Provides a fix for using Labels within Navigation toolbar
@available(iOS 14.0, *)
public struct HorizontalLabelStyle: LabelStyle {
    @State var isFlipped: Bool
    public init(isFlipped: Bool = false) {
        self._isFlipped = State(initialValue: isFlipped)
    }
    public func makeBody(configuration: Configuration) -> some View {
        HStack {
            if isFlipped {
                configuration.title.font(.subheadline)
                configuration.icon.font(.headline)
            } else {
                configuration.icon.font(.headline)
                configuration.title.font(.subheadline)
            }
        }
    }
}
