/// Links a `checkoutId` to a `checkout_page_url` that customers are directed to in order to provide their payment information using a payment processing workflow hosted on connect.squareup.com.    NOTE: The Checkout API has been updated with new features.  For more information, see [Checkout API highlights](https://developer.squareup.com/docs/checkout-api#checkout-api-highlights). We recommend that you use the new [CreatePaymentLink](https://developer.squareup.com/reference/square_2022-05-12/checkout-api/create-payment-link)  endpoint in place of this previously released endpoint.
public struct CreateCheckout: SquareAPIEndpoint {
	public typealias inputType = CreateCheckoutRequest
	public typealias outputType = CreateCheckoutResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Links a `checkoutId` to a `checkout_page_url` that customers are directed to in order to provide their payment information using a payment processing workflow hosted on connect.squareup.com.    NOTE: The Checkout API has been updated with new features.  For more information, see [Checkout API highlights](https://developer.squareup.com/docs/checkout-api#checkout-api-highlights). We recommend that you use the new [CreatePaymentLink](https://developer.squareup.com/reference/square_2022-05-12/checkout-api/create-payment-link)  endpoint in place of this previously released endpoint.
		/// - Parameters:
		///   - location_id: The ID of the business location to associate the checkout with.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/locations/\(inputs.location_id)/checkouts"
		return url
	}
}

/// Lists all payment links.
public struct ListPaymentLinks: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListPaymentLinksResponse
	public typealias paramType = Params
	public struct Params {
		let cursor: String?
		let limit: Int?
		/// Lists all payment links.
		/// - Parameters:
		///   - cursor: A pagination cursor returned by a previous call to this endpoint.  Provide this cursor to retrieve the next set of results for the original query.  If a cursor is not provided, the endpoint returns the first page of the results.  For more  information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
		///   - limit: A limit on the number of results to return per page. The limit is advisory and  the implementation might return more or less results. If the supplied limit is negative, zero, or greater than the maximum limit of 1000, it is ignored.  Default value: `100`
		public init(cursor: String? = nil, limit: Int? = nil) {
			self.cursor = cursor
			self.limit = limit
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/online-checkout/payment-links"
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

/// Creates a Square-hosted checkout page. Applications can share the resulting payment link with their buyer to pay for goods and services.
public struct CreatePaymentLink: SquareAPIEndpoint {
	public typealias inputType = CreatePaymentLinkRequest
	public typealias outputType = CreatePaymentLinkResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/online-checkout/payment-links"
	}
}

/// Retrieves a payment link.
public struct RetrievePaymentLink: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrievePaymentLinkResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Retrieves a payment link.
		/// - Parameters:
		///   - id: The ID of link to retrieve.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/online-checkout/payment-links/\(inputs.id)"
		return url
	}
}

/// Updates a payment link. You can update the `payment_link` fields such as  `description`, `checkout_options`, and  `pre_populated_data`.  You cannot update other fields such as the `order_id`, `version`, `URL`, or `timestamp` field.
public struct UpdatePaymentLink: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdatePaymentLinkRequest
	public typealias outputType = UpdatePaymentLinkResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Updates a payment link. You can update the `payment_link` fields such as  `description`, `checkout_options`, and  `pre_populated_data`.  You cannot update other fields such as the `order_id`, `version`, `URL`, or `timestamp` field.
		/// - Parameters:
		///   - id: The ID of the payment link to update.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/online-checkout/payment-links/\(inputs.id)"
		return url
	}
}

/// Deletes a payment link.
public struct DeletePaymentLink: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeletePaymentLinkResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Deletes a payment link.
		/// - Parameters:
		///   - id: The ID of the payment link to delete.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/online-checkout/payment-links/\(inputs.id)"
		return url
	}
}

