/// Creates a subscription to a subscription plan by a customer.  If you provide a card on file in the request, Square charges the card for the subscription. Otherwise, Square bills an invoice to the customer's email address. The subscription starts immediately, unless the request includes the optional `start_date`. Each individual subscription is associated with a particular location.
public struct CreateSubscription: SquareAPIEndpoint {
	public typealias inputType = CreateSubscriptionRequest
	public typealias outputType = CreateSubscriptionResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/subscriptions"
	}
}

/// Searches for subscriptions.  Results are ordered chronologically by subscription creation date. If the request specifies more than one location ID, the endpoint orders the result by location ID, and then by creation date within each location. If no locations are given in the query, all locations are searched.  You can also optionally specify `customer_ids` to search by customer. If left unset, all customers associated with the specified locations are returned. If the request specifies customer IDs, the endpoint orders results first by location, within location by customer ID, and within customer by subscription creation date.  For more information, see [Retrieve subscriptions](https://developer.squareup.com/docs/subscriptions-api/overview#retrieve-subscriptions).
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
		let include: String?
		/// Retrieves a subscription.
		/// - Parameters:
		///   - subscription_id: The ID of the subscription to retrieve.
		///   - include: (Beta) A query parameter to specify related information to be included in the response.   The supported query parameter values are:   - `actions`: to include scheduled actions on the targeted subscription.
		public init(subscription_id: String, include: String? = nil) {
			self.subscription_id = subscription_id
			self.include = include
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/subscriptions/\(inputs.subscription_id)"
		var queries = [String]()
		if let v = inputs.include { queries.append("include=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
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
		///   - subscription_id: The ID of the subscription to update.
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/subscriptions/\(inputs.subscription_id)"
		return url
	}
}

/// Deletes a scheduled action for a subscription.
public struct DeleteSubscriptionAction: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteSubscriptionActionResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		let action_id: String
		/// Deletes a scheduled action for a subscription.
		/// - Parameters:
		///   - subscription_id: (Beta) The ID of the subscription the targeted action is to act upon.
		///   - action_id: (Beta) The ID of the targeted action to be deleted.
		public init(subscription_id: String, action_id: String) {
			self.subscription_id = subscription_id
			self.action_id = action_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/subscriptions/\(inputs.subscription_id)/actions/\(inputs.action_id)"
		return url
	}
}

/// Schedules a `CANCEL` action to cancel an active subscription  by setting the `canceled_date` field to the end of the active billing period  and changing the subscription status from ACTIVE to CANCELED after this date.
public struct CancelSubscription: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CancelSubscriptionResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		/// Schedules a `CANCEL` action to cancel an active subscription  by setting the `canceled_date` field to the end of the active billing period  and changing the subscription status from ACTIVE to CANCELED after this date.
		/// - Parameters:
		///   - subscription_id: The ID of the subscription to cancel.
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/subscriptions/\(inputs.subscription_id)/cancel"
		return url
	}
}

/// Lists all events for a specific subscription.
public struct ListSubscriptionEvents: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListSubscriptionEventsResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		let cursor: String?
		let limit: Int?
		/// Lists all events for a specific subscription.
		/// - Parameters:
		///   - subscription_id: The ID of the subscription to retrieve the events for.
		///   - cursor: When the total number of resulting subscription events exceeds the limit of a paged response,  specify the cursor returned from a preceding response here to fetch the next set of results. If the cursor is unset, the response contains the last page of the results.  For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
		///   - limit: The upper limit on the number of subscription events to return in a paged response.
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

/// Schedules a `PAUSE` action to pause an active subscription.
public struct PauseSubscription: SquareAPIEndpoint {
	public typealias inputType = PauseSubscriptionRequest
	public typealias outputType = PauseSubscriptionResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		/// Schedules a `PAUSE` action to pause an active subscription.
		/// - Parameters:
		///   - subscription_id: (Beta) The ID of the subscription to pause.
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/subscriptions/\(inputs.subscription_id)/pause"
		return url
	}
}

/// Schedules a `RESUME` action to resume a paused or a deactivated subscription.
public struct ResumeSubscription: SquareAPIEndpoint {
	public typealias inputType = ResumeSubscriptionRequest
	public typealias outputType = ResumeSubscriptionResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		/// Schedules a `RESUME` action to resume a paused or a deactivated subscription.
		/// - Parameters:
		///   - subscription_id: The ID of the subscription to resume.
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/subscriptions/\(inputs.subscription_id)/resume"
		return url
	}
}

/// Schedules a `SWAP_PLAN` action to swap a subscription plan in an existing subscription.
public struct SwapPlan: SquareAPIEndpoint {
	public typealias inputType = SwapPlanRequest
	public typealias outputType = SwapPlanResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		/// Schedules a `SWAP_PLAN` action to swap a subscription plan in an existing subscription.
		/// - Parameters:
		///   - subscription_id: (Beta) The ID of the subscription to swap the subscription plan for.
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/subscriptions/\(inputs.subscription_id)/swap-plan"
		return url
	}
}

