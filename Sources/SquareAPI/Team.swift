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

/// Returns a paginated list of `TeamMember` objects for a business. The list can be filtered by the following: - location IDs - `status`
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

/// Retrieves a `WageSetting` object for a team member specified by `TeamMember.id`. Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#retrievewagesetting).
public struct RetrieveWageSetting: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveWageSettingResponse
	public typealias paramType = Params
	public struct Params {
		let team_member_id: String
		/// Retrieves a `WageSetting` object for a team member specified by `TeamMember.id`. Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#retrievewagesetting).
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

/// Creates or updates a `WageSetting` object. The object is created if a `WageSetting` with the specified `team_member_id` does not exist. Otherwise, it fully replaces the `WageSetting` object for the team member. The `WageSetting` is returned on a successful update. Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#create-or-update-a-wage-setting).
public struct UpdateWageSetting: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateWageSettingRequest
	public typealias outputType = UpdateWageSettingResponse
	public typealias paramType = Params
	public struct Params {
		let team_member_id: String
		/// Creates or updates a `WageSetting` object. The object is created if a `WageSetting` with the specified `team_member_id` does not exist. Otherwise, it fully replaces the `WageSetting` object for the team member. The `WageSetting` is returned on a successful update. Learn about [Troubleshooting the Team API](https://developer.squareup.com/docs/team/troubleshooting#create-or-update-a-wage-setting).
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

