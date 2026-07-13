import XCTest
@testable import SquareAPI

final class SquareAPITests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
		XCTAssertNotNil(SquareAPIInfo.version.range(of: #"^20\d{2}-\d{2}-\d{2}$"#, options: .regularExpression), "version should be a yyyy-mm-dd Square-Version header value")
    }

    static var allTests = [
        ("testExample", testExample),
		("testLocationDecode", testLocationDecode)
    ]

	func testLocationDecode() throws {
	}

	/// Square regularly returns enum values missing from their published spec; unknown values
	/// must decode to .UNRECOGNIZED instead of failing the whole payload
	func testTolerantEnumDecoding() throws {
		let decoder = JSONDecoder()

		// a known code
		let known = """
		{"errors": [{"code": "BAD_REQUEST", "detail": "The request was bad.", "category": "INVALID_REQUEST_ERROR"}]}
		"""
		struct ErrorsWrapper: Codable { let errors: [SquareError] }
		let decodedKnown = try decoder.decode(ErrorsWrapper.self, from: known.data(using: .utf8)!)
		XCTAssertEqual(decodedKnown.errors.first?.code, .BAD_REQUEST)
		XCTAssertEqual(decodedKnown.errors.first?.codeRaw, "BAD_REQUEST")

		// a code and category that don't exist (yet)
		let unknown = """
		{"errors": [{"code": "SOME_FUTURE_CODE", "detail": "whatever", "category": "SOME_FUTURE_CATEGORY"}]}
		"""
		let decodedUnknown = try decoder.decode(ErrorsWrapper.self, from: unknown.data(using: .utf8)!)
		XCTAssertEqual(decodedUnknown.errors.first?.code, .UNRECOGNIZED)
		XCTAssertEqual(decodedUnknown.errors.first?.codeRaw, "SOME_FUTURE_CODE")
		XCTAssertEqual(decodedUnknown.errors.first?.category, .UNRECOGNIZED)

		// fulfillment types: a known case and a future unknown
		XCTAssertEqual(try decoder.decode(FulfillmentType.self, from: "\"PICKUP\"".data(using: .utf8)!), .PICKUP)
		XCTAssertEqual(try decoder.decode(FulfillmentType.self, from: "\"HOLOGRAM\"".data(using: .utf8)!), .UNRECOGNIZED)
		XCTAssertEqual(try decoder.decode(OrderFulfillmentType.self, from: "\"DIGITAL\"".data(using: .utf8)!), .UNRECOGNIZED)

		// measurement units: a known unit and a future unknown
		XCTAssertEqual(try decoder.decode(MeasurementUnitUnitType.self, from: "\"TYPE_WEIGHT\"".data(using: .utf8)!), .TYPE_WEIGHT)
		XCTAssertEqual(try decoder.decode(MeasurementUnitUnitType.self, from: "\"TYPE_VIBES\"".data(using: .utf8)!), .UNRECOGNIZED)
	}
}
