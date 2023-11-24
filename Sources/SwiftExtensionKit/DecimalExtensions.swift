//
//  DecimalExtensions.swift
//
//
//  Created by John Baker on 11/24/23.
//

import Foundation

public extension Decimal {
    /// Takes a double & converts it to display currency amount
    func asLocalizedDisplayCurrency() -> String {
        let formatter = NumberFormatter()
        formatter.locale = Locale.current
        formatter.numberStyle = .currencyAccounting
        return formatter.string(from: self as NSNumber) ?? ""
    }
    
}
