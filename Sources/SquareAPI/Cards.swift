/// Retrieves a list of cards owned by the account making the request. A max of 25 cards will be returned.
public struct ListCards: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCardsResponse
	public typealias paramType = Params
	public struct Params {
		let cursor: String?
		let customer_id: String?
		let include_disabled: Bool?
		let reference_id: String?
		let sort_order: String?
		/// Retrieves a list of cards owned by the account making the request. A max of 25 cards will be returned.
		/// - Parameters:
		///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query.  See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
		///   - customer_id: Limit results to cards associated with the customer supplied. By default, all cards owned by the merchant are returned.
		///   - include_disabled: Includes disabled cards. By default, all enabled cards owned by the merchant are returned.
		///   - reference_id: Limit results to cards associated with the reference_id supplied.
		///   - sort_order: Sorts the returned list by when the card was created with the specified order. This field defaults to ASC.
		public init(cursor: String? = nil, customer_id: String? = nil, include_disabled: Bool? = nil, reference_id: String? = nil, sort_order: String? = nil) {
			self.cursor = cursor
			self.customer_id = customer_id
			self.include_disabled = include_disabled
			self.reference_id = reference_id
			self.sort_order = sort_order
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/cards"
		var queries = [String]()
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if let v = inputs.customer_id { queries.append("customer_id=\(v)") }
		if let v = inputs.include_disabled { queries.append("include_disabled=\(v)") }
		if let v = inputs.reference_id { queries.append("reference_id=\(v)") }
		if let v = inputs.sort_order { queries.append("sort_order=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Adds a card on file to an existing merchant.
public struct CreateCard: SquareAPIEndpoint {
	public typealias inputType = CreateCardRequest
	public typealias outputType = CreateCardResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/cards"
	}
}

/// Retrieves details for a specific Card.
public struct RetrieveCard: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveCardResponse
	public typealias paramType = Params
	public struct Params {
		let card_id: String
		/// Retrieves details for a specific Card.
		/// - Parameters:
		///   - card_id: Unique ID for the desired Card.
		public init(card_id: String) {
			self.card_id = card_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/cards/\(inputs.card_id)"
		return url
	}
}

/// Disables the card, preventing any further updates or charges. Disabling an already disabled card is allowed but has no effect.
public struct DisableCard: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = DisableCardResponse
	public typealias paramType = Params
	public struct Params {
		let card_id: String
		/// Disables the card, preventing any further updates or charges. Disabling an already disabled card is allowed but has no effect.
		/// - Parameters:
		///   - card_id: Unique ID for the desired Card.
		public init(card_id: String) {
			self.card_id = card_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/cards/\(inputs.card_id)/disable"
		return url
	}
}

