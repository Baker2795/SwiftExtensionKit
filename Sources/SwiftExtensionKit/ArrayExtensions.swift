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
    
    // MARK: - Get
    /// Returns a group of dictionary items based on an IndexSet
    func get(atOffsets indexes: IndexSet) -> [Element] {
        return indexes.compactMap { index in
            guard index < self.count else { return nil }
            return self[index]
        }
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
    
    // MARK: - Does not contain
    /// Simple helper extension to determine if array does not contain something
    func doesNotContain(_ element: Element) -> Bool {
        return !self.contains(element)
    }
    
}

public extension Array where Element: Numeric {
    func average() -> Double? {
        guard !isEmpty else { return nil }
        
        let sum = reduce(0.0) { (result, element) in
            return result + Double(truncating: element as! NSNumber)
        }
        
        return sum / Double(count)
    }
}
