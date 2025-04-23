/// Lists customer profiles associated with a Square account.  Under normal operating conditions, newly created or updated customer profiles become available for the listing operation in well under 30 seconds. Occasionally, propagation of the new or updated profiles can take closer to one minute or longer, especially during network incidents and outages.
public struct ListCustomers: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCustomersResponse
	public typealias paramType = Params
	public struct Params {
		let cursor: String?
		let limit: Int?
		let sort_field: CustomerSortField?
		let sort_order: SortOrder?
		let count: Bool?
		/// Lists customer profiles associated with a Square account.  Under normal operating conditions, newly created or updated customer profiles become available for the listing operation in well under 30 seconds. Occasionally, propagation of the new or updated profiles can take closer to one minute or longer, especially during network incidents and outages.
		/// - Parameters:
		///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for your original query.  For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
		///   - limit: The maximum number of results to return in a single page. This limit is advisory. The response might contain more or fewer results. If the specified limit is less than 1 or greater than 100, Square returns a `400 VALUE_TOO_LOW` or `400 VALUE_TOO_HIGH` error. The default value is 100.  For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
		///   - sort_field: Indicates how customers should be sorted.  The default value is `DEFAULT`.
		///   - sort_order: Indicates whether customers should be sorted in ascending (`ASC`) or descending (`DESC`) order.  The default value is `ASC`.
		///   - count: Indicates whether to return the total count of customers in the `count` field of the response.  The default value is `false`.
		public init(cursor: String? = nil, limit: Int? = nil, sort_field: CustomerSortField? = nil, sort_order: SortOrder? = nil, count: Bool? = nil) {
			self.cursor = cursor
			self.limit = limit
			self.sort_field = sort_field
			self.sort_order = sort_order
			self.count = count
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/customers"
		var queries = [String]()
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if let v = inputs.sort_field { queries.append("sort_field=\(v)") }
		if let v = inputs.sort_order { queries.append("sort_order=\(v)") }
		if let v = inputs.count { queries.append("count=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Creates a new customer for a business.  You must provide at least one of the following values in your request to this endpoint:  - `given_name` - `family_name` - `company_name` - `email_address` - `phone_number`
public struct CreateCustomer: SquareAPIEndpoint {
	public typealias inputType = CreateCustomerRequest
	public typealias outputType = CreateCustomerResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers"
	}
}

/// Creates multiple [customer profiles](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Customer) for a business.  This endpoint takes a map of individual create requests and returns a map of responses.  You must provide at least one of the following values in each create request:  - `given_name` - `family_name` - `company_name` - `email_address` - `phone_number`
public struct BulkCreateCustomers: SquareAPIEndpoint {
	public typealias inputType = BulkCreateCustomersRequest
	public typealias outputType = BulkCreateCustomersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers/bulk-create"
	}
}

/// Deletes multiple customer profiles.  The endpoint takes a list of customer IDs and returns a map of responses.
public struct BulkDeleteCustomers: SquareAPIEndpoint {
	public typealias inputType = BulkDeleteCustomersRequest
	public typealias outputType = BulkDeleteCustomersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers/bulk-delete"
	}
}

/// Retrieves multiple customer profiles.  This endpoint takes a list of customer IDs and returns a map of responses.
public struct BulkRetrieveCustomers: SquareAPIEndpoint {
	public typealias inputType = BulkRetrieveCustomersRequest
	public typealias outputType = BulkRetrieveCustomersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers/bulk-retrieve"
	}
}

/// Updates multiple customer profiles.  This endpoint takes a map of individual update requests and returns a map of responses.
public struct BulkUpdateCustomers: SquareAPIEndpoint {
	public typealias inputType = BulkUpdateCustomersRequest
	public typealias outputType = BulkUpdateCustomersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers/bulk-update"
	}
}

/// Searches the customer profiles associated with a Square account using one or more supported query filters.  Calling `SearchCustomers` without any explicit query filter returns all customer profiles ordered alphabetically based on `given_name` and `family_name`.  Under normal operating conditions, newly created or updated customer profiles become available for the search operation in well under 30 seconds. Occasionally, propagation of the new or updated profiles can take closer to one minute or longer, especially during network incidents and outages.
public struct SearchCustomers: SquareAPIEndpoint {
	public typealias inputType = SearchCustomersRequest
	public typealias outputType = SearchCustomersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers/search"
	}
}

/// Returns details for a single customer.
public struct RetrieveCustomer: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveCustomerResponse
	public typealias paramType = Params
	public struct Params {
		let customer_id: String
		/// Returns details for a single customer.
		/// - Parameters:
		///   - customer_id: The ID of the customer to retrieve.
		public init(customer_id: String) {
			self.customer_id = customer_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/customers/\(inputs.customer_id)"
		return url
	}
}

/// Updates a customer profile. This endpoint supports sparse updates, so only new or changed fields are required in the request. To add or update a field, specify the new value. To remove a field, specify `null`.  To update a customer profile that was created by merging existing profiles, you must use the ID of the newly created profile.
public struct UpdateCustomer: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateCustomerRequest
	public typealias outputType = UpdateCustomerResponse
	public typealias paramType = Params
	public struct Params {
		let customer_id: String
		/// Updates a customer profile. This endpoint supports sparse updates, so only new or changed fields are required in the request. To add or update a field, specify the new value. To remove a field, specify `null`.  To update a customer profile that was created by merging existing profiles, you must use the ID of the newly created profile.
		/// - Parameters:
		///   - customer_id: The ID of the customer to update.
		public init(customer_id: String) {
			self.customer_id = customer_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/customers/\(inputs.customer_id)"
		return url
	}
}

/// Deletes a customer profile from a business.  To delete a customer profile that was created by merging existing profiles, you must use the ID of the newly created profile.
public struct DeleteCustomer: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteCustomerResponse
	public typealias paramType = Params
	public struct Params {
		let customer_id: String
		let version: Int?
		/// Deletes a customer profile from a business.  To delete a customer profile that was created by merging existing profiles, you must use the ID of the newly created profile.
		/// - Parameters:
		///   - customer_id: The ID of the customer to delete.
		///   - version: The current version of the customer profile.  As a best practice, you should include this parameter to enable [optimistic concurrency](https://developer.squareup.com/docs/build-basics/common-api-patterns/optimistic-concurrency) control.  For more information, see [Delete a customer profile](https://developer.squareup.com/docs/customers-api/use-the-api/keep-records#delete-customer-profile).
		public init(customer_id: String, version: Int? = nil) {
			self.customer_id = customer_id
			self.version = version
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/customers/\(inputs.customer_id)"
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

/// Adds a card on file to an existing customer.  As with charges, calls to `CreateCustomerCard` are idempotent. Multiple calls with the same card nonce return the same card record that was created with the provided nonce during the _first_ call.
@available(*,deprecated)
public struct CreateCustomerCard: SquareAPIEndpoint {
	public typealias inputType = CreateCustomerCardRequest
	public typealias outputType = CreateCustomerCardResponse
	public typealias paramType = Params
	public struct Params {
		let customer_id: String
		/// Adds a card on file to an existing customer.  As with charges, calls to `CreateCustomerCard` are idempotent. Multiple calls with the same card nonce return the same card record that was created with the provided nonce during the _first_ call.
		/// - Parameters:
		///   - customer_id: The Square ID of the customer profile the card is linked to.
		public init(customer_id: String) {
			self.customer_id = customer_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/customers/\(inputs.customer_id)/cards"
		return url
	}
}

/// Removes a card on file from a customer.
@available(*,deprecated)
public struct DeleteCustomerCard: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteCustomerCardResponse
	public typealias paramType = Params
	public struct Params {
		let customer_id: String
		let card_id: String
		/// Removes a card on file from a customer.
		/// - Parameters:
		///   - customer_id: The ID of the customer that the card on file belongs to.
		///   - card_id: The ID of the card on file to delete.
		public init(customer_id: String, card_id: String) {
			self.customer_id = customer_id
			self.card_id = card_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/customers/\(inputs.customer_id)/cards/\(inputs.card_id)"
		return url
	}
}

/// Adds a group membership to a customer.  The customer is identified by the `customer_id` value and the customer group is identified by the `group_id` value.
public struct AddGroupToCustomer: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = Empty
	public typealias outputType = AddGroupToCustomerResponse
	public typealias paramType = Params
	public struct Params {
		let customer_id: String
		let group_id: String
		/// Adds a group membership to a customer.  The customer is identified by the `customer_id` value and the customer group is identified by the `group_id` value.
		/// - Parameters:
		///   - customer_id: The ID of the customer to add to a group.
		///   - group_id: The ID of the customer group to add the customer to.
		public init(customer_id: String, group_id: String) {
			self.customer_id = customer_id
			self.group_id = group_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/customers/\(inputs.customer_id)/groups/\(inputs.group_id)"
		return url
	}
}

/// Removes a group membership from a customer.  The customer is identified by the `customer_id` value and the customer group is identified by the `group_id` value.
public struct RemoveGroupFromCustomer: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = RemoveGroupFromCustomerResponse
	public typealias paramType = Params
	public struct Params {
		let customer_id: String
		let group_id: String
		/// Removes a group membership from a customer.  The customer is identified by the `customer_id` value and the customer group is identified by the `group_id` value.
		/// - Parameters:
		///   - customer_id: The ID of the customer to remove from the group.
		///   - group_id: The ID of the customer group to remove the customer from.
		public init(customer_id: String, group_id: String) {
			self.customer_id = customer_id
			self.group_id = group_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/customers/\(inputs.customer_id)/groups/\(inputs.group_id)"
		return url
	}
}

