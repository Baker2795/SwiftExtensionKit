//
//  DateExtensions.swift
//
//
//  Created by John Baker on 10/21/23.
//

import Foundation

public extension Date {
    
    /// Returns true or false if the date is today
    func isToday() -> Bool {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let selfDate = calendar.startOfDay(for: self)
        
        return calendar.isDate(today, inSameDayAs: selfDate)
    }
    
    /// Returns difference in minutes of date compared to date passed in
    func minutesDifference(to date: Date) -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.minute], from: self, to: date)
        return components.minute ?? 0
    }
    
    func localizedShortDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale.current

        return dateFormatter.string(from: self)
    }
    
    func localizedLongDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        dateFormatter.locale = Locale.current

        return dateFormatter.string(from: self)
    }
    
    func localizedShortDateTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale.current

        return dateFormatter.string(from: self)
    }
    
    func localizedLongDateTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale.current

        return dateFormatter.string(from: self)
    }
    
    func localizedShortTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale.current

        return dateFormatter.string(from: self)
    }
    
    func daysFromToday() -> Int {
        let calendar = Calendar.current
        let today = calendar.startOfDay(for: Date())
        let otherDate = calendar.startOfDay(for: self)
        let components = calendar.dateComponents([.day], from: today, to: otherDate)
        return components.day ?? 0
    }
    
    func secondsFromNow() -> Int {
        let calendar = Calendar.current
        let now = Date()
        let components = calendar.dateComponents([.second], from: now, to: self)
        return components.second ?? 0
    }
    
    func subtractDays(_ days: Int) -> Date {
        let secondsInADay: TimeInterval = Double(days) * 24 * 60 * 60
        return addingTimeInterval(-secondsInADay)
    }
}

public extension Date {
    static func lengthOfMonth() -> Int {
        let calendar = Calendar.current
        let currentDate = Date()
        
        guard let range = calendar.range(of: .day, in: .month, for: currentDate) else {
            return 28
        }
        
        return range.count
    }
    
    static func lengthOfYear() -> Int {
        let calendar = Calendar.current
        let currentDate = Date()
        
        guard let range = calendar.range(of: .day, in: .year, for: currentDate) else {
            return 365
        }
        
        return range.count
    }

    static func dateFromComponents(_ components: DateComponents) -> Date? {
        let calendar = Calendar.current
        return calendar.date(from: components)
    }
}
