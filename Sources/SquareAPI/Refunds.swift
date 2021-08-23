/// Retrieves a list of refunds for the account making the request.  Results are eventually consistent, and new refunds or changes to refunds might take several seconds to appear.  The maximum results per page is 100.
public struct ListPaymentRefunds: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListPaymentRefundsResponse
	public typealias paramType = Params
	public struct Params {
		let begin_time: String?
		let end_time: String?
		let sort_order: String?
		let cursor: String?
		let location_id: String?
		let status: String?
		let source_type: String?
		let limit: Int?
		/// Retrieves a list of refunds for the account making the request.  Results are eventually consistent, and new refunds or changes to refunds might take several seconds to appear.  The maximum results per page is 100.
		/// - Parameters:
		///   - begin_time: The timestamp for the beginning of the requested reporting period, in RFC 3339 format.  Default: The current time minus one year.
		///   - end_time: The timestamp for the end of the requested reporting period, in RFC 3339 format.  Default: The current time.
		///   - sort_order: The order in which results are listed: - `ASC` - Oldest to newest. - `DESC` - Newest to oldest (default).
		///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query.  For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
		///   - location_id: Limit results to the location supplied. By default, results are returned for all locations associated with the seller.
		///   - status: If provided, only refunds with the given status are returned. For a list of refund status values, see [PaymentRefund](https://developer.squareup.com/reference/square_2021-08-18/objects/PaymentRefund).  Default: If omitted, refunds are returned regardless of their status.
		///   - source_type: If provided, only refunds with the given source type are returned. - `CARD` - List refunds only for payments where `CARD` was specified as the payment source.  Default: If omitted, refunds are returned regardless of the source type.
		///   - limit: The maximum number of results to be returned in a single page.  It is possible to receive fewer results than the specified limit on a given page.  If the supplied value is greater than 100, no more than 100 results are returned.  Default: 100
		public init(begin_time: String? = nil, end_time: String? = nil, sort_order: String? = nil, cursor: String? = nil, location_id: String? = nil, status: String? = nil, source_type: String? = nil, limit: Int? = nil) {
			self.begin_time = begin_time
			self.end_time = end_time
			self.sort_order = sort_order
			self.cursor = cursor
			self.location_id = location_id
			self.status = status
			self.source_type = source_type
			self.limit = limit
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/refunds"
		var queries = [String]()
		if let v = inputs.begin_time { queries.append("begin_time=\(v)") }
		if let v = inputs.end_time { queries.append("end_time=\(v)") }
		if let v = inputs.sort_order { queries.append("sort_order=\(v)") }
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if let v = inputs.location_id { queries.append("location_id=\(v)") }
		if let v = inputs.status { queries.append("status=\(v)") }
		if let v = inputs.source_type { queries.append("source_type=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Refunds a payment. You can refund the entire payment amount or a portion of it. You can use this endpoint to refund a card payment or record a  refund of a cash or external payment. For more information, see [Refund Payment](https://developer.squareup.com/docs/payments-api/refund-payments).
public struct RefundPayment: SquareAPIEndpoint {
	public typealias inputType = RefundPaymentRequest
	public typealias outputType = RefundPaymentResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/refunds"
	}
}

/// Retrieves a specific refund using the `refund_id`.
public struct GetPaymentRefund: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetPaymentRefundResponse
	public typealias paramType = Params
	public struct Params {
		let refund_id: String
		/// Retrieves a specific refund using the `refund_id`.
		/// - Parameters:
		///   - refund_id: The unique ID for the desired `PaymentRefund`.
		public init(refund_id: String) {
			self.refund_id = refund_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/refunds/\(inputs.refund_id)"
		return url
	}
}

