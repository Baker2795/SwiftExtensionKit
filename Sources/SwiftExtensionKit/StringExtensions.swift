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
    
    func cleanedPhoneNumber() -> String {
        // Remove leading country code if it starts with "+1"
        var cleanedString = self
        if cleanedString.hasPrefix("+1") {
            cleanedString.removeFirst(2)
        }
        
        // Remove spaces and other non-digit characters
        let allowedCharacterSet = CharacterSet(charactersIn: "0123456789")
        cleanedString = String(cleanedString.unicodeScalars.filter { allowedCharacterSet.contains($0) })
        
        // Insert spaces for better formatting
        if cleanedString.count == 10 {
            let index1 = cleanedString.index(cleanedString.startIndex, offsetBy: 3)
            let index2 = cleanedString.index(cleanedString.startIndex, offsetBy: 7)
            let index3 = cleanedString.index(cleanedString.startIndex, offsetBy: 0)
            let index4 = cleanedString.index(cleanedString.startIndex, offsetBy: 4)
            
            cleanedString.insert(" ", at: index1)
            cleanedString.insert("-", at: index2)
            cleanedString.insert("(", at: index3)
            cleanedString.insert(")", at: index4)
        }
        
        return cleanedString
    }
    
    func removeWeirdCharactersFromPhoneNumber(leavingCountryCodePlus: Bool = true) -> String {
        var characterSetString = "1234567890"
        if leavingCountryCodePlus {
            characterSetString.append("+")
        }
        let oddCharacters = CharacterSet(charactersIn: characterSetString).inverted
        let filteredString = self.components(separatedBy: oddCharacters).joined()
        return filteredString
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
    
    func replacingFirstInstanceOf(_ target: String, with replacement: String) -> String {
        guard let range = self.range(of: target) else {
            return self
        }

        return self.replacingCharacters(in: range, with: replacement)
    }
}
