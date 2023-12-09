//
//  SFButton.swift
//
//
//  Created by John Baker on 12/9/23.
//

import SwiftUI

@available(iOS 14.0, *)
struct SFButton: View {
    
    var sfImage: String
    var action: (() -> Void)
    
    init(_ sfImage: String, action: @escaping () -> Void) {
        self.sfImage = sfImage
        self.action = action
    }
    
    var body: some View {
        Button(action: action, label: {
            Label("", systemImage: sfImage)
        })
    }
    
}

@available(iOS 17.0, *)
#Preview {
    return VStack {
        SFButton("house") {
            print("")
        }
    }
}
