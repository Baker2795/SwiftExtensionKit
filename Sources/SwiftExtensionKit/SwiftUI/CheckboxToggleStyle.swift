//
//  File.swift
//  
//
//  Created by John Baker on 1/11/24.
//

import SwiftUI

@available(iOS 14.0, *)
public struct iOSCheckboxToggleStyle: ToggleStyle {
    
    @State var isRadioStyle: Bool
    
    public init(isRadioStyle: Bool = false) {
        self._isRadioStyle = State(initialValue: isRadioStyle)
    }
    
    public func makeBody(configuration: Configuration) -> some View {
        Button(action: {
            configuration.isOn.toggle()
        }, label: {
            HStack {
                if isRadioStyle {
                    ZStack(alignment: .center) {
                        Image(systemName: "circle")
                        if configuration.isOn {
                            Image(systemName: "circlebadge.fill")
                        }
                    }
                } else {
                    Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                }
                configuration.label
            }
        })
    }
}

@available(iOS 17.0, *)
#Preview {
    
    @State var tester: Bool = false
    
    return VStack {
        Toggle(isOn: $tester, label: {
            Text("thing")
        })
        .toggleStyle(iOSCheckboxToggleStyle(isRadioStyle: true))
    }
}
