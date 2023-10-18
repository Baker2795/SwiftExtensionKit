//
//  StringExtensions.swift
//  
//
//  Created by John Baker on 9/12/23.
//

import Foundation
import UIKit

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
    
    /// Converts text to an image
    /// Mainly for use with emojis
    func textToImage() -> UIImage? {
        let nsString = (self as NSString)
        let font = UIFont.systemFont(ofSize: 1024) // you can change your font size here
        let stringAttributes = [NSAttributedString.Key.font: font]
        let imageSize = nsString.size(withAttributes: stringAttributes)

        UIGraphicsBeginImageContextWithOptions(imageSize, false, 0) //  begin image context
        UIColor.clear.set() // clear background
        UIRectFill(CGRect(origin: CGPoint(), size: imageSize)) // set rect size
        nsString.draw(at: CGPoint.zero, withAttributes: stringAttributes) // draw text within rect
        let image = UIGraphicsGetImageFromCurrentImageContext() // create image from context
        UIGraphicsEndImageContext() //  end image context

        return image ?? UIImage()
    }
}
