/// Provides information of all locations of a business.  Many Square API endpoints require a `location_id` parameter. The `id` field of the [`Location`](https://developer.squareup.com/reference/square_2021-10-20/objects/Location) objects returned by this endpoint correspond to that `location_id` parameter.
public struct ListLocations: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListLocationsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/locations"
	}
}

/// Creates a location.
public struct CreateLocation: SquareAPIEndpoint {
	public typealias inputType = CreateLocationRequest
	public typealias outputType = CreateLocationResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/locations"
	}
}

/// Retrieves details of a location. You can specify "main"  as the location ID to retrieve details of the  main location.
public struct RetrieveLocation: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveLocationResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Retrieves details of a location. You can specify "main"  as the location ID to retrieve details of the  main location.
		/// - Parameters:
		///   - location_id: The ID of the location to retrieve. If you specify the string "main", then the endpoint returns the main location.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/locations/\(inputs.location_id)"
		return url
	}
}

/// Updates a location.
public struct UpdateLocation: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateLocationRequest
	public typealias outputType = UpdateLocationResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Updates a location.
		/// - Parameters:
		///   - location_id: (Beta) The ID of the location to update.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/locations/\(inputs.location_id)"
		return url
	}
}

