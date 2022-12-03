/// Creates a new [order](https://developer.squareup.com/reference/square_2022-11-16/objects/Order) that can include information about products for purchase and settings to apply to the purchase.  To pay for a created order, see [Pay for Orders](https://developer.squareup.com/docs/orders-api/pay-for-orders).  You can modify open orders using the [UpdateOrder](https://developer.squareup.com/reference/square_2022-11-16/orders-api/update-order) endpoint.
public struct CreateOrder: SquareAPIEndpoint {
	public typealias inputType = CreateOrderRequest
	public typealias outputType = CreateOrderResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders"
	}
}

/// Retrieves a set of [orders](https://developer.squareup.com/reference/square_2022-11-16/objects/Order) by their IDs.  If a given order ID does not exist, the ID is ignored instead of generating an error.
public struct BatchRetrieveOrders: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveOrdersRequest
	public typealias outputType = BatchRetrieveOrdersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/batch-retrieve"
	}
}

/// Enables applications to preview order pricing without creating an order.
public struct CalculateOrder: SquareAPIEndpoint {
	public typealias inputType = CalculateOrderRequest
	public typealias outputType = CalculateOrderResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/calculate"
	}
}

/// Creates a new order, in the `DRAFT` state, by duplicating an existing order. The newly created order has only the core fields (such as line items, taxes, and discounts) copied from the original order.
public struct CloneOrder: SquareAPIEndpoint {
	public typealias inputType = CloneOrderRequest
	public typealias outputType = CloneOrderResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/clone"
	}
}

/// Search all orders for one or more locations. Orders include all sales, returns, and exchanges regardless of how or when they entered the Square ecosystem (such as Point of Sale, Invoices, and Connect APIs).  `SearchOrders` requests need to specify which locations to search and define a [SearchOrdersQuery](https://developer.squareup.com/reference/square_2022-11-16/objects/SearchOrdersQuery) object that controls how to sort or filter the results. Your `SearchOrdersQuery` can:    Set filter criteria.   Set the sort order.   Determine whether to return results as complete `Order` objects or as [OrderEntry](https://developer.squareup.com/reference/square_2022-11-16/objects/OrderEntry) objects.  Note that details for orders processed with Square Point of Sale while in offline mode might not be transmitted to Square for up to 72 hours. Offline orders have a `created_at` value that reflects the time the order was created, not the time it was subsequently transmitted to Square.
public struct SearchOrders: SquareAPIEndpoint {
	public typealias inputType = SearchOrdersRequest
	public typealias outputType = SearchOrdersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/search"
	}
}

/// Retrieves an [Order](https://developer.squareup.com/reference/square_2022-11-16/objects/Order) by ID.
public struct RetrieveOrder: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveOrderResponse
	public typealias paramType = Params
	public struct Params {
		let order_id: String
		/// Retrieves an [Order](https://developer.squareup.com/reference/square_2022-11-16/objects/Order) by ID.
		/// - Parameters:
		///   - order_id: The ID of the order to retrieve.
		public init(order_id: String) {
			self.order_id = order_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/orders/\(inputs.order_id)"
		return url
	}
}

/// Updates an open [order](https://developer.squareup.com/reference/square_2022-11-16/objects/Order) by adding, replacing, or deleting fields. Orders with a `COMPLETED` or `CANCELED` state cannot be updated.  An `UpdateOrder` request requires the following:  - The `order_id` in the endpoint path, identifying the order to update. - The latest `version` of the order to update. - The [sparse order](https://developer.squareup.com/docs/orders-api/manage-orders/update-orders#sparse-order-objects) containing only the fields to update and the version to which the update is being applied. - If deleting fields, the [dot notation paths](https://developer.squareup.com/docs/orders-api/manage-orders/update-orders#identifying-fields-to-delete) identifying the fields to clear.  To pay for an order, see [Pay for Orders](https://developer.squareup.com/docs/orders-api/pay-for-orders).
public struct UpdateOrder: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateOrderRequest
	public typealias outputType = UpdateOrderResponse
	public typealias paramType = Params
	public struct Params {
		let order_id: String
		/// Updates an open [order](https://developer.squareup.com/reference/square_2022-11-16/objects/Order) by adding, replacing, or deleting fields. Orders with a `COMPLETED` or `CANCELED` state cannot be updated.  An `UpdateOrder` request requires the following:  - The `order_id` in the endpoint path, identifying the order to update. - The latest `version` of the order to update. - The [sparse order](https://developer.squareup.com/docs/orders-api/manage-orders/update-orders#sparse-order-objects) containing only the fields to update and the version to which the update is being applied. - If deleting fields, the [dot notation paths](https://developer.squareup.com/docs/orders-api/manage-orders/update-orders#identifying-fields-to-delete) identifying the fields to clear.  To pay for an order, see [Pay for Orders](https://developer.squareup.com/docs/orders-api/pay-for-orders).
		/// - Parameters:
		///   - order_id: (Beta) The ID of the order to update.
		public init(order_id: String) {
			self.order_id = order_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/orders/\(inputs.order_id)"
		return url
	}
}

/// Pay for an [order](https://developer.squareup.com/reference/square_2022-11-16/objects/Order) using one or more approved [payments](https://developer.squareup.com/reference/square_2022-11-16/objects/Payment) or settle an order with a total of `0`.  The total of the `payment_ids` listed in the request must be equal to the order total. Orders with a total amount of `0` can be marked as paid by specifying an empty array of `payment_ids` in the request.  To be used with `PayOrder`, a payment must:  - Reference the order by specifying the `order_id` when [creating the payment](https://developer.squareup.com/reference/square_2022-11-16/payments-api/create-payment). Any approved payments that reference the same `order_id` not specified in the `payment_ids` is canceled. - Be approved with [delayed capture](https://developer.squareup.com/docs/payments-api/take-payments/card-payments/delayed-capture). Using a delayed capture payment with `PayOrder` completes the approved payment.
public struct PayOrder: SquareAPIEndpoint {
	public typealias inputType = PayOrderRequest
	public typealias outputType = PayOrderResponse
	public typealias paramType = Params
	public struct Params {
		let order_id: String
		/// Pay for an [order](https://developer.squareup.com/reference/square_2022-11-16/objects/Order) using one or more approved [payments](https://developer.squareup.com/reference/square_2022-11-16/objects/Payment) or settle an order with a total of `0`.  The total of the `payment_ids` listed in the request must be equal to the order total. Orders with a total amount of `0` can be marked as paid by specifying an empty array of `payment_ids` in the request.  To be used with `PayOrder`, a payment must:  - Reference the order by specifying the `order_id` when [creating the payment](https://developer.squareup.com/reference/square_2022-11-16/payments-api/create-payment). Any approved payments that reference the same `order_id` not specified in the `payment_ids` is canceled. - Be approved with [delayed capture](https://developer.squareup.com/docs/payments-api/take-payments/card-payments/delayed-capture). Using a delayed capture payment with `PayOrder` completes the approved payment.
		/// - Parameters:
		///   - order_id: (Beta) The ID of the order being paid.
		public init(order_id: String) {
			self.order_id = order_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/orders/\(inputs.order_id)/pay"
		return url
	}
}

