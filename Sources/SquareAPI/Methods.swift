public struct CancelTerminalRefund: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let terminal_refund_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/terminals/refunds/\(inputs.terminal_refund_id)/cancel"
	}
	public typealias outputType = Empty
}

public struct GetTerminalRefund: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let terminal_refund_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/terminals/refunds/\(inputs.terminal_refund_id)"
	}
	public typealias outputType = Empty
}

public struct SearchTerminalRefunds: SquareAPIEndpoint {
	public typealias inputType = SearchTerminalRefundsRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/terminals/refunds/search"
	}
	public typealias outputType = Empty
}

public struct CreateTerminalRefund: SquareAPIEndpoint {
	public typealias inputType = CreateTerminalRefundRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/terminals/refunds"
	}
	public typealias outputType = Empty
}

public struct CancelTerminalCheckout: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let checkout_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/terminals/checkouts/\(inputs.checkout_id)/cancel"
	}
	public typealias outputType = Empty
}

public struct GetTerminalCheckout: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let checkout_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/terminals/checkouts/\(inputs.checkout_id)"
	}
	public typealias outputType = Empty
}

public struct SearchTerminalCheckouts: SquareAPIEndpoint {
	public typealias inputType = SearchTerminalCheckoutsRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/terminals/checkouts/search"
	}
	public typealias outputType = Empty
}

public struct CreateTerminalCheckout: SquareAPIEndpoint {
	public typealias inputType = CreateTerminalCheckoutRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/terminals/checkouts"
	}
	public typealias outputType = Empty
}

public struct RetrieveWageSetting: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let team_member_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/team-members/\(inputs.team_member_id)/wage-setting"
	}
	public typealias outputType = Empty
}

public struct RetrieveTeamMember: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let team_member_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/team-members/\(inputs.team_member_id)"
	}
	public typealias outputType = Empty
}

public struct SearchTeamMembers: SquareAPIEndpoint {
	public typealias inputType = SearchTeamMembersRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members/search"
	}
	public typealias outputType = Empty
}

public struct BulkUpdateTeamMembers: SquareAPIEndpoint {
	public typealias inputType = BulkUpdateTeamMembersRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members/bulk-update"
	}
	public typealias outputType = Empty
}

public struct BulkCreateTeamMembers: SquareAPIEndpoint {
	public typealias inputType = BulkCreateTeamMembersRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members/bulk-create"
	}
	public typealias outputType = Empty
}

public struct CreateTeamMember: SquareAPIEndpoint {
	public typealias inputType = CreateTeamMemberRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members"
	}
	public typealias outputType = Empty
}

public struct ListSubscriptionEvents: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/subscriptions/\(inputs.subscription_id)/events"
	}
	public typealias outputType = Empty
}

public struct CancelSubscription: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/subscriptions/\(inputs.subscription_id)/cancel"
	}
	public typealias outputType = Empty
}

public struct RetrieveSubscription: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/subscriptions/\(inputs.subscription_id)"
	}
	public typealias outputType = Empty
}

public struct SearchSubscriptions: SquareAPIEndpoint {
	public typealias inputType = SearchSubscriptionsRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/subscriptions/search"
	}
	public typealias outputType = Empty
}

public struct CreateSubscription: SquareAPIEndpoint {
	public typealias inputType = CreateSubscriptionRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/subscriptions"
	}
	public typealias outputType = Empty
}

public struct GetPaymentRefund: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let refund_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/refunds/\(inputs.refund_id)"
	}
	public typealias outputType = Empty
}

public struct ListPaymentRefunds: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/refunds"
	}
	public typealias outputType = Empty
}

public struct CompletePayment: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let payment_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/payments/\(inputs.payment_id)/complete"
	}
	public typealias outputType = Empty
}

public struct CancelPayment: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let payment_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/payments/\(inputs.payment_id)/cancel"
	}
	public typealias outputType = Empty
}

public struct GetPayment: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let payment_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/payments/\(inputs.payment_id)"
	}
	public typealias outputType = Empty
}

public struct CancelPaymentByIdempotencyKey: SquareAPIEndpoint {
	public typealias inputType = CancelPaymentByIdempotencyKeyRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/payments/cancel"
	}
	public typealias outputType = Empty
}

public struct ListPayments: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/payments"
	}
	public typealias outputType = Empty
}

public struct PayOrder: SquareAPIEndpoint {
	public typealias inputType = PayOrderRequest
	public typealias paramType = Params
	public struct Params {
		let order_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/orders/\(inputs.order_id)/pay"
	}
	public typealias outputType = Empty
}

public struct RetrieveOrder: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let order_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/orders/\(inputs.order_id)"
	}
	public typealias outputType = Empty
}

public struct SearchOrders: SquareAPIEndpoint {
	public typealias inputType = SearchOrdersRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/search"
	}
	public typealias outputType = Empty
}

public struct CalculateOrder: SquareAPIEndpoint {
	public typealias inputType = CalculateOrderRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/calculate"
	}
	public typealias outputType = Empty
}

public struct BatchRetrieveOrders: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveOrdersRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/batch-retrieve"
	}
	public typealias outputType = Empty
}

public struct CreateOrder: SquareAPIEndpoint {
	public typealias inputType = CreateOrderRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders"
	}
	public typealias outputType = Empty
}

public struct RetrieveMerchant: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let merchant_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/merchants/\(inputs.merchant_id)"
	}
	public typealias outputType = Empty
}

public struct ListMerchants: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/merchants"
	}
	public typealias outputType = Empty
}

public struct RedeemLoyaltyReward: SquareAPIEndpoint {
	public typealias inputType = RedeemLoyaltyRewardRequest
	public typealias paramType = Params
	public struct Params {
		let reward_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/rewards/\(inputs.reward_id)/redeem"
	}
	public typealias outputType = Empty
}

public struct RetrieveLoyaltyReward: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let reward_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/rewards/\(inputs.reward_id)"
	}
	public typealias outputType = Empty
}

public struct SearchLoyaltyRewards: SquareAPIEndpoint {
	public typealias inputType = SearchLoyaltyRewardsRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/rewards/search"
	}
	public typealias outputType = Empty
}

public struct CreateLoyaltyReward: SquareAPIEndpoint {
	public typealias inputType = CreateLoyaltyRewardRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/rewards"
	}
	public typealias outputType = Empty
}

public struct CalculateLoyaltyPoints: SquareAPIEndpoint {
	public typealias inputType = CalculateLoyaltyPointsRequest
	public typealias paramType = Params
	public struct Params {
		let program_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/programs/\(inputs.program_id)/calculate"
	}
	public typealias outputType = Empty
}

public struct ListLoyaltyPrograms: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/programs"
	}
	public typealias outputType = Empty
}

public struct SearchLoyaltyEvents: SquareAPIEndpoint {
	public typealias inputType = SearchLoyaltyEventsRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/events/search"
	}
	public typealias outputType = Empty
}

public struct AdjustLoyaltyPoints: SquareAPIEndpoint {
	public typealias inputType = AdjustLoyaltyPointsRequest
	public typealias paramType = Params
	public struct Params {
		let account_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/accounts/\(inputs.account_id)/adjust"
	}
	public typealias outputType = Empty
}

public struct AccumulateLoyaltyPoints: SquareAPIEndpoint {
	public typealias inputType = AccumulateLoyaltyPointsRequest
	public typealias paramType = Params
	public struct Params {
		let account_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/accounts/\(inputs.account_id)/accumulate"
	}
	public typealias outputType = Empty
}

public struct RetrieveLoyaltyAccount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let account_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/accounts/\(inputs.account_id)"
	}
	public typealias outputType = Empty
}

public struct SearchLoyaltyAccounts: SquareAPIEndpoint {
	public typealias inputType = SearchLoyaltyAccountsRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/accounts/search"
	}
	public typealias outputType = Empty
}

public struct CreateLoyaltyAccount: SquareAPIEndpoint {
	public typealias inputType = CreateLoyaltyAccountRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/accounts"
	}
	public typealias outputType = Empty
}

public struct VoidTransaction: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let transaction_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/transactions/\(inputs.transaction_id)/void"
	}
	public typealias outputType = Empty
}

public struct CreateRefund: SquareAPIEndpoint {
	public typealias inputType = CreateRefundRequest
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let transaction_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/transactions/\(inputs.transaction_id)/refund"
	}
	public typealias outputType = Empty
}

public struct CaptureTransaction: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let transaction_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/transactions/\(inputs.transaction_id)/capture"
	}
	public typealias outputType = Empty
}

public struct RetrieveTransaction: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let transaction_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/transactions/\(inputs.transaction_id)"
	}
	public typealias outputType = Empty
}

public struct ListTransactions: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/transactions"
	}
	public typealias outputType = Empty
}

public struct ListRefunds: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/refunds"
	}
	public typealias outputType = Empty
}

public struct CreateCheckout: SquareAPIEndpoint {
	public typealias inputType = CreateCheckoutRequest
	public typealias paramType = Params
	public struct Params {
		let location_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/checkouts"
	}
	public typealias outputType = Empty
}

public struct RetrieveLocation: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)"
	}
	public typealias outputType = Empty
}

public struct ListLocations: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/locations"
	}
	public typealias outputType = Empty
}

public struct ListWorkweekConfigs: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/workweek-configs"
	}
	public typealias outputType = Empty
}

public struct GetTeamMemberWage: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/labor/team-member-wages/\(inputs.id)"
	}
	public typealias outputType = Empty
}

public struct ListTeamMemberWages: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/team-member-wages"
	}
	public typealias outputType = Empty
}

public struct GetShift: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/labor/shifts/\(inputs.id)"
	}
	public typealias outputType = Empty
}

public struct SearchShifts: SquareAPIEndpoint {
	public typealias inputType = SearchShiftsRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/shifts/search"
	}
	public typealias outputType = Empty
}

public struct CreateShift: SquareAPIEndpoint {
	public typealias inputType = CreateShiftRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/shifts"
	}
	public typealias outputType = Empty
}

public struct GetEmployeeWage: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/labor/employee-wages/\(inputs.id)"
	}
	public typealias outputType = Empty
}

public struct ListEmployeeWages: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/employee-wages"
	}
	public typealias outputType = Empty
}

public struct GetBreakType: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/labor/break-types/\(inputs.id)"
	}
	public typealias outputType = Empty
}

public struct ListBreakTypes: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/break-types"
	}
	public typealias outputType = Empty
}

public struct PublishInvoice: SquareAPIEndpoint {
	public typealias inputType = PublishInvoiceRequest
	public typealias paramType = Params
	public struct Params {
		let invoice_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/invoices/\(inputs.invoice_id)/publish"
	}
	public typealias outputType = Empty
}

public struct CancelInvoice: SquareAPIEndpoint {
	public typealias inputType = CancelInvoiceRequest
	public typealias paramType = Params
	public struct Params {
		let invoice_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/invoices/\(inputs.invoice_id)/cancel"
	}
	public typealias outputType = Empty
}

public struct GetInvoice: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let invoice_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/invoices/\(inputs.invoice_id)"
	}
	public typealias outputType = Empty
}

public struct SearchInvoices: SquareAPIEndpoint {
	public typealias inputType = SearchInvoicesRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/invoices/search"
	}
	public typealias outputType = Empty
}

public struct ListInvoices: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/invoices"
	}
	public typealias outputType = Empty
}

public struct RetrieveInventoryChanges: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let catalog_object_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/inventory/\(inputs.catalog_object_id)/changes"
	}
	public typealias outputType = Empty
}

public struct RetrieveInventoryCount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let catalog_object_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/inventory/\(inputs.catalog_object_id)"
	}
	public typealias outputType = Empty
}

public struct RetrieveInventoryPhysicalCount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let physical_count_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/inventory/physical-count/\(inputs.physical_count_id)"
	}
	public typealias outputType = Empty
}

public struct BatchRetrieveInventoryCounts: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveInventoryCountsRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/inventory/batch-retrieve-counts"
	}
	public typealias outputType = Empty
}

public struct BatchRetrieveInventoryChanges: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveInventoryChangesRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/inventory/batch-retrieve-changes"
	}
	public typealias outputType = Empty
}

public struct BatchChangeInventory: SquareAPIEndpoint {
	public typealias inputType = BatchChangeInventoryRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/inventory/batch-change"
	}
	public typealias outputType = Empty
}

public struct RetrieveInventoryAdjustment: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let adjustment_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/inventory/adjustment/\(inputs.adjustment_id)"
	}
	public typealias outputType = Empty
}

public struct RetrieveEmployee: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/employees/\(inputs.id)"
	}
	public typealias outputType = Empty
}

public struct ListEmployees: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/employees"
	}
	public typealias outputType = Empty
}

public struct SubmitEvidence: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)/submit-evidence"
	}
	public typealias outputType = Empty
}

public struct CreateDisputeEvidenceText: SquareAPIEndpoint {
	public typealias inputType = CreateDisputeEvidenceTextRequest
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)/evidence_text"
	}
	public typealias outputType = Empty
}

public struct RetrieveDisputeEvidence: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
		let evidence_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)/evidence/\(inputs.evidence_id)"
	}
	public typealias outputType = Empty
}

public struct ListDisputeEvidence: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)/evidence"
	}
	public typealias outputType = Empty
}

public struct AcceptDispute: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)/accept"
	}
	public typealias outputType = Empty
}

public struct RetrieveDispute: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)"
	}
	public typealias outputType = Empty
}

public struct ListDisputes: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/disputes"
	}
	public typealias outputType = Empty
}

public struct GetDeviceCode: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/devices/codes/\(inputs.id)"
	}
	public typealias outputType = Empty
}

public struct ListDeviceCodes: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/devices/codes"
	}
	public typealias outputType = Empty
}

public struct CreateCustomerCard: SquareAPIEndpoint {
	public typealias inputType = CreateCustomerCardRequest
	public typealias paramType = Params
	public struct Params {
		let customer_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/customers/\(inputs.customer_id)/cards"
	}
	public typealias outputType = Empty
}

public struct RetrieveCustomer: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let customer_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/customers/\(inputs.customer_id)"
	}
	public typealias outputType = Empty
}

public struct RetrieveCustomerSegment: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let segment_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/customers/segments/\(inputs.segment_id)"
	}
	public typealias outputType = Empty
}

public struct ListCustomerSegments: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers/segments"
	}
	public typealias outputType = Empty
}

public struct SearchCustomers: SquareAPIEndpoint {
	public typealias inputType = SearchCustomersRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers/search"
	}
	public typealias outputType = Empty
}

public struct RetrieveCustomerGroup: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let group_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/customers/groups/\(inputs.group_id)"
	}
	public typealias outputType = Empty
}

public struct ListCustomerGroups: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers/groups"
	}
	public typealias outputType = Empty
}

public struct ListCustomers: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers"
	}
	public typealias outputType = Empty
}

public struct UpdateItemTaxes: SquareAPIEndpoint {
	public typealias inputType = UpdateItemTaxesRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/update-item-taxes"
	}
	public typealias outputType = Empty
}

public struct UpdateItemModifierLists: SquareAPIEndpoint {
	public typealias inputType = UpdateItemModifierListsRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/update-item-modifier-lists"
	}
	public typealias outputType = Empty
}

public struct SearchCatalogItems: SquareAPIEndpoint {
	public typealias inputType = SearchCatalogItemsRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/search-catalog-items"
	}
	public typealias outputType = Empty
}

public struct SearchCatalogObjects: SquareAPIEndpoint {
	public typealias inputType = SearchCatalogObjectsRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/search"
	}
	public typealias outputType = Empty
}

public struct RetrieveCatalogObject: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let object_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/catalog/object/\(inputs.object_id)"
	}
	public typealias outputType = Empty
}

public struct UpsertCatalogObject: SquareAPIEndpoint {
	public typealias inputType = UpsertCatalogObjectRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/object"
	}
	public typealias outputType = Empty
}

public struct ListCatalog: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/list"
	}
	public typealias outputType = Empty
}

public struct CatalogInfo: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/info"
	}
	public typealias outputType = Empty
}

public struct BatchUpsertCatalogObjects: SquareAPIEndpoint {
	public typealias inputType = BatchUpsertCatalogObjectsRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/batch-upsert"
	}
	public typealias outputType = Empty
}

public struct BatchRetrieveCatalogObjects: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveCatalogObjectsRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/batch-retrieve"
	}
	public typealias outputType = Empty
}

public struct BatchDeleteCatalogObjects: SquareAPIEndpoint {
	public typealias inputType = BatchDeleteCatalogObjectsRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/batch-delete"
	}
	public typealias outputType = Empty
}

public struct ListCashDrawerShiftEvents: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let shift_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/cash-drawers/shifts/\(inputs.shift_id)/events"
	}
	public typealias outputType = Empty
}

public struct RetrieveCashDrawerShift: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let shift_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/cash-drawers/shifts/\(inputs.shift_id)"
	}
	public typealias outputType = Empty
}

public struct ListCashDrawerShifts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/cash-drawers/shifts"
	}
	public typealias outputType = Empty
}

public struct CancelBooking: SquareAPIEndpoint {
	public typealias inputType = CancelBookingRequest
	public typealias paramType = Params
	public struct Params {
		let booking_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bookings/\(inputs.booking_id)/cancel"
	}
	public typealias outputType = Empty
}

public struct RetrieveBooking: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let booking_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bookings/\(inputs.booking_id)"
	}
	public typealias outputType = Empty
}

public struct RetrieveTeamMemberBookingProfile: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let team_member_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bookings/team-member-booking-profiles/\(inputs.team_member_id)"
	}
	public typealias outputType = Empty
}

public struct ListTeamMemberBookingProfiles: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings/team-member-booking-profiles"
	}
	public typealias outputType = Empty
}

public struct RetrieveBusinessBookingProfile: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings/business-booking-profile"
	}
	public typealias outputType = Empty
}

public struct SearchAvailability: SquareAPIEndpoint {
	public typealias inputType = SearchAvailabilityRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings/availability/search"
	}
	public typealias outputType = Empty
}

public struct CreateBooking: SquareAPIEndpoint {
	public typealias inputType = CreateBookingRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings"
	}
	public typealias outputType = Empty
}

public struct GetBankAccount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let bank_account_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bank-accounts/\(inputs.bank_account_id)"
	}
	public typealias outputType = Empty
}

public struct GetBankAccountByV1Id: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let v1_bank_account_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bank-accounts/by-v1-id/\(inputs.v1_bank_account_id)"
	}
	public typealias outputType = Empty
}

public struct ListBankAccounts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bank-accounts"
	}
	public typealias outputType = Empty
}

public struct RegisterDomain: SquareAPIEndpoint {
	public typealias inputType = RegisterDomainRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/apple-pay/domains"
	}
	public typealias outputType = Empty
}

public struct V1RetrieveSettlement: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let settlement_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/settlements/\(inputs.settlement_id)"
	}
	public typealias outputType = Empty
}

public struct V1ListSettlements: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/settlements"
	}
	public typealias outputType = Empty
}

public struct V1ListRefunds: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/refunds"
	}
	public typealias outputType = Empty
}

public struct V1RetrievePayment: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let payment_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/payments/\(inputs.payment_id)"
	}
	public typealias outputType = Empty
}

public struct V1ListPayments: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/payments"
	}
	public typealias outputType = Empty
}

public struct V1ListPages: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/pages"
	}
	public typealias outputType = Empty
}

public struct V1RetrieveOrder: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let order_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/orders/\(inputs.order_id)"
	}
	public typealias outputType = Empty
}

public struct V1ListOrders: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/orders"
	}
	public typealias outputType = Empty
}

public struct V1CreateModifierOption: SquareAPIEndpoint {
	public typealias inputType = V1ModifierOption
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let modifier_list_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/modifier-lists/\(inputs.modifier_list_id)/modifier-options"
	}
	public typealias outputType = Empty
}

public struct V1RetrieveModifierList: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let modifier_list_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/modifier-lists/\(inputs.modifier_list_id)"
	}
	public typealias outputType = Empty
}

public struct V1ListModifierLists: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/modifier-lists"
	}
	public typealias outputType = Empty
}

public struct V1CreateVariation: SquareAPIEndpoint {
	public typealias inputType = V1Variation
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let item_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/items/\(inputs.item_id)/variations"
	}
	public typealias outputType = Empty
}

public struct V1RetrieveItem: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let item_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/items/\(inputs.item_id)"
	}
	public typealias outputType = Empty
}

public struct V1ListItems: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/items"
	}
	public typealias outputType = Empty
}

public struct V1AdjustInventory: SquareAPIEndpoint {
	public typealias inputType = V1AdjustInventoryRequest
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let variation_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/inventory/\(inputs.variation_id)"
	}
	public typealias outputType = Empty
}

public struct V1ListInventory: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/inventory"
	}
	public typealias outputType = Empty
}

public struct V1ListFees: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/fees"
	}
	public typealias outputType = Empty
}

public struct V1ListDiscounts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/discounts"
	}
	public typealias outputType = Empty
}

public struct V1ListCategories: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/categories"
	}
	public typealias outputType = Empty
}

public struct V1RetrieveCashDrawerShift: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let shift_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/cash-drawer-shifts/\(inputs.shift_id)"
	}
	public typealias outputType = Empty
}

public struct V1ListCashDrawerShifts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/cash-drawer-shifts"
	}
	public typealias outputType = Empty
}

public struct V1RetrieveBankAccount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let bank_account_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/bank-accounts/\(inputs.bank_account_id)"
	}
	public typealias outputType = Empty
}

public struct V1ListBankAccounts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let location_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/bank-accounts"
	}
	public typealias outputType = Empty
}

public struct V1ListTimecardEvents: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let timecard_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/timecards/\(inputs.timecard_id)/events"
	}
	public typealias outputType = Empty
}

public struct V1RetrieveTimecard: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let timecard_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/timecards/\(inputs.timecard_id)"
	}
	public typealias outputType = Empty
}

public struct V1ListTimecards: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/me/timecards"
	}
	public typealias outputType = Empty
}

public struct V1RetrieveEmployeeRole: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let role_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/roles/\(inputs.role_id)"
	}
	public typealias outputType = Empty
}

public struct V1ListEmployeeRoles: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/me/roles"
	}
	public typealias outputType = Empty
}

public struct V1RetrieveEmployee: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Params
	public struct Params {
		let employee_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/employees/\(inputs.employee_id)"
	}
	public typealias outputType = Empty
}

public struct V1ListEmployees: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/me/employees"
	}
	public typealias outputType = Empty
}

public struct ObtainToken: SquareAPIEndpoint {
	public typealias inputType = ObtainTokenRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/oauth2/token"
	}
	public typealias outputType = Empty
}

public struct RevokeToken: SquareAPIEndpoint {
	public typealias inputType = RevokeTokenRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/oauth2/revoke"
	}
	public typealias outputType = Empty
}

public struct RenewToken: SquareAPIEndpoint {
	public typealias inputType = RenewTokenRequest
	public typealias paramType = Params
	public struct Params {
		let client_id: String
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/oauth2/clients/\(inputs.client_id)/access-token/renew"
	}
	public typealias outputType = Empty
}

public struct CreateMobileAuthorizationCode: SquareAPIEndpoint {
	public typealias inputType = CreateMobileAuthorizationCodeRequest
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/mobile/authorization-code"
	}
	public typealias outputType = Empty
}

