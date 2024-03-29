//
//  DoubleExtensions.swift
//
//
//  Created by John Baker on 10/12/23.
//

import Foundation

public extension Double {
    /// Takes a double & converts it to a percentage
    func asPercentageString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.minimumFractionDigits = 0
        formatter.maximumFractionDigits = 2
        return formatter.string(from: NSNumber(value: self)) ?? ""
    }
    
    /// Takes a double & converts it to display currency amount
    func asLocalizedDisplayCurrency(showDecimals: Bool = true) -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currencyAccounting
        
        if !showDecimals {
            formatter.maximumFractionDigits = 0
        }
        
        return formatter.string(from: self as NSNumber) ?? ""
    }
    
    /// Takes a double & returns a display string with the given amount of decimal places
    func asRoundedDecimalString(_ places: Int) -> String {
        let divisor = pow(10.0, Double(places))
        let roundedValue = (self * divisor).rounded() / divisor
        return String(format: "%.\(places)f", roundedValue)
    }
}
