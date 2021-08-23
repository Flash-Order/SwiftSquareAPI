/// Provides summary information for all of a business's employees.
public struct V1ListEmployees: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Employee]
	public typealias paramType = Params
	public struct Params {
		let order: String?
		let begin_updated_at: String?
		let end_updated_at: String?
		let begin_created_at: String?
		let end_created_at: String?
		let status: String?
		let external_id: String?
		let limit: Int?
		let batch_token: String?
		/// Provides summary information for all of a business's employees.
		/// - Parameters:
		///   - order: The order in which employees are listed in the response, based on their created_at field.      Default value: ASC
		///   - begin_updated_at: If filtering results by their updated_at field, the beginning of the requested reporting period, in ISO 8601 format
		///   - end_updated_at: If filtering results by there updated_at field, the end of the requested reporting period, in ISO 8601 format.
		///   - begin_created_at: If filtering results by their created_at field, the beginning of the requested reporting period, in ISO 8601 format.
		///   - end_created_at: If filtering results by their created_at field, the end of the requested reporting period, in ISO 8601 format.
		///   - status: If provided, the endpoint returns only employee entities with the specified status (ACTIVE or INACTIVE).
		///   - external_id: If provided, the endpoint returns only employee entities with the specified external_id.
		///   - limit: The maximum integer number of employee entities to return in a single response. Default 100, maximum 200.
		///   - batch_token: A pagination cursor to retrieve the next set of results for your original query to the endpoint.
		public init(order: String? = nil, begin_updated_at: String? = nil, end_updated_at: String? = nil, begin_created_at: String? = nil, end_created_at: String? = nil, status: String? = nil, external_id: String? = nil, limit: Int? = nil, batch_token: String? = nil) {
			self.order = order
			self.begin_updated_at = begin_updated_at
			self.end_updated_at = end_updated_at
			self.begin_created_at = begin_created_at
			self.end_created_at = end_created_at
			self.status = status
			self.external_id = external_id
			self.limit = limit
			self.batch_token = batch_token
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/me/employees"
		var queries = [String]()
		if let v = inputs.order { queries.append("order=\(v)") }
		if let v = inputs.begin_updated_at { queries.append("begin_updated_at=\(v)") }
		if let v = inputs.end_updated_at { queries.append("end_updated_at=\(v)") }
		if let v = inputs.begin_created_at { queries.append("begin_created_at=\(v)") }
		if let v = inputs.end_created_at { queries.append("end_created_at=\(v)") }
		if let v = inputs.status { queries.append("status=\(v)") }
		if let v = inputs.external_id { queries.append("external_id=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if let v = inputs.batch_token { queries.append("batch_token=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

///  Use the CreateEmployee endpoint to add an employee to a Square account. Employees created with the Connect API have an initial status of `INACTIVE`. Inactive employees cannot sign in to Square Point of Sale until they are activated from the Square Dashboard. Employee status cannot be changed with the Connect API.  Employee entities cannot be deleted. To disable employee profiles, set the employee's status to <code>INACTIVE</code>
public struct V1CreateEmployee: SquareAPIEndpoint {
	public typealias inputType = V1Employee
	public typealias outputType = V1Employee
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/me/employees"
	}
}

/// Provides the details for a single employee.
public struct V1RetrieveEmployee: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1Employee
	public typealias paramType = Params
	public struct Params {
		let employee_id: String
		/// Provides the details for a single employee.
		/// - Parameters:
		///   - employee_id: The employee's ID.
		public init(employee_id: String) {
			self.employee_id = employee_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/me/employees/\(inputs.employee_id)"
		return url
	}
}

public struct V1UpdateEmployee: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = V1Employee
	public typealias outputType = V1Employee
	public typealias paramType = Params
	public struct Params {
		let employee_id: String
		public init(employee_id: String) {
			self.employee_id = employee_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/me/employees/\(inputs.employee_id)"
		return url
	}
}

/// Provides summary information for all of a business's employee roles.
public struct V1ListEmployeeRoles: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1EmployeeRole]
	public typealias paramType = Params
	public struct Params {
		let order: String?
		let limit: Int?
		let batch_token: String?
		/// Provides summary information for all of a business's employee roles.
		/// - Parameters:
		///   - order: The order in which employees are listed in the response, based on their created_at field.Default value: ASC
		///   - limit: The maximum integer number of employee entities to return in a single response. Default 100, maximum 200.
		///   - batch_token: A pagination cursor to retrieve the next set of results for your original query to the endpoint.
		public init(order: String? = nil, limit: Int? = nil, batch_token: String? = nil) {
			self.order = order
			self.limit = limit
			self.batch_token = batch_token
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/me/roles"
		var queries = [String]()
		if let v = inputs.order { queries.append("order=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if let v = inputs.batch_token { queries.append("batch_token=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Creates an employee role you can then assign to employees.  Square accounts can include any number of roles that can be assigned to employees. These roles define the actions and permissions granted to an employee with that role. For example, an employee with a "Shift Manager" role might be able to issue refunds in Square Point of Sale, whereas an employee with a "Clerk" role might not.  Roles are assigned with the [V1UpdateEmployee](https://developer.squareup.com/reference/square_2021-08-18/v1-employees-api/update-employee-role) endpoint. An employee can have only one role at a time.  If an employee has no role, they have none of the permissions associated with roles. All employees can accept payments with Square Point of Sale.
public struct V1CreateEmployeeRole: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = V1EmployeeRole
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/me/roles"
	}
}

/// Provides the details for a single employee role.
public struct V1RetrieveEmployeeRole: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1EmployeeRole
	public typealias paramType = Params
	public struct Params {
		let role_id: String
		/// Provides the details for a single employee role.
		/// - Parameters:
		///   - role_id: The role's ID.
		public init(role_id: String) {
			self.role_id = role_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/me/roles/\(inputs.role_id)"
		return url
	}
}

/// Modifies the details of an employee role.
public struct V1UpdateEmployeeRole: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = V1EmployeeRole
	public typealias outputType = V1EmployeeRole
	public typealias paramType = Params
	public struct Params {
		let role_id: String
		/// Modifies the details of an employee role.
		/// - Parameters:
		///   - role_id: The ID of the role to modify.
		public init(role_id: String) {
			self.role_id = role_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/me/roles/\(inputs.role_id)"
		return url
	}
}

