//
//  SegmentedMultiPicker.swift
//
//
//  Created by John Baker on 12/7/23.
//

import SwiftUI

@available(iOS 15.0, *)
public struct SegmentedMultiPicker: View {
    
    @State var components: [String] = []
    
    /// unordered group of selected indexes
    @Binding var selectedIndexes: IndexSet
    
    public init(components: [String], selectedIndexes: Binding<IndexSet>) {
        self._components = State(initialValue: components)
        self._selectedIndexes = selectedIndexes
    }
    
    public var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<components.count, id: \.self) { index in
                Button(action: {
                    if selectedIndexes.contains(index) {
                        self.selectedIndexes.remove(index)
                    } else {
                        self.selectedIndexes.insert(index)
                    }
                }) {
                    Text(components[index])
                        .foregroundColor(.black)
                        .font(.callout)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 6)
                }
                .buttonStyle(BorderlessButtonStyle())
                .background {
                    if selectedIndexes.contains(index) {
                        RoundedRectangle(cornerRadius: 6.0)
                            .fill(.white)
                            .padding(.vertical, 1)
                            .padding(.horizontal ,2)
                    }
                }
                if index != components.count - 1 {
                    Divider()
                        .padding(.vertical, 6)
                }
            }
        }
        .frame(minHeight: 35)
        .fixedSize(horizontal: false, vertical: true)
        .frame(maxWidth: .infinity)
        .background(Color(uiColor: .tertiarySystemFill))
        .clipShape(RoundedRectangle(cornerRadius: 8.0))
    }
    
}

@available(iOS 15.0, *)
#Preview {
    @State var selection: IndexSet = []
    
    return SegmentedMultiPicker(components: Calendar.current.veryShortWeekdaySymbols, selectedIndexes: $selection)
}
