/// Provides non-confidential details for all of a location's associated bank accounts. This endpoint does not provide full bank account numbers, and there is no way to obtain a full bank account number with the Connect API.
@available(*,deprecated)
public struct V1ListBankAccounts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1BankAccount]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Provides non-confidential details for all of a location's associated bank accounts. This endpoint does not provide full bank account numbers, and there is no way to obtain a full bank account number with the Connect API.
		/// - Parameters:
		///   - location_id: The ID of the location to list bank accounts for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/bank-accounts"
	}
}

/// Provides non-confidential details for a merchant's associated bank account. This endpoint does not provide full bank account numbers, and there is no way to obtain a full bank account number with the Connect API.
@available(*,deprecated)
public struct V1RetrieveBankAccount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1BankAccount
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let bank_account_id: String
		/// Provides non-confidential details for a merchant's associated bank account. This endpoint does not provide full bank account numbers, and there is no way to obtain a full bank account number with the Connect API.
		/// - Parameters:
		///   - location_id: The ID of the bank account's associated location.
		///   - bank_account_id: The bank account's Square-issued ID. You obtain this value from Settlement objects returned.
		public init(location_id: String, bank_account_id: String) {
			self.location_id = location_id
			self.bank_account_id = bank_account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/bank-accounts/\(inputs.bank_account_id)"
	}
}

/// Provides summary information for a merchant's online store orders.
public struct V1ListOrders: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Order]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Provides summary information for a merchant's online store orders.
		/// - Parameters:
		///   - location_id: The ID of the location to list online store orders for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/orders"
	}
}

/// Provides comprehensive information for a single online store order, including the order's history.
public struct V1RetrieveOrder: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1Order
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let order_id: String
		/// Provides comprehensive information for a single online store order, including the order's history.
		/// - Parameters:
		///   - location_id: The ID of the order's associated location.
		///   - order_id: The order's Square-issued ID. You obtain this value from Order objects returned by the List Orders endpoint
		public init(location_id: String, order_id: String) {
			self.location_id = location_id
			self.order_id = order_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/orders/\(inputs.order_id)"
	}
}

/// Updates the details of an online store order. Every update you perform on an order corresponds to one of three actions:
public struct V1UpdateOrder: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = V1UpdateOrderRequest
	public typealias outputType = V1Order
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let order_id: String
		/// Updates the details of an online store order. Every update you perform on an order corresponds to one of three actions:
		/// - Parameters:
		///   - location_id: The ID of the order's associated location.
		///   - order_id: The order's Square-issued ID. You obtain this value from Order objects returned by the List Orders endpoint
		public init(location_id: String, order_id: String) {
			self.location_id = location_id
			self.order_id = order_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/orders/\(inputs.order_id)"
	}
}

/// Provides summary information for all payments taken for a given Square account during a date range. Date ranges cannot exceed 1 year in length. See Date ranges for details of inclusive and exclusive dates.  *Note**: Details for payments processed with Square Point of Sale while in offline mode may not be transmitted to Square for up to 72 hours. Offline payments have a `created_at` value that reflects the time the payment was originally processed, not the time it was subsequently transmitted to Square. Consequently, the ListPayments endpoint might list an offline payment chronologically between online payments that were seen in a previous request.
public struct V1ListPayments: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Payment]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Provides summary information for all payments taken for a given Square account during a date range. Date ranges cannot exceed 1 year in length. See Date ranges for details of inclusive and exclusive dates.  *Note**: Details for payments processed with Square Point of Sale while in offline mode may not be transmitted to Square for up to 72 hours. Offline payments have a `created_at` value that reflects the time the payment was originally processed, not the time it was subsequently transmitted to Square. Consequently, the ListPayments endpoint might list an offline payment chronologically between online payments that were seen in a previous request.
		/// - Parameters:
		///   - location_id: The ID of the location to list payments for. If you specify me, this endpoint returns payments aggregated from all of the business's locations.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/payments"
	}
}

/// Provides comprehensive information for a single payment.
public struct V1RetrievePayment: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1Payment
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let payment_id: String
		/// Provides comprehensive information for a single payment.
		/// - Parameters:
		///   - location_id: The ID of the payment's associated location.
		///   - payment_id: The Square-issued payment ID. payment_id comes from Payment objects returned by the List Payments endpoint, Settlement objects returned by the List Settlements endpoint, or Refund objects returned by the List Refunds endpoint.
		public init(location_id: String, payment_id: String) {
			self.location_id = location_id
			self.payment_id = payment_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/payments/\(inputs.payment_id)"
	}
}

/// Provides the details for all refunds initiated by a merchant or any of the merchant's mobile staff during a date range. Date ranges cannot exceed one year in length.
public struct V1ListRefunds: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Refund]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Provides the details for all refunds initiated by a merchant or any of the merchant's mobile staff during a date range. Date ranges cannot exceed one year in length.
		/// - Parameters:
		///   - location_id: The ID of the location to list refunds for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/refunds"
	}
}

/// Issues a refund for a previously processed payment. You must issue a refund within 60 days of the associated payment.  You cannot issue a partial refund for a split tender payment. You must instead issue a full or partial refund for a particular tender, by providing the applicable tender id to the V1CreateRefund endpoint. Issuing a full refund for a split tender payment refunds all tenders associated with the payment.  Issuing a refund for a card payment is not reversible. For development purposes, you can create fake cash payments in Square Point of Sale and refund them.
public struct V1CreateRefund: SquareAPIEndpoint {
	public typealias inputType = V1CreateRefundRequest
	public typealias outputType = V1Refund
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Issues a refund for a previously processed payment. You must issue a refund within 60 days of the associated payment.  You cannot issue a partial refund for a split tender payment. You must instead issue a full or partial refund for a particular tender, by providing the applicable tender id to the V1CreateRefund endpoint. Issuing a full refund for a split tender payment refunds all tenders associated with the payment.  Issuing a refund for a card payment is not reversible. For development purposes, you can create fake cash payments in Square Point of Sale and refund them.
		/// - Parameters:
		///   - location_id: The ID of the original payment's associated location.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/refunds"
	}
}

/// Provides summary information for all deposits and withdrawals initiated by Square to a linked bank account during a date range. Date ranges cannot exceed one year in length.  *Note**: the ListSettlements endpoint does not provide entry information.
public struct V1ListSettlements: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Settlement]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Provides summary information for all deposits and withdrawals initiated by Square to a linked bank account during a date range. Date ranges cannot exceed one year in length.  *Note**: the ListSettlements endpoint does not provide entry information.
		/// - Parameters:
		///   - location_id: The ID of the location to list settlements for. If you specify me, this endpoint returns settlements aggregated from all of the business's locations.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/settlements"
	}
}

/// Provides comprehensive information for a single settlement.  The returned `Settlement` objects include an `entries` field that lists the transactions that contribute to the settlement total. Most settlement entries correspond to a payment payout, but settlement entries are also generated for less common events, like refunds, manual adjustments, or chargeback holds.  Square initiates its regular deposits as indicated in the [Deposit Options with Square](https://squareup.com/help/us/en/article/3807) help article. Details for a regular deposit are usually not available from Connect API endpoints before 10 p.m. PST the same day.  Square does not know when an initiated settlement **completes**, only whether it has failed. A completed settlement is typically reflected in a bank account within 3 business days, but in exceptional cases it may take longer.
public struct V1RetrieveSettlement: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1Settlement
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let settlement_id: String
		/// Provides comprehensive information for a single settlement.  The returned `Settlement` objects include an `entries` field that lists the transactions that contribute to the settlement total. Most settlement entries correspond to a payment payout, but settlement entries are also generated for less common events, like refunds, manual adjustments, or chargeback holds.  Square initiates its regular deposits as indicated in the [Deposit Options with Square](https://squareup.com/help/us/en/article/3807) help article. Details for a regular deposit are usually not available from Connect API endpoints before 10 p.m. PST the same day.  Square does not know when an initiated settlement **completes**, only whether it has failed. A completed settlement is typically reflected in a bank account within 3 business days, but in exceptional cases it may take longer.
		/// - Parameters:
		///   - location_id: The ID of the settlements's associated location.
		///   - settlement_id: The settlement's Square-issued ID. You obtain this value from Settlement objects returned by the List Settlements endpoint.
		public init(location_id: String, settlement_id: String) {
			self.location_id = location_id
			self.settlement_id = settlement_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/settlements/\(inputs.settlement_id)"
	}
}

