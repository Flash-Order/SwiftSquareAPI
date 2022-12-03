/// Get all bookings custom attribute definitions.  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
public struct ListBookingCustomAttributeDefinitions: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListBookingCustomAttributeDefinitionsResponse
	public typealias paramType = Params
	public struct Params {
		let limit: Int?
		let cursor: String?
		/// Get all bookings custom attribute definitions.  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
		/// - Parameters:
		///   - limit: (Beta) The maximum number of results to return in a single paged response. This limit is advisory. The response might contain more or fewer results. The minimum value is 1 and the maximum value is 100. The default value is 20. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
		///   - cursor: (Beta) The cursor returned in the paged response from the previous call to this endpoint. Provide this cursor to retrieve the next page of results for your original request. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
		public init(limit: Int? = nil, cursor: String? = nil) {
			self.limit = limit
			self.cursor = cursor
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bookings/custom-attribute-definitions"
		var queries = [String]()
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

/// Creates a bookings custom attribute definition.  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.  For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus* or *Appointments Premium*.
public struct CreateBookingCustomAttributeDefinition: SquareAPIEndpoint {
	public typealias inputType = CreateBookingCustomAttributeDefinitionRequest
	public typealias outputType = CreateBookingCustomAttributeDefinitionResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings/custom-attribute-definitions"
	}
}

/// Retrieves a bookings custom attribute definition.  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
public struct RetrieveBookingCustomAttributeDefinition: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveBookingCustomAttributeDefinitionResponse
	public typealias paramType = Params
	public struct Params {
		let key: String
		let version: Int?
		/// Retrieves a bookings custom attribute definition.  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
		/// - Parameters:
		///   - key: (Beta) The key of the custom attribute definition to retrieve. If the requesting application is not the definition owner, you must use the qualified key.
		///   - version: (Beta) The current version of the custom attribute definition, which is used for strongly consistent reads to guarantee that you receive the most up-to-date data. When included in the request, Square returns the specified version or a higher version if one exists. If the specified version is higher than the current version, Square returns a `BAD_REQUEST` error.
		public init(key: String, version: Int? = nil) {
			self.key = key
			self.version = version
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bookings/custom-attribute-definitions/\(inputs.key)"
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

/// Updates a bookings custom attribute definition.  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.  For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus* or *Appointments Premium*.
public struct UpdateBookingCustomAttributeDefinition: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateBookingCustomAttributeDefinitionRequest
	public typealias outputType = UpdateBookingCustomAttributeDefinitionResponse
	public typealias paramType = Params
	public struct Params {
		let key: String
		/// Updates a bookings custom attribute definition.  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.  For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus* or *Appointments Premium*.
		/// - Parameters:
		///   - key: (Beta) The key of the custom attribute definition to update.
		public init(key: String) {
			self.key = key
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bookings/custom-attribute-definitions/\(inputs.key)"
		return url
	}
}

/// Deletes a bookings custom attribute definition.  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.  For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus* or *Appointments Premium*.
public struct DeleteBookingCustomAttributeDefinition: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteBookingCustomAttributeDefinitionResponse
	public typealias paramType = Params
	public struct Params {
		let key: String
		/// Deletes a bookings custom attribute definition.  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.  For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus* or *Appointments Premium*.
		/// - Parameters:
		///   - key: (Beta) The key of the custom attribute definition to delete.
		public init(key: String) {
			self.key = key
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bookings/custom-attribute-definitions/\(inputs.key)"
		return url
	}
}

/// Bulk deletes bookings custom attributes.  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.  For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus* or *Appointments Premium*.
public struct BulkDeleteBookingCustomAttributes: SquareAPIEndpoint {
	public typealias inputType = BulkDeleteBookingCustomAttributesRequest
	public typealias outputType = BulkDeleteBookingCustomAttributesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings/custom-attributes/bulk-delete"
	}
}

/// Bulk upserts bookings custom attributes.  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.  For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus* or *Appointments Premium*.
public struct BulkUpsertBookingCustomAttributes: SquareAPIEndpoint {
	public typealias inputType = BulkUpsertBookingCustomAttributesRequest
	public typealias outputType = BulkUpsertBookingCustomAttributesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings/custom-attributes/bulk-upsert"
	}
}

/// Lists a booking's custom attributes.  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
public struct ListBookingCustomAttributes: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListBookingCustomAttributesResponse
	public typealias paramType = Params
	public struct Params {
		let booking_id: String
		let limit: Int?
		let cursor: String?
		let with_definitions: Bool?
		/// Lists a booking's custom attributes.  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
		/// - Parameters:
		///   - booking_id: (Beta) The ID of the target [booking](https://developer.squareup.com/reference/square_2022-11-16/objects/Booking).
		///   - limit: (Beta) The maximum number of results to return in a single paged response. This limit is advisory. The response might contain more or fewer results. The minimum value is 1 and the maximum value is 100. The default value is 20. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
		///   - cursor: (Beta) The cursor returned in the paged response from the previous call to this endpoint. Provide this cursor to retrieve the next page of results for your original request. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
		///   - with_definitions: (Beta) Indicates whether to return the [custom attribute definition](https://developer.squareup.com/reference/square_2022-11-16/objects/CustomAttributeDefinition) in the `definition` field of each custom attribute. Set this parameter to `true` to get the name and description of each custom attribute, information about the data type, or other definition details. The default value is `false`.
		public init(booking_id: String, limit: Int? = nil, cursor: String? = nil, with_definitions: Bool? = nil) {
			self.booking_id = booking_id
			self.limit = limit
			self.cursor = cursor
			self.with_definitions = with_definitions
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bookings/\(inputs.booking_id)/custom-attributes"
		var queries = [String]()
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

/// Retrieves a bookings custom attribute.  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
public struct RetrieveBookingCustomAttribute: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveBookingCustomAttributeResponse
	public typealias paramType = Params
	public struct Params {
		let booking_id: String
		let key: String
		let with_definition: Bool?
		let version: Int?
		/// Retrieves a bookings custom attribute.  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
		/// - Parameters:
		///   - booking_id: (Beta) The ID of the target [booking](https://developer.squareup.com/reference/square_2022-11-16/objects/Booking).
		///   - key: (Beta) The key of the custom attribute to retrieve. This key must match the `key` of a custom attribute definition in the Square seller account. If the requesting application is not the definition owner, you must use the qualified key.
		///   - with_definition: (Beta) Indicates whether to return the [custom attribute definition](https://developer.squareup.com/reference/square_2022-11-16/objects/CustomAttributeDefinition) in the `definition` field of the custom attribute. Set this parameter to `true` to get the name and description of the custom attribute, information about the data type, or other definition details. The default value is `false`.
		///   - version: (Beta) The current version of the custom attribute, which is used for strongly consistent reads to guarantee that you receive the most up-to-date data. When included in the request, Square returns the specified version or a higher version if one exists. If the specified version is higher than the current version, Square returns a `BAD_REQUEST` error.
		public init(booking_id: String, key: String, with_definition: Bool? = nil, version: Int? = nil) {
			self.booking_id = booking_id
			self.key = key
			self.with_definition = with_definition
			self.version = version
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bookings/\(inputs.booking_id)/custom-attributes/\(inputs.key)"
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

/// Upserts a bookings custom attribute.  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.  For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus* or *Appointments Premium*.
public struct UpsertBookingCustomAttribute: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpsertBookingCustomAttributeRequest
	public typealias outputType = UpsertBookingCustomAttributeResponse
	public typealias paramType = Params
	public struct Params {
		let booking_id: String
		let key: String
		/// Upserts a bookings custom attribute.  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.  For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus* or *Appointments Premium*.
		/// - Parameters:
		///   - booking_id: (Beta) The ID of the target [booking](https://developer.squareup.com/reference/square_2022-11-16/objects/Booking).
		///   - key: (Beta) The key of the custom attribute to create or update. This key must match the `key` of a custom attribute definition in the Square seller account. If the requesting application is not the definition owner, you must use the qualified key.
		public init(booking_id: String, key: String) {
			self.booking_id = booking_id
			self.key = key
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bookings/\(inputs.booking_id)/custom-attributes/\(inputs.key)"
		return url
	}
}

/// Deletes a bookings custom attribute.  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.  For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus* or *Appointments Premium*.
public struct DeleteBookingCustomAttribute: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteBookingCustomAttributeResponse
	public typealias paramType = Params
	public struct Params {
		let booking_id: String
		let key: String
		/// Deletes a bookings custom attribute.  To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope.  For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus* or *Appointments Premium*.
		/// - Parameters:
		///   - booking_id: (Beta) The ID of the target [booking](https://developer.squareup.com/reference/square_2022-11-16/objects/Booking).
		///   - key: (Beta) The key of the custom attribute to delete. This key must match the `key` of a custom attribute definition in the Square seller account. If the requesting application is not the definition owner, you must use the qualified key.
		public init(booking_id: String, key: String) {
			self.booking_id = booking_id
			self.key = key
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bookings/\(inputs.booking_id)/custom-attributes/\(inputs.key)"
		return url
	}
}

