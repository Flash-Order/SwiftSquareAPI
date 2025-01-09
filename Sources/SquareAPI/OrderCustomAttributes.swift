/// Lists the order-related [custom attribute definitions](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttributeDefinition) that belong to a Square seller account. When all response pages are retrieved, the results include all custom attribute definitions that are visible to the requesting application, including those that are created by other applications and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
public struct ListOrderCustomAttributeDefinitions: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListOrderCustomAttributeDefinitionsResponse
	public typealias paramType = Params
	public struct Params {
		let visibility_filter: VisibilityFilter?
		let cursor: String?
		let limit: Int?
		/// Lists the order-related [custom attribute definitions](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttributeDefinition) that belong to a Square seller account. When all response pages are retrieved, the results include all custom attribute definitions that are visible to the requesting application, including those that are created by other applications and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
		/// - Parameters:
		///   - visibility_filter: Requests that all of the custom attributes be returned, or only those that are read-only or read-write.
		///   - cursor: The cursor returned in the paged response from the previous call to this endpoint.  Provide this cursor to retrieve the next page of results for your original request.  For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
		///   - limit: The maximum number of results to return in a single paged response. This limit is advisory.  The response might contain more or fewer results. The minimum value is 1 and the maximum value is 100.  The default value is 20. For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
		public init(visibility_filter: VisibilityFilter? = nil, cursor: String? = nil, limit: Int? = nil) {
			self.visibility_filter = visibility_filter
			self.cursor = cursor
			self.limit = limit
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/orders/custom-attribute-definitions"
		var queries = [String]()
		if let v = inputs.visibility_filter { queries.append("visibility_filter=\(v)") }
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Creates an order-related custom attribute definition.  Use this endpoint to define a custom attribute that can be associated with orders. After creating a custom attribute definition, you can set the custom attribute for orders in the Square seller account.
public struct CreateOrderCustomAttributeDefinition: SquareAPIEndpoint {
	public typealias inputType = CreateOrderCustomAttributeDefinitionRequest
	public typealias outputType = CreateOrderCustomAttributeDefinitionResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/custom-attribute-definitions"
	}
}

/// Retrieves an order-related [custom attribute definition](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttributeDefinition) from a Square seller account. To retrieve a custom attribute definition created by another application, the `visibility` setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
public struct RetrieveOrderCustomAttributeDefinition: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveOrderCustomAttributeDefinitionResponse
	public typealias paramType = Params
	public struct Params {
		let key: String
		let version: Int?
		/// Retrieves an order-related [custom attribute definition](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttributeDefinition) from a Square seller account. To retrieve a custom attribute definition created by another application, the `visibility` setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
		/// - Parameters:
		///   - key: The key of the custom attribute definition to retrieve.
		///   - version: To enable [optimistic concurrency](https://developer.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency) control, include this optional field and specify the current version of the custom attribute.
		public init(key: String, version: Int? = nil) {
			self.key = key
			self.version = version
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/orders/custom-attribute-definitions/\(inputs.key)"
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

/// Updates an order-related custom attribute definition for a Square seller account. Only the definition owner can update a custom attribute definition. Note that sellers can view all custom attributes in exported customer data, including those set to `VISIBILITY_HIDDEN`.
public struct UpdateOrderCustomAttributeDefinition: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateOrderCustomAttributeDefinitionRequest
	public typealias outputType = UpdateOrderCustomAttributeDefinitionResponse
	public typealias paramType = Params
	public struct Params {
		let key: String
		/// Updates an order-related custom attribute definition for a Square seller account. Only the definition owner can update a custom attribute definition. Note that sellers can view all custom attributes in exported customer data, including those set to `VISIBILITY_HIDDEN`.
		/// - Parameters:
		///   - key: The key of the custom attribute definition to update.
		public init(key: String) {
			self.key = key
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/orders/custom-attribute-definitions/\(inputs.key)"
		return url
	}
}

/// Deletes an order-related [custom attribute definition](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttributeDefinition) from a Square seller account. Only the definition owner can delete a custom attribute definition.
public struct DeleteOrderCustomAttributeDefinition: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteOrderCustomAttributeDefinitionResponse
	public typealias paramType = Params
	public struct Params {
		let key: String
		/// Deletes an order-related [custom attribute definition](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttributeDefinition) from a Square seller account. Only the definition owner can delete a custom attribute definition.
		/// - Parameters:
		///   - key: The key of the custom attribute definition to delete.
		public init(key: String) {
			self.key = key
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/orders/custom-attribute-definitions/\(inputs.key)"
		return url
	}
}

/// Deletes order [custom attributes](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttribute) as a bulk operation. Use this endpoint to delete one or more custom attributes from one or more orders. A custom attribute is based on a custom attribute definition in a Square seller account.  (To create a custom attribute definition, use the [CreateOrderCustomAttributeDefinition]($e/OrderCustomAttributes/CreateOrderCustomAttributeDefinition) endpoint.) This `BulkDeleteOrderCustomAttributes` endpoint accepts a map of 1 to 25 individual delete requests and returns a map of individual delete responses. Each delete request has a unique ID and provides an order ID and custom attribute. Each delete response is returned with the ID of the corresponding request. To delete a custom attribute owned by another application, the `visibility` setting must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
public struct BulkDeleteOrderCustomAttributes: SquareAPIEndpoint {
	public typealias inputType = BulkDeleteOrderCustomAttributesRequest
	public typealias outputType = BulkDeleteOrderCustomAttributesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/custom-attributes/bulk-delete"
	}
}

/// Creates or updates order [custom attributes](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttribute) as a bulk operation. Use this endpoint to delete one or more custom attributes from one or more orders. A custom attribute is based on a custom attribute definition in a Square seller account.  (To create a custom attribute definition, use the [CreateOrderCustomAttributeDefinition]($e/OrderCustomAttributes/CreateOrderCustomAttributeDefinition) endpoint.) This `BulkUpsertOrderCustomAttributes` endpoint accepts a map of 1 to 25 individual upsert requests and returns a map of individual upsert responses. Each upsert request has a unique ID and provides an order ID and custom attribute. Each upsert response is returned with the ID of the corresponding request. To create or update a custom attribute owned by another application, the `visibility` setting must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
public struct BulkUpsertOrderCustomAttributes: SquareAPIEndpoint {
	public typealias inputType = BulkUpsertOrderCustomAttributesRequest
	public typealias outputType = BulkUpsertOrderCustomAttributesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/custom-attributes/bulk-upsert"
	}
}

/// Lists the [custom attributes](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttribute) associated with an order. You can use the `with_definitions` query parameter to also retrieve custom attribute definitions in the same call. When all response pages are retrieved, the results include all custom attributes that are visible to the requesting application, including those that are owned by other applications and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
public struct ListOrderCustomAttributes: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListOrderCustomAttributesResponse
	public typealias paramType = Params
	public struct Params {
		let order_id: String
		let visibility_filter: VisibilityFilter?
		let cursor: String?
		let limit: Int?
		let with_definitions: Bool?
		/// Lists the [custom attributes](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttribute) associated with an order. You can use the `with_definitions` query parameter to also retrieve custom attribute definitions in the same call. When all response pages are retrieved, the results include all custom attributes that are visible to the requesting application, including those that are owned by other applications and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
		/// - Parameters:
		///   - order_id: The ID of the target [order](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Order).
		///   - visibility_filter: Requests that all of the custom attributes be returned, or only those that are read-only or read-write.
		///   - cursor: The cursor returned in the paged response from the previous call to this endpoint.  Provide this cursor to retrieve the next page of results for your original request.  For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
		///   - limit: The maximum number of results to return in a single paged response. This limit is advisory.  The response might contain more or fewer results. The minimum value is 1 and the maximum value is 100.  The default value is 20. For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
		///   - with_definitions: Indicates whether to return the [custom attribute definition](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttributeDefinition) in the `definition` field of each custom attribute. Set this parameter to `true` to get the name and description of each custom attribute,  information about the data type, or other definition details. The default value is `false`.
		public init(order_id: String, visibility_filter: VisibilityFilter? = nil, cursor: String? = nil, limit: Int? = nil, with_definitions: Bool? = nil) {
			self.order_id = order_id
			self.visibility_filter = visibility_filter
			self.cursor = cursor
			self.limit = limit
			self.with_definitions = with_definitions
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/orders/\(inputs.order_id)/custom-attributes"
		var queries = [String]()
		if let v = inputs.visibility_filter { queries.append("visibility_filter=\(v)") }
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if let v = inputs.with_definitions { queries.append("with_definitions=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Retrieves a [custom attribute](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttribute) associated with an order. You can use the `with_definition` query parameter to also retrieve the custom attribute definition in the same call. To retrieve a custom attribute owned by another application, the `visibility` setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
public struct RetrieveOrderCustomAttribute: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveOrderCustomAttributeResponse
	public typealias paramType = Params
	public struct Params {
		let order_id: String
		let custom_attribute_key: String
		let version: Int?
		let with_definition: Bool?
		/// Retrieves a [custom attribute](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttribute) associated with an order. You can use the `with_definition` query parameter to also retrieve the custom attribute definition in the same call. To retrieve a custom attribute owned by another application, the `visibility` setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
		/// - Parameters:
		///   - order_id: The ID of the target [order](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Order).
		///   - custom_attribute_key: The key of the custom attribute to retrieve.  This key must match the key of an existing custom attribute definition.
		///   - version: To enable [optimistic concurrency](https://developer.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency) control, include this optional field and specify the current version of the custom attribute.
		///   - with_definition: Indicates whether to return the [custom attribute definition](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttributeDefinition) in the `definition` field of each  custom attribute. Set this parameter to `true` to get the name and description of each custom attribute,  information about the data type, or other definition details. The default value is `false`.
		public init(order_id: String, custom_attribute_key: String, version: Int? = nil, with_definition: Bool? = nil) {
			self.order_id = order_id
			self.custom_attribute_key = custom_attribute_key
			self.version = version
			self.with_definition = with_definition
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/orders/\(inputs.order_id)/custom-attributes/\(inputs.custom_attribute_key)"
		var queries = [String]()
		if let v = inputs.version { queries.append("version=\(v)") }
		if let v = inputs.with_definition { queries.append("with_definition=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Creates or updates a [custom attribute](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttribute) for an order. Use this endpoint to set the value of a custom attribute for a specific order. A custom attribute is based on a custom attribute definition in a Square seller account. (To create a custom attribute definition, use the [CreateOrderCustomAttributeDefinition]($e/OrderCustomAttributes/CreateOrderCustomAttributeDefinition) endpoint.) To create or update a custom attribute owned by another application, the `visibility` setting must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
public struct UpsertOrderCustomAttribute: SquareAPIEndpoint {
	public typealias inputType = UpsertOrderCustomAttributeRequest
	public typealias outputType = UpsertOrderCustomAttributeResponse
	public typealias paramType = Params
	public struct Params {
		let order_id: String
		let custom_attribute_key: String
		/// Creates or updates a [custom attribute](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttribute) for an order. Use this endpoint to set the value of a custom attribute for a specific order. A custom attribute is based on a custom attribute definition in a Square seller account. (To create a custom attribute definition, use the [CreateOrderCustomAttributeDefinition]($e/OrderCustomAttributes/CreateOrderCustomAttributeDefinition) endpoint.) To create or update a custom attribute owned by another application, the `visibility` setting must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
		/// - Parameters:
		///   - order_id: The ID of the target [order](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Order).
		///   - custom_attribute_key: The key of the custom attribute to create or update.  This key must match the key  of an existing custom attribute definition.
		public init(order_id: String, custom_attribute_key: String) {
			self.order_id = order_id
			self.custom_attribute_key = custom_attribute_key
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/orders/\(inputs.order_id)/custom-attributes/\(inputs.custom_attribute_key)"
		return url
	}
}

/// Deletes a [custom attribute](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttribute) associated with a customer profile. To delete a custom attribute owned by another application, the `visibility` setting must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
public struct DeleteOrderCustomAttribute: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteOrderCustomAttributeResponse
	public typealias paramType = Params
	public struct Params {
		let order_id: String
		let custom_attribute_key: String
		/// Deletes a [custom attribute](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttribute) associated with a customer profile. To delete a custom attribute owned by another application, the `visibility` setting must be `VISIBILITY_READ_WRITE_VALUES`. Note that seller-defined custom attributes (also known as custom fields) are always set to `VISIBILITY_READ_WRITE_VALUES`.
		/// - Parameters:
		///   - order_id: The ID of the target [order](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Order).
		///   - custom_attribute_key: The key of the custom attribute to delete.  This key must match the key of an existing custom attribute definition.
		public init(order_id: String, custom_attribute_key: String) {
			self.order_id = order_id
			self.custom_attribute_key = custom_attribute_key
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/orders/\(inputs.order_id)/custom-attributes/\(inputs.custom_attribute_key)"
		return url
	}
}

