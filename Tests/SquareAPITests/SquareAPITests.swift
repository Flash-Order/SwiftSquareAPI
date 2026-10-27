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
		let locJSON =
		"""
		{
			"location": {
				"address": {
					"address_line_1": "xxxxxxx",
					"administrative_district_level_1": "NH",
					"country": "US",
					"locality": "Portsmouth",
					"postal_code": "03801"
				},
				"business_email": "xxxxxxx@gmail.com",
				"business_hours": {
					"periods": [
						{
							"day_of_week": "SUN",
							"end_local_time": "16:00:00",
							"start_local_time": "09:00:00"
						},
						{
							"day_of_week": "MON",
							"end_local_time": "18:00:00",
							"start_local_time": "08:00:00"
						},
						{
							"day_of_week": "TUE",
							"end_local_time": "18:00:00",
							"start_local_time": "08:00:00"
						},
						{
							"day_of_week": "WED",
							"end_local_time": "18:00:00",
							"start_local_time": "08:00:00"
						},
						{
							"day_of_week": "THU",
							"end_local_time": "18:00:00",
							"start_local_time": "08:00:00"
						},
						{
							"day_of_week": "FRI",
							"end_local_time": "18:00:00",
							"start_local_time": "08:00:00"
						},
						{
							"day_of_week": "SAT",
							"end_local_time": "18:00:00",
							"start_local_time": "09:00:00"
						}
					]
				},
				"business_name": "The XXXX XXXXX",
				"capabilities": [
					"CREDIT_CARD_PROCESSING"
				],
				"coordinates": {
					"latitude": 43.00000,
					"longitude": -70.00000
				},
				"country": "US",
				"created_at": "2014-01-16T16:50:24Z",
				"currency": "USD",
				"description": "Organic juice, smoothies, and more",
				"facebook_url": "facebook.com/xxxxxxxx",
				"id": "XXXXXXXXX",
				"language_code": "en-US",
				"logo_url": "xxxxxxx",
				"mcc": "5814",
				"merchant_id": "XXXXXXX",
				"name": "The XXXXX XXXXX",
				"phone_number": "+1 XXX-XXX-XXXX",
				"pos_background_url": "xxxxxxxxxxxxxxxxxxxx",
				"status": "ACTIVE",
				"timezone": "America/New_York",
				"type": "MOBILE",
				"website_url": "xxxxxxxx"
			}
		}
		"""
		let data = locJSON.data(using: .utf8)!
		XCTAssertNoThrow(try JSONDecoder().decode(SquareAPI.RetrieveLocationResponse.self, from: data))
	}
	
	func testDebugDescriptions() throws {
		let testMoney: Money? = Money(amount: 100, currency: .USD)
		let testMoney2: Money? = nil
		print("v1:  \(String(describing: testMoney))")
		print("nil: \(String(describing: testMoney2))")
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
