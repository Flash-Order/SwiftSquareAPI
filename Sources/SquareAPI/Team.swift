/// Creates a single `TeamMember` object. The `TeamMember` will be returned on successful creates. You must provide the following values in your request to this endpoint: - `given_name` - `family_name`  Learn about [Troubleshooting the Teams API](/docs/team/troubleshooting#createteammember).
public struct CreateTeamMember: SquareAPIEndpoint {
	public typealias inputType = CreateTeamMemberRequest
	public typealias outputType = CreateTeamMemberResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members"
	}
}

/// Creates multiple `TeamMember` objects. The created `TeamMember` objects will be returned on successful creates. This process is non-transactional and will process as much of the request as is possible. If one of the creates in the request cannot be successfully processed, the request will NOT be marked as failed, but the body of the response will contain explicit error information for this particular create.  Learn about [Troubleshooting the Teams API](/docs/team/troubleshooting#bulkcreateteammembers).
public struct BulkCreateTeamMembers: SquareAPIEndpoint {
	public typealias inputType = BulkCreateTeamMembersRequest
	public typealias outputType = BulkCreateTeamMembersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members/bulk-create"
	}
}

/// Updates multiple `TeamMember` objects. The updated `TeamMember` objects will be returned on successful updates. This process is non-transactional and will process as much of the request as is possible. If one of the updates in the request cannot be successfully processed, the request will NOT be marked as failed, but the body of the response will contain explicit error information for this particular update. Learn about [Troubleshooting the Teams API](/docs/team/troubleshooting#bulkupdateteammembers).
public struct BulkUpdateTeamMembers: SquareAPIEndpoint {
	public typealias inputType = BulkUpdateTeamMembersRequest
	public typealias outputType = BulkUpdateTeamMembersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members/bulk-update"
	}
}

/// Returns a paginated list of `TeamMember` objects for a business. The list to be returned can be filtered by: - location IDs **and** - `status`
public struct SearchTeamMembers: SquareAPIEndpoint {
	public typealias inputType = SearchTeamMembersRequest
	public typealias outputType = SearchTeamMembersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members/search"
	}
}

/// Retrieve a `TeamMember` object for the given `TeamMember.id`. Learn about [Troubleshooting the Teams API](/docs/team/troubleshooting#retrieveteammember).
public struct RetrieveTeamMember: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveTeamMemberResponse
	public typealias paramType = Params
	public struct Params {
		let team_member_id: String
		/// Retrieve a `TeamMember` object for the given `TeamMember.id`. Learn about [Troubleshooting the Teams API](/docs/team/troubleshooting#retrieveteammember).
		/// - Parameters:
		///   - team_member_id: The ID of the team member to retrieve.
		public init(team_member_id: String) {
			self.team_member_id = team_member_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/team-members/\(inputs.team_member_id)"
	}
}

/// Updates a single `TeamMember` object. The `TeamMember` will be returned on successful updates. Learn about [Troubleshooting the Teams API](/docs/team/troubleshooting#updateteammember).
public struct UpdateTeamMember: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateTeamMemberRequest
	public typealias outputType = UpdateTeamMemberResponse
	public typealias paramType = Params
	public struct Params {
		let team_member_id: String
		/// Updates a single `TeamMember` object. The `TeamMember` will be returned on successful updates. Learn about [Troubleshooting the Teams API](/docs/team/troubleshooting#updateteammember).
		/// - Parameters:
		///   - team_member_id: The ID of the team member to update.
		public init(team_member_id: String) {
			self.team_member_id = team_member_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/team-members/\(inputs.team_member_id)"
	}
}

/// Retrieve a `WageSetting` object for a team member specified by `TeamMember.id`. Learn about [Troubleshooting the Teams API](/docs/team/troubleshooting#retrievewagesetting).
public struct RetrieveWageSetting: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveWageSettingResponse
	public typealias paramType = Params
	public struct Params {
		let team_member_id: String
		/// Retrieve a `WageSetting` object for a team member specified by `TeamMember.id`. Learn about [Troubleshooting the Teams API](/docs/team/troubleshooting#retrievewagesetting).
		/// - Parameters:
		///   - team_member_id: The ID of the team member to retrieve wage setting for
		public init(team_member_id: String) {
			self.team_member_id = team_member_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/team-members/\(inputs.team_member_id)/wage-setting"
	}
}

/// Creates or updates a `WageSetting` object. The object is created if a `WageSetting` with the specified `team_member_id` does not exist. Otherwise, it fully replaces the `WageSetting` object for the team member. The `WageSetting` will be returned upon successful update. Learn about [Troubleshooting the Teams API](/docs/team/troubleshooting#updatewagesetting).
public struct UpdateWageSetting: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateWageSettingRequest
	public typealias outputType = UpdateWageSettingResponse
	public typealias paramType = Params
	public struct Params {
		let team_member_id: String
		/// Creates or updates a `WageSetting` object. The object is created if a `WageSetting` with the specified `team_member_id` does not exist. Otherwise, it fully replaces the `WageSetting` object for the team member. The `WageSetting` will be returned upon successful update. Learn about [Troubleshooting the Teams API](/docs/team/troubleshooting#updatewagesetting).
		/// - Parameters:
		///   - team_member_id: The ID of the team member to update the `WageSetting` object for.
		public init(team_member_id: String) {
			self.team_member_id = team_member_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/team-members/\(inputs.team_member_id)/wage-setting"
	}
}

