/// Retrieves a list of refunds for the account making the request.  The maximum results per page is 100.
public struct ListPaymentRefunds: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListPaymentRefundsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/refunds"
	}
}

/// Refunds a payment. You can refund the entire payment amount or a  portion of it.
public struct RefundPayment: SquareAPIEndpoint {
	public typealias inputType = RefundPaymentRequest
	public typealias outputType = RefundPaymentResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/refunds"
	}
}

/// Retrieves a specific refund using the `refund_id`.
public struct GetPaymentRefund: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetPaymentRefundResponse
	public typealias paramType = Params
	public struct Params {
		let refund_id: String
		/// Retrieves a specific refund using the `refund_id`.
		/// - Parameters:
		///   - refund_id: The unique ID for the desired `PaymentRefund`.
		public init(refund_id: String) {
			self.refund_id = refund_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/refunds/\(inputs.refund_id)"
	}
}

