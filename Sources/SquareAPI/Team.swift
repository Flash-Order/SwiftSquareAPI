/// Creates a single `TeamMember` object. The `TeamMember` object is returned on successful creates. You must provide the following values in your request to this endpoint: - `given_name` - `family_name`  Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#createteammember).
public struct CreateTeamMember: SquareAPIEndpoint {
	public typealias inputType = CreateTeamMemberRequest
	public typealias outputType = CreateTeamMemberResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members"
	}
}

/// Creates multiple `TeamMember` objects. The created `TeamMember` objects are returned on successful creates. This process is non-transactional and processes as much of the request as possible. If one of the creates in the request cannot be successfully processed, the request is not marked as failed, but the body of the response contains explicit error information for the failed create.  Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#bulk-create-team-members).
public struct BulkCreateTeamMembers: SquareAPIEndpoint {
	public typealias inputType = BulkCreateTeamMembersRequest
	public typealias outputType = BulkCreateTeamMembersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members/bulk-create"
	}
}

/// Updates multiple `TeamMember` objects. The updated `TeamMember` objects are returned on successful updates. This process is non-transactional and processes as much of the request as possible. If one of the updates in the request cannot be successfully processed, the request is not marked as failed, but the body of the response contains explicit error information for the failed update. Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#bulk-update-team-members).
public struct BulkUpdateTeamMembers: SquareAPIEndpoint {
	public typealias inputType = BulkUpdateTeamMembersRequest
	public typealias outputType = BulkUpdateTeamMembersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members/bulk-update"
	}
}

/// Lists jobs in a seller account. Results are sorted by title in ascending order.
public struct ListJobs: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListJobsResponse
	public typealias paramType = Params
	public struct Params {
		let cursor: String?
		/// Lists jobs in a seller account. Results are sorted by title in ascending order.
		/// - Parameters:
		///   - cursor: The pagination cursor returned by the previous call to this endpoint. Provide this cursor to retrieve the next page of results for your original request. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
		public init(cursor: String? = nil) {
			self.cursor = cursor
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/team-members/jobs"
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

/// Creates a job in a seller account. A job defines a title and tip eligibility. Note that compensation is defined in a [job assignment](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/JobAssignment) in a team member's wage setting.
public struct CreateJob: SquareAPIEndpoint {
	public typealias inputType = CreateJobRequest
	public typealias outputType = CreateJobResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members/jobs"
	}
}

/// Retrieves a specified job.
public struct RetrieveJob: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveJobResponse
	public typealias paramType = Params
	public struct Params {
		let job_id: String
		/// Retrieves a specified job.
		/// - Parameters:
		///   - job_id: The ID of the job to retrieve.
		public init(job_id: String) {
			self.job_id = job_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/team-members/jobs/\(inputs.job_id)"
		return url
	}
}

/// Updates the title or tip eligibility of a job. Changes to the title propagate to all `JobAssignment`, `Shift`, and `TeamMemberWage` objects that reference the job ID. Changes to tip eligibility propagate to all `TeamMemberWage` objects that reference the job ID.
public struct UpdateJob: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateJobRequest
	public typealias outputType = UpdateJobResponse
	public typealias paramType = Params
	public struct Params {
		let job_id: String
		/// Updates the title or tip eligibility of a job. Changes to the title propagate to all `JobAssignment`, `Shift`, and `TeamMemberWage` objects that reference the job ID. Changes to tip eligibility propagate to all `TeamMemberWage` objects that reference the job ID.
		/// - Parameters:
		///   - job_id: The ID of the job to update.
		public init(job_id: String) {
			self.job_id = job_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/team-members/jobs/\(inputs.job_id)"
		return url
	}
}

/// Returns a paginated list of `TeamMember` objects for a business.  The list can be filtered by location IDs, `ACTIVE` or `INACTIVE` status, or whether the team member is the Square account owner.
public struct SearchTeamMembers: SquareAPIEndpoint {
	public typealias inputType = SearchTeamMembersRequest
	public typealias outputType = SearchTeamMembersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members/search"
	}
}

/// Retrieves a `TeamMember` object for the given `TeamMember.id`. Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#retrieve-a-team-member).
public struct RetrieveTeamMember: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveTeamMemberResponse
	public typealias paramType = Params
	public struct Params {
		let team_member_id: String
		/// Retrieves a `TeamMember` object for the given `TeamMember.id`. Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#retrieve-a-team-member).
		/// - Parameters:
		///   - team_member_id: The ID of the team member to retrieve.
		public init(team_member_id: String) {
			self.team_member_id = team_member_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/team-members/\(inputs.team_member_id)"
		return url
	}
}

/// Updates a single `TeamMember` object. The `TeamMember` object is returned on successful updates. Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#update-a-team-member).
public struct UpdateTeamMember: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateTeamMemberRequest
	public typealias outputType = UpdateTeamMemberResponse
	public typealias paramType = Params
	public struct Params {
		let team_member_id: String
		/// Updates a single `TeamMember` object. The `TeamMember` object is returned on successful updates. Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#update-a-team-member).
		/// - Parameters:
		///   - team_member_id: The ID of the team member to update.
		public init(team_member_id: String) {
			self.team_member_id = team_member_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/team-members/\(inputs.team_member_id)"
		return url
	}
}

/// Retrieves a `WageSetting` object for a team member specified by `TeamMember.id`. For more information, see [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#retrievewagesetting).  Square recommends using [RetrieveTeamMember](api-endpoint:Team-RetrieveTeamMember) or [SearchTeamMembers](api-endpoint:Team-SearchTeamMembers) to get this information directly from the `TeamMember.wage_setting` field.
public struct RetrieveWageSetting: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveWageSettingResponse
	public typealias paramType = Params
	public struct Params {
		let team_member_id: String
		/// Retrieves a `WageSetting` object for a team member specified by `TeamMember.id`. For more information, see [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#retrievewagesetting).  Square recommends using [RetrieveTeamMember](api-endpoint:Team-RetrieveTeamMember) or [SearchTeamMembers](api-endpoint:Team-SearchTeamMembers) to get this information directly from the `TeamMember.wage_setting` field.
		/// - Parameters:
		///   - team_member_id: The ID of the team member for which to retrieve the wage setting.
		public init(team_member_id: String) {
			self.team_member_id = team_member_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/team-members/\(inputs.team_member_id)/wage-setting"
		return url
	}
}

/// Creates or updates a `WageSetting` object. The object is created if a `WageSetting` with the specified `team_member_id` doesn't exist. Otherwise, it fully replaces the `WageSetting` object for the team member. The `WageSetting` is returned on a successful update. For more information, see [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#create-or-update-a-wage-setting).  Square recommends using [CreateTeamMember](api-endpoint:Team-CreateTeamMember) or [UpdateTeamMember](api-endpoint:Team-UpdateTeamMember) to manage the `TeamMember.wage_setting` field directly.
public struct UpdateWageSetting: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateWageSettingRequest
	public typealias outputType = UpdateWageSettingResponse
	public typealias paramType = Params
	public struct Params {
		let team_member_id: String
		/// Creates or updates a `WageSetting` object. The object is created if a `WageSetting` with the specified `team_member_id` doesn't exist. Otherwise, it fully replaces the `WageSetting` object for the team member. The `WageSetting` is returned on a successful update. For more information, see [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#create-or-update-a-wage-setting).  Square recommends using [CreateTeamMember](api-endpoint:Team-CreateTeamMember) or [UpdateTeamMember](api-endpoint:Team-UpdateTeamMember) to manage the `TeamMember.wage_setting` field directly.
		/// - Parameters:
		///   - team_member_id: The ID of the team member for which to update the `WageSetting` object.
		public init(team_member_id: String) {
			self.team_member_id = team_member_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/team-members/\(inputs.team_member_id)/wage-setting"
		return url
	}
}

