/// Creates a Terminal checkout request and sends it to the specified device to take a payment for the requested amount.
public struct CreateTerminalCheckout: SquareAPIEndpoint {
	public typealias inputType = CreateTerminalCheckoutRequest
	public typealias outputType = CreateTerminalCheckoutResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/terminals/checkouts"
	}
}

/// Returns a filtered list of Terminal checkout requests created by the application making the request. Only Terminal checkout requests created for the merchant scoped to the OAuth token are returned. Terminal checkout requests are available for 30 days.
public struct SearchTerminalCheckouts: SquareAPIEndpoint {
	public typealias inputType = SearchTerminalCheckoutsRequest
	public typealias outputType = SearchTerminalCheckoutsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/terminals/checkouts/search"
	}
}

/// Retrieves a Terminal checkout request by `checkout_id`. Terminal checkout requests are available for 30 days.
public struct GetTerminalCheckout: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetTerminalCheckoutResponse
	public typealias paramType = Params
	public struct Params {
		let checkout_id: String
		/// Retrieves a Terminal checkout request by `checkout_id`. Terminal checkout requests are available for 30 days.
		/// - Parameters:
		///   - checkout_id: The unique ID for the desired `TerminalCheckout`.
		public init(checkout_id: String) {
			self.checkout_id = checkout_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/terminals/checkouts/\(inputs.checkout_id)"
		return url
	}
}

/// Cancels a Terminal checkout request if the status of the request permits it.
public struct CancelTerminalCheckout: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CancelTerminalCheckoutResponse
	public typealias paramType = Params
	public struct Params {
		let checkout_id: String
		/// Cancels a Terminal checkout request if the status of the request permits it.
		/// - Parameters:
		///   - checkout_id: The unique ID for the desired `TerminalCheckout`.
		public init(checkout_id: String) {
			self.checkout_id = checkout_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/terminals/checkouts/\(inputs.checkout_id)/cancel"
		return url
	}
}

/// Creates a request to refund an Interac payment completed on a Square Terminal. Refunds for Interac payments on a Square Terminal are supported only for Interac debit cards in Canada. Other refunds for Terminal payments should use the Refunds API. For more information, see [Refunds API](https://developer.squareup.com/reference/square_2022-04-20/refunds-api).
public struct CreateTerminalRefund: SquareAPIEndpoint {
	public typealias inputType = CreateTerminalRefundRequest
	public typealias outputType = CreateTerminalRefundResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/terminals/refunds"
	}
}

/// Retrieves a filtered list of Interac Terminal refund requests created by the seller making the request. Terminal refund requests are available for 30 days.
public struct SearchTerminalRefunds: SquareAPIEndpoint {
	public typealias inputType = SearchTerminalRefundsRequest
	public typealias outputType = SearchTerminalRefundsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/terminals/refunds/search"
	}
}

/// Retrieves an Interac Terminal refund object by ID. Terminal refund objects are available for 30 days.
public struct GetTerminalRefund: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetTerminalRefundResponse
	public typealias paramType = Params
	public struct Params {
		let terminal_refund_id: String
		/// Retrieves an Interac Terminal refund object by ID. Terminal refund objects are available for 30 days.
		/// - Parameters:
		///   - terminal_refund_id: The unique ID for the desired `TerminalRefund`.
		public init(terminal_refund_id: String) {
			self.terminal_refund_id = terminal_refund_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/terminals/refunds/\(inputs.terminal_refund_id)"
		return url
	}
}

/// Cancels an Interac Terminal refund request by refund request ID if the status of the request permits it.
public struct CancelTerminalRefund: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CancelTerminalRefundResponse
	public typealias paramType = Params
	public struct Params {
		let terminal_refund_id: String
		/// Cancels an Interac Terminal refund request by refund request ID if the status of the request permits it.
		/// - Parameters:
		///   - terminal_refund_id: The unique ID for the desired `TerminalRefund`.
		public init(terminal_refund_id: String) {
			self.terminal_refund_id = terminal_refund_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/terminals/refunds/\(inputs.terminal_refund_id)/cancel"
		return url
	}
}

