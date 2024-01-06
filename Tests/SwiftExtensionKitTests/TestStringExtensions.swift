import XCTest
@testable import SwiftExtensionKit

final class StringExtensionTests: XCTestCase {
    
    func testCleanPhoneString() {
        let phoneString = "+1 (302) 781 1164"
        
        XCTAssertEqual("(302) 781-1164", phoneString.cleanedPhoneNumber())
    }
    
    func testReplacingFirstInstanceOf() {
        let firstString = "aaa"
        XCTAssertEqual("baa", firstString.replacingFirstInstanceOf("a", with: "b"))
    }
}
