/// Creates a subscription for a customer to a subscription plan.  If you provide a card on file in the request, Square charges the card for the subscription. Otherwise, Square bills an invoice to the customer's email address. The subscription starts immediately, unless the request includes the optional `start_date`. Each individual subscription is associated with a particular location.
public struct CreateSubscription: SquareAPIEndpoint {
	public typealias inputType = CreateSubscriptionRequest
	public typealias outputType = CreateSubscriptionResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/subscriptions"
	}
}

/// Searches for subscriptions. Results are ordered chronologically by subscription creation date. If the request specifies more than one location ID, the endpoint orders the result by location ID, and then by creation date within each location. If no locations are given in the query, all locations are searched.  You can also optionally specify `customer_ids` to search by customer. If left unset, all customers associated with the specified locations are returned. If the request specifies customer IDs, the endpoint orders results first by location, within location by customer ID, and within customer by subscription creation date.  For more information, see [Retrieve subscriptions](https://developer.squareup.com/docs/subscriptions-api/overview#retrieve-subscriptions).
public struct SearchSubscriptions: SquareAPIEndpoint {
	public typealias inputType = SearchSubscriptionsRequest
	public typealias outputType = SearchSubscriptionsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/subscriptions/search"
	}
}

/// Retrieves a subscription.
public struct RetrieveSubscription: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveSubscriptionResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		/// Retrieves a subscription.
		/// - Parameters:
		///   - subscription_id: (Beta) The ID of the subscription to retrieve.
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/subscriptions/\(inputs.subscription_id)"
		return url
	}
}

/// Updates a subscription. You can set, modify, and clear the `subscription` field values.
public struct UpdateSubscription: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateSubscriptionRequest
	public typealias outputType = UpdateSubscriptionResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		/// Updates a subscription. You can set, modify, and clear the `subscription` field values.
		/// - Parameters:
		///   - subscription_id: (Beta) The ID for the subscription to update.
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/subscriptions/\(inputs.subscription_id)"
		return url
	}
}

/// Sets the `canceled_date` field to the end of the active billing period. After this date, the status changes from ACTIVE to CANCELED.
public struct CancelSubscription: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CancelSubscriptionResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		/// Sets the `canceled_date` field to the end of the active billing period. After this date, the status changes from ACTIVE to CANCELED.
		/// - Parameters:
		///   - subscription_id: (Beta) The ID of the subscription to cancel.
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/subscriptions/\(inputs.subscription_id)/cancel"
		return url
	}
}

/// Lists all events for a specific subscription. In the current implementation, only `START_SUBSCRIPTION` and `STOP_SUBSCRIPTION` (when the subscription was canceled) events are returned.
public struct ListSubscriptionEvents: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListSubscriptionEventsResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		let cursor: String?
		let limit: Int?
		/// Lists all events for a specific subscription. In the current implementation, only `START_SUBSCRIPTION` and `STOP_SUBSCRIPTION` (when the subscription was canceled) events are returned.
		/// - Parameters:
		///   - subscription_id: (Beta) The ID of the subscription to retrieve the events for.
		///   - cursor: (Beta) A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query.  For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
		///   - limit: (Beta) The upper limit on the number of subscription events to return in the response.  Default: `200`
		public init(subscription_id: String, cursor: String? = nil, limit: Int? = nil) {
			self.subscription_id = subscription_id
			self.cursor = cursor
			self.limit = limit
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/subscriptions/\(inputs.subscription_id)/events"
		var queries = [String]()
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Resumes a deactivated subscription.
public struct ResumeSubscription: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = ResumeSubscriptionResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		/// Resumes a deactivated subscription.
		/// - Parameters:
		///   - subscription_id: (Beta) The ID of the subscription to resume.
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/subscriptions/\(inputs.subscription_id)/resume"
		return url
	}
}

