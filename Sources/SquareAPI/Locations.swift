/// Provides details about all of the seller's [locations](https://developer.squareup.com/docs/locations-api), including those with an inactive status.
public struct ListLocations: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListLocationsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/locations"
	}
}

/// Creates a [location](https://developer.squareup.com/docs/locations-api). Creating new locations allows for separate configuration of receipt layouts, item prices, and sales reports. Developers can use locations to separate sales activity through applications that integrate with Square from sales activity elsewhere in a seller's account. Locations created programmatically with the Locations API last forever and are visible to the seller for their own management. Therefore, ensure that each location has a sensible and unique name.
public struct CreateLocation: SquareAPIEndpoint {
	public typealias inputType = CreateLocationRequest
	public typealias outputType = CreateLocationResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/locations"
	}
}

/// Retrieves details of a single location. Specify "main" as the location ID to retrieve details of the [main location](https://developer.squareup.com/docs/locations-api#about-the-main-location).
public struct RetrieveLocation: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveLocationResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Retrieves details of a single location. Specify "main" as the location ID to retrieve details of the [main location](https://developer.squareup.com/docs/locations-api#about-the-main-location).
		/// - Parameters:
		///   - location_id: The ID of the location to retrieve. Specify the string "main" to return the main location.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/locations/\(inputs.location_id)"
		return url
	}
}

/// Updates a [location](https://developer.squareup.com/docs/locations-api).
public struct UpdateLocation: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateLocationRequest
	public typealias outputType = UpdateLocationResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Updates a [location](https://developer.squareup.com/docs/locations-api).
		/// - Parameters:
		///   - location_id: The ID of the location to update.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/locations/\(inputs.location_id)"
		return url
	}
}

