/// Lists customer profiles associated with a Square account.  Under normal operating conditions, newly created or updated customer profiles become available for the listing operation in well under 30 seconds. Occasionally, propagation of the new or updated profiles can take closer to one minute or longer, especially during network incidents and outages.
public struct ListCustomers: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCustomersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers"
	}
}

/// Creates a new customer for a business, which can have associated cards on file.  You must provide __at least one__ of the following values in your request to this endpoint:  - `given_name` - `family_name` - `company_name` - `email_address` - `phone_number`
public struct CreateCustomer: SquareAPIEndpoint {
	public typealias inputType = CreateCustomerRequest
	public typealias outputType = CreateCustomerResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers"
	}
}

/// Searches the customer profiles associated with a Square account using a supported query filter.  Calling `SearchCustomers` without any explicit query filter returns all customer profiles ordered alphabetically based on `given_name` and `family_name`.  Under normal operating conditions, newly created or updated customer profiles become available for the search operation in well under 30 seconds. Occasionally, propagation of the new or updated profiles can take closer to one minute or longer, especially during network incidents and outages.
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
		return "/v2/customers/\(inputs.customer_id)"
	}
}

/// Updates the details of an existing customer. When two profiles are merged into a single profile, that profile is assigned a new `customer_id`. You must use the new `customer_id` to update merged profiles.  You cannot edit a customer's cards on file with this endpoint. To make changes to a card on file, you must delete the existing card on file with the [DeleteCustomerCard](#endpoint-Customers-deletecustomercard) endpoint, then create a new one with the [CreateCustomerCard](#endpoint-Customers-createcustomercard) endpoint.
public struct UpdateCustomer: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateCustomerRequest
	public typealias outputType = UpdateCustomerResponse
	public typealias paramType = Params
	public struct Params {
		let customer_id: String
		/// Updates the details of an existing customer. When two profiles are merged into a single profile, that profile is assigned a new `customer_id`. You must use the new `customer_id` to update merged profiles.  You cannot edit a customer's cards on file with this endpoint. To make changes to a card on file, you must delete the existing card on file with the [DeleteCustomerCard](#endpoint-Customers-deletecustomercard) endpoint, then create a new one with the [CreateCustomerCard](#endpoint-Customers-createcustomercard) endpoint.
		/// - Parameters:
		///   - customer_id: The ID of the customer to update.
		public init(customer_id: String) {
			self.customer_id = customer_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/customers/\(inputs.customer_id)"
	}
}

/// Deletes a customer from a business, along with any linked cards on file. When two profiles are merged into a single profile, that profile is assigned a new `customer_id`. You must use the new `customer_id` to delete merged profiles.
public struct DeleteCustomer: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteCustomerResponse
	public typealias paramType = Params
	public struct Params {
		let customer_id: String
		/// Deletes a customer from a business, along with any linked cards on file. When two profiles are merged into a single profile, that profile is assigned a new `customer_id`. You must use the new `customer_id` to delete merged profiles.
		/// - Parameters:
		///   - customer_id: The ID of the customer to delete.
		public init(customer_id: String) {
			self.customer_id = customer_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/customers/\(inputs.customer_id)"
	}
}

/// Adds a card on file to an existing customer.  As with charges, calls to `CreateCustomerCard` are idempotent. Multiple calls with the same card nonce return the same card record that was created with the provided nonce during the _first_ call.
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
		return "/v2/customers/\(inputs.customer_id)/cards"
	}
}

/// Removes a card on file from a customer.
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
		return "/v2/customers/\(inputs.customer_id)/cards/\(inputs.card_id)"
	}
}

/// Adds a group membership to a customer.   The customer is identified by the `customer_id` value  and the customer group is identified by the `group_id` value.
public struct AddGroupToCustomer: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = Empty
	public typealias outputType = AddGroupToCustomerResponse
	public typealias paramType = Params
	public struct Params {
		let customer_id: String
		let group_id: String
		/// Adds a group membership to a customer.   The customer is identified by the `customer_id` value  and the customer group is identified by the `group_id` value.
		/// - Parameters:
		///   - customer_id: The ID of the customer to add to a group.
		///   - group_id: The ID of the customer group to add the customer to.
		public init(customer_id: String, group_id: String) {
			self.customer_id = customer_id
			self.group_id = group_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/customers/\(inputs.customer_id)/groups/\(inputs.group_id)"
	}
}

/// Removes a group membership from a customer.   The customer is identified by the `customer_id` value  and the customer group is identified by the `group_id` value.
public struct RemoveGroupFromCustomer: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = RemoveGroupFromCustomerResponse
	public typealias paramType = Params
	public struct Params {
		let customer_id: String
		let group_id: String
		/// Removes a group membership from a customer.   The customer is identified by the `customer_id` value  and the customer group is identified by the `group_id` value.
		/// - Parameters:
		///   - customer_id: The ID of the customer to remove from the group.
		///   - group_id: The ID of the customer group to remove the customer from.
		public init(customer_id: String, group_id: String) {
			self.customer_id = customer_id
			self.group_id = group_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/customers/\(inputs.customer_id)/groups/\(inputs.group_id)"
	}
}

