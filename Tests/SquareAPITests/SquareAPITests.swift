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

		// a known-but-recently-added error code
		let mismatch = """
		{"errors": [{"code": "ORDER_TOTAL_MISMATCH", "detail": "The order total does not match the payment total.", "category": "INVALID_REQUEST_ERROR"}]}
		"""
		struct ErrorsWrapper: Codable { let errors: [SquareError] }
		let decodedMismatch = try decoder.decode(ErrorsWrapper.self, from: mismatch.data(using: .utf8)!)
		XCTAssertEqual(decodedMismatch.errors.first?.code, .ORDER_TOTAL_MISMATCH)
		XCTAssertEqual(decodedMismatch.errors.first?.codeRaw, "ORDER_TOTAL_MISMATCH")

		// a long-standing code
		let known = """
		{"errors": [{"code": "BAD_REQUEST", "detail": "The request was bad.", "category": "INVALID_REQUEST_ERROR"}]}
		"""
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

		// fulfillment types: a known case, DIGITAL (live but undocumented) and a future unknown
		XCTAssertEqual(try decoder.decode(FulfillmentType.self, from: "\"PICKUP\"".data(using: .utf8)!), .PICKUP)
		XCTAssertEqual(try decoder.decode(FulfillmentType.self, from: "\"DIGITAL\"".data(using: .utf8)!), .DIGITAL)
		XCTAssertEqual(try decoder.decode(FulfillmentType.self, from: "\"HOLOGRAM\"".data(using: .utf8)!), .UNRECOGNIZED)
		XCTAssertEqual(try decoder.decode(OrderFulfillmentType.self, from: "\"DIGITAL\"".data(using: .utf8)!), .DIGITAL)

		// measurement units: a known unit, TYPE_TIME (live but undocumented) and a future unknown
		XCTAssertEqual(try decoder.decode(MeasurementUnitUnitType.self, from: "\"TYPE_WEIGHT\"".data(using: .utf8)!), .TYPE_WEIGHT)
		XCTAssertEqual(try decoder.decode(MeasurementUnitUnitType.self, from: "\"TYPE_TIME\"".data(using: .utf8)!), .TYPE_TIME)
		XCTAssertEqual(try decoder.decode(MeasurementUnitUnitType.self, from: "\"TYPE_VIBES\"".data(using: .utf8)!), .UNRECOGNIZED)
	}

	/// app_fee_allocations / buyer_currency_exchange are referenced by Square's spec but never defined
	/// (AppFeeAllocation is hand-patched into the spec, CurrencyExchange is AnyCodable) — a Payment carrying
	/// them must still decode, since Square echoes an allocation back on every payment with an app fee
	func testPaymentFeeAllocationsDecode() throws {
		let json = """
		{"payment": {"id": "R2B3Z8WMVt3EAmzYWLZvz7Y69EbZY", "status": "COMPLETED", "location_id": "L88917AVBK2S5",
		 "amount_money": {"amount": 1000, "currency": "USD"}, "app_fee_money": {"amount": 35, "currency": "USD"},
		 "app_fee_allocations": [{"location_id": "LDEVELOPER", "amount_money": {"amount": 30, "currency": "USD"}},
		                         {"location_id": "LPARTNER", "amount_money": {"amount": 5, "currency": "USD"}}],
		 "buyer_currency_exchange": {"anything": {"Square": "sends"}, "rate": 0.0000123}}}
		"""
		struct PaymentWrapper: Codable { let payment: Payment }
		let p = try JSONDecoder().decode(PaymentWrapper.self, from: json.data(using: .utf8)!).payment
		XCTAssertEqual(p.app_fee_allocations?.count, 2)
		XCTAssertEqual(p.app_fee_allocations?.first?.location_id, "LDEVELOPER")
		XCTAssertEqual(p.app_fee_allocations?.last?.amount_money?.amount, 5)
		XCTAssertNotNil(p.buyer_currency_exchange)
	}
}
