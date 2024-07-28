//
//  File.swift
//  
//
//  Created by John Baker on 7/27/24.
//

import Foundation

@propertyWrapper
public struct DateStorage {
    private let key: String
    private let defaultValue: Date

    public init(wrappedValue: Date, _ key: String) {
        self.key = key
        self.defaultValue = wrappedValue
    }

    public var wrappedValue: Date {
        get {
            let timeInterval = UserDefaults.standard.double(forKey: key)
            return timeInterval == 0 ? defaultValue : Date(timeInterval: timeInterval)
        }
        set {
            UserDefaults.standard.set(newValue.timeInterval, forKey: key)
        }
    }
}

fileprivate extension Date {
    var timeInterval: TimeInterval {
        return self.timeIntervalSince1970
    }

    init(timeInterval: TimeInterval) {
        self = Date(timeIntervalSince1970: timeInterval)
    }
}
