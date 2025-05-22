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
		///   - id: The UUID for the `BreakType` being updated.
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

/// Creates a scheduled shift by providing draft shift details such as job ID, team member assignment, and start and end times.  The following `draft_shift_details` fields are required: - `location_id` - `job_id` - `start_at` - `end_at`
public struct CreateScheduledShift: SquareAPIEndpoint {
	public typealias inputType = CreateScheduledShiftRequest
	public typealias outputType = CreateScheduledShiftResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/scheduled-shifts"
	}
}

/// Publishes 1 - 100 scheduled shifts. This endpoint takes a map of individual publish requests and returns a map of responses. When a scheduled shift is published, Square keeps the `draft_shift_details` field as is and copies it to the `published_shift_details` field.  The minimum `start_at` and maximum `end_at` timestamps of all shifts in a `BulkPublishScheduledShifts` request must fall within a two-week period.
public struct BulkPublishScheduledShifts: SquareAPIEndpoint {
	public typealias inputType = BulkPublishScheduledShiftsRequest
	public typealias outputType = BulkPublishScheduledShiftsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/scheduled-shifts/bulk-publish"
	}
}

/// Returns a paginated list of scheduled shifts, with optional filter and sort settings. By default, results are sorted by `start_at` in ascending order.
public struct SearchScheduledShifts: SquareAPIEndpoint {
	public typealias inputType = SearchScheduledShiftsRequest
	public typealias outputType = SearchScheduledShiftsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/scheduled-shifts/search"
	}
}

/// Retrieves a scheduled shift by ID.
public struct RetrieveScheduledShift: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveScheduledShiftResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Retrieves a scheduled shift by ID.
		/// - Parameters:
		///   - id: The ID of the scheduled shift to retrieve.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/labor/scheduled-shifts/\(inputs.id)"
		return url
	}
}

/// Updates the draft shift details for a scheduled shift. This endpoint supports sparse updates, so only new, changed, or removed fields are required in the request. You must publish the shift to make updates public.  You can make the following updates to `draft_shift_details`: - Change the `location_id`, `job_id`, `start_at`, and `end_at` fields. - Add, change, or clear the `team_member_id` and `notes` fields. To clear these fields, set the value to null. - Change the `is_deleted` field. To delete a scheduled shift, set `is_deleted` to true and then publish the shift.
public struct UpdateScheduledShift: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateScheduledShiftRequest
	public typealias outputType = UpdateScheduledShiftResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Updates the draft shift details for a scheduled shift. This endpoint supports sparse updates, so only new, changed, or removed fields are required in the request. You must publish the shift to make updates public.  You can make the following updates to `draft_shift_details`: - Change the `location_id`, `job_id`, `start_at`, and `end_at` fields. - Add, change, or clear the `team_member_id` and `notes` fields. To clear these fields, set the value to null. - Change the `is_deleted` field. To delete a scheduled shift, set `is_deleted` to true and then publish the shift.
		/// - Parameters:
		///   - id: The ID of the scheduled shift to update.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/labor/scheduled-shifts/\(inputs.id)"
		return url
	}
}

/// Publishes a scheduled shift. When a scheduled shift is published, Square keeps the `draft_shift_details` field as is and copies it to the `published_shift_details` field.
public struct PublishScheduledShift: SquareAPIEndpoint {
	public typealias inputType = PublishScheduledShiftRequest
	public typealias outputType = PublishScheduledShiftResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Publishes a scheduled shift. When a scheduled shift is published, Square keeps the `draft_shift_details` field as is and copies it to the `published_shift_details` field.
		/// - Parameters:
		///   - id: The ID of the scheduled shift to publish.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/labor/scheduled-shifts/\(inputs.id)/publish"
		return url
	}
}

/// Creates a new `Shift`.  A `Shift` represents a complete workday for a single team member. You must provide the following values in your request to this endpoint:  - `location_id` - `team_member_id` - `start_at`  An attempt to create a new `Shift` can result in a `BAD_REQUEST` error when: - The `status` of the new `Shift` is `OPEN` and the team member has another shift with an `OPEN` status. - The `start_at` date is in the future. - The `start_at` or `end_at` date overlaps another shift for the same team member. - The `Break` instances are set in the request and a break `start_at` is before the `Shift.start_at`, a break `end_at` is after the `Shift.end_at`, or both.
@available(*,deprecated)
public struct CreateShift: SquareAPIEndpoint {
	public typealias inputType = CreateShiftRequest
	public typealias outputType = CreateShiftResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/shifts"
	}
}

/// Returns a paginated list of `Shift` records for a business. The list to be returned can be filtered by: - Location IDs - Team member IDs - Shift status (`OPEN` or `CLOSED`) - Shift start - Shift end - Workday details  The list can be sorted by: - `START_AT` - `END_AT` - `CREATED_AT` - `UPDATED_AT`
@available(*,deprecated)
public struct SearchShifts: SquareAPIEndpoint {
	public typealias inputType = SearchShiftsRequest
	public typealias outputType = SearchShiftsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/shifts/search"
	}
}

/// Returns a single `Shift` specified by `id`.
@available(*,deprecated)
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
@available(*,deprecated)
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
@available(*,deprecated)
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

/// Returns a single `TeamMemberWage` specified by `id`.
public struct GetTeamMemberWage: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetTeamMemberWageResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Returns a single `TeamMemberWage` specified by `id`.
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

/// Creates a new `Timecard`.  A `Timecard` represents a complete workday for a single team member. You must provide the following values in your request to this endpoint:  - `location_id` - `team_member_id` - `start_at`  An attempt to create a new `Timecard` can result in a `BAD_REQUEST` error when: - The `status` of the new `Timecard` is `OPEN` and the team member has another timecard with an `OPEN` status. - The `start_at` date is in the future. - The `start_at` or `end_at` date overlaps another timecard for the same team member. - The `Break` instances are set in the request and a break `start_at` is before the `Timecard.start_at`, a break `end_at` is after the `Timecard.end_at`, or both.
public struct CreateTimecard: SquareAPIEndpoint {
	public typealias inputType = CreateTimecardRequest
	public typealias outputType = CreateTimecardResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/timecards"
	}
}

/// Returns a paginated list of `Timecard` records for a business. The list to be returned can be filtered by: - Location IDs - Team member IDs - Timecard status (`OPEN` or `CLOSED`) - Timecard start - Timecard end - Workday details  The list can be sorted by: - `START_AT` - `END_AT` - `CREATED_AT` - `UPDATED_AT`
public struct SearchTimecards: SquareAPIEndpoint {
	public typealias inputType = SearchTimecardsRequest
	public typealias outputType = SearchTimecardsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/timecards/search"
	}
}

/// Returns a single `Timecard` specified by `id`.
public struct RetrieveTimecard: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveTimecardResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Returns a single `Timecard` specified by `id`.
		/// - Parameters:
		///   - id: The UUID for the `Timecard` being retrieved.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/labor/timecards/\(inputs.id)"
		return url
	}
}

/// Updates an existing `Timecard`.  When adding a `Break` to a `Timecard`, any earlier `Break` instances in the `Timecard` have the `end_at` property set to a valid RFC-3339 datetime string.  When closing a `Timecard`, all `Break` instances in the `Timecard` must be complete with `end_at` set on each `Break`.
public struct UpdateTimecard: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateTimecardRequest
	public typealias outputType = UpdateTimecardResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Updates an existing `Timecard`.  When adding a `Break` to a `Timecard`, any earlier `Break` instances in the `Timecard` have the `end_at` property set to a valid RFC-3339 datetime string.  When closing a `Timecard`, all `Break` instances in the `Timecard` must be complete with `end_at` set on each `Break`.
		/// - Parameters:
		///   - id: The ID of the object being updated.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/labor/timecards/\(inputs.id)"
		return url
	}
}

/// Deletes a `Timecard`.
public struct DeleteTimecard: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteTimecardResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Deletes a `Timecard`.
		/// - Parameters:
		///   - id: The UUID for the `Timecard` being deleted.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/labor/timecards/\(inputs.id)"
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

