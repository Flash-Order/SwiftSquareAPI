/// Lists gift card activities. By default, you get gift card activities for all gift cards in the seller's account. You can optionally specify query parameters to filter the list. For example, you can get a list of gift card activities for a gift card, for all gift cards in a specific region, or for activities within a time window.
public struct ListGiftCardActivities: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListGiftCardActivitiesResponse
	public typealias paramType = Params
	public struct Params {
		let gift_card_id: String?
		let type: String?
		let location_id: String?
		let begin_time: String?
		let end_time: String?
		let limit: Int?
		let cursor: String?
		let sort_order: String?
		/// Lists gift card activities. By default, you get gift card activities for all gift cards in the seller's account. You can optionally specify query parameters to filter the list. For example, you can get a list of gift card activities for a gift card, for all gift cards in a specific region, or for activities within a time window.
		/// - Parameters:
		///   - gift_card_id: (Beta) If a gift card ID is provided, the endpoint returns activities related  to the specified gift card. Otherwise, the endpoint returns all gift card activities for  the seller.
		///   - type: (Beta) If a [type](https://developer.squareup.com/reference/square_2021-12-15/enums/GiftCardActivityType) is provided, the endpoint returns gift card activities of the specified type.  Otherwise, the endpoint returns all types of gift card activities.
		///   - location_id: (Beta) If a location ID is provided, the endpoint returns gift card activities for the specified location.  Otherwise, the endpoint returns gift card activities for all locations.
		///   - begin_time: (Beta) The timestamp for the beginning of the reporting period, in RFC 3339 format. This start time is inclusive. The default value is the current time minus one year.
		///   - end_time: (Beta) The timestamp for the end of the reporting period, in RFC 3339 format. This end time is inclusive. The default value is the current time.
		///   - limit: (Beta) If a limit is provided, the endpoint returns the specified number  of results (or fewer) per page. The maximum value is 100. The default value is 50. For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
		///   - cursor: (Beta) A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query. If a cursor is not provided, the endpoint returns the first page of the results. For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
		///   - sort_order: (Beta) The order in which the endpoint returns the activities, based on `created_at`. - `ASC` - Oldest to newest. - `DESC` - Newest to oldest (default).
		public init(gift_card_id: String? = nil, type: String? = nil, location_id: String? = nil, begin_time: String? = nil, end_time: String? = nil, limit: Int? = nil, cursor: String? = nil, sort_order: String? = nil) {
			self.gift_card_id = gift_card_id
			self.type = type
			self.location_id = location_id
			self.begin_time = begin_time
			self.end_time = end_time
			self.limit = limit
			self.cursor = cursor
			self.sort_order = sort_order
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/gift-cards/activities"
		var queries = [String]()
		if let v = inputs.gift_card_id { queries.append("gift_card_id=\(v)") }
		if let v = inputs.type { queries.append("type=\(v)") }
		if let v = inputs.location_id { queries.append("location_id=\(v)") }
		if let v = inputs.begin_time { queries.append("begin_time=\(v)") }
		if let v = inputs.end_time { queries.append("end_time=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if let v = inputs.sort_order { queries.append("sort_order=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Creates a gift card activity. For more information, see  [GiftCardActivity](https://developer.squareup.com/docs/gift-cards/using-gift-cards-api#giftcardactivity) and  [Using activated gift cards](https://developer.squareup.com/docs/gift-cards/using-gift-cards-api#using-activated-gift-cards).
public struct CreateGiftCardActivity: SquareAPIEndpoint {
	public typealias inputType = CreateGiftCardActivityRequest
	public typealias outputType = CreateGiftCardActivityResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/gift-cards/activities"
	}
}

