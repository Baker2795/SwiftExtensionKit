//
//  DateExtensions.swift
//
//
//  Created by John Baker on 10/21/23.
//

import Foundation

public extension Date {
    func isToday() -> Bool {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let selfDate = calendar.startOfDay(for: self)
        
        return calendar.isDate(today, inSameDayAs: selfDate)
    }
    
    func minutesDifference(to date: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.minute], from: self, to: date)
        return components.minute ?? 0
    }
}
