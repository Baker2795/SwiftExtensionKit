//
//  StringExtensions.swift
//  
//
//  Created by John Baker on 9/12/23.
//

import Foundation

public extension String {
    
    /// Counts how many times a substring occurs within a string
    func countOccurrences(of subString: String) -> Int {
        var count = 0
        var searchRange = self.startIndex..<self.endIndex

        while let range = self.range(of: subString, options: [], range: searchRange) {
            count += 1
            searchRange = range.upperBound..<searchRange.upperBound
        }

        return count
    }
    
    /// Modify's the string & removes the last character
    mutating func removeLastCharacter() {
        if !self.isEmpty {
            self.removeLast()
        }
    }
    
    /// Removes the last character of a string
    func removingLastCharacter() -> String {
        var modifiedString = self
        modifiedString.removeLast()
        return modifiedString
    }
}
