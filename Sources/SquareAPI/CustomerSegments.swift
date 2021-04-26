/// Retrieves the list of customer segments of a business.
public struct ListCustomerSegments: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCustomerSegmentsResponse
	public typealias paramType = Params
	public struct Params {
		let cursor: String?
		/// Retrieves the list of customer segments of a business.
		/// - Parameters:
		///   - cursor: A pagination cursor returned by previous calls to `ListCustomerSegments`. This cursor is used to retrieve the next set of query results.  For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
		public init(cursor: String? = nil) {
			self.cursor = cursor
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/customers/segments"
		var queries = [String]()
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Retrieves a specific customer segment as identified by the `segment_id` value.
public struct RetrieveCustomerSegment: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveCustomerSegmentResponse
	public typealias paramType = Params
	public struct Params {
		let segment_id: String
		/// Retrieves a specific customer segment as identified by the `segment_id` value.
		/// - Parameters:
		///   - segment_id: The Square-issued ID of the customer segment.
		public init(segment_id: String) {
			self.segment_id = segment_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/customers/segments/\(inputs.segment_id)"
		return url
	}
}

