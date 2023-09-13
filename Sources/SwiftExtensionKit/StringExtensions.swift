//
//  StringExtensions.swift
//  
//
//  Created by John Baker on 9/12/23.
//

import Foundation

extension String {
    func countOccurrences(of subString: String) -> Int {
        var count = 0
        var searchRange = self.startIndex..<self.endIndex

        while let range = self.range(of: subString, options: [], range: searchRange) {
            count += 1
            searchRange = range.upperBound..<searchRange.upperBound
        }

        return count
    }
}
