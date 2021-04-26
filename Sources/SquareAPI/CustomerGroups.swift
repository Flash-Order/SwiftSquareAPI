/// Retrieves the list of customer groups of a business.
public struct ListCustomerGroups: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCustomerGroupsResponse
	public typealias paramType = Params
	public struct Params {
		let cursor: String?
		/// Retrieves the list of customer groups of a business.
		/// - Parameters:
		///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for your original query.  For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
		public init(cursor: String? = nil) {
			self.cursor = cursor
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/customers/groups"
		var queries = [String]()
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Creates a new customer group for a business.  The request must include the `name` value of the group.
public struct CreateCustomerGroup: SquareAPIEndpoint {
	public typealias inputType = CreateCustomerGroupRequest
	public typealias outputType = CreateCustomerGroupResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers/groups"
	}
}

/// Retrieves a specific customer group as identified by the `group_id` value.
public struct RetrieveCustomerGroup: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveCustomerGroupResponse
	public typealias paramType = Params
	public struct Params {
		let group_id: String
		/// Retrieves a specific customer group as identified by the `group_id` value.
		/// - Parameters:
		///   - group_id: The ID of the customer group to retrieve.
		public init(group_id: String) {
			self.group_id = group_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/customers/groups/\(inputs.group_id)"
		return url
	}
}

/// Updates a customer group as identified by the `group_id` value.
public struct UpdateCustomerGroup: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateCustomerGroupRequest
	public typealias outputType = UpdateCustomerGroupResponse
	public typealias paramType = Params
	public struct Params {
		let group_id: String
		/// Updates a customer group as identified by the `group_id` value.
		/// - Parameters:
		///   - group_id: The ID of the customer group to update.
		public init(group_id: String) {
			self.group_id = group_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/customers/groups/\(inputs.group_id)"
		return url
	}
}

/// Deletes a customer group as identified by the `group_id` value.
public struct DeleteCustomerGroup: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteCustomerGroupResponse
	public typealias paramType = Params
	public struct Params {
		let group_id: String
		/// Deletes a customer group as identified by the `group_id` value.
		/// - Parameters:
		///   - group_id: The ID of the customer group to delete.
		public init(group_id: String) {
			self.group_id = group_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/customers/groups/\(inputs.group_id)"
		return url
	}
}

