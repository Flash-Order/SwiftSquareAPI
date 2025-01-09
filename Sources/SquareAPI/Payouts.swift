/// Retrieves a list of all payouts for the default location. You can filter payouts by location ID, status, time range, and order them in ascending or descending order. To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
public struct ListPayouts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListPayoutsResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String?
		let status: PayoutStatus?
		let begin_time: String?
		let end_time: String?
		let sort_order: SortOrder?
		let cursor: String?
		let limit: Int?
		/// Retrieves a list of all payouts for the default location. You can filter payouts by location ID, status, time range, and order them in ascending or descending order. To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
		/// - Parameters:
		///   - location_id: The ID of the location for which to list the payouts. By default, payouts are returned for the default (main) location associated with the seller.
		///   - status: If provided, only payouts with the given status are returned.
		///   - begin_time: The timestamp for the beginning of the payout creation time, in RFC 3339 format. Inclusive. Default: The current time minus one year.
		///   - end_time: The timestamp for the end of the payout creation time, in RFC 3339 format. Default: The current time.
		///   - sort_order: The order in which payouts are listed.
		///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination). If request parameters change between requests, subsequent results may contain duplicates or missing records.
		///   - limit: The maximum number of results to be returned in a single page. It is possible to receive fewer results than the specified limit on a given page. The default value of 100 is also the maximum allowed value. If the provided value is greater than 100, it is ignored and the default value is used instead. Default: `100`
		public init(location_id: String? = nil, status: PayoutStatus? = nil, begin_time: String? = nil, end_time: String? = nil, sort_order: SortOrder? = nil, cursor: String? = nil, limit: Int? = nil) {
			self.location_id = location_id
			self.status = status
			self.begin_time = begin_time
			self.end_time = end_time
			self.sort_order = sort_order
			self.cursor = cursor
			self.limit = limit
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/payouts"
		var queries = [String]()
		if let v = inputs.location_id { queries.append("location_id=\(v)") }
		if let v = inputs.status { queries.append("status=\(v)") }
		if let v = inputs.begin_time { queries.append("begin_time=\(v)") }
		if let v = inputs.end_time { queries.append("end_time=\(v)") }
		if let v = inputs.sort_order { queries.append("sort_order=\(v)") }
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Retrieves details of a specific payout identified by a payout ID. To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
public struct GetPayout: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetPayoutResponse
	public typealias paramType = Params
	public struct Params {
		let payout_id: String
		/// Retrieves details of a specific payout identified by a payout ID. To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
		/// - Parameters:
		///   - payout_id: The ID of the payout to retrieve the information for.
		public init(payout_id: String) {
			self.payout_id = payout_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/payouts/\(inputs.payout_id)"
		return url
	}
}

/// Retrieves a list of all payout entries for a specific payout. To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
public struct ListPayoutEntries: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListPayoutEntriesResponse
	public typealias paramType = Params
	public struct Params {
		let payout_id: String
		let sort_order: SortOrder?
		let cursor: String?
		let limit: Int?
		/// Retrieves a list of all payout entries for a specific payout. To call this endpoint, set `PAYOUTS_READ` for the OAuth scope.
		/// - Parameters:
		///   - payout_id: The ID of the payout to retrieve the information for.
		///   - sort_order: The order in which payout entries are listed.
		///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination). If request parameters change between requests, subsequent results may contain duplicates or missing records.
		///   - limit: The maximum number of results to be returned in a single page. It is possible to receive fewer results than the specified limit on a given page. The default value of 100 is also the maximum allowed value. If the provided value is greater than 100, it is ignored and the default value is used instead. Default: `100`
		public init(payout_id: String, sort_order: SortOrder? = nil, cursor: String? = nil, limit: Int? = nil) {
			self.payout_id = payout_id
			self.sort_order = sort_order
			self.cursor = cursor
			self.limit = limit
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/payouts/\(inputs.payout_id)/payout-entries"
		var queries = [String]()
		if let v = inputs.sort_order { queries.append("sort_order=\(v)") }
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

