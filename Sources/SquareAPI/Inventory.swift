/// Deprecated version of [RetrieveInventoryAdjustment](https://developer.squareup.com/reference/square_2021-12-15/inventory-api/retrieve-inventory-adjustment) after the endpoint URL  is updated to conform to the standard convention.
@available(*,deprecated)
public struct DeprecatedRetrieveInventoryAdjustment: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveInventoryAdjustmentResponse
	public typealias paramType = Params
	public struct Params {
		let adjustment_id: String
		/// Deprecated version of [RetrieveInventoryAdjustment](https://developer.squareup.com/reference/square_2021-12-15/inventory-api/retrieve-inventory-adjustment) after the endpoint URL  is updated to conform to the standard convention.
		/// - Parameters:
		///   - adjustment_id: ID of the [InventoryAdjustment](https://developer.squareup.com/reference/square_2021-12-15/objects/InventoryAdjustment) to retrieve.
		public init(adjustment_id: String) {
			self.adjustment_id = adjustment_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/inventory/adjustment/\(inputs.adjustment_id)"
		return url
	}
}

/// Returns the [InventoryAdjustment](https://developer.squareup.com/reference/square_2021-12-15/objects/InventoryAdjustment) object with the provided `adjustment_id`.
public struct RetrieveInventoryAdjustment: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveInventoryAdjustmentResponse
	public typealias paramType = Params
	public struct Params {
		let adjustment_id: String
		/// Returns the [InventoryAdjustment](https://developer.squareup.com/reference/square_2021-12-15/objects/InventoryAdjustment) object with the provided `adjustment_id`.
		/// - Parameters:
		///   - adjustment_id: ID of the [InventoryAdjustment](https://developer.squareup.com/reference/square_2021-12-15/objects/InventoryAdjustment) to retrieve.
		public init(adjustment_id: String) {
			self.adjustment_id = adjustment_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/inventory/adjustments/\(inputs.adjustment_id)"
		return url
	}
}

/// Deprecated version of [BatchChangeInventory](https://developer.squareup.com/reference/square_2021-12-15/inventory-api/batch-change-inventory) after the endpoint URL  is updated to conform to the standard convention.
@available(*,deprecated)
public struct DeprecatedBatchChangeInventory: SquareAPIEndpoint {
	public typealias inputType = BatchChangeInventoryRequest
	public typealias outputType = BatchChangeInventoryResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/inventory/batch-change"
	}
}

/// Deprecated version of [BatchRetrieveInventoryChanges](https://developer.squareup.com/reference/square_2021-12-15/inventory-api/batch-retrieve-inventory-changes) after the endpoint URL  is updated to conform to the standard convention.
@available(*,deprecated)
public struct DeprecatedBatchRetrieveInventoryChanges: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveInventoryChangesRequest
	public typealias outputType = BatchRetrieveInventoryChangesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/inventory/batch-retrieve-changes"
	}
}

/// Deprecated version of [BatchRetrieveInventoryCounts](https://developer.squareup.com/reference/square_2021-12-15/inventory-api/batch-retrieve-inventory-counts) after the endpoint URL  is updated to conform to the standard convention.
@available(*,deprecated)
public struct DeprecatedBatchRetrieveInventoryCounts: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveInventoryCountsRequest
	public typealias outputType = BatchRetrieveInventoryCountsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/inventory/batch-retrieve-counts"
	}
}

/// Applies adjustments and counts to the provided item quantities.  On success: returns the current calculated counts for all objects referenced in the request. On failure: returns a list of related errors.
public struct BatchChangeInventory: SquareAPIEndpoint {
	public typealias inputType = BatchChangeInventoryRequest
	public typealias outputType = BatchChangeInventoryResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/inventory/changes/batch-create"
	}
}

/// Returns historical physical counts and adjustments based on the provided filter criteria.  Results are paginated and sorted in ascending order according their `occurred_at` timestamp (oldest first).  BatchRetrieveInventoryChanges is a catch-all query endpoint for queries that cannot be handled by other, simpler endpoints.
public struct BatchRetrieveInventoryChanges: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveInventoryChangesRequest
	public typealias outputType = BatchRetrieveInventoryChangesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/inventory/changes/batch-retrieve"
	}
}

/// Returns current counts for the provided [CatalogObject](https://developer.squareup.com/reference/square_2021-12-15/objects/CatalogObject)s at the requested [Location](https://developer.squareup.com/reference/square_2021-12-15/objects/Location)s.  Results are paginated and sorted in descending order according to their `calculated_at` timestamp (newest first).  When `updated_after` is specified, only counts that have changed since that time (based on the server timestamp for the most recent change) are returned. This allows clients to perform a "sync" operation, for example in response to receiving a Webhook notification.
public struct BatchRetrieveInventoryCounts: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveInventoryCountsRequest
	public typealias outputType = BatchRetrieveInventoryCountsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/inventory/counts/batch-retrieve"
	}
}

/// Deprecated version of [RetrieveInventoryPhysicalCount](https://developer.squareup.com/reference/square_2021-12-15/inventory-api/retrieve-inventory-physical-count) after the endpoint URL  is updated to conform to the standard convention.
@available(*,deprecated)
public struct DeprecatedRetrieveInventoryPhysicalCount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveInventoryPhysicalCountResponse
	public typealias paramType = Params
	public struct Params {
		let physical_count_id: String
		/// Deprecated version of [RetrieveInventoryPhysicalCount](https://developer.squareup.com/reference/square_2021-12-15/inventory-api/retrieve-inventory-physical-count) after the endpoint URL  is updated to conform to the standard convention.
		/// - Parameters:
		///   - physical_count_id: ID of the [InventoryPhysicalCount](https://developer.squareup.com/reference/square_2021-12-15/objects/InventoryPhysicalCount) to retrieve.
		public init(physical_count_id: String) {
			self.physical_count_id = physical_count_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/inventory/physical-count/\(inputs.physical_count_id)"
		return url
	}
}

/// Returns the [InventoryPhysicalCount](https://developer.squareup.com/reference/square_2021-12-15/objects/InventoryPhysicalCount) object with the provided `physical_count_id`.
public struct RetrieveInventoryPhysicalCount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveInventoryPhysicalCountResponse
	public typealias paramType = Params
	public struct Params {
		let physical_count_id: String
		/// Returns the [InventoryPhysicalCount](https://developer.squareup.com/reference/square_2021-12-15/objects/InventoryPhysicalCount) object with the provided `physical_count_id`.
		/// - Parameters:
		///   - physical_count_id: ID of the [InventoryPhysicalCount](https://developer.squareup.com/reference/square_2021-12-15/objects/InventoryPhysicalCount) to retrieve.
		public init(physical_count_id: String) {
			self.physical_count_id = physical_count_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/inventory/physical-counts/\(inputs.physical_count_id)"
		return url
	}
}

/// Returns the [InventoryTransfer](https://developer.squareup.com/reference/square_2021-12-15/objects/InventoryTransfer) object with the provided `transfer_id`.
public struct RetrieveInventoryTransfer: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveInventoryTransferResponse
	public typealias paramType = Params
	public struct Params {
		let transfer_id: String
		/// Returns the [InventoryTransfer](https://developer.squareup.com/reference/square_2021-12-15/objects/InventoryTransfer) object with the provided `transfer_id`.
		/// - Parameters:
		///   - transfer_id: (Beta) ID of the [InventoryTransfer](https://developer.squareup.com/reference/square_2021-12-15/objects/InventoryTransfer) to retrieve.
		public init(transfer_id: String) {
			self.transfer_id = transfer_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/inventory/transfers/\(inputs.transfer_id)"
		return url
	}
}

/// Retrieves the current calculated stock count for a given [CatalogObject](https://developer.squareup.com/reference/square_2021-12-15/objects/CatalogObject) at a given set of [Location](https://developer.squareup.com/reference/square_2021-12-15/objects/Location)s. Responses are paginated and unsorted. For more sophisticated queries, use a batch endpoint.
public struct RetrieveInventoryCount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveInventoryCountResponse
	public typealias paramType = Params
	public struct Params {
		let catalog_object_id: String
		let location_ids: String?
		let cursor: String?
		/// Retrieves the current calculated stock count for a given [CatalogObject](https://developer.squareup.com/reference/square_2021-12-15/objects/CatalogObject) at a given set of [Location](https://developer.squareup.com/reference/square_2021-12-15/objects/Location)s. Responses are paginated and unsorted. For more sophisticated queries, use a batch endpoint.
		/// - Parameters:
		///   - catalog_object_id: ID of the [CatalogObject](https://developer.squareup.com/reference/square_2021-12-15/objects/CatalogObject) to retrieve.
		///   - location_ids: The [Location](https://developer.squareup.com/reference/square_2021-12-15/objects/Location) IDs to look up as a comma-separated list. An empty list queries all locations.
		///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query.  See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
		public init(catalog_object_id: String, location_ids: String? = nil, cursor: String? = nil) {
			self.catalog_object_id = catalog_object_id
			self.location_ids = location_ids
			self.cursor = cursor
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/inventory/\(inputs.catalog_object_id)"
		var queries = [String]()
		if let v = inputs.location_ids { queries.append("location_ids=\(v)") }
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Returns a set of physical counts and inventory adjustments for the provided [CatalogObject](https://developer.squareup.com/reference/square_2021-12-15/objects/CatalogObject) at the requested [Location](https://developer.squareup.com/reference/square_2021-12-15/objects/Location)s.   You can achieve the same result by calling [BatchRetrieveInventoryChanges](https://developer.squareup.com/reference/square_2021-12-15/inventory-api/batch-retrieve-inventory-changes)  and having the `catalog_object_ids` list contain a single element of the `CatalogObject` ID.  Results are paginated and sorted in descending order according to their `occurred_at` timestamp (newest first).  There are no limits on how far back the caller can page. This endpoint can be  used to display recent changes for a specific item. For more sophisticated queries, use a batch endpoint.
@available(*,deprecated)
public struct RetrieveInventoryChanges: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveInventoryChangesResponse
	public typealias paramType = Params
	public struct Params {
		let catalog_object_id: String
		let location_ids: String?
		let cursor: String?
		/// Returns a set of physical counts and inventory adjustments for the provided [CatalogObject](https://developer.squareup.com/reference/square_2021-12-15/objects/CatalogObject) at the requested [Location](https://developer.squareup.com/reference/square_2021-12-15/objects/Location)s.   You can achieve the same result by calling [BatchRetrieveInventoryChanges](https://developer.squareup.com/reference/square_2021-12-15/inventory-api/batch-retrieve-inventory-changes)  and having the `catalog_object_ids` list contain a single element of the `CatalogObject` ID.  Results are paginated and sorted in descending order according to their `occurred_at` timestamp (newest first).  There are no limits on how far back the caller can page. This endpoint can be  used to display recent changes for a specific item. For more sophisticated queries, use a batch endpoint.
		/// - Parameters:
		///   - catalog_object_id: ID of the [CatalogObject](https://developer.squareup.com/reference/square_2021-12-15/objects/CatalogObject) to retrieve.
		///   - location_ids: The [Location](https://developer.squareup.com/reference/square_2021-12-15/objects/Location) IDs to look up as a comma-separated list. An empty list queries all locations.
		///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query.  See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
		public init(catalog_object_id: String, location_ids: String? = nil, cursor: String? = nil) {
			self.catalog_object_id = catalog_object_id
			self.location_ids = location_ids
			self.cursor = cursor
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/inventory/\(inputs.catalog_object_id)/changes"
		var queries = [String]()
		if let v = inputs.location_ids { queries.append("location_ids=\(v)") }
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

