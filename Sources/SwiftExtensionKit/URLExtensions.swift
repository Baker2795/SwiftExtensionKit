//
//  URLExtensions.swift
//
//
//  Created by John Baker on 12/7/23.
//

import Foundation

public extension URL {
    func cleanedHost() -> String? {
        // Get the host from the URL
        guard let host = self.host else {
            return nil
        }
        
        // Remove "www." if it exists
        let cleanedHost = host.hasPrefix("www.") ? String(host.dropFirst(4)) : host
        
        // Remove any trailing marks after the first qualifier
        if let firstQualifierRange = cleanedHost.range(of: ".") {
            let firstQualifier = cleanedHost[..<firstQualifierRange.lowerBound]
            return String(firstQualifier)
        }
        
        return cleanedHost
    }
}

