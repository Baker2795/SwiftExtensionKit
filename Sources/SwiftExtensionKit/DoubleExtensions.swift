//
//  DoubleExtensions.swift
//
//
//  Created by John Baker on 10/12/23.
//

import Foundation

extension Double {
    
    /// Takes a double & converts it to a percentage
    func asPercentageString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
}
