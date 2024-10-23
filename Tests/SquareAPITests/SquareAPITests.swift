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
		let testMoney: Money? = Money(amount: 100, currency: "USD")
		let testMoney2: Money? = nil
		print("v1:  \(String(describing: testMoney))")
		print("nil: \(String(describing: testMoney2))")
	}
}
