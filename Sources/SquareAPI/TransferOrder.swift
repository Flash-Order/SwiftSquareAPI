/// Creates a new transfer order in [DRAFT](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrderStatus) status. A transfer order represents the intent  to move [CatalogItemVariation](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogItemVariation)s from one [Location](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Location) to another.  The source and destination locations must be different and must belong to your Square account.  In [DRAFT](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrderStatus) status, you can: - Add or remove items - Modify quantities - Update shipping information - Delete the entire order via [DeleteTransferOrder](api-endpoint:TransferOrders-DeleteTransferOrder)  The request requires source_location_id and destination_location_id. Inventory levels are not affected until the order is started via  [StartTransferOrder](api-endpoint:TransferOrders-StartTransferOrder).  Common integration points: - Sync with warehouse management systems - Automate regular stock transfers - Initialize transfers from inventory optimization systems  Creates a [transfer_order.created](webhook:transfer_order.created) webhook event.
public struct CreateTransferOrder: SquareAPIEndpoint {
	public typealias inputType = CreateTransferOrderRequest
	public typealias outputType = CreateTransferOrderResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/transfer-orders"
	}
}

/// Searches for transfer orders using filters. Returns a paginated list of matching [TransferOrder](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrder)s sorted by creation date.  Common search scenarios: - Find orders for a source [Location](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Location) - Find orders for a destination [Location](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Location) - Find orders in a particular [TransferOrderStatus](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrderStatus)
public struct SearchTransferOrders: SquareAPIEndpoint {
	public typealias inputType = SearchTransferOrdersRequest
	public typealias outputType = SearchTransferOrdersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/transfer-orders/search"
	}
}

/// Retrieves a specific [TransferOrder](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrder) by ID. Returns the complete order details including:  - Basic information (status, dates, notes) - Line items with ordered and received quantities - Source and destination [Location](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Location)s - Tracking information (if available)
public struct RetrieveTransferOrder: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveTransferOrderResponse
	public typealias paramType = Params
	public struct Params {
		let transfer_order_id: String
		/// Retrieves a specific [TransferOrder](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrder) by ID. Returns the complete order details including:  - Basic information (status, dates, notes) - Line items with ordered and received quantities - Source and destination [Location](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Location)s - Tracking information (if available)
		/// - Parameters:
		///   - transfer_order_id: The ID of the transfer order to retrieve
		public init(transfer_order_id: String) {
			self.transfer_order_id = transfer_order_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/transfer-orders/\(inputs.transfer_order_id)"
		return url
	}
}

/// Updates an existing transfer order. This endpoint supports sparse updates, allowing you to modify specific fields without affecting others.  Creates a [transfer_order.updated](webhook:transfer_order.updated) webhook event.
public struct UpdateTransferOrder: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateTransferOrderRequest
	public typealias outputType = UpdateTransferOrderResponse
	public typealias paramType = Params
	public struct Params {
		let transfer_order_id: String
		/// Updates an existing transfer order. This endpoint supports sparse updates, allowing you to modify specific fields without affecting others.  Creates a [transfer_order.updated](webhook:transfer_order.updated) webhook event.
		/// - Parameters:
		///   - transfer_order_id: The ID of the transfer order to update
		public init(transfer_order_id: String) {
			self.transfer_order_id = transfer_order_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/transfer-orders/\(inputs.transfer_order_id)"
		return url
	}
}

/// Deletes a transfer order in [DRAFT](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrderStatus) status. Only draft orders can be deleted. Once an order is started via  [StartTransferOrder](api-endpoint:TransferOrders-StartTransferOrder), it can no longer be deleted.  Creates a [transfer_order.deleted](webhook:transfer_order.deleted) webhook event.
public struct DeleteTransferOrder: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteTransferOrderResponse
	public typealias paramType = Params
	public struct Params {
		let transfer_order_id: String
		let version: Int?
		/// Deletes a transfer order in [DRAFT](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrderStatus) status. Only draft orders can be deleted. Once an order is started via  [StartTransferOrder](api-endpoint:TransferOrders-StartTransferOrder), it can no longer be deleted.  Creates a [transfer_order.deleted](webhook:transfer_order.deleted) webhook event.
		/// - Parameters:
		///   - transfer_order_id: The ID of the transfer order to delete
		///   - version: Version for optimistic concurrency
		public init(transfer_order_id: String, version: Int? = nil) {
			self.transfer_order_id = transfer_order_id
			self.version = version
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/transfer-orders/\(inputs.transfer_order_id)"
		var queries = [String]()
		if let v = inputs.version { queries.append("version=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Cancels a transfer order in [STARTED](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrderStatus) or  [PARTIALLY_RECEIVED](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrderStatus) status. Any unreceived quantities will no longer be receivable and will be immediately returned to the source [Location](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Location)'s inventory.  Common reasons for cancellation: - Items no longer needed at destination - Source location needs the inventory - Order created in error  Creates a [transfer_order.updated](webhook:transfer_order.updated) webhook event.
public struct CancelTransferOrder: SquareAPIEndpoint {
	public typealias inputType = CancelTransferOrderRequest
	public typealias outputType = CancelTransferOrderResponse
	public typealias paramType = Params
	public struct Params {
		let transfer_order_id: String
		/// Cancels a transfer order in [STARTED](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrderStatus) or  [PARTIALLY_RECEIVED](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrderStatus) status. Any unreceived quantities will no longer be receivable and will be immediately returned to the source [Location](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Location)'s inventory.  Common reasons for cancellation: - Items no longer needed at destination - Source location needs the inventory - Order created in error  Creates a [transfer_order.updated](webhook:transfer_order.updated) webhook event.
		/// - Parameters:
		///   - transfer_order_id: The ID of the transfer order to cancel. Must be in STARTED or PARTIALLY_RECEIVED status.
		public init(transfer_order_id: String) {
			self.transfer_order_id = transfer_order_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/transfer-orders/\(inputs.transfer_order_id)/cancel"
		return url
	}
}

/// Records receipt of [CatalogItemVariation](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogItemVariation)s for a transfer order. This endpoint supports partial receiving - you can receive items in multiple batches.  For each line item, you can specify: - Quantity received in good condition (added to destination inventory with [InventoryState](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/InventoryState) of IN_STOCK) - Quantity damaged during transit/handling (added to destination inventory with [InventoryState](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/InventoryState) of WASTE) - Quantity canceled (returned to source location's inventory)  The order must be in [STARTED](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrderStatus) or [PARTIALLY_RECEIVED](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrderStatus) status. Received quantities are added to the destination [Location](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Location)'s inventory according to their condition. Canceled quantities are immediately returned to the source [Location](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Location)'s inventory.  When all items are either received, damaged, or canceled, the order moves to [COMPLETED](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrderStatus) status.  Creates a [transfer_order.updated](webhook:transfer_order.updated) webhook event.
public struct ReceiveTransferOrder: SquareAPIEndpoint {
	public typealias inputType = ReceiveTransferOrderRequest
	public typealias outputType = ReceiveTransferOrderResponse
	public typealias paramType = Params
	public struct Params {
		let transfer_order_id: String
		/// Records receipt of [CatalogItemVariation](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogItemVariation)s for a transfer order. This endpoint supports partial receiving - you can receive items in multiple batches.  For each line item, you can specify: - Quantity received in good condition (added to destination inventory with [InventoryState](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/InventoryState) of IN_STOCK) - Quantity damaged during transit/handling (added to destination inventory with [InventoryState](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/InventoryState) of WASTE) - Quantity canceled (returned to source location's inventory)  The order must be in [STARTED](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrderStatus) or [PARTIALLY_RECEIVED](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrderStatus) status. Received quantities are added to the destination [Location](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Location)'s inventory according to their condition. Canceled quantities are immediately returned to the source [Location](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Location)'s inventory.  When all items are either received, damaged, or canceled, the order moves to [COMPLETED](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrderStatus) status.  Creates a [transfer_order.updated](webhook:transfer_order.updated) webhook event.
		/// - Parameters:
		///   - transfer_order_id: The ID of the transfer order to receive items for
		public init(transfer_order_id: String) {
			self.transfer_order_id = transfer_order_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/transfer-orders/\(inputs.transfer_order_id)/receive"
		return url
	}
}

/// Changes a [DRAFT](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrderStatus) transfer order to [STARTED](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrderStatus) status. This decrements inventory at the source [Location](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Location) and marks it as in-transit.  The order must be in [DRAFT](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrderStatus) status and have all required fields populated. Once started, the order can no longer be deleted, but it can be canceled via  [CancelTransferOrder](api-endpoint:TransferOrders-CancelTransferOrder).  Creates a [transfer_order.updated](webhook:transfer_order.updated) webhook event.
public struct StartTransferOrder: SquareAPIEndpoint {
	public typealias inputType = StartTransferOrderRequest
	public typealias outputType = StartTransferOrderResponse
	public typealias paramType = Params
	public struct Params {
		let transfer_order_id: String
		/// Changes a [DRAFT](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrderStatus) transfer order to [STARTED](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrderStatus) status. This decrements inventory at the source [Location](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Location) and marks it as in-transit.  The order must be in [DRAFT](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/TransferOrderStatus) status and have all required fields populated. Once started, the order can no longer be deleted, but it can be canceled via  [CancelTransferOrder](api-endpoint:TransferOrders-CancelTransferOrder).  Creates a [transfer_order.updated](webhook:transfer_order.updated) webhook event.
		/// - Parameters:
		///   - transfer_order_id: The ID of the transfer order to start. Must be in DRAFT status.
		public init(transfer_order_id: String) {
			self.transfer_order_id = transfer_order_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/transfer-orders/\(inputs.transfer_order_id)/start"
		return url
	}
}

