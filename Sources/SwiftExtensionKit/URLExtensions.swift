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

        // Find the last period to get the TLD
        if let lastPeriodRange = cleanedHost.range(of: ".", options: .backwards) {
            let tld = cleanedHost[lastPeriodRange.upperBound...]
            return String(tld)
        }

        return cleanedHost
    }
}

