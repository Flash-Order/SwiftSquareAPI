/// Retrieve a collection of bookings. To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
public struct ListBookings: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListBookingsResponse
	public typealias paramType = Params
	public struct Params {
		let limit: Int?
		let cursor: String?
		let customer_id: String?
		let team_member_id: String?
		let location_id: String?
		let start_at_min: String?
		let start_at_max: String?
		/// Retrieve a collection of bookings. To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
		/// - Parameters:
		///   - limit: The maximum number of results per page to return in a paged response.
		///   - cursor: The pagination cursor from the preceding response to return the next page of the results. Do not set this when retrieving the first page of the results.
		///   - customer_id: The [customer](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Customer) for whom to retrieve bookings. If this is not set, bookings for all customers are retrieved.
		///   - team_member_id: The team member for whom to retrieve bookings. If this is not set, bookings of all members are retrieved.
		///   - location_id: The location for which to retrieve bookings. If this is not set, all locations' bookings are retrieved.
		///   - start_at_min: The RFC 3339 timestamp specifying the earliest of the start time. If this is not set, the current time is used.
		///   - start_at_max: The RFC 3339 timestamp specifying the latest of the start time. If this is not set, the time of 31 days after `start_at_min` is used.
		public init(limit: Int? = nil, cursor: String? = nil, customer_id: String? = nil, team_member_id: String? = nil, location_id: String? = nil, start_at_min: String? = nil, start_at_max: String? = nil) {
			self.limit = limit
			self.cursor = cursor
			self.customer_id = customer_id
			self.team_member_id = team_member_id
			self.location_id = location_id
			self.start_at_min = start_at_min
			self.start_at_max = start_at_max
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bookings"
		var queries = [String]()
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if let v = inputs.customer_id { queries.append("customer_id=\(v)") }
		if let v = inputs.team_member_id { queries.append("team_member_id=\(v)") }
		if let v = inputs.location_id { queries.append("location_id=\(v)") }
		if let v = inputs.start_at_min { queries.append("start_at_min=\(v)") }
		if let v = inputs.start_at_max { queries.append("start_at_max=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Creates a booking. The required input must include the following: - `Booking.location_id` - `Booking.start_at` - `Booking.AppointmentSegment.team_member_id` - `Booking.AppointmentSegment.service_variation_id` - `Booking.AppointmentSegment.service_variation_version` To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope. For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus* or *Appointments Premium*.
public struct CreateBooking: SquareAPIEndpoint {
	public typealias inputType = CreateBookingRequest
	public typealias outputType = CreateBookingResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings"
	}
}

/// Searches for availabilities for booking. To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
public struct SearchAvailability: SquareAPIEndpoint {
	public typealias inputType = SearchAvailabilityRequest
	public typealias outputType = SearchAvailabilityResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings/availability/search"
	}
}

/// Bulk-Retrieves a list of bookings by booking IDs. To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
public struct BulkRetrieveBookings: SquareAPIEndpoint {
	public typealias inputType = BulkRetrieveBookingsRequest
	public typealias outputType = BulkRetrieveBookingsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings/bulk-retrieve"
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

/// Lists location booking profiles of a seller.
public struct ListLocationBookingProfiles: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListLocationBookingProfilesResponse
	public typealias paramType = Params
	public struct Params {
		let limit: Int?
		let cursor: String?
		/// Lists location booking profiles of a seller.
		/// - Parameters:
		///   - limit: The maximum number of results to return in a paged response.
		///   - cursor: The pagination cursor from the preceding response to return the next page of the results. Do not set this when retrieving the first page of the results.
		public init(limit: Int? = nil, cursor: String? = nil) {
			self.limit = limit
			self.cursor = cursor
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bookings/location-booking-profiles"
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

/// Retrieves a seller's location booking profile.
public struct RetrieveLocationBookingProfile: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveLocationBookingProfileResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Retrieves a seller's location booking profile.
		/// - Parameters:
		///   - location_id: The ID of the location to retrieve the booking profile.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bookings/location-booking-profiles/\(inputs.location_id)"
		return url
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
		///   - bookable_only: Indicates whether to include only bookable team members in the returned result (`true`) or not (`false`).
		///   - limit: The maximum number of results to return in a paged response.
		///   - cursor: The pagination cursor from the preceding response to return the next page of the results. Do not set this when retrieving the first page of the results.
		///   - location_id: Indicates whether to include only team members enabled at the given location in the returned result.
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

/// Retrieves one or more team members' booking profiles.
public struct BulkRetrieveTeamMemberBookingProfiles: SquareAPIEndpoint {
	public typealias inputType = BulkRetrieveTeamMemberBookingProfilesRequest
	public typealias outputType = BulkRetrieveTeamMemberBookingProfilesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings/team-member-booking-profiles/bulk-retrieve"
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
		///   - team_member_id: The ID of the team member to retrieve.
		public init(team_member_id: String) {
			self.team_member_id = team_member_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bookings/team-member-booking-profiles/\(inputs.team_member_id)"
		return url
	}
}

/// Retrieves a booking. To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
public struct RetrieveBooking: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveBookingResponse
	public typealias paramType = Params
	public struct Params {
		let booking_id: String
		/// Retrieves a booking. To call this endpoint with buyer-level permissions, set `APPOINTMENTS_READ` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_READ` and `APPOINTMENTS_READ` for the OAuth scope.
		/// - Parameters:
		///   - booking_id: The ID of the [Booking](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Booking) object representing the to-be-retrieved booking.
		public init(booking_id: String) {
			self.booking_id = booking_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bookings/\(inputs.booking_id)"
		return url
	}
}

/// Updates a booking. To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope. For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus* or *Appointments Premium*.
public struct UpdateBooking: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateBookingRequest
	public typealias outputType = UpdateBookingResponse
	public typealias paramType = Params
	public struct Params {
		let booking_id: String
		/// Updates a booking. To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope. For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus* or *Appointments Premium*.
		/// - Parameters:
		///   - booking_id: The ID of the [Booking](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Booking) object representing the to-be-updated booking.
		public init(booking_id: String) {
			self.booking_id = booking_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bookings/\(inputs.booking_id)"
		return url
	}
}

/// Cancels an existing booking. To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope. For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus* or *Appointments Premium*.
public struct CancelBooking: SquareAPIEndpoint {
	public typealias inputType = CancelBookingRequest
	public typealias outputType = CancelBookingResponse
	public typealias paramType = Params
	public struct Params {
		let booking_id: String
		/// Cancels an existing booking. To call this endpoint with buyer-level permissions, set `APPOINTMENTS_WRITE` for the OAuth scope. To call this endpoint with seller-level permissions, set `APPOINTMENTS_ALL_WRITE` and `APPOINTMENTS_WRITE` for the OAuth scope. For calls to this endpoint with seller-level permissions to succeed, the seller must have subscribed to *Appointments Plus* or *Appointments Premium*.
		/// - Parameters:
		///   - booking_id: The ID of the [Booking](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/Booking) object representing the to-be-cancelled booking.
		public init(booking_id: String) {
			self.booking_id = booking_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bookings/\(inputs.booking_id)/cancel"
		return url
	}
}

