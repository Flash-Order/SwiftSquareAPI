/// Retrieves the list of customer groups of a business.
public struct ListCustomerGroups: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCustomerGroupsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers/groups"
	}
}

/// Creates a new customer group for a business.   The request must include the `name` value of the group.
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
		return "/v2/customers/groups/\(inputs.group_id)"
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
		return "/v2/customers/groups/\(inputs.group_id)"
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
		return "/v2/customers/groups/\(inputs.group_id)"
	}
}

