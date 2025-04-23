/// Lists the merchant-related [custom attribute definitions](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttributeDefinition) that belong to a Square seller account. When all response pages are retrieved, the results include all custom attribute definitions that are visible to the requesting application, including those that are created by other applications and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
public struct ListMerchantCustomAttributeDefinitions: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListMerchantCustomAttributeDefinitionsResponse
	public typealias paramType = Params
	public struct Params {
		let visibility_filter: VisibilityFilter?
		let limit: Int?
		let cursor: String?
		/// Lists the merchant-related [custom attribute definitions](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttributeDefinition) that belong to a Square seller account. When all response pages are retrieved, the results include all custom attribute definitions that are visible to the requesting application, including those that are created by other applications and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
		/// - Parameters:
		///   - visibility_filter: Filters the `CustomAttributeDefinition` results by their `visibility` values.
		///   - limit: The maximum number of results to return in a single paged response. This limit is advisory. The response might contain more or fewer results. The minimum value is 1 and the maximum value is 100. The default value is 20. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
		///   - cursor: The cursor returned in the paged response from the previous call to this endpoint. Provide this cursor to retrieve the next page of results for your original request. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
		public init(visibility_filter: VisibilityFilter? = nil, limit: Int? = nil, cursor: String? = nil) {
			self.visibility_filter = visibility_filter
			self.limit = limit
			self.cursor = cursor
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/merchants/custom-attribute-definitions"
		var queries = [String]()
		if let v = inputs.visibility_filter { queries.append("visibility_filter=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Creates a merchant-related [custom attribute definition](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttributeDefinition) for a Square seller account. Use this endpoint to define a custom attribute that can be associated with a merchant connecting to your application. A custom attribute definition specifies the `key`, `visibility`, `schema`, and other properties for a custom attribute. After the definition is created, you can call [UpsertMerchantCustomAttribute](api-endpoint:MerchantCustomAttributes-UpsertMerchantCustomAttribute) or [BulkUpsertMerchantCustomAttributes](api-endpoint:MerchantCustomAttributes-BulkUpsertMerchantCustomAttributes) to set the custom attribute for a merchant.
public struct CreateMerchantCustomAttributeDefinition: SquareAPIEndpoint {
	public typealias inputType = CreateMerchantCustomAttributeDefinitionRequest
	public typealias outputType = CreateMerchantCustomAttributeDefinitionResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/merchants/custom-attribute-definitions"
	}
}

/// Retrieves a merchant-related [custom attribute definition](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttributeDefinition) from a Square seller account. To retrieve a custom attribute definition created by another application, the `visibility` setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
public struct RetrieveMerchantCustomAttributeDefinition: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveMerchantCustomAttributeDefinitionResponse
	public typealias paramType = Params
	public struct Params {
		let key: String
		let version: Int?
		/// Retrieves a merchant-related [custom attribute definition](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttributeDefinition) from a Square seller account. To retrieve a custom attribute definition created by another application, the `visibility` setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
		/// - Parameters:
		///   - key: The key of the custom attribute definition to retrieve. If the requesting application is not the definition owner, you must use the qualified key.
		///   - version: The current version of the custom attribute definition, which is used for strongly consistent reads to guarantee that you receive the most up-to-date data. When included in the request, Square returns the specified version or a higher version if one exists. If the specified version is higher than the current version, Square returns a `BAD_REQUEST` error.
		public init(key: String, version: Int? = nil) {
			self.key = key
			self.version = version
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/merchants/custom-attribute-definitions/\(inputs.key)"
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

/// Updates a merchant-related [custom attribute definition](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttributeDefinition) for a Square seller account. Use this endpoint to update the following fields: `name`, `description`, `visibility`, or the `schema` for a `Selection` data type. Only the definition owner can update a custom attribute definition.
public struct UpdateMerchantCustomAttributeDefinition: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateMerchantCustomAttributeDefinitionRequest
	public typealias outputType = UpdateMerchantCustomAttributeDefinitionResponse
	public typealias paramType = Params
	public struct Params {
		let key: String
		/// Updates a merchant-related [custom attribute definition](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttributeDefinition) for a Square seller account. Use this endpoint to update the following fields: `name`, `description`, `visibility`, or the `schema` for a `Selection` data type. Only the definition owner can update a custom attribute definition.
		/// - Parameters:
		///   - key: The key of the custom attribute definition to update.
		public init(key: String) {
			self.key = key
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/merchants/custom-attribute-definitions/\(inputs.key)"
		return url
	}
}

/// Deletes a merchant-related [custom attribute definition](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttributeDefinition) from a Square seller account. Deleting a custom attribute definition also deletes the corresponding custom attribute from the merchant. Only the definition owner can delete a custom attribute definition.
public struct DeleteMerchantCustomAttributeDefinition: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteMerchantCustomAttributeDefinitionResponse
	public typealias paramType = Params
	public struct Params {
		let key: String
		/// Deletes a merchant-related [custom attribute definition](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttributeDefinition) from a Square seller account. Deleting a custom attribute definition also deletes the corresponding custom attribute from the merchant. Only the definition owner can delete a custom attribute definition.
		/// - Parameters:
		///   - key: The key of the custom attribute definition to delete.
		public init(key: String) {
			self.key = key
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/merchants/custom-attribute-definitions/\(inputs.key)"
		return url
	}
}

/// Deletes [custom attributes](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttribute) for a merchant as a bulk operation. To delete a custom attribute owned by another application, the `visibility` setting must be `VISIBILITY_READ_WRITE_VALUES`.
public struct BulkDeleteMerchantCustomAttributes: SquareAPIEndpoint {
	public typealias inputType = BulkDeleteMerchantCustomAttributesRequest
	public typealias outputType = BulkDeleteMerchantCustomAttributesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/merchants/custom-attributes/bulk-delete"
	}
}

/// Creates or updates [custom attributes](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttribute) for a merchant as a bulk operation. Use this endpoint to set the value of one or more custom attributes for a merchant. A custom attribute is based on a custom attribute definition in a Square seller account, which is created using the [CreateMerchantCustomAttributeDefinition](api-endpoint:MerchantCustomAttributes-CreateMerchantCustomAttributeDefinition) endpoint. This `BulkUpsertMerchantCustomAttributes` endpoint accepts a map of 1 to 25 individual upsert requests and returns a map of individual upsert responses. Each upsert request has a unique ID and provides a merchant ID and custom attribute. Each upsert response is returned with the ID of the corresponding request. To create or update a custom attribute owned by another application, the `visibility` setting must be `VISIBILITY_READ_WRITE_VALUES`.
public struct BulkUpsertMerchantCustomAttributes: SquareAPIEndpoint {
	public typealias inputType = BulkUpsertMerchantCustomAttributesRequest
	public typealias outputType = BulkUpsertMerchantCustomAttributesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/merchants/custom-attributes/bulk-upsert"
	}
}

/// Lists the [custom attributes](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttribute) associated with a merchant. You can use the `with_definitions` query parameter to also retrieve custom attribute definitions in the same call. When all response pages are retrieved, the results include all custom attributes that are visible to the requesting application, including those that are owned by other applications and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
public struct ListMerchantCustomAttributes: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListMerchantCustomAttributesResponse
	public typealias paramType = Params
	public struct Params {
		let merchant_id: String
		let visibility_filter: VisibilityFilter?
		let limit: Int?
		let cursor: String?
		let with_definitions: Bool?
		/// Lists the [custom attributes](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttribute) associated with a merchant. You can use the `with_definitions` query parameter to also retrieve custom attribute definitions in the same call. When all response pages are retrieved, the results include all custom attributes that are visible to the requesting application, including those that are owned by other applications and set to `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
		/// - Parameters:
		///   - merchant_id: The ID of the target [merchant](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Merchant).
		///   - visibility_filter: Filters the `CustomAttributeDefinition` results by their `visibility` values.
		///   - limit: The maximum number of results to return in a single paged response. This limit is advisory. The response might contain more or fewer results. The minimum value is 1 and the maximum value is 100. The default value is 20. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
		///   - cursor: The cursor returned in the paged response from the previous call to this endpoint. Provide this cursor to retrieve the next page of results for your original request. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
		///   - with_definitions: Indicates whether to return the [custom attribute definition](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttributeDefinition) in the `definition` field of each custom attribute. Set this parameter to `true` to get the name and description of each custom attribute, information about the data type, or other definition details. The default value is `false`.
		public init(merchant_id: String, visibility_filter: VisibilityFilter? = nil, limit: Int? = nil, cursor: String? = nil, with_definitions: Bool? = nil) {
			self.merchant_id = merchant_id
			self.visibility_filter = visibility_filter
			self.limit = limit
			self.cursor = cursor
			self.with_definitions = with_definitions
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/merchants/\(inputs.merchant_id)/custom-attributes"
		var queries = [String]()
		if let v = inputs.visibility_filter { queries.append("visibility_filter=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if let v = inputs.with_definitions { queries.append("with_definitions=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Retrieves a [custom attribute](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttribute) associated with a merchant. You can use the `with_definition` query parameter to also retrieve the custom attribute definition in the same call. To retrieve a custom attribute owned by another application, the `visibility` setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
public struct RetrieveMerchantCustomAttribute: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveMerchantCustomAttributeResponse
	public typealias paramType = Params
	public struct Params {
		let merchant_id: String
		let key: String
		let with_definition: Bool?
		let version: Int?
		/// Retrieves a [custom attribute](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttribute) associated with a merchant. You can use the `with_definition` query parameter to also retrieve the custom attribute definition in the same call. To retrieve a custom attribute owned by another application, the `visibility` setting must be `VISIBILITY_READ_ONLY` or `VISIBILITY_READ_WRITE_VALUES`.
		/// - Parameters:
		///   - merchant_id: The ID of the target [merchant](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Merchant).
		///   - key: The key of the custom attribute to retrieve. This key must match the `key` of a custom attribute definition in the Square seller account. If the requesting application is not the definition owner, you must use the qualified key.
		///   - with_definition: Indicates whether to return the [custom attribute definition](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttributeDefinition) in the `definition` field of the custom attribute. Set this parameter to `true` to get the name and description of the custom attribute, information about the data type, or other definition details. The default value is `false`.
		///   - version: The current version of the custom attribute, which is used for strongly consistent reads to guarantee that you receive the most up-to-date data. When included in the request, Square returns the specified version or a higher version if one exists. If the specified version is higher than the current version, Square returns a `BAD_REQUEST` error.
		public init(merchant_id: String, key: String, with_definition: Bool? = nil, version: Int? = nil) {
			self.merchant_id = merchant_id
			self.key = key
			self.with_definition = with_definition
			self.version = version
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/merchants/\(inputs.merchant_id)/custom-attributes/\(inputs.key)"
		var queries = [String]()
		if let v = inputs.with_definition { queries.append("with_definition=\(v)") }
		if let v = inputs.version { queries.append("version=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Creates or updates a [custom attribute](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttribute) for a merchant. Use this endpoint to set the value of a custom attribute for a specified merchant. A custom attribute is based on a custom attribute definition in a Square seller account, which is created using the [CreateMerchantCustomAttributeDefinition](api-endpoint:MerchantCustomAttributes-CreateMerchantCustomAttributeDefinition) endpoint. To create or update a custom attribute owned by another application, the `visibility` setting must be `VISIBILITY_READ_WRITE_VALUES`.
public struct UpsertMerchantCustomAttribute: SquareAPIEndpoint {
	public typealias inputType = UpsertMerchantCustomAttributeRequest
	public typealias outputType = UpsertMerchantCustomAttributeResponse
	public typealias paramType = Params
	public struct Params {
		let merchant_id: String
		let key: String
		/// Creates or updates a [custom attribute](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttribute) for a merchant. Use this endpoint to set the value of a custom attribute for a specified merchant. A custom attribute is based on a custom attribute definition in a Square seller account, which is created using the [CreateMerchantCustomAttributeDefinition](api-endpoint:MerchantCustomAttributes-CreateMerchantCustomAttributeDefinition) endpoint. To create or update a custom attribute owned by another application, the `visibility` setting must be `VISIBILITY_READ_WRITE_VALUES`.
		/// - Parameters:
		///   - merchant_id: The ID of the target [merchant](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Merchant).
		///   - key: The key of the custom attribute to create or update. This key must match the `key` of a custom attribute definition in the Square seller account. If the requesting application is not the definition owner, you must use the qualified key.
		public init(merchant_id: String, key: String) {
			self.merchant_id = merchant_id
			self.key = key
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/merchants/\(inputs.merchant_id)/custom-attributes/\(inputs.key)"
		return url
	}
}

/// Deletes a [custom attribute](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttribute) associated with a merchant. To delete a custom attribute owned by another application, the `visibility` setting must be `VISIBILITY_READ_WRITE_VALUES`.
public struct DeleteMerchantCustomAttribute: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteMerchantCustomAttributeResponse
	public typealias paramType = Params
	public struct Params {
		let merchant_id: String
		let key: String
		/// Deletes a [custom attribute](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CustomAttribute) associated with a merchant. To delete a custom attribute owned by another application, the `visibility` setting must be `VISIBILITY_READ_WRITE_VALUES`.
		/// - Parameters:
		///   - merchant_id: The ID of the target [merchant](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Merchant).
		///   - key: The key of the custom attribute to delete. This key must match the `key` of a custom attribute definition in the Square seller account. If the requesting application is not the definition owner, you must use the qualified key.
		public init(merchant_id: String, key: String) {
			self.merchant_id = merchant_id
			self.key = key
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/merchants/\(inputs.merchant_id)/custom-attributes/\(inputs.key)"
		return url
	}
}

