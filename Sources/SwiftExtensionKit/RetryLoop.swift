//
//  File.swift
//  
//
//  Created by John Baker on 3/10/24.
//

import Foundation

public enum RetryError: Error {
    case maxAttemptsReached
}

/// Retry function
/// Will attempt to retry the given operation, until the closure condition is met
/// ```
/// retry(maxAttempts: 5, delay: 1.0, operation: fetchRandomNumber, until: { $0 == 7 }) { result in
///     switch result {
///     case .success(let randomNumber):
///         print("Got the expected value: \(randomNumber)")
///     case .failure(let error):
///         print("Max attempts reached without getting the expected value. Error: \(error)")
///     }
/// }
/// ```
public func retry<T>(maxAttempts: Int, delay: TimeInterval, operation: @escaping () -> T?, until condition: @escaping (T) -> Bool, completion: @escaping (Result<T, RetryError>) -> Void) {
    var attempt = 0
    
    func attemptOperation() {
        if let result = operation(), condition(result) {
            completion(.success(result))
        } else if attempt < maxAttempts {
            attempt += 1
            
            if Thread.isMainThread {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    attemptOperation()
                }
            } else {
                Thread.sleep(forTimeInterval: delay)
                attemptOperation()
            }
            
        } else {
            completion(.failure(.maxAttemptsReached))
        }
    }
    
    attemptOperation()
}
