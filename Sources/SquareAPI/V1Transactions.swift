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

