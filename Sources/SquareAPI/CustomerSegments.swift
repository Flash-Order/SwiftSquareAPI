/// Retrieves the list of customer segments of a business.
public struct ListCustomerSegments: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCustomerSegmentsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers/segments"
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
		return "/v2/customers/segments/\(inputs.segment_id)"
	}
}

