/// Retrieves a list of payments taken by the account making the request.  Results are eventually consistent, and new payments or changes to payments might take several seconds to appear.  The maximum results per page is 100.
public struct ListPayments: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListPaymentsResponse
	public typealias paramType = Params
	public struct Params {
		let begin_time: String?
		let end_time: String?
		let sort_order: String?
		let cursor: String?
		let location_id: String?
		let total: Int?
		let last_4: String?
		let card_brand: String?
		let limit: Int?
		/// Retrieves a list of payments taken by the account making the request.  Results are eventually consistent, and new payments or changes to payments might take several seconds to appear.  The maximum results per page is 100.
		/// - Parameters:
		///   - begin_time: The timestamp for the beginning of the reporting period, in RFC 3339 format. Inclusive. Default: The current time minus one year.
		///   - end_time: The timestamp for the end of the reporting period, in RFC 3339 format.  Default: The current time.
		///   - sort_order: The order in which results are listed: - `ASC` - Oldest to newest. - `DESC` - Newest to oldest (default).
		///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query.  For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
		///   - location_id: Limit results to the location supplied. By default, results are returned for the default (main) location associated with the seller.
		///   - total: The exact amount in the `total_money` for a payment.
		///   - last_4: The last four digits of a payment card.
		///   - card_brand: The brand of the payment card (for example, VISA).
		///   - limit: The maximum number of results to be returned in a single page. It is possible to receive fewer results than the specified limit on a given page.  The default value of 100 is also the maximum allowed value. If the provided value is  greater than 100, it is ignored and the default value is used instead.  Default: `100`
		public init(begin_time: String? = nil, end_time: String? = nil, sort_order: String? = nil, cursor: String? = nil, location_id: String? = nil, total: Int? = nil, last_4: String? = nil, card_brand: String? = nil, limit: Int? = nil) {
			self.begin_time = begin_time
			self.end_time = end_time
			self.sort_order = sort_order
			self.cursor = cursor
			self.location_id = location_id
			self.total = total
			self.last_4 = last_4
			self.card_brand = card_brand
			self.limit = limit
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/payments"
		var queries = [String]()
		if let v = inputs.begin_time { queries.append("begin_time=\(v)") }
		if let v = inputs.end_time { queries.append("end_time=\(v)") }
		if let v = inputs.sort_order { queries.append("sort_order=\(v)") }
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if let v = inputs.location_id { queries.append("location_id=\(v)") }
		if let v = inputs.total { queries.append("total=\(v)") }
		if let v = inputs.last_4 { queries.append("last_4=\(v)") }
		if let v = inputs.card_brand { queries.append("card_brand=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Creates a payment using the provided source. You can use this endpoint  to charge a card (credit/debit card or     Square gift card) or record a payment that the seller received outside of Square  (cash payment from a buyer or a payment that an external entity  processed on behalf of the seller).  The endpoint creates a  `Payment` object and returns it in the response.
public struct CreatePayment: SquareAPIEndpoint {
	public typealias inputType = CreatePaymentRequest
	public typealias outputType = CreatePaymentResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/payments"
	}
}

/// Cancels (voids) a payment identified by the idempotency key that is specified in the request.  Use this method when the status of a `CreatePayment` request is unknown (for example, after you send a `CreatePayment` request, a network error occurs and you do not get a response). In this case, you can direct Square to cancel the payment using this endpoint. In the request, you provide the same idempotency key that you provided in your `CreatePayment` request that you want to cancel. After canceling the payment, you can submit your `CreatePayment` request again.  Note that if no payment with the specified idempotency key is found, no action is taken and the endpoint returns successfully.
public struct CancelPaymentByIdempotencyKey: SquareAPIEndpoint {
	public typealias inputType = CancelPaymentByIdempotencyKeyRequest
	public typealias outputType = CancelPaymentByIdempotencyKeyResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/payments/cancel"
	}
}

/// Retrieves details for a specific payment.
public struct GetPayment: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetPaymentResponse
	public typealias paramType = Params
	public struct Params {
		let payment_id: String
		/// Retrieves details for a specific payment.
		/// - Parameters:
		///   - payment_id: A unique ID for the desired payment.
		public init(payment_id: String) {
			self.payment_id = payment_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/payments/\(inputs.payment_id)"
		return url
	}
}

/// Updates a payment with the APPROVED status. You can update the `amount_money` and `tip_money` using this endpoint.
public struct UpdatePayment: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdatePaymentRequest
	public typealias outputType = UpdatePaymentResponse
	public typealias paramType = Params
	public struct Params {
		let payment_id: String
		/// Updates a payment with the APPROVED status. You can update the `amount_money` and `tip_money` using this endpoint.
		/// - Parameters:
		///   - payment_id: (Beta) The ID of the payment to update.
		public init(payment_id: String) {
			self.payment_id = payment_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/payments/\(inputs.payment_id)"
		return url
	}
}

/// Cancels (voids) a payment. You can use this endpoint to cancel a payment with  the APPROVED `status`.
public struct CancelPayment: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CancelPaymentResponse
	public typealias paramType = Params
	public struct Params {
		let payment_id: String
		/// Cancels (voids) a payment. You can use this endpoint to cancel a payment with  the APPROVED `status`.
		/// - Parameters:
		///   - payment_id: The ID of the payment to cancel.
		public init(payment_id: String) {
			self.payment_id = payment_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/payments/\(inputs.payment_id)/cancel"
		return url
	}
}

/// Completes (captures) a payment. By default, payments are set to complete immediately after they are created.  You can use this endpoint to complete a payment with the APPROVED `status`.
public struct CompletePayment: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CompletePaymentResponse
	public typealias paramType = Params
	public struct Params {
		let payment_id: String
		/// Completes (captures) a payment. By default, payments are set to complete immediately after they are created.  You can use this endpoint to complete a payment with the APPROVED `status`.
		/// - Parameters:
		///   - payment_id: The unique ID identifying the payment to be completed.
		public init(payment_id: String) {
			self.payment_id = payment_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/payments/\(inputs.payment_id)/complete"
		return url
	}
}

