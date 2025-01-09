/// Search for Square API events that occur within a 28-day timeframe.
public struct SearchEvents: SquareAPIEndpoint {
	public typealias inputType = SearchEventsRequest
	public typealias outputType = SearchEventsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/events"
	}
}

/// Disables events to prevent them from being searchable. All events are disabled by default. You must enable events to make them searchable. Disabling events for a specific time period prevents them from being searchable, even if you re-enable them later.
public struct DisableEvents: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = Empty
	public typealias outputType = DisableEventsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/events/disable"
	}
}

/// Enables events to make them searchable. Only events that occur while in the enabled state are searchable.
public struct EnableEvents: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = Empty
	public typealias outputType = EnableEventsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/events/enable"
	}
}

/// Lists all event types that you can subscribe to as webhooks or query using the Events API.
public struct ListEventTypes: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListEventTypesResponse
	public typealias paramType = Params
	public struct Params {
		let api_version: String?
		/// Lists all event types that you can subscribe to as webhooks or query using the Events API.
		/// - Parameters:
		///   - api_version: The API version for which to list event types. Setting this field overrides the default version used by the application.
		public init(api_version: String? = nil) {
			self.api_version = api_version
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/events/types"
		var queries = [String]()
		if let v = inputs.api_version { queries.append("api_version=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

