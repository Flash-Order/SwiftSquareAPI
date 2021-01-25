/// Creates a subscription for a customer to a subscription plan.  If you provide a card on file in the request, Square charges the card for  the subscription. Otherwise, Square bills an invoice to the customer's email  address. The subscription starts immediately, unless the request includes  the optional `start_date`. Each individual subscription is associated with a particular location.
public struct CreateSubscription: SquareAPIEndpoint {
	public typealias inputType = CreateSubscriptionRequest
	public typealias outputType = CreateSubscriptionResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/subscriptions"
	}
}

/// Searches for subscriptions.  Results are ordered chronologically by subscription creation date. If the request specifies more than one location ID,  the endpoint orders the result  by location ID, and then by creation date within each location. If no locations are given in the query, all locations are searched.  You can also optionally specify `customer_ids` to search by customer.  If left unset, all customers  associated with the specified locations are returned.  If the request specifies customer IDs, the endpoint orders results  first by location, within location by customer ID, and within  customer by subscription creation date.  For more information, see  [Retrieve subscriptions](/docs/subscriptions-api/overview#retrieve-subscriptions).
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
		///   - subscription_id: The ID of the subscription to retrieve.
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/subscriptions/\(inputs.subscription_id)"
	}
}

/// Updates a subscription. You can set, modify, and clear the  `subscription` field values.
public struct UpdateSubscription: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateSubscriptionRequest
	public typealias outputType = UpdateSubscriptionResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		/// Updates a subscription. You can set, modify, and clear the  `subscription` field values.
		/// - Parameters:
		///   - subscription_id: The ID for the subscription to update.
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/subscriptions/\(inputs.subscription_id)"
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
		///   - subscription_id: The ID of the subscription to cancel.
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/subscriptions/\(inputs.subscription_id)/cancel"
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
		/// Lists all events for a specific subscription. In the current implementation, only `START_SUBSCRIPTION` and `STOP_SUBSCRIPTION` (when the subscription was canceled) events are returned.
		/// - Parameters:
		///   - subscription_id: The ID of the subscription to retrieve the events for.
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/subscriptions/\(inputs.subscription_id)/events"
	}
}

