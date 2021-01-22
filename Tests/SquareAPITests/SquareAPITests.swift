import XCTest
@testable import SquareAPI

final class SquareAPITests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
		XCTAssertEqual(SquareAPIInfo.version, "2021-01-21")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
