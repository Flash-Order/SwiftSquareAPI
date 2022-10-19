/// Provides the details for all of the cash drawer shifts for a location in a date range.
public struct ListCashDrawerShifts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCashDrawerShiftsResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let sort_order: String?
		let begin_time: String?
		let end_time: String?
		let limit: Int?
		let cursor: String?
		/// Provides the details for all of the cash drawer shifts for a location in a date range.
		/// - Parameters:
		///   - location_id: The ID of the location to query for a list of cash drawer shifts.
		///   - sort_order: The order in which cash drawer shifts are listed in the response, based on their opened_at field. Default value: ASC
		///   - begin_time: The inclusive start time of the query on opened_at, in ISO 8601 format.
		///   - end_time: The exclusive end date of the query on opened_at, in ISO 8601 format.
		///   - limit: Number of cash drawer shift events in a page of results (200 by default, 1000 max).
		///   - cursor: Opaque cursor for fetching the next page of results.
		public init(location_id: String, sort_order: String? = nil, begin_time: String? = nil, end_time: String? = nil, limit: Int? = nil, cursor: String? = nil) {
			self.location_id = location_id
			self.sort_order = sort_order
			self.begin_time = begin_time
			self.end_time = end_time
			self.limit = limit
			self.cursor = cursor
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/cash-drawers/shifts"
		var queries = [String]()
		queries.append("location_id=\(inputs.location_id)")
		if let v = inputs.sort_order { queries.append("sort_order=\(v)") }
		if let v = inputs.begin_time { queries.append("begin_time=\(v)") }
		if let v = inputs.end_time { queries.append("end_time=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Provides the summary details for a single cash drawer shift. See [ListCashDrawerShiftEvents](https://developer.squareup.com/reference/square_2022-10-19/cash-drawers-api/list-cash-drawer-shift-events) for a list of cash drawer shift events.
public struct RetrieveCashDrawerShift: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveCashDrawerShiftResponse
	public typealias paramType = Params
	public struct Params {
		let shift_id: String
		let location_id: String
		/// Provides the summary details for a single cash drawer shift. See [ListCashDrawerShiftEvents](https://developer.squareup.com/reference/square_2022-10-19/cash-drawers-api/list-cash-drawer-shift-events) for a list of cash drawer shift events.
		/// - Parameters:
		///   - shift_id: The shift ID.
		///   - location_id: The ID of the location to retrieve cash drawer shifts from.
		public init(shift_id: String, location_id: String) {
			self.shift_id = shift_id
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/cash-drawers/shifts/\(inputs.shift_id)"
		var queries = [String]()
		queries.append("location_id=\(inputs.location_id)")
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Provides a paginated list of events for a single cash drawer shift.
public struct ListCashDrawerShiftEvents: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCashDrawerShiftEventsResponse
	public typealias paramType = Params
	public struct Params {
		let shift_id: String
		let location_id: String
		let limit: Int?
		let cursor: String?
		/// Provides a paginated list of events for a single cash drawer shift.
		/// - Parameters:
		///   - shift_id: The shift ID.
		///   - location_id: The ID of the location to list cash drawer shifts for.
		///   - limit: Number of resources to be returned in a page of results (200 by default, 1000 max).
		///   - cursor: Opaque cursor for fetching the next page of results.
		public init(shift_id: String, location_id: String, limit: Int? = nil, cursor: String? = nil) {
			self.shift_id = shift_id
			self.location_id = location_id
			self.limit = limit
			self.cursor = cursor
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/cash-drawers/shifts/\(inputs.shift_id)/events"
		var queries = [String]()
		queries.append("location_id=\(inputs.location_id)")
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

