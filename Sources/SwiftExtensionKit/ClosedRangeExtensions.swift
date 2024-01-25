//
//  File.swift
//  
//
//  Created by John Baker on 1/24/24.
//

import Foundation

public extension ClosedRange where Bound == Float {
    func asDoubleRange() -> ClosedRange<Double> {
        return Double(lowerBound)...Double(upperBound)
    }
    
    func asIntRange() -> ClosedRange<Int> {
        return Int(lowerBound)...Int(upperBound)
    }
}

public extension ClosedRange where Bound == Double {
    func asFloatRange() -> ClosedRange<Float> {
        return Float(lowerBound)...Float(upperBound)
    }
    
    func asIntRange() -> ClosedRange<Int> {
        return Int(lowerBound)...Int(upperBound)
    }
}

public extension ClosedRange where Bound == Int {
    func asFloatRange() -> ClosedRange<Float> {
        return Float(lowerBound)...Float(upperBound)
    }
    
    func asDoubleRange() -> ClosedRange<Double> {
        return Double(lowerBound)...Double(upperBound)
    }
}
