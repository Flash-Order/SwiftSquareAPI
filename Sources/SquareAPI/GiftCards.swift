/// Lists all gift cards. You can specify optional filters to retrieve  a subset of the gift cards.
public struct ListGiftCards: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListGiftCardsResponse
	public typealias paramType = Params
	public struct Params {
		let type: String?
		let state: String?
		let limit: Int?
		let cursor: String?
		let customer_id: String?
		/// Lists all gift cards. You can specify optional filters to retrieve  a subset of the gift cards.
		/// - Parameters:
		///   - type: (Beta) If a [type](https://developer.squareup.com/reference/square_2022-04-20/enums/GiftCardType) is provided, the endpoint returns gift cards of the specified type. Otherwise, the endpoint returns gift cards of all types.
		///   - state: (Beta) If a [state](https://developer.squareup.com/reference/square_2022-04-20/enums/GiftCardStatus) is provided, the endpoint returns the gift cards in the specified state. Otherwise, the endpoint returns the gift cards of all states.
		///   - limit: (Beta) If a limit is provided, the endpoint returns only the specified number of results per page. The maximum value is 50. The default value is 30. For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
		///   - cursor: (Beta) A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query. If a cursor is not provided, the endpoint returns the first page of the results.  For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
		///   - customer_id: (Beta) If a customer ID is provided, the endpoint returns only the gift cards linked to the specified customer.
		public init(type: String? = nil, state: String? = nil, limit: Int? = nil, cursor: String? = nil, customer_id: String? = nil) {
			self.type = type
			self.state = state
			self.limit = limit
			self.cursor = cursor
			self.customer_id = customer_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/gift-cards"
		var queries = [String]()
		if let v = inputs.type { queries.append("type=\(v)") }
		if let v = inputs.state { queries.append("state=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if let v = inputs.customer_id { queries.append("customer_id=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Creates a digital gift card or registers a physical (plastic) gift card. You must activate the gift card before  it can be used for payment. For more information, see  [Selling gift cards](https://developer.squareup.com/docs/gift-cards/using-gift-cards-api#selling-square-gift-cards).
public struct CreateGiftCard: SquareAPIEndpoint {
	public typealias inputType = CreateGiftCardRequest
	public typealias outputType = CreateGiftCardResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/gift-cards"
	}
}

/// Retrieves a gift card using the gift card account number (GAN).
public struct RetrieveGiftCardFromGAN: SquareAPIEndpoint {
	public typealias inputType = RetrieveGiftCardFromGANRequest
	public typealias outputType = RetrieveGiftCardFromGANResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/gift-cards/from-gan"
	}
}

/// Retrieves a gift card using a secure payment token that represents the gift card.
public struct RetrieveGiftCardFromNonce: SquareAPIEndpoint {
	public typealias inputType = RetrieveGiftCardFromNonceRequest
	public typealias outputType = RetrieveGiftCardFromNonceResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/gift-cards/from-nonce"
	}
}

/// Links a customer to a gift card, which is also referred to as adding a card on file.
public struct LinkCustomerToGiftCard: SquareAPIEndpoint {
	public typealias inputType = LinkCustomerToGiftCardRequest
	public typealias outputType = LinkCustomerToGiftCardResponse
	public typealias paramType = Params
	public struct Params {
		let gift_card_id: String
		/// Links a customer to a gift card, which is also referred to as adding a card on file.
		/// - Parameters:
		///   - gift_card_id: (Beta) The ID of the gift card to be linked.
		public init(gift_card_id: String) {
			self.gift_card_id = gift_card_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/gift-cards/\(inputs.gift_card_id)/link-customer"
		return url
	}
}

/// Unlinks a customer from a gift card, which is also referred to as removing a card on file.
public struct UnlinkCustomerFromGiftCard: SquareAPIEndpoint {
	public typealias inputType = UnlinkCustomerFromGiftCardRequest
	public typealias outputType = UnlinkCustomerFromGiftCardResponse
	public typealias paramType = Params
	public struct Params {
		let gift_card_id: String
		/// Unlinks a customer from a gift card, which is also referred to as removing a card on file.
		/// - Parameters:
		///   - gift_card_id: (Beta) The ID of the gift card to be unlinked.
		public init(gift_card_id: String) {
			self.gift_card_id = gift_card_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/gift-cards/\(inputs.gift_card_id)/unlink-customer"
		return url
	}
}

/// Retrieves a gift card using its ID.
public struct RetrieveGiftCard: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveGiftCardResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Retrieves a gift card using its ID.
		/// - Parameters:
		///   - id: (Beta) The ID of the gift card to retrieve.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/gift-cards/\(inputs.id)"
		return url
	}
}

