import XCTest
@testable import SquareAPI

final class SquareAPITests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
		XCTAssertEqual(SquareAPI.version, "2020-12-16")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
