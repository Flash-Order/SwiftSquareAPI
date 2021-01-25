/// Creates a new [Order](#type-order) which can include information on products for purchase and settings to apply to the purchase.  To pay for a created order, please refer to the [Pay for Orders](/orders-api/pay-for-orders) guide.  You can modify open orders using the [UpdateOrder](#endpoint-orders-updateorder) endpoint.
public struct CreateOrder: SquareAPIEndpoint {
	public typealias inputType = CreateOrderRequest
	public typealias outputType = CreateOrderResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders"
	}
}

/// Retrieves a set of [Order](#type-order)s by their IDs.  If a given Order ID does not exist, the ID is ignored instead of generating an error.
public struct BatchRetrieveOrders: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveOrdersRequest
	public typealias outputType = BatchRetrieveOrdersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/batch-retrieve"
	}
}

/// Calculates an [Order](#type-order).
public struct CalculateOrder: SquareAPIEndpoint {
	public typealias inputType = CalculateOrderRequest
	public typealias outputType = CalculateOrderResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/calculate"
	}
}

/// Search all orders for one or more locations. Orders include all sales, returns, and exchanges regardless of how or when they entered the Square Ecosystem (e.g. Point of Sale, Invoices, Connect APIs, etc).  SearchOrders requests need to specify which locations to search and define a [`SearchOrdersQuery`](#type-searchordersquery) object which controls how to sort or filter the results. Your SearchOrdersQuery can:    Set filter criteria.   Set sort order.   Determine whether to return results as complete Order objects, or as [OrderEntry](#type-orderentry) objects.  Note that details for orders processed with Square Point of Sale while in offline mode may not be transmitted to Square for up to 72 hours. Offline orders have a `created_at` value that reflects the time the order was created, not the time it was subsequently transmitted to Square.
public struct SearchOrders: SquareAPIEndpoint {
	public typealias inputType = SearchOrdersRequest
	public typealias outputType = SearchOrdersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/search"
	}
}

/// Retrieves an [Order](#type-order) by ID.
public struct RetrieveOrder: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveOrderResponse
	public typealias paramType = Params
	public struct Params {
		let order_id: String
		/// Retrieves an [Order](#type-order) by ID.
		/// - Parameters:
		///   - order_id: The ID of the order to retrieve.
		public init(order_id: String) {
			self.order_id = order_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/orders/\(inputs.order_id)"
	}
}

/// Updates an open [Order](#type-order) by adding, replacing, or deleting fields. Orders with a `COMPLETED` or `CANCELED` state cannot be updated.  An UpdateOrder request requires the following:  - The `order_id` in the endpoint path, identifying the order to update. - The latest `version` of the order to update. - The [sparse order](/orders-api/manage-orders#sparse-order-objects) containing only the fields to update and the version the update is being applied to. - If deleting fields, the [dot notation paths](/orders-api/manage-orders#on-dot-notation) identifying fields to clear.  To pay for an order, please refer to the [Pay for Orders](/orders-api/pay-for-orders) guide.
public struct UpdateOrder: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateOrderRequest
	public typealias outputType = UpdateOrderResponse
	public typealias paramType = Params
	public struct Params {
		let order_id: String
		/// Updates an open [Order](#type-order) by adding, replacing, or deleting fields. Orders with a `COMPLETED` or `CANCELED` state cannot be updated.  An UpdateOrder request requires the following:  - The `order_id` in the endpoint path, identifying the order to update. - The latest `version` of the order to update. - The [sparse order](/orders-api/manage-orders#sparse-order-objects) containing only the fields to update and the version the update is being applied to. - If deleting fields, the [dot notation paths](/orders-api/manage-orders#on-dot-notation) identifying fields to clear.  To pay for an order, please refer to the [Pay for Orders](/orders-api/pay-for-orders) guide.
		/// - Parameters:
		///   - order_id: The ID of the order to update.
		public init(order_id: String) {
			self.order_id = order_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/orders/\(inputs.order_id)"
	}
}

/// Pay for an [order](#type-order) using one or more approved [payments](#type-payment), or settle an order with a total of `0`.  The total of the `payment_ids` listed in the request must be equal to the order total. Orders with a total amount of `0` can be marked as paid by specifying an empty array of `payment_ids` in the request.  To be used with PayOrder, a payment must:  - Reference the order by specifying the `order_id` when [creating the payment](#endpoint-payments-createpayment). Any approved payments that reference the same `order_id` not specified in the `payment_ids` will be canceled. - Be approved with [delayed capture](/payments-api/take-payments#delayed-capture). Using a delayed capture payment with PayOrder will complete the approved payment.
public struct PayOrder: SquareAPIEndpoint {
	public typealias inputType = PayOrderRequest
	public typealias outputType = PayOrderResponse
	public typealias paramType = Params
	public struct Params {
		let order_id: String
		/// Pay for an [order](#type-order) using one or more approved [payments](#type-payment), or settle an order with a total of `0`.  The total of the `payment_ids` listed in the request must be equal to the order total. Orders with a total amount of `0` can be marked as paid by specifying an empty array of `payment_ids` in the request.  To be used with PayOrder, a payment must:  - Reference the order by specifying the `order_id` when [creating the payment](#endpoint-payments-createpayment). Any approved payments that reference the same `order_id` not specified in the `payment_ids` will be canceled. - Be approved with [delayed capture](/payments-api/take-payments#delayed-capture). Using a delayed capture payment with PayOrder will complete the approved payment.
		/// - Parameters:
		///   - order_id: The ID of the order being paid.
		public init(order_id: String) {
			self.order_id = order_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/orders/\(inputs.order_id)/pay"
	}
}

