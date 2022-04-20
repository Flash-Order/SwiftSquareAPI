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

/// Captures a transaction that was created with the [Charge](https://developer.squareup.com/reference/square_2022-04-20/transactions-api/charge) endpoint with a `delay_capture` value of `true`.   See [Delayed capture transactions](https://developer.squareup.com/docs/payments/transactions/overview#delayed-capture) for more information.
@available(*,deprecated)
public struct CaptureTransaction: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CaptureTransactionResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let transaction_id: String
		/// Captures a transaction that was created with the [Charge](https://developer.squareup.com/reference/square_2022-04-20/transactions-api/charge) endpoint with a `delay_capture` value of `true`.   See [Delayed capture transactions](https://developer.squareup.com/docs/payments/transactions/overview#delayed-capture) for more information.
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

/// Cancels a transaction that was created with the [Charge](https://developer.squareup.com/reference/square_2022-04-20/transactions-api/charge) endpoint with a `delay_capture` value of `true`.   See [Delayed capture transactions](https://developer.squareup.com/docs/payments/transactions/overview#delayed-capture) for more information.
@available(*,deprecated)
public struct VoidTransaction: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = VoidTransactionResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let transaction_id: String
		/// Cancels a transaction that was created with the [Charge](https://developer.squareup.com/reference/square_2022-04-20/transactions-api/charge) endpoint with a `delay_capture` value of `true`.   See [Delayed capture transactions](https://developer.squareup.com/docs/payments/transactions/overview#delayed-capture) for more information.
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

