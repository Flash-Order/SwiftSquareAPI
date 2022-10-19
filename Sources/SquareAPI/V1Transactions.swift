/// Provides summary information for a merchant's online store orders.
@available(*,deprecated)
public struct V1V1ListOrders: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Order]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let order: String?
		let limit: Int?
		let batch_token: String?
		/// Provides summary information for a merchant's online store orders.
		/// - Parameters:
		///   - location_id: The ID of the location to list online store orders for.
		///   - order: The order in which payments are listed in the response.
		///   - limit: The maximum number of payments to return in a single response. This value cannot exceed 200.
		///   - batch_token: A pagination cursor to retrieve the next set of results for your original query to the endpoint.
		public init(location_id: String, order: String? = nil, limit: Int? = nil, batch_token: String? = nil) {
			self.location_id = location_id
			self.order = order
			self.limit = limit
			self.batch_token = batch_token
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/orders"
		var queries = [String]()
		if let v = inputs.order { queries.append("order=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if let v = inputs.batch_token { queries.append("batch_token=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Provides comprehensive information for a single online store order, including the order's history.
@available(*,deprecated)
public struct V1V1RetrieveOrder: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1Order
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let order_id: String
		/// Provides comprehensive information for a single online store order, including the order's history.
		/// - Parameters:
		///   - location_id: The ID of the order's associated location.
		///   - order_id: The order's Square-issued ID. You obtain this value from Order objects returned by the List Orders endpoint
		public init(location_id: String, order_id: String) {
			self.location_id = location_id
			self.order_id = order_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/orders/\(inputs.order_id)"
		return url
	}
}

/// Updates the details of an online store order. Every update you perform on an order corresponds to one of three actions:
@available(*,deprecated)
public struct V1V1UpdateOrder: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = V1UpdateOrderRequest
	public typealias outputType = V1Order
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let order_id: String
		/// Updates the details of an online store order. Every update you perform on an order corresponds to one of three actions:
		/// - Parameters:
		///   - location_id: The ID of the order's associated location.
		///   - order_id: The order's Square-issued ID. You obtain this value from Order objects returned by the List Orders endpoint
		public init(location_id: String, order_id: String) {
			self.location_id = location_id
			self.order_id = order_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/orders/\(inputs.order_id)"
		return url
	}
}

/// Provides summary information for all payments taken for a given Square account during a date range. Date ranges cannot exceed 1 year in length. See Date ranges for details of inclusive and exclusive dates.  *Note**: Details for payments processed with Square Point of Sale while in offline mode may not be transmitted to Square for up to 72 hours. Offline payments have a `created_at` value that reflects the time the payment was originally processed, not the time it was subsequently transmitted to Square. Consequently, the ListPayments endpoint might list an offline payment chronologically between online payments that were seen in a previous request.
@available(*,deprecated)
public struct V1V1ListPayments: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Payment]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let order: String?
		let begin_time: String?
		let end_time: String?
		let limit: Int?
		let batch_token: String?
		let include_partial: Bool?
		/// Provides summary information for all payments taken for a given Square account during a date range. Date ranges cannot exceed 1 year in length. See Date ranges for details of inclusive and exclusive dates.  *Note**: Details for payments processed with Square Point of Sale while in offline mode may not be transmitted to Square for up to 72 hours. Offline payments have a `created_at` value that reflects the time the payment was originally processed, not the time it was subsequently transmitted to Square. Consequently, the ListPayments endpoint might list an offline payment chronologically between online payments that were seen in a previous request.
		/// - Parameters:
		///   - location_id: The ID of the location to list payments for. If you specify me, this endpoint returns payments aggregated from all of the business's locations.
		///   - order: The order in which payments are listed in the response.
		///   - begin_time: The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year.
		///   - end_time: The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time.
		///   - limit: The maximum number of payments to return in a single response. This value cannot exceed 200.
		///   - batch_token: A pagination cursor to retrieve the next set of results for your original query to the endpoint.
		///   - include_partial: Indicates whether or not to include partial payments in the response. Partial payments will have the tenders collected so far, but the itemizations will be empty until the payment is completed.
		public init(location_id: String, order: String? = nil, begin_time: String? = nil, end_time: String? = nil, limit: Int? = nil, batch_token: String? = nil, include_partial: Bool? = nil) {
			self.location_id = location_id
			self.order = order
			self.begin_time = begin_time
			self.end_time = end_time
			self.limit = limit
			self.batch_token = batch_token
			self.include_partial = include_partial
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/payments"
		var queries = [String]()
		if let v = inputs.order { queries.append("order=\(v)") }
		if let v = inputs.begin_time { queries.append("begin_time=\(v)") }
		if let v = inputs.end_time { queries.append("end_time=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if let v = inputs.batch_token { queries.append("batch_token=\(v)") }
		if let v = inputs.include_partial { queries.append("include_partial=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Provides comprehensive information for a single payment.
@available(*,deprecated)
public struct V1V1RetrievePayment: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1Payment
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let payment_id: String
		/// Provides comprehensive information for a single payment.
		/// - Parameters:
		///   - location_id: The ID of the payment's associated location.
		///   - payment_id: The Square-issued payment ID. payment_id comes from Payment objects returned by the List Payments endpoint, Settlement objects returned by the List Settlements endpoint, or Refund objects returned by the List Refunds endpoint.
		public init(location_id: String, payment_id: String) {
			self.location_id = location_id
			self.payment_id = payment_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/payments/\(inputs.payment_id)"
		return url
	}
}

/// Provides the details for all refunds initiated by a merchant or any of the merchant's mobile staff during a date range. Date ranges cannot exceed one year in length.
@available(*,deprecated)
public struct V1V1ListRefunds: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Refund]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let order: String?
		let begin_time: String?
		let end_time: String?
		let limit: Int?
		let batch_token: String?
		/// Provides the details for all refunds initiated by a merchant or any of the merchant's mobile staff during a date range. Date ranges cannot exceed one year in length.
		/// - Parameters:
		///   - location_id: The ID of the location to list refunds for.
		///   - order: The order in which payments are listed in the response.
		///   - begin_time: The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year.
		///   - end_time: The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time.
		///   - limit: The approximate number of refunds to return in a single response. Default: 100. Max: 200. Response may contain more results than the prescribed limit when refunds are made simultaneously to multiple tenders in a payment or when refunds are generated in an exchange to account for the value of returned goods.
		///   - batch_token: A pagination cursor to retrieve the next set of results for your original query to the endpoint.
		public init(location_id: String, order: String? = nil, begin_time: String? = nil, end_time: String? = nil, limit: Int? = nil, batch_token: String? = nil) {
			self.location_id = location_id
			self.order = order
			self.begin_time = begin_time
			self.end_time = end_time
			self.limit = limit
			self.batch_token = batch_token
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/refunds"
		var queries = [String]()
		if let v = inputs.order { queries.append("order=\(v)") }
		if let v = inputs.begin_time { queries.append("begin_time=\(v)") }
		if let v = inputs.end_time { queries.append("end_time=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if let v = inputs.batch_token { queries.append("batch_token=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Issues a refund for a previously processed payment. You must issue a refund within 60 days of the associated payment.  You cannot issue a partial refund for a split tender payment. You must instead issue a full or partial refund for a particular tender, by providing the applicable tender id to the V1CreateRefund endpoint. Issuing a full refund for a split tender payment refunds all tenders associated with the payment.  Issuing a refund for a card payment is not reversible. For development purposes, you can create fake cash payments in Square Point of Sale and refund them.
@available(*,deprecated)
public struct V1V1CreateRefund: SquareAPIEndpoint {
	public typealias inputType = V1CreateRefundRequest
	public typealias outputType = V1Refund
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Issues a refund for a previously processed payment. You must issue a refund within 60 days of the associated payment.  You cannot issue a partial refund for a split tender payment. You must instead issue a full or partial refund for a particular tender, by providing the applicable tender id to the V1CreateRefund endpoint. Issuing a full refund for a split tender payment refunds all tenders associated with the payment.  Issuing a refund for a card payment is not reversible. For development purposes, you can create fake cash payments in Square Point of Sale and refund them.
		/// - Parameters:
		///   - location_id: The ID of the original payment's associated location.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/refunds"
		return url
	}
}

/// Provides summary information for all deposits and withdrawals initiated by Square to a linked bank account during a date range. Date ranges cannot exceed one year in length.  *Note**: the ListSettlements endpoint does not provide entry information.
@available(*,deprecated)
public struct V1V1ListSettlements: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Settlement]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let order: String?
		let begin_time: String?
		let end_time: String?
		let limit: Int?
		let status: String?
		let batch_token: String?
		/// Provides summary information for all deposits and withdrawals initiated by Square to a linked bank account during a date range. Date ranges cannot exceed one year in length.  *Note**: the ListSettlements endpoint does not provide entry information.
		/// - Parameters:
		///   - location_id: The ID of the location to list settlements for. If you specify me, this endpoint returns settlements aggregated from all of the business's locations.
		///   - order: The order in which settlements are listed in the response.
		///   - begin_time: The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year.
		///   - end_time: The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time.
		///   - limit: The maximum number of settlements to return in a single response. This value cannot exceed 200.
		///   - status: Provide this parameter to retrieve only settlements with a particular status (SENT or FAILED).
		///   - batch_token: A pagination cursor to retrieve the next set of results for your original query to the endpoint.
		public init(location_id: String, order: String? = nil, begin_time: String? = nil, end_time: String? = nil, limit: Int? = nil, status: String? = nil, batch_token: String? = nil) {
			self.location_id = location_id
			self.order = order
			self.begin_time = begin_time
			self.end_time = end_time
			self.limit = limit
			self.status = status
			self.batch_token = batch_token
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/settlements"
		var queries = [String]()
		if let v = inputs.order { queries.append("order=\(v)") }
		if let v = inputs.begin_time { queries.append("begin_time=\(v)") }
		if let v = inputs.end_time { queries.append("end_time=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if let v = inputs.status { queries.append("status=\(v)") }
		if let v = inputs.batch_token { queries.append("batch_token=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Provides comprehensive information for a single settlement.  The returned `Settlement` objects include an `entries` field that lists the transactions that contribute to the settlement total. Most settlement entries correspond to a payment payout, but settlement entries are also generated for less common events, like refunds, manual adjustments, or chargeback holds.  Square initiates its regular deposits as indicated in the [Deposit Options with Square](https://squareup.com/help/us/en/article/3807) help article. Details for a regular deposit are usually not available from Connect API endpoints before 10 p.m. PST the same day.  Square does not know when an initiated settlement **completes**, only whether it has failed. A completed settlement is typically reflected in a bank account within 3 business days, but in exceptional cases it may take longer.
@available(*,deprecated)
public struct V1V1RetrieveSettlement: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1Settlement
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let settlement_id: String
		/// Provides comprehensive information for a single settlement.  The returned `Settlement` objects include an `entries` field that lists the transactions that contribute to the settlement total. Most settlement entries correspond to a payment payout, but settlement entries are also generated for less common events, like refunds, manual adjustments, or chargeback holds.  Square initiates its regular deposits as indicated in the [Deposit Options with Square](https://squareup.com/help/us/en/article/3807) help article. Details for a regular deposit are usually not available from Connect API endpoints before 10 p.m. PST the same day.  Square does not know when an initiated settlement **completes**, only whether it has failed. A completed settlement is typically reflected in a bank account within 3 business days, but in exceptional cases it may take longer.
		/// - Parameters:
		///   - location_id: The ID of the settlements's associated location.
		///   - settlement_id: The settlement's Square-issued ID. You obtain this value from Settlement objects returned by the List Settlements endpoint.
		public init(location_id: String, settlement_id: String) {
			self.location_id = location_id
			self.settlement_id = settlement_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/settlements/\(inputs.settlement_id)"
		return url
	}
}

