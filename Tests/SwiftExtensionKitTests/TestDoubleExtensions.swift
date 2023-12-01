import XCTest
@testable import SwiftExtensionKit

final class DoubleExtensionTests: XCTestCase {
    func testLocalizedDisplayCurrencyFromDouble() {
        var currencyDouble = 10.0
        XCTAssertEqual(currencyDouble.asLocalizedDisplayCurrency(), "$10.00")
        
        currencyDouble = -10.0
        XCTAssertEqual(currencyDouble.asLocalizedDisplayCurrency(), "($10.00)")
        
        currencyDouble = -10.0
        XCTAssertEqual(currencyDouble.asLocalizedDisplayCurrency(showDecimals: false), "($10)")
        
        currencyDouble = 10.0
        XCTAssertEqual(currencyDouble.asLocalizedDisplayCurrency(showDecimals: false), "$10")
        
        currencyDouble = 1000.0
        XCTAssertEqual(currencyDouble.asLocalizedDisplayCurrency(), "$1,000.00")
        
        currencyDouble = 1000000.0
        XCTAssertEqual(currencyDouble.asLocalizedDisplayCurrency(), "$1,000,000.00")
        
        currencyDouble = 10.001
        XCTAssertEqual(currencyDouble.asLocalizedDisplayCurrency(), "$10.00")
        
        currencyDouble = 10.006
        XCTAssertEqual(currencyDouble.asLocalizedDisplayCurrency(), "$10.01")
    }
    
    func testPercentageStringFromDouble() {
        var percentageDouble = 0.1
        XCTAssertEqual(percentageDouble.asPercentageString(), "10%")
        
        percentageDouble = 0.12
        XCTAssertEqual(percentageDouble.asPercentageString(), "12%")
        
        percentageDouble = 1.01
        XCTAssertEqual(percentageDouble.asPercentageString(), "101%")
        
        percentageDouble = 1.0
        XCTAssertEqual(percentageDouble.asPercentageString(), "100%")
        
        percentageDouble = 0.123
        XCTAssertEqual(percentageDouble.asPercentageString(), "12.3%")
        
        percentageDouble = 0.125
        XCTAssertEqual(percentageDouble.asPercentageString(), "12.5%")
        
        percentageDouble = 0.126
        XCTAssertEqual(percentageDouble.asPercentageString(), "12.6%")
        
        percentageDouble = 0.999999
        XCTAssertEqual(percentageDouble.asPercentageString(), "100%")
        
        percentageDouble = 0.00001
        XCTAssertEqual(percentageDouble.asPercentageString(), "0%")
        
        percentageDouble = 0.12224
        XCTAssertEqual(percentageDouble.asPercentageString(), "12.22%")
        
        percentageDouble = 0.12226
        XCTAssertEqual(percentageDouble.asPercentageString(), "12.23%")
    }
}
