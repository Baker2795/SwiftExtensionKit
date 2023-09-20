//
//  ArrayExtensions.swift
//  
//
//  Created by John Baker on 9/12/23.
//

import Foundation

public extension Array {
    
    // MARK: - Shuffle
    /// Allows full shuffle of an array
    mutating func shuffle() {
        for i in stride(from: count - 1, to: 0, by: -1) {
            let j = Int.random(in: 0...i)
            if i != j {
                swapAt(i, j)
            }
        }
    }
    
    // MARK: - Group By
    /// Creates a dictionary of array elements grouped by specific key
    func groupBy<Key: Hashable>(_ keyFunction: (Element) -> Key) -> [Key: [Element]] {
        var groupedDictionary = [Key: [Element]]()
        for element in self {
            let key = keyFunction(element)
            if var group = groupedDictionary[key] {
                group.append(element)
                groupedDictionary[key] = group
            } else {
                groupedDictionary[key] = [element]
            }
        }
        return groupedDictionary
    }
    
}

public extension Array where Element: Equatable {
    
    // MARK: - Removing Duplicates
    /// Removes all duplicate elements from an array
    func removingDuplicates() -> [Element] {
        var result = [Element]()
        for element in self {
            if !result.contains(element) {
                result.append(element)
            }
        }
        return result
    }
    
}
