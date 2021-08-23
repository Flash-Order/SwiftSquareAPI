/// Returns a paginated list of `BreakType` instances for a business.
public struct ListBreakTypes: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListBreakTypesResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String?
		let limit: Int?
		let cursor: String?
		/// Returns a paginated list of `BreakType` instances for a business.
		/// - Parameters:
		///   - location_id: Filter the returned `BreakType` results to only those that are associated with the specified location.
		///   - limit: The maximum number of `BreakType` results to return per page. The number can range between 1 and 200. The default is 200.
		///   - cursor: A pointer to the next page of `BreakType` results to fetch.
		public init(location_id: String? = nil, limit: Int? = nil, cursor: String? = nil) {
			self.location_id = location_id
			self.limit = limit
			self.cursor = cursor
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/labor/break-types"
		var queries = [String]()
		if let v = inputs.location_id { queries.append("location_id=\(v)") }
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

/// Creates a new `BreakType`.  A `BreakType` is a template for creating `Break` objects. You must provide the following values in your request to this endpoint:  - `location_id` - `break_name` - `expected_duration` - `is_paid`  You can only have three `BreakType` instances per location. If you attempt to add a fourth `BreakType` for a location, an `INVALID_REQUEST_ERROR` "Exceeded limit of 3 breaks per location." is returned.
public struct CreateBreakType: SquareAPIEndpoint {
	public typealias inputType = CreateBreakTypeRequest
	public typealias outputType = CreateBreakTypeResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/break-types"
	}
}

/// Returns a single `BreakType` specified by `id`.
public struct GetBreakType: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetBreakTypeResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Returns a single `BreakType` specified by `id`.
		/// - Parameters:
		///   - id: The UUID for the `BreakType` being retrieved.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/labor/break-types/\(inputs.id)"
		return url
	}
}

/// Updates an existing `BreakType`.
public struct UpdateBreakType: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateBreakTypeRequest
	public typealias outputType = UpdateBreakTypeResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Updates an existing `BreakType`.
		/// - Parameters:
		///   - id:  The UUID for the `BreakType` being updated.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/labor/break-types/\(inputs.id)"
		return url
	}
}

/// Deletes an existing `BreakType`.  A `BreakType` can be deleted even if it is referenced from a `Shift`.
public struct DeleteBreakType: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteBreakTypeResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Deletes an existing `BreakType`.  A `BreakType` can be deleted even if it is referenced from a `Shift`.
		/// - Parameters:
		///   - id: The UUID for the `BreakType` being deleted.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/labor/break-types/\(inputs.id)"
		return url
	}
}

/// Returns a paginated list of `EmployeeWage` instances for a business.
@available(*,deprecated)
public struct ListEmployeeWages: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListEmployeeWagesResponse
	public typealias paramType = Params
	public struct Params {
		let employee_id: String?
		let limit: Int?
		let cursor: String?
		/// Returns a paginated list of `EmployeeWage` instances for a business.
		/// - Parameters:
		///   - employee_id: Filter the returned wages to only those that are associated with the specified employee.
		///   - limit: The maximum number of `EmployeeWage` results to return per page. The number can range between 1 and 200. The default is 200.
		///   - cursor: A pointer to the next page of `EmployeeWage` results to fetch.
		public init(employee_id: String? = nil, limit: Int? = nil, cursor: String? = nil) {
			self.employee_id = employee_id
			self.limit = limit
			self.cursor = cursor
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/labor/employee-wages"
		var queries = [String]()
		if let v = inputs.employee_id { queries.append("employee_id=\(v)") }
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

/// Returns a single `EmployeeWage` specified by `id`.
@available(*,deprecated)
public struct GetEmployeeWage: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetEmployeeWageResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Returns a single `EmployeeWage` specified by `id`.
		/// - Parameters:
		///   - id: The UUID for the `EmployeeWage` being retrieved.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/labor/employee-wages/\(inputs.id)"
		return url
	}
}

/// Creates a new `Shift`.  A `Shift` represents a complete workday for a single employee. You must provide the following values in your request to this endpoint:  - `location_id` - `employee_id` - `start_at`  An attempt to create a new `Shift` can result in a `BAD_REQUEST` error when: - The `status` of the new `Shift` is `OPEN` and the employee has another shift with an `OPEN` status. - The `start_at` date is in the future. - The `start_at` or `end_at` date overlaps another shift for the same employee. - The `Break` instances are set in the request and a break `start_at` is before the `Shift.start_at`, a break `end_at` is after the `Shift.end_at`, or both.
public struct CreateShift: SquareAPIEndpoint {
	public typealias inputType = CreateShiftRequest
	public typealias outputType = CreateShiftResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/shifts"
	}
}

/// Returns a paginated list of `Shift` records for a business. The list to be returned can be filtered by: - Location IDs. - Employee IDs. - Shift status (`OPEN` and `CLOSED`). - Shift start. - Shift end. - Workday details.  The list can be sorted by: - `start_at`. - `end_at`. - `created_at`. - `updated_at`.
public struct SearchShifts: SquareAPIEndpoint {
	public typealias inputType = SearchShiftsRequest
	public typealias outputType = SearchShiftsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/shifts/search"
	}
}

/// Returns a single `Shift` specified by `id`.
public struct GetShift: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetShiftResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Returns a single `Shift` specified by `id`.
		/// - Parameters:
		///   - id: The UUID for the `Shift` being retrieved.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/labor/shifts/\(inputs.id)"
		return url
	}
}

/// Updates an existing `Shift`.  When adding a `Break` to a `Shift`, any earlier `Break` instances in the `Shift` have the `end_at` property set to a valid RFC-3339 datetime string.  When closing a `Shift`, all `Break` instances in the `Shift` must be complete with `end_at` set on each `Break`.
public struct UpdateShift: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateShiftRequest
	public typealias outputType = UpdateShiftResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Updates an existing `Shift`.  When adding a `Break` to a `Shift`, any earlier `Break` instances in the `Shift` have the `end_at` property set to a valid RFC-3339 datetime string.  When closing a `Shift`, all `Break` instances in the `Shift` must be complete with `end_at` set on each `Break`.
		/// - Parameters:
		///   - id: The ID of the object being updated.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/labor/shifts/\(inputs.id)"
		return url
	}
}

/// Deletes a `Shift`.
public struct DeleteShift: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteShiftResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Deletes a `Shift`.
		/// - Parameters:
		///   - id: The UUID for the `Shift` being deleted.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/labor/shifts/\(inputs.id)"
		return url
	}
}

/// Returns a paginated list of `TeamMemberWage` instances for a business.
public struct ListTeamMemberWages: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListTeamMemberWagesResponse
	public typealias paramType = Params
	public struct Params {
		let team_member_id: String?
		let limit: Int?
		let cursor: String?
		/// Returns a paginated list of `TeamMemberWage` instances for a business.
		/// - Parameters:
		///   - team_member_id: Filter the returned wages to only those that are associated with the specified team member.
		///   - limit: The maximum number of `TeamMemberWage` results to return per page. The number can range between 1 and 200. The default is 200.
		///   - cursor: A pointer to the next page of `EmployeeWage` results to fetch.
		public init(team_member_id: String? = nil, limit: Int? = nil, cursor: String? = nil) {
			self.team_member_id = team_member_id
			self.limit = limit
			self.cursor = cursor
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/labor/team-member-wages"
		var queries = [String]()
		if let v = inputs.team_member_id { queries.append("team_member_id=\(v)") }
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

/// Returns a single `TeamMemberWage` specified by `id `.
public struct GetTeamMemberWage: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetTeamMemberWageResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Returns a single `TeamMemberWage` specified by `id `.
		/// - Parameters:
		///   - id: The UUID for the `TeamMemberWage` being retrieved.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/labor/team-member-wages/\(inputs.id)"
		return url
	}
}

/// Returns a list of `WorkweekConfig` instances for a business.
public struct ListWorkweekConfigs: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListWorkweekConfigsResponse
	public typealias paramType = Params
	public struct Params {
		let limit: Int?
		let cursor: String?
		/// Returns a list of `WorkweekConfig` instances for a business.
		/// - Parameters:
		///   - limit: The maximum number of `WorkweekConfigs` results to return per page.
		///   - cursor: A pointer to the next page of `WorkweekConfig` results to fetch.
		public init(limit: Int? = nil, cursor: String? = nil) {
			self.limit = limit
			self.cursor = cursor
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/labor/workweek-configs"
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

/// Updates a `WorkweekConfig`.
public struct UpdateWorkweekConfig: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateWorkweekConfigRequest
	public typealias outputType = UpdateWorkweekConfigResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Updates a `WorkweekConfig`.
		/// - Parameters:
		///   - id: The UUID for the `WorkweekConfig` object being updated.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/labor/workweek-configs/\(inputs.id)"
		return url
	}
}

