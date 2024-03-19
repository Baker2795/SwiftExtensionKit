//
//  File.swift
//  
//
//  Created by John Baker on 3/18/24.
//

import Foundation

public extension Int {
    
    /// Returns a hours minutes seconds components from Int representing seconds
    func asDisplayTime() -> (hours: Int, minutes: Int, seconds: Int) {
        let hours = self / 3600
        let minutes = (self % 3600) / 60
        let seconds = self % 60
        
        return (hours, minutes, seconds)
    }
    
}
