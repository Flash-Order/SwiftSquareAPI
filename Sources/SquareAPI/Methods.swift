public struct CancelTerminalRefund: SquareAPIEndpoint {
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let terminal_refund_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/terminals/refunds/\(inputs.terminal_refund_id)/cancel"
	}
	typealias outputType = Empty
}

public struct GetTerminalRefund: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let terminal_refund_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/terminals/refunds/\(inputs.terminal_refund_id)"
	}
	typealias outputType = Empty
}

public struct SearchTerminalRefunds: SquareAPIEndpoint {
	typealias inputType = SearchTerminalRefundsRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/terminals/refunds/search"
	}
	typealias outputType = Empty
}

public struct CreateTerminalRefund: SquareAPIEndpoint {
	typealias inputType = CreateTerminalRefundRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/terminals/refunds"
	}
	typealias outputType = Empty
}

public struct CancelTerminalCheckout: SquareAPIEndpoint {
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let checkout_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/terminals/checkouts/\(inputs.checkout_id)/cancel"
	}
	typealias outputType = Empty
}

public struct GetTerminalCheckout: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let checkout_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/terminals/checkouts/\(inputs.checkout_id)"
	}
	typealias outputType = Empty
}

public struct SearchTerminalCheckouts: SquareAPIEndpoint {
	typealias inputType = SearchTerminalCheckoutsRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/terminals/checkouts/search"
	}
	typealias outputType = Empty
}

public struct CreateTerminalCheckout: SquareAPIEndpoint {
	typealias inputType = CreateTerminalCheckoutRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/terminals/checkouts"
	}
	typealias outputType = Empty
}

public struct RetrieveWageSetting: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let team_member_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/team-members/\(inputs.team_member_id)/wage-setting"
	}
	typealias outputType = Empty
}

public struct RetrieveTeamMember: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let team_member_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/team-members/\(inputs.team_member_id)"
	}
	typealias outputType = Empty
}

public struct SearchTeamMembers: SquareAPIEndpoint {
	typealias inputType = SearchTeamMembersRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members/search"
	}
	typealias outputType = Empty
}

public struct BulkUpdateTeamMembers: SquareAPIEndpoint {
	typealias inputType = BulkUpdateTeamMembersRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members/bulk-update"
	}
	typealias outputType = Empty
}

public struct BulkCreateTeamMembers: SquareAPIEndpoint {
	typealias inputType = BulkCreateTeamMembersRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members/bulk-create"
	}
	typealias outputType = Empty
}

public struct CreateTeamMember: SquareAPIEndpoint {
	typealias inputType = CreateTeamMemberRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members"
	}
	typealias outputType = Empty
}

public struct ListSubscriptionEvents: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let subscription_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/subscriptions/\(inputs.subscription_id)/events"
	}
	typealias outputType = Empty
}

public struct CancelSubscription: SquareAPIEndpoint {
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let subscription_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/subscriptions/\(inputs.subscription_id)/cancel"
	}
	typealias outputType = Empty
}

public struct RetrieveSubscription: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let subscription_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/subscriptions/\(inputs.subscription_id)"
	}
	typealias outputType = Empty
}

public struct SearchSubscriptions: SquareAPIEndpoint {
	typealias inputType = SearchSubscriptionsRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/subscriptions/search"
	}
	typealias outputType = Empty
}

public struct CreateSubscription: SquareAPIEndpoint {
	typealias inputType = CreateSubscriptionRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/subscriptions"
	}
	typealias outputType = Empty
}

public struct GetPaymentRefund: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let refund_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/refunds/\(inputs.refund_id)"
	}
	typealias outputType = Empty
}

public struct ListPaymentRefunds: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/refunds"
	}
	typealias outputType = Empty
}

public struct CompletePayment: SquareAPIEndpoint {
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let payment_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/payments/\(inputs.payment_id)/complete"
	}
	typealias outputType = Empty
}

public struct CancelPayment: SquareAPIEndpoint {
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let payment_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/payments/\(inputs.payment_id)/cancel"
	}
	typealias outputType = Empty
}

public struct GetPayment: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let payment_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/payments/\(inputs.payment_id)"
	}
	typealias outputType = Empty
}

public struct CancelPaymentByIdempotencyKey: SquareAPIEndpoint {
	typealias inputType = CancelPaymentByIdempotencyKeyRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/payments/cancel"
	}
	typealias outputType = Empty
}

public struct ListPayments: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/payments"
	}
	typealias outputType = Empty
}

public struct PayOrder: SquareAPIEndpoint {
	typealias inputType = PayOrderRequest
	typealias paramType = Params
	struct Params {
		let order_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/orders/\(inputs.order_id)/pay"
	}
	typealias outputType = Empty
}

public struct RetrieveOrder: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let order_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/orders/\(inputs.order_id)"
	}
	typealias outputType = Empty
}

public struct SearchOrders: SquareAPIEndpoint {
	typealias inputType = SearchOrdersRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/search"
	}
	typealias outputType = Empty
}

public struct CalculateOrder: SquareAPIEndpoint {
	typealias inputType = CalculateOrderRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/calculate"
	}
	typealias outputType = Empty
}

public struct BatchRetrieveOrders: SquareAPIEndpoint {
	typealias inputType = BatchRetrieveOrdersRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/batch-retrieve"
	}
	typealias outputType = Empty
}

public struct CreateOrder: SquareAPIEndpoint {
	typealias inputType = CreateOrderRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders"
	}
	typealias outputType = Empty
}

public struct RetrieveMerchant: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let merchant_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/merchants/\(inputs.merchant_id)"
	}
	typealias outputType = Empty
}

public struct ListMerchants: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/merchants"
	}
	typealias outputType = Empty
}

public struct RedeemLoyaltyReward: SquareAPIEndpoint {
	typealias inputType = RedeemLoyaltyRewardRequest
	typealias paramType = Params
	struct Params {
		let reward_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/rewards/\(inputs.reward_id)/redeem"
	}
	typealias outputType = Empty
}

public struct RetrieveLoyaltyReward: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let reward_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/rewards/\(inputs.reward_id)"
	}
	typealias outputType = Empty
}

public struct SearchLoyaltyRewards: SquareAPIEndpoint {
	typealias inputType = SearchLoyaltyRewardsRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/rewards/search"
	}
	typealias outputType = Empty
}

public struct CreateLoyaltyReward: SquareAPIEndpoint {
	typealias inputType = CreateLoyaltyRewardRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/rewards"
	}
	typealias outputType = Empty
}

public struct CalculateLoyaltyPoints: SquareAPIEndpoint {
	typealias inputType = CalculateLoyaltyPointsRequest
	typealias paramType = Params
	struct Params {
		let program_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/programs/\(inputs.program_id)/calculate"
	}
	typealias outputType = Empty
}

public struct ListLoyaltyPrograms: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/programs"
	}
	typealias outputType = Empty
}

public struct SearchLoyaltyEvents: SquareAPIEndpoint {
	typealias inputType = SearchLoyaltyEventsRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/events/search"
	}
	typealias outputType = Empty
}

public struct AdjustLoyaltyPoints: SquareAPIEndpoint {
	typealias inputType = AdjustLoyaltyPointsRequest
	typealias paramType = Params
	struct Params {
		let account_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/accounts/\(inputs.account_id)/adjust"
	}
	typealias outputType = Empty
}

public struct AccumulateLoyaltyPoints: SquareAPIEndpoint {
	typealias inputType = AccumulateLoyaltyPointsRequest
	typealias paramType = Params
	struct Params {
		let account_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/accounts/\(inputs.account_id)/accumulate"
	}
	typealias outputType = Empty
}

public struct RetrieveLoyaltyAccount: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let account_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/accounts/\(inputs.account_id)"
	}
	typealias outputType = Empty
}

public struct SearchLoyaltyAccounts: SquareAPIEndpoint {
	typealias inputType = SearchLoyaltyAccountsRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/accounts/search"
	}
	typealias outputType = Empty
}

public struct CreateLoyaltyAccount: SquareAPIEndpoint {
	typealias inputType = CreateLoyaltyAccountRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/accounts"
	}
	typealias outputType = Empty
}

public struct VoidTransaction: SquareAPIEndpoint {
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
		let transaction_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/transactions/\(inputs.transaction_id)/void"
	}
	typealias outputType = Empty
}

public struct CreateRefund: SquareAPIEndpoint {
	typealias inputType = CreateRefundRequest
	typealias paramType = Params
	struct Params {
		let location_id: String
		let transaction_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/transactions/\(inputs.transaction_id)/refund"
	}
	typealias outputType = Empty
}

public struct CaptureTransaction: SquareAPIEndpoint {
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
		let transaction_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/transactions/\(inputs.transaction_id)/capture"
	}
	typealias outputType = Empty
}

public struct RetrieveTransaction: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
		let transaction_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/transactions/\(inputs.transaction_id)"
	}
	typealias outputType = Empty
}

public struct ListTransactions: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/transactions"
	}
	typealias outputType = Empty
}

public struct ListRefunds: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/refunds"
	}
	typealias outputType = Empty
}

public struct CreateCheckout: SquareAPIEndpoint {
	typealias inputType = CreateCheckoutRequest
	typealias paramType = Params
	struct Params {
		let location_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/checkouts"
	}
	typealias outputType = Empty
}

public struct RetrieveLocation: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)"
	}
	typealias outputType = Empty
}

public struct ListLocations: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/locations"
	}
	typealias outputType = Empty
}

public struct ListWorkweekConfigs: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/workweek-configs"
	}
	typealias outputType = Empty
}

public struct GetTeamMemberWage: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/labor/team-member-wages/\(inputs.id)"
	}
	typealias outputType = Empty
}

public struct ListTeamMemberWages: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/team-member-wages"
	}
	typealias outputType = Empty
}

public struct GetShift: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/labor/shifts/\(inputs.id)"
	}
	typealias outputType = Empty
}

public struct SearchShifts: SquareAPIEndpoint {
	typealias inputType = SearchShiftsRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/shifts/search"
	}
	typealias outputType = Empty
}

public struct CreateShift: SquareAPIEndpoint {
	typealias inputType = CreateShiftRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/shifts"
	}
	typealias outputType = Empty
}

public struct GetEmployeeWage: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/labor/employee-wages/\(inputs.id)"
	}
	typealias outputType = Empty
}

public struct ListEmployeeWages: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/employee-wages"
	}
	typealias outputType = Empty
}

public struct GetBreakType: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/labor/break-types/\(inputs.id)"
	}
	typealias outputType = Empty
}

public struct ListBreakTypes: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/break-types"
	}
	typealias outputType = Empty
}

public struct PublishInvoice: SquareAPIEndpoint {
	typealias inputType = PublishInvoiceRequest
	typealias paramType = Params
	struct Params {
		let invoice_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/invoices/\(inputs.invoice_id)/publish"
	}
	typealias outputType = Empty
}

public struct CancelInvoice: SquareAPIEndpoint {
	typealias inputType = CancelInvoiceRequest
	typealias paramType = Params
	struct Params {
		let invoice_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/invoices/\(inputs.invoice_id)/cancel"
	}
	typealias outputType = Empty
}

public struct GetInvoice: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let invoice_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/invoices/\(inputs.invoice_id)"
	}
	typealias outputType = Empty
}

public struct SearchInvoices: SquareAPIEndpoint {
	typealias inputType = SearchInvoicesRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/invoices/search"
	}
	typealias outputType = Empty
}

public struct ListInvoices: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/invoices"
	}
	typealias outputType = Empty
}

public struct RetrieveInventoryChanges: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let catalog_object_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/inventory/\(inputs.catalog_object_id)/changes"
	}
	typealias outputType = Empty
}

public struct RetrieveInventoryCount: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let catalog_object_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/inventory/\(inputs.catalog_object_id)"
	}
	typealias outputType = Empty
}

public struct RetrieveInventoryPhysicalCount: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let physical_count_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/inventory/physical-count/\(inputs.physical_count_id)"
	}
	typealias outputType = Empty
}

public struct BatchRetrieveInventoryCounts: SquareAPIEndpoint {
	typealias inputType = BatchRetrieveInventoryCountsRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/inventory/batch-retrieve-counts"
	}
	typealias outputType = Empty
}

public struct BatchRetrieveInventoryChanges: SquareAPIEndpoint {
	typealias inputType = BatchRetrieveInventoryChangesRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/inventory/batch-retrieve-changes"
	}
	typealias outputType = Empty
}

public struct BatchChangeInventory: SquareAPIEndpoint {
	typealias inputType = BatchChangeInventoryRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/inventory/batch-change"
	}
	typealias outputType = Empty
}

public struct RetrieveInventoryAdjustment: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let adjustment_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/inventory/adjustment/\(inputs.adjustment_id)"
	}
	typealias outputType = Empty
}

public struct RetrieveEmployee: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/employees/\(inputs.id)"
	}
	typealias outputType = Empty
}

public struct ListEmployees: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/employees"
	}
	typealias outputType = Empty
}

public struct SubmitEvidence: SquareAPIEndpoint {
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let dispute_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)/submit-evidence"
	}
	typealias outputType = Empty
}

public struct CreateDisputeEvidenceText: SquareAPIEndpoint {
	typealias inputType = CreateDisputeEvidenceTextRequest
	typealias paramType = Params
	struct Params {
		let dispute_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)/evidence_text"
	}
	typealias outputType = Empty
}

public struct RetrieveDisputeEvidence: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let dispute_id: String
		let evidence_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)/evidence/\(inputs.evidence_id)"
	}
	typealias outputType = Empty
}

public struct ListDisputeEvidence: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let dispute_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)/evidence"
	}
	typealias outputType = Empty
}

public struct AcceptDispute: SquareAPIEndpoint {
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let dispute_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)/accept"
	}
	typealias outputType = Empty
}

public struct RetrieveDispute: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let dispute_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)"
	}
	typealias outputType = Empty
}

public struct ListDisputes: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/disputes"
	}
	typealias outputType = Empty
}

public struct GetDeviceCode: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/devices/codes/\(inputs.id)"
	}
	typealias outputType = Empty
}

public struct ListDeviceCodes: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/devices/codes"
	}
	typealias outputType = Empty
}

public struct CreateCustomerCard: SquareAPIEndpoint {
	typealias inputType = CreateCustomerCardRequest
	typealias paramType = Params
	struct Params {
		let customer_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/customers/\(inputs.customer_id)/cards"
	}
	typealias outputType = Empty
}

public struct RetrieveCustomer: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let customer_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/customers/\(inputs.customer_id)"
	}
	typealias outputType = Empty
}

public struct RetrieveCustomerSegment: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let segment_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/customers/segments/\(inputs.segment_id)"
	}
	typealias outputType = Empty
}

public struct ListCustomerSegments: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers/segments"
	}
	typealias outputType = Empty
}

public struct SearchCustomers: SquareAPIEndpoint {
	typealias inputType = SearchCustomersRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers/search"
	}
	typealias outputType = Empty
}

public struct RetrieveCustomerGroup: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let group_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/customers/groups/\(inputs.group_id)"
	}
	typealias outputType = Empty
}

public struct ListCustomerGroups: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers/groups"
	}
	typealias outputType = Empty
}

public struct ListCustomers: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers"
	}
	typealias outputType = Empty
}

public struct UpdateItemTaxes: SquareAPIEndpoint {
	typealias inputType = UpdateItemTaxesRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/update-item-taxes"
	}
	typealias outputType = Empty
}

public struct UpdateItemModifierLists: SquareAPIEndpoint {
	typealias inputType = UpdateItemModifierListsRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/update-item-modifier-lists"
	}
	typealias outputType = Empty
}

public struct SearchCatalogItems: SquareAPIEndpoint {
	typealias inputType = SearchCatalogItemsRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/search-catalog-items"
	}
	typealias outputType = Empty
}

public struct SearchCatalogObjects: SquareAPIEndpoint {
	typealias inputType = SearchCatalogObjectsRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/search"
	}
	typealias outputType = Empty
}

public struct RetrieveCatalogObject: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let object_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/catalog/object/\(inputs.object_id)"
	}
	typealias outputType = Empty
}

public struct UpsertCatalogObject: SquareAPIEndpoint {
	typealias inputType = UpsertCatalogObjectRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/object"
	}
	typealias outputType = Empty
}

public struct ListCatalog: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/list"
	}
	typealias outputType = Empty
}

public struct CatalogInfo: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/info"
	}
	typealias outputType = Empty
}

public struct BatchUpsertCatalogObjects: SquareAPIEndpoint {
	typealias inputType = BatchUpsertCatalogObjectsRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/batch-upsert"
	}
	typealias outputType = Empty
}

public struct BatchRetrieveCatalogObjects: SquareAPIEndpoint {
	typealias inputType = BatchRetrieveCatalogObjectsRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/batch-retrieve"
	}
	typealias outputType = Empty
}

public struct BatchDeleteCatalogObjects: SquareAPIEndpoint {
	typealias inputType = BatchDeleteCatalogObjectsRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/batch-delete"
	}
	typealias outputType = Empty
}

public struct ListCashDrawerShiftEvents: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let shift_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/cash-drawers/shifts/\(inputs.shift_id)/events"
	}
	typealias outputType = Empty
}

public struct RetrieveCashDrawerShift: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let shift_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/cash-drawers/shifts/\(inputs.shift_id)"
	}
	typealias outputType = Empty
}

public struct ListCashDrawerShifts: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/cash-drawers/shifts"
	}
	typealias outputType = Empty
}

public struct CancelBooking: SquareAPIEndpoint {
	typealias inputType = CancelBookingRequest
	typealias paramType = Params
	struct Params {
		let booking_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bookings/\(inputs.booking_id)/cancel"
	}
	typealias outputType = Empty
}

public struct RetrieveBooking: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let booking_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bookings/\(inputs.booking_id)"
	}
	typealias outputType = Empty
}

public struct RetrieveTeamMemberBookingProfile: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let team_member_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bookings/team-member-booking-profiles/\(inputs.team_member_id)"
	}
	typealias outputType = Empty
}

public struct ListTeamMemberBookingProfiles: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings/team-member-booking-profiles"
	}
	typealias outputType = Empty
}

public struct RetrieveBusinessBookingProfile: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings/business-booking-profile"
	}
	typealias outputType = Empty
}

public struct SearchAvailability: SquareAPIEndpoint {
	typealias inputType = SearchAvailabilityRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings/availability/search"
	}
	typealias outputType = Empty
}

public struct CreateBooking: SquareAPIEndpoint {
	typealias inputType = CreateBookingRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings"
	}
	typealias outputType = Empty
}

public struct GetBankAccount: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let bank_account_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bank-accounts/\(inputs.bank_account_id)"
	}
	typealias outputType = Empty
}

public struct GetBankAccountByV1Id: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let v1_bank_account_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bank-accounts/by-v1-id/\(inputs.v1_bank_account_id)"
	}
	typealias outputType = Empty
}

public struct ListBankAccounts: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bank-accounts"
	}
	typealias outputType = Empty
}

public struct RegisterDomain: SquareAPIEndpoint {
	typealias inputType = RegisterDomainRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/apple-pay/domains"
	}
	typealias outputType = Empty
}

public struct V1RetrieveSettlement: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
		let settlement_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/settlements/\(inputs.settlement_id)"
	}
	typealias outputType = Empty
}

public struct V1ListSettlements: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/settlements"
	}
	typealias outputType = Empty
}

public struct V1ListRefunds: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/refunds"
	}
	typealias outputType = Empty
}

public struct V1RetrievePayment: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
		let payment_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/payments/\(inputs.payment_id)"
	}
	typealias outputType = Empty
}

public struct V1ListPayments: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/payments"
	}
	typealias outputType = Empty
}

public struct V1ListPages: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/pages"
	}
	typealias outputType = Empty
}

public struct V1RetrieveOrder: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
		let order_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/orders/\(inputs.order_id)"
	}
	typealias outputType = Empty
}

public struct V1ListOrders: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/orders"
	}
	typealias outputType = Empty
}

public struct V1CreateModifierOption: SquareAPIEndpoint {
	typealias inputType = V1ModifierOption
	typealias paramType = Params
	struct Params {
		let location_id: String
		let modifier_list_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/modifier-lists/\(inputs.modifier_list_id)/modifier-options"
	}
	typealias outputType = Empty
}

public struct V1RetrieveModifierList: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
		let modifier_list_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/modifier-lists/\(inputs.modifier_list_id)"
	}
	typealias outputType = Empty
}

public struct V1ListModifierLists: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/modifier-lists"
	}
	typealias outputType = Empty
}

public struct V1CreateVariation: SquareAPIEndpoint {
	typealias inputType = V1Variation
	typealias paramType = Params
	struct Params {
		let location_id: String
		let item_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/items/\(inputs.item_id)/variations"
	}
	typealias outputType = Empty
}

public struct V1RetrieveItem: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
		let item_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/items/\(inputs.item_id)"
	}
	typealias outputType = Empty
}

public struct V1ListItems: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/items"
	}
	typealias outputType = Empty
}

public struct V1AdjustInventory: SquareAPIEndpoint {
	typealias inputType = V1AdjustInventoryRequest
	typealias paramType = Params
	struct Params {
		let location_id: String
		let variation_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/inventory/\(inputs.variation_id)"
	}
	typealias outputType = Empty
}

public struct V1ListInventory: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/inventory"
	}
	typealias outputType = Empty
}

public struct V1ListFees: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/fees"
	}
	typealias outputType = Empty
}

public struct V1ListDiscounts: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/discounts"
	}
	typealias outputType = Empty
}

public struct V1ListCategories: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/categories"
	}
	typealias outputType = Empty
}

public struct V1RetrieveCashDrawerShift: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
		let shift_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/cash-drawer-shifts/\(inputs.shift_id)"
	}
	typealias outputType = Empty
}

public struct V1ListCashDrawerShifts: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/cash-drawer-shifts"
	}
	typealias outputType = Empty
}

public struct V1RetrieveBankAccount: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
		let bank_account_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/bank-accounts/\(inputs.bank_account_id)"
	}
	typealias outputType = Empty
}

public struct V1ListBankAccounts: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let location_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/bank-accounts"
	}
	typealias outputType = Empty
}

public struct V1ListTimecardEvents: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let timecard_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/timecards/\(inputs.timecard_id)/events"
	}
	typealias outputType = Empty
}

public struct V1RetrieveTimecard: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let timecard_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/timecards/\(inputs.timecard_id)"
	}
	typealias outputType = Empty
}

public struct V1ListTimecards: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/me/timecards"
	}
	typealias outputType = Empty
}

public struct V1RetrieveEmployeeRole: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let role_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/roles/\(inputs.role_id)"
	}
	typealias outputType = Empty
}

public struct V1ListEmployeeRoles: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/me/roles"
	}
	typealias outputType = Empty
}

public struct V1RetrieveEmployee: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Params
	struct Params {
		let employee_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/employees/\(inputs.employee_id)"
	}
	typealias outputType = Empty
}

public struct V1ListEmployees: SquareAPIEndpoint {
	static var method: HTTPMethod { return .GET }
	typealias inputType = Empty
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/me/employees"
	}
	typealias outputType = Empty
}

public struct ObtainToken: SquareAPIEndpoint {
	typealias inputType = ObtainTokenRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/oauth2/token"
	}
	typealias outputType = Empty
}

public struct RevokeToken: SquareAPIEndpoint {
	typealias inputType = RevokeTokenRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/oauth2/revoke"
	}
	typealias outputType = Empty
}

public struct RenewToken: SquareAPIEndpoint {
	typealias inputType = RenewTokenRequest
	typealias paramType = Params
	struct Params {
		let client_id: String
	}
	static func endpoint(for inputs: Params) throws -> String {
		return "/oauth2/clients/\(inputs.client_id)/access-token/renew"
	}
	typealias outputType = Empty
}

public struct CreateMobileAuthorizationCode: SquareAPIEndpoint {
	typealias inputType = CreateMobileAuthorizationCodeRequest
	typealias paramType = Empty
	static func endpoint(for inputs: Empty) throws -> String {
		return "/mobile/authorization-code"
	}
	typealias outputType = Empty
}

