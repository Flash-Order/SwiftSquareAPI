/// Lists all webhook event types that can be subscribed to.
public struct ListWebhookEventTypes: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListWebhookEventTypesResponse
	public typealias paramType = Params
	public struct Params {
		let api_version: String?
		/// Lists all webhook event types that can be subscribed to.
		/// - Parameters:
		///   - api_version: (Beta) The API version for which to list event types. Setting this field overrides the default version used by the application.
		public init(api_version: String? = nil) {
			self.api_version = api_version
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/webhooks/event-types"
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

/// Lists all webhook subscriptions owned by your application.
public struct ListWebhookSubscriptions: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListWebhookSubscriptionsResponse
	public typealias paramType = Params
	public struct Params {
		let cursor: String?
		let include_disabled: Bool?
		let sort_order: String?
		let limit: Int?
		/// Lists all webhook subscriptions owned by your application.
		/// - Parameters:
		///   - cursor: (Beta) A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query.  For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
		///   - include_disabled: (Beta) Includes disabled [Subscription](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/WebhookSubscription)s. By default, all enabled [Subscription](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/WebhookSubscription)s are returned.
		///   - sort_order: (Beta) Sorts the returned list by when the [Subscription](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/WebhookSubscription) was created with the specified order. This field defaults to ASC.
		///   - limit: (Beta) The maximum number of results to be returned in a single page. It is possible to receive fewer results than the specified limit on a given page. The default value of 100 is also the maximum allowed value.  Default: 100
		public init(cursor: String? = nil, include_disabled: Bool? = nil, sort_order: String? = nil, limit: Int? = nil) {
			self.cursor = cursor
			self.include_disabled = include_disabled
			self.sort_order = sort_order
			self.limit = limit
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/webhooks/subscriptions"
		var queries = [String]()
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if let v = inputs.include_disabled { queries.append("include_disabled=\(v)") }
		if let v = inputs.sort_order { queries.append("sort_order=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Creates a webhook subscription.
public struct CreateWebhookSubscription: SquareAPIEndpoint {
	public typealias inputType = CreateWebhookSubscriptionRequest
	public typealias outputType = CreateWebhookSubscriptionResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/webhooks/subscriptions"
	}
}

/// Retrieves a webhook subscription identified by its ID.
public struct RetrieveWebhookSubscription: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveWebhookSubscriptionResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		/// Retrieves a webhook subscription identified by its ID.
		/// - Parameters:
		///   - subscription_id: (Beta) [REQUIRED] The ID of the [Subscription](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/WebhookSubscription) to retrieve.
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/webhooks/subscriptions/\(inputs.subscription_id)"
		return url
	}
}

/// Updates a webhook subscription.
public struct UpdateWebhookSubscription: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateWebhookSubscriptionRequest
	public typealias outputType = UpdateWebhookSubscriptionResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		/// Updates a webhook subscription.
		/// - Parameters:
		///   - subscription_id: (Beta) [REQUIRED] The ID of the [Subscription](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/WebhookSubscription) to update.
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/webhooks/subscriptions/\(inputs.subscription_id)"
		return url
	}
}

/// Deletes a webhook subscription.
public struct DeleteWebhookSubscription: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteWebhookSubscriptionResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		/// Deletes a webhook subscription.
		/// - Parameters:
		///   - subscription_id: (Beta) [REQUIRED] The ID of the [Subscription](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/WebhookSubscription) to delete.
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/webhooks/subscriptions/\(inputs.subscription_id)"
		return url
	}
}

/// Updates a webhook subscription by replacing the existing signature key with a new one.
public struct UpdateWebhookSubscriptionSignatureKey: SquareAPIEndpoint {
	public typealias inputType = UpdateWebhookSubscriptionSignatureKeyRequest
	public typealias outputType = UpdateWebhookSubscriptionSignatureKeyResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		/// Updates a webhook subscription by replacing the existing signature key with a new one.
		/// - Parameters:
		///   - subscription_id: (Beta) [REQUIRED] The ID of the [Subscription](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/WebhookSubscription) to update.
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/webhooks/subscriptions/\(inputs.subscription_id)/signature-key"
		return url
	}
}

/// Tests a webhook subscription by sending a test event to the notification URL.
public struct TestWebhookSubscription: SquareAPIEndpoint {
	public typealias inputType = TestWebhookSubscriptionRequest
	public typealias outputType = TestWebhookSubscriptionResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		/// Tests a webhook subscription by sending a test event to the notification URL.
		/// - Parameters:
		///   - subscription_id: (Beta) [REQUIRED] The ID of the [Subscription](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/WebhookSubscription) to test.
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/webhooks/subscriptions/\(inputs.subscription_id)/test"
		return url
	}
}

