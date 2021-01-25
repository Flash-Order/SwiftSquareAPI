/// Retrieves a list of payments taken by the account making the request.  The maximum results per page is 100.
public struct ListPayments: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListPaymentsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/payments"
	}
}

/// Charges a payment source (for example, a card  represented by customer's card on file or a card nonce). In addition  to the payment source, the request must include the  amount to accept for the payment.  There are several optional parameters that you can include in the request  (for example, tip money, whether to autocomplete the payment, or a reference ID  to correlate this payment with another system).   The `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission is required to enable application fees.
public struct CreatePayment: SquareAPIEndpoint {
	public typealias inputType = CreatePaymentRequest
	public typealias outputType = CreatePaymentResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/payments"
	}
}

/// Cancels (voids) a payment identified by the idempotency key that is specified in the request.  Use this method when the status of a `CreatePayment` request is unknown (for example, after you send a `CreatePayment` request, a network error occurs and you do not get a response). In this case, you can direct Square to cancel the payment using this endpoint. In the request, you provide the same idempotency key that you provided in your `CreatePayment` request that you want to cancel. After canceling the payment, you can submit your `CreatePayment` request again.  Note that if no payment with the specified idempotency key is found, no action is taken and the endpoint  returns successfully.
public struct CancelPaymentByIdempotencyKey: SquareAPIEndpoint {
	public typealias inputType = CancelPaymentByIdempotencyKeyRequest
	public typealias outputType = CancelPaymentByIdempotencyKeyResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/payments/cancel"
	}
}

/// Retrieves details for a specific payment.
public struct GetPayment: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetPaymentResponse
	public typealias paramType = Params
	public struct Params {
		let payment_id: String
		/// Retrieves details for a specific payment.
		/// - Parameters:
		///   - payment_id: A unique ID for the desired payment.
		public init(payment_id: String) {
			self.payment_id = payment_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/payments/\(inputs.payment_id)"
	}
}

/// Cancels (voids) a payment. If you set `autocomplete` to `false` when creating a payment,  you can cancel the payment using this endpoint.
public struct CancelPayment: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CancelPaymentResponse
	public typealias paramType = Params
	public struct Params {
		let payment_id: String
		/// Cancels (voids) a payment. If you set `autocomplete` to `false` when creating a payment,  you can cancel the payment using this endpoint.
		/// - Parameters:
		///   - payment_id: The `payment_id` identifying the payment to be canceled.
		public init(payment_id: String) {
			self.payment_id = payment_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/payments/\(inputs.payment_id)/cancel"
	}
}

/// Completes (captures) a payment.  By default, payments are set to complete immediately after they are created.  If you set `autocomplete` to `false` when creating a payment, you can complete (capture)  the payment using this endpoint.
public struct CompletePayment: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CompletePaymentResponse
	public typealias paramType = Params
	public struct Params {
		let payment_id: String
		/// Completes (captures) a payment.  By default, payments are set to complete immediately after they are created.  If you set `autocomplete` to `false` when creating a payment, you can complete (capture)  the payment using this endpoint.
		/// - Parameters:
		///   - payment_id: The unique ID identifying the payment to be completed.
		public init(payment_id: String) {
			self.payment_id = payment_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/payments/\(inputs.payment_id)/complete"
	}
}

