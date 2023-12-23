//
//  LazyView.swift
//
//
//  Created by John Baker on 12/23/23.
//

import SwiftUI

@available(iOS 13.0, *)
public struct LazyView<Content: View>: View {
    let build: () -> Content
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }
    public var body: Content {
        build()
    }
}
