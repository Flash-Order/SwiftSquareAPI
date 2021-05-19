/// Lists refunds for one of a business's locations.  In addition to full or partial tender refunds processed through Square APIs, refunds may result from itemized returns or exchanges through Square's Point of Sale applications.  Refunds with a `status` of `PENDING` are not currently included in this endpoint's response.  Max results per [page](https://developer.squareup.com/docs/working-with-apis/pagination): 50
@available(*,deprecated)
public struct ListRefunds: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListRefundsResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let begin_time: String?
		let end_time: String?
		let sort_order: String?
		let cursor: String?
		/// Lists refunds for one of a business's locations.  In addition to full or partial tender refunds processed through Square APIs, refunds may result from itemized returns or exchanges through Square's Point of Sale applications.  Refunds with a `status` of `PENDING` are not currently included in this endpoint's response.  Max results per [page](https://developer.squareup.com/docs/working-with-apis/pagination): 50
		/// - Parameters:
		///   - location_id: The ID of the location to list refunds for.
		///   - begin_time: The beginning of the requested reporting period, in RFC 3339 format.  See [Date ranges](https://developer.squareup.com/docs/build-basics/working-with-dates) for details on date inclusivity/exclusivity.  Default value: The current time minus one year.
		///   - end_time: The end of the requested reporting period, in RFC 3339 format.  See [Date ranges](https://developer.squareup.com/docs/build-basics/working-with-dates) for details on date inclusivity/exclusivity.  Default value: The current time.
		///   - sort_order: The order in which results are listed in the response (`ASC` for oldest first, `DESC` for newest first).  Default value: `DESC`
		///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query.  See [Paginating results](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
		public init(location_id: String, begin_time: String? = nil, end_time: String? = nil, sort_order: String? = nil, cursor: String? = nil) {
			self.location_id = location_id
			self.begin_time = begin_time
			self.end_time = end_time
			self.sort_order = sort_order
			self.cursor = cursor
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/locations/\(inputs.location_id)/refunds"
		var queries = [String]()
		if let v = inputs.begin_time { queries.append("begin_time=\(v)") }
		if let v = inputs.end_time { queries.append("end_time=\(v)") }
		if let v = inputs.sort_order { queries.append("sort_order=\(v)") }
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Lists transactions for a particular location.  Transactions include payment information from sales and exchanges and refund information from returns and exchanges.  Max results per [page](https://developer.squareup.com/docs/working-with-apis/pagination): 50
@available(*,deprecated)
public struct ListTransactions: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListTransactionsResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let begin_time: String?
		let end_time: String?
		let sort_order: String?
		let cursor: String?
		/// Lists transactions for a particular location.  Transactions include payment information from sales and exchanges and refund information from returns and exchanges.  Max results per [page](https://developer.squareup.com/docs/working-with-apis/pagination): 50
		/// - Parameters:
		///   - location_id: The ID of the location to list transactions for.
		///   - begin_time: The beginning of the requested reporting period, in RFC 3339 format.  See [Date ranges](https://developer.squareup.com/docs/build-basics/working-with-dates) for details on date inclusivity/exclusivity.  Default value: The current time minus one year.
		///   - end_time: The end of the requested reporting period, in RFC 3339 format.  See [Date ranges](https://developer.squareup.com/docs/build-basics/working-with-dates) for details on date inclusivity/exclusivity.  Default value: The current time.
		///   - sort_order: The order in which results are listed in the response (`ASC` for oldest first, `DESC` for newest first).  Default value: `DESC`
		///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query.  See [Paginating results](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
		public init(location_id: String, begin_time: String? = nil, end_time: String? = nil, sort_order: String? = nil, cursor: String? = nil) {
			self.location_id = location_id
			self.begin_time = begin_time
			self.end_time = end_time
			self.sort_order = sort_order
			self.cursor = cursor
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/locations/\(inputs.location_id)/transactions"
		var queries = [String]()
		if let v = inputs.begin_time { queries.append("begin_time=\(v)") }
		if let v = inputs.end_time { queries.append("end_time=\(v)") }
		if let v = inputs.sort_order { queries.append("sort_order=\(v)") }
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Charges a card represented by a card nonce or a customer's card on file.  Your request to this endpoint must include _either_:  - A value for the `card_nonce` parameter (to charge a card nonce generated with the `SqPaymentForm`) - Values for the `customer_card_id` and `customer_id` parameters (to charge a customer's card on file)  In order for an eCommerce payment to potentially qualify for [Square chargeback protection](https://squareup.com/help/article/5394), you _must_ provide values for the following parameters in your request:  - `buyer_email_address` - At least one of `billing_address` or `shipping_address`  When this response is returned, the amount of Square's processing fee might not yet be calculated. To obtain the processing fee, wait about ten seconds and call [RetrieveTransaction](https://developer.squareup.com/reference/square_2021-05-13/transactions-api/retrieve-transaction). See the `processing_fee_money` field of each [Tender included](https://developer.squareup.com/reference/square_2021-05-13/objects/Tender) in the transaction.
@available(*,deprecated)
public struct Charge: SquareAPIEndpoint {
	public typealias inputType = ChargeRequest
	public typealias outputType = ChargeResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Charges a card represented by a card nonce or a customer's card on file.  Your request to this endpoint must include _either_:  - A value for the `card_nonce` parameter (to charge a card nonce generated with the `SqPaymentForm`) - Values for the `customer_card_id` and `customer_id` parameters (to charge a customer's card on file)  In order for an eCommerce payment to potentially qualify for [Square chargeback protection](https://squareup.com/help/article/5394), you _must_ provide values for the following parameters in your request:  - `buyer_email_address` - At least one of `billing_address` or `shipping_address`  When this response is returned, the amount of Square's processing fee might not yet be calculated. To obtain the processing fee, wait about ten seconds and call [RetrieveTransaction](https://developer.squareup.com/reference/square_2021-05-13/transactions-api/retrieve-transaction). See the `processing_fee_money` field of each [Tender included](https://developer.squareup.com/reference/square_2021-05-13/objects/Tender) in the transaction.
		/// - Parameters:
		///   - location_id: The ID of the location to associate the created transaction with.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/locations/\(inputs.location_id)/transactions"
		return url
	}
}

/// Retrieves details for a single transaction.
@available(*,deprecated)
public struct RetrieveTransaction: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveTransactionResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let transaction_id: String
		/// Retrieves details for a single transaction.
		/// - Parameters:
		///   - location_id: The ID of the transaction's associated location.
		///   - transaction_id: The ID of the transaction to retrieve.
		public init(location_id: String, transaction_id: String) {
			self.location_id = location_id
			self.transaction_id = transaction_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/locations/\(inputs.location_id)/transactions/\(inputs.transaction_id)"
		return url
	}
}

/// Captures a transaction that was created with the [Charge](https://developer.squareup.com/reference/square_2021-05-13/transactions-api/charge) endpoint with a `delay_capture` value of `true`.   See [Delayed capture transactions](https://developer.squareup.com/docs/payments/transactions/overview#delayed-capture) for more information.
@available(*,deprecated)
public struct CaptureTransaction: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CaptureTransactionResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let transaction_id: String
		/// Captures a transaction that was created with the [Charge](https://developer.squareup.com/reference/square_2021-05-13/transactions-api/charge) endpoint with a `delay_capture` value of `true`.   See [Delayed capture transactions](https://developer.squareup.com/docs/payments/transactions/overview#delayed-capture) for more information.
		/// - Parameters:
		///   - location_id: 
		///   - transaction_id: 
		public init(location_id: String, transaction_id: String) {
			self.location_id = location_id
			self.transaction_id = transaction_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/locations/\(inputs.location_id)/transactions/\(inputs.transaction_id)/capture"
		return url
	}
}

/// Initiates a refund for a previously charged tender.  You must issue a refund within 120 days of the associated payment. See [this article](https://squareup.com/help/us/en/article/5060) for more information on refund behavior.  NOTE: Card-present transactions with Interac credit cards **cannot be refunded using the Connect API**. Interac transactions must refunded in-person (e.g., dipping the card using POS app).
@available(*,deprecated)
public struct CreateRefund: SquareAPIEndpoint {
	public typealias inputType = CreateRefundRequest
	public typealias outputType = CreateRefundResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let transaction_id: String
		/// Initiates a refund for a previously charged tender.  You must issue a refund within 120 days of the associated payment. See [this article](https://squareup.com/help/us/en/article/5060) for more information on refund behavior.  NOTE: Card-present transactions with Interac credit cards **cannot be refunded using the Connect API**. Interac transactions must refunded in-person (e.g., dipping the card using POS app).
		/// - Parameters:
		///   - location_id: The ID of the original transaction's associated location.
		///   - transaction_id: The ID of the original transaction that includes the tender to refund.
		public init(location_id: String, transaction_id: String) {
			self.location_id = location_id
			self.transaction_id = transaction_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/locations/\(inputs.location_id)/transactions/\(inputs.transaction_id)/refund"
		return url
	}
}

/// Cancels a transaction that was created with the [Charge](https://developer.squareup.com/reference/square_2021-05-13/transactions-api/charge) endpoint with a `delay_capture` value of `true`.   See [Delayed capture transactions](https://developer.squareup.com/docs/payments/transactions/overview#delayed-capture) for more information.
@available(*,deprecated)
public struct VoidTransaction: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = VoidTransactionResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let transaction_id: String
		/// Cancels a transaction that was created with the [Charge](https://developer.squareup.com/reference/square_2021-05-13/transactions-api/charge) endpoint with a `delay_capture` value of `true`.   See [Delayed capture transactions](https://developer.squareup.com/docs/payments/transactions/overview#delayed-capture) for more information.
		/// - Parameters:
		///   - location_id: 
		///   - transaction_id: 
		public init(location_id: String, transaction_id: String) {
			self.location_id = location_id
			self.transaction_id = transaction_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/locations/\(inputs.location_id)/transactions/\(inputs.transaction_id)/void"
		return url
	}
}

