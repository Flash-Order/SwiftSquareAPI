/// Creates a booking.
public struct CreateBooking: SquareAPIEndpoint {
	public typealias inputType = CreateBookingRequest
	public typealias outputType = CreateBookingResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings"
	}
}

/// Searches for availabilities for booking.
public struct SearchAvailability: SquareAPIEndpoint {
	public typealias inputType = SearchAvailabilityRequest
	public typealias outputType = SearchAvailabilityResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings/availability/search"
	}
}

/// Retrieves a seller's booking profile.
public struct RetrieveBusinessBookingProfile: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveBusinessBookingProfileResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings/business-booking-profile"
	}
}

/// Lists booking profiles for team members.
public struct ListTeamMemberBookingProfiles: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListTeamMemberBookingProfilesResponse
	public typealias paramType = Params
	public struct Params {
		let bookable_only: Bool?
		let limit: Int?
		let cursor: String?
		let location_id: String?
		/// Lists booking profiles for team members.
		/// - Parameters:
		///   - bookable_only: (Beta) Indicates whether to include only bookable team members in the returned result (`true`) or not (`false`).
		///   - limit: (Beta) The maximum number of results to return.
		///   - cursor: (Beta) The cursor for paginating through the results.
		///   - location_id: (Beta) Indicates whether to include only team members enabled at the given location in the returned result.
		public init(bookable_only: Bool? = nil, limit: Int? = nil, cursor: String? = nil, location_id: String? = nil) {
			self.bookable_only = bookable_only
			self.limit = limit
			self.cursor = cursor
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bookings/team-member-booking-profiles"
		var queries = [String]()
		if let v = inputs.bookable_only { queries.append("bookable_only=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if let v = inputs.location_id { queries.append("location_id=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Retrieves a team member's booking profile.
public struct RetrieveTeamMemberBookingProfile: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveTeamMemberBookingProfileResponse
	public typealias paramType = Params
	public struct Params {
		let team_member_id: String
		/// Retrieves a team member's booking profile.
		/// - Parameters:
		///   - team_member_id: (Beta) The ID of the team member to retrieve.
		public init(team_member_id: String) {
			self.team_member_id = team_member_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bookings/team-member-booking-profiles/\(inputs.team_member_id)"
		return url
	}
}

/// Retrieves a booking.
public struct RetrieveBooking: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveBookingResponse
	public typealias paramType = Params
	public struct Params {
		let booking_id: String
		/// Retrieves a booking.
		/// - Parameters:
		///   - booking_id: (Beta) The ID of the [Booking](https://developer.squareup.com/reference/square_2021-06-16/objects/Booking) object representing the to-be-retrieved booking.
		public init(booking_id: String) {
			self.booking_id = booking_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bookings/\(inputs.booking_id)"
		return url
	}
}

/// Updates a booking.
public struct UpdateBooking: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateBookingRequest
	public typealias outputType = UpdateBookingResponse
	public typealias paramType = Params
	public struct Params {
		let booking_id: String
		/// Updates a booking.
		/// - Parameters:
		///   - booking_id: (Beta) The ID of the [Booking](https://developer.squareup.com/reference/square_2021-06-16/objects/Booking) object representing the to-be-updated booking.
		public init(booking_id: String) {
			self.booking_id = booking_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bookings/\(inputs.booking_id)"
		return url
	}
}

/// Cancels an existing booking.
public struct CancelBooking: SquareAPIEndpoint {
	public typealias inputType = CancelBookingRequest
	public typealias outputType = CancelBookingResponse
	public typealias paramType = Params
	public struct Params {
		let booking_id: String
		/// Cancels an existing booking.
		/// - Parameters:
		///   - booking_id: (Beta) The ID of the [Booking](https://developer.squareup.com/reference/square_2021-06-16/objects/Booking) object representing the to-be-cancelled booking.
		public init(booking_id: String) {
			self.booking_id = booking_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bookings/\(inputs.booking_id)/cancel"
		return url
	}
}

