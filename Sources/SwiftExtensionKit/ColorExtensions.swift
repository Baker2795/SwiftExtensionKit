//
//  ColorExtensions.swift
//
//
//  Created by John Baker on 9/20/23.
//

import SwiftUI

#if os(iOS)
    typealias OSColor = UIColor
#elseif os(OSX)
    typealias OSColor = NSColor
#endif

@available(iOS 14, *)
public extension OSColor {
    /// Extension to determine if a color is considered "dark" or not
    var isDarkColor: Bool {
        var r, g, b, a: CGFloat
        (r, g, b, a) = (0, 0, 0, 0)
        self.getRed(&r, green: &g, blue: &b, alpha: &a)
        let lum = 0.2126 * r + 0.7152 * g + 0.0722 * b
        return  lum < 0.50
    }
}

@available(iOS 14, *)
public extension Color {
    /// Allows SwiftUI Color to use UIColor extension `isDarkColor`
    var isDarkColor : Bool {
        return OSColor(self).isDarkColor
    }
}
