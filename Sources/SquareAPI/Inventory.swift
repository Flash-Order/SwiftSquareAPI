/// Returns the [InventoryAdjustment](#type-inventoryadjustment) object with the provided `adjustment_id`.
public struct RetrieveInventoryAdjustment: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveInventoryAdjustmentResponse
	public typealias paramType = Params
	public struct Params {
		let adjustment_id: String
		/// Returns the [InventoryAdjustment](#type-inventoryadjustment) object with the provided `adjustment_id`.
		/// - Parameters:
		///   - adjustment_id: ID of the `InventoryAdjustment` to retrieve.
		public init(adjustment_id: String) {
			self.adjustment_id = adjustment_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/inventory/adjustment/\(inputs.adjustment_id)"
	}
}

/// Applies adjustments and counts to the provided item quantities.  On success: returns the current calculated counts for all objects referenced in the request. On failure: returns a list of related errors.
public struct BatchChangeInventory: SquareAPIEndpoint {
	public typealias inputType = BatchChangeInventoryRequest
	public typealias outputType = BatchChangeInventoryResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/inventory/batch-change"
	}
}

/// Returns historical physical counts and adjustments based on the provided filter criteria.  Results are paginated and sorted in ascending order according their `occurred_at` timestamp (oldest first).  BatchRetrieveInventoryChanges is a catch-all query endpoint for queries that cannot be handled by other, simpler endpoints.
public struct BatchRetrieveInventoryChanges: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveInventoryChangesRequest
	public typealias outputType = BatchRetrieveInventoryChangesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/inventory/batch-retrieve-changes"
	}
}

/// Returns current counts for the provided [CatalogObject](#type-catalogobject)s at the requested [Location](#type-location)s.  Results are paginated and sorted in descending order according to their `calculated_at` timestamp (newest first).  When `updated_after` is specified, only counts that have changed since that time (based on the server timestamp for the most recent change) are returned. This allows clients to perform a "sync" operation, for example in response to receiving a Webhook notification.
public struct BatchRetrieveInventoryCounts: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveInventoryCountsRequest
	public typealias outputType = BatchRetrieveInventoryCountsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/inventory/batch-retrieve-counts"
	}
}

/// Returns the [InventoryPhysicalCount](#type-inventoryphysicalcount) object with the provided `physical_count_id`.
public struct RetrieveInventoryPhysicalCount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveInventoryPhysicalCountResponse
	public typealias paramType = Params
	public struct Params {
		let physical_count_id: String
		/// Returns the [InventoryPhysicalCount](#type-inventoryphysicalcount) object with the provided `physical_count_id`.
		/// - Parameters:
		///   - physical_count_id: ID of the `InventoryPhysicalCount` to retrieve.
		public init(physical_count_id: String) {
			self.physical_count_id = physical_count_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/inventory/physical-count/\(inputs.physical_count_id)"
	}
}

/// Retrieves the current calculated stock count for a given [CatalogObject](#type-catalogobject) at a given set of [Location](#type-location)s. Responses are paginated and unsorted. For more sophisticated queries, use a batch endpoint.
public struct RetrieveInventoryCount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveInventoryCountResponse
	public typealias paramType = Params
	public struct Params {
		let catalog_object_id: String
		/// Retrieves the current calculated stock count for a given [CatalogObject](#type-catalogobject) at a given set of [Location](#type-location)s. Responses are paginated and unsorted. For more sophisticated queries, use a batch endpoint.
		/// - Parameters:
		///   - catalog_object_id: ID of the `CatalogObject` to retrieve.
		public init(catalog_object_id: String) {
			self.catalog_object_id = catalog_object_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/inventory/\(inputs.catalog_object_id)"
	}
}

/// Returns a set of physical counts and inventory adjustments for the provided [CatalogObject](#type-catalogobject) at the requested [Location](#type-location)s.  Results are paginated and sorted in descending order according to their `occurred_at` timestamp (newest first).  There are no limits on how far back the caller can page. This endpoint can be  used to display recent changes for a specific item. For more sophisticated queries, use a batch endpoint.
public struct RetrieveInventoryChanges: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveInventoryChangesResponse
	public typealias paramType = Params
	public struct Params {
		let catalog_object_id: String
		/// Returns a set of physical counts and inventory adjustments for the provided [CatalogObject](#type-catalogobject) at the requested [Location](#type-location)s.  Results are paginated and sorted in descending order according to their `occurred_at` timestamp (newest first).  There are no limits on how far back the caller can page. This endpoint can be  used to display recent changes for a specific item. For more sophisticated queries, use a batch endpoint.
		/// - Parameters:
		///   - catalog_object_id: ID of the `CatalogObject` to retrieve.
		public init(catalog_object_id: String) {
			self.catalog_object_id = catalog_object_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/inventory/\(inputs.catalog_object_id)/changes"
	}
}

