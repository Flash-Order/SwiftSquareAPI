/// Creates a loyalty account. To create a loyalty account, you must provide the `program_id` and a `mapping` with the `phone_number` of the buyer.
public struct CreateLoyaltyAccount: SquareAPIEndpoint {
	public typealias inputType = CreateLoyaltyAccountRequest
	public typealias outputType = CreateLoyaltyAccountResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/accounts"
	}
}

/// Searches for loyalty accounts in a loyalty program. You can search for a loyalty account using the phone number or customer ID associated with the account. To return all loyalty accounts, specify an empty `query` object or omit it entirely. Search results are sorted by `created_at` in ascending order.
public struct SearchLoyaltyAccounts: SquareAPIEndpoint {
	public typealias inputType = SearchLoyaltyAccountsRequest
	public typealias outputType = SearchLoyaltyAccountsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/accounts/search"
	}
}

/// Retrieves a loyalty account.
public struct RetrieveLoyaltyAccount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveLoyaltyAccountResponse
	public typealias paramType = Params
	public struct Params {
		let account_id: String
		/// Retrieves a loyalty account.
		/// - Parameters:
		///   - account_id: The ID of the [loyalty account](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyAccount) to retrieve.
		public init(account_id: String) {
			self.account_id = account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/loyalty/accounts/\(inputs.account_id)"
		return url
	}
}

/// Adds points earned from a purchase to a [loyalty account](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyAccount). - If you are using the Orders API to manage orders, provide the `order_id`. Square reads the order to compute the points earned from both the base loyalty program and an associated [loyalty promotion](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyPromotion). For purchases that qualify for multiple accrual rules, Square computes points based on the accrual rule that grants the most points. For purchases that qualify for multiple promotions, Square computes points based on the most recently created promotion. A purchase must first qualify for program points to be eligible for promotion points. - If you are not using the Orders API to manage orders, provide `points` with the number of points to add. You must first perform a client-side computation of the points earned from the loyalty program and loyalty promotion. For spend-based and visit-based programs, you can call [CalculateLoyaltyPoints]($e/Loyalty/CalculateLoyaltyPoints) to compute the points earned from the base loyalty program. For information about computing points earned from a loyalty promotion, see [Calculating promotion points](https://developer.squareup.com/docs/loyalty-api/loyalty-promotions#calculate-promotion-points).
public struct AccumulateLoyaltyPoints: SquareAPIEndpoint {
	public typealias inputType = AccumulateLoyaltyPointsRequest
	public typealias outputType = AccumulateLoyaltyPointsResponse
	public typealias paramType = Params
	public struct Params {
		let account_id: String
		/// Adds points earned from a purchase to a [loyalty account](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyAccount). - If you are using the Orders API to manage orders, provide the `order_id`. Square reads the order to compute the points earned from both the base loyalty program and an associated [loyalty promotion](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyPromotion). For purchases that qualify for multiple accrual rules, Square computes points based on the accrual rule that grants the most points. For purchases that qualify for multiple promotions, Square computes points based on the most recently created promotion. A purchase must first qualify for program points to be eligible for promotion points. - If you are not using the Orders API to manage orders, provide `points` with the number of points to add. You must first perform a client-side computation of the points earned from the loyalty program and loyalty promotion. For spend-based and visit-based programs, you can call [CalculateLoyaltyPoints]($e/Loyalty/CalculateLoyaltyPoints) to compute the points earned from the base loyalty program. For information about computing points earned from a loyalty promotion, see [Calculating promotion points](https://developer.squareup.com/docs/loyalty-api/loyalty-promotions#calculate-promotion-points).
		/// - Parameters:
		///   - account_id: The ID of the target [loyalty account](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyAccount).
		public init(account_id: String) {
			self.account_id = account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/loyalty/accounts/\(inputs.account_id)/accumulate"
		return url
	}
}

/// Adds points to or subtracts points from a buyer's account. Use this endpoint only when you need to manually adjust points. Otherwise, in your application flow, you call [AccumulateLoyaltyPoints]($e/Loyalty/AccumulateLoyaltyPoints) to add points when a buyer pays for the purchase.
public struct AdjustLoyaltyPoints: SquareAPIEndpoint {
	public typealias inputType = AdjustLoyaltyPointsRequest
	public typealias outputType = AdjustLoyaltyPointsResponse
	public typealias paramType = Params
	public struct Params {
		let account_id: String
		/// Adds points to or subtracts points from a buyer's account. Use this endpoint only when you need to manually adjust points. Otherwise, in your application flow, you call [AccumulateLoyaltyPoints]($e/Loyalty/AccumulateLoyaltyPoints) to add points when a buyer pays for the purchase.
		/// - Parameters:
		///   - account_id: The ID of the target [loyalty account](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyAccount).
		public init(account_id: String) {
			self.account_id = account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/loyalty/accounts/\(inputs.account_id)/adjust"
		return url
	}
}

/// Searches for loyalty events. A Square loyalty program maintains a ledger of events that occur during the lifetime of a buyer's loyalty account. Each change in the point balance (for example, points earned, points redeemed, and points expired) is recorded in the ledger. Using this endpoint, you can search the ledger for events. Search results are sorted by `created_at` in descending order.
public struct SearchLoyaltyEvents: SquareAPIEndpoint {
	public typealias inputType = SearchLoyaltyEventsRequest
	public typealias outputType = SearchLoyaltyEventsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/events/search"
	}
}

/// Returns a list of loyalty programs in the seller's account. Loyalty programs define how buyers can earn points and redeem points for rewards. Square sellers can have only one loyalty program, which is created and managed from the Seller Dashboard. For more information, see [Loyalty Program Overview](https://developer.squareup.com/docs/loyalty/overview).  Replaced with [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram) when used with the keyword `main`.
@available(*,deprecated)
public struct ListLoyaltyPrograms: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListLoyaltyProgramsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/programs"
	}
}

/// Retrieves the loyalty program in a seller's account, specified by the program ID or the keyword `main`. Loyalty programs define how buyers can earn points and redeem points for rewards. Square sellers can have only one loyalty program, which is created and managed from the Seller Dashboard. For more information, see [Loyalty Program Overview](https://developer.squareup.com/docs/loyalty/overview).
public struct RetrieveLoyaltyProgram: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveLoyaltyProgramResponse
	public typealias paramType = Params
	public struct Params {
		let program_id: String
		/// Retrieves the loyalty program in a seller's account, specified by the program ID or the keyword `main`. Loyalty programs define how buyers can earn points and redeem points for rewards. Square sellers can have only one loyalty program, which is created and managed from the Seller Dashboard. For more information, see [Loyalty Program Overview](https://developer.squareup.com/docs/loyalty/overview).
		/// - Parameters:
		///   - program_id: The ID of the loyalty program or the keyword `main`. Either value can be used to retrieve the single loyalty program that belongs to the seller.
		public init(program_id: String) {
			self.program_id = program_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/loyalty/programs/\(inputs.program_id)"
		return url
	}
}

/// Calculates the number of points a buyer can earn from a purchase. Applications might call this endpoint to display the points to the buyer. - If you are using the Orders API to manage orders, provide the `order_id` and (optional) `loyalty_account_id`. Square reads the order to compute the points earned from the base loyalty program and an associated [loyalty promotion](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyPromotion). - If you are not using the Orders API to manage orders, provide `transaction_amount_money` with the purchase amount. Square uses this amount to calculate the points earned from the base loyalty program, but not points earned from a loyalty promotion. For spend-based and visit-based programs, the `tax_mode` setting of the accrual rule indicates how taxes should be treated for loyalty points accrual. If the purchase qualifies for program points, call [ListLoyaltyPromotions]($e/Loyalty/ListLoyaltyPromotions) and perform a client-side computation to calculate whether the purchase also qualifies for promotion points. For more information, see [Calculating promotion points](https://developer.squareup.com/docs/loyalty-api/loyalty-promotions#calculate-promotion-points).
public struct CalculateLoyaltyPoints: SquareAPIEndpoint {
	public typealias inputType = CalculateLoyaltyPointsRequest
	public typealias outputType = CalculateLoyaltyPointsResponse
	public typealias paramType = Params
	public struct Params {
		let program_id: String
		/// Calculates the number of points a buyer can earn from a purchase. Applications might call this endpoint to display the points to the buyer. - If you are using the Orders API to manage orders, provide the `order_id` and (optional) `loyalty_account_id`. Square reads the order to compute the points earned from the base loyalty program and an associated [loyalty promotion](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyPromotion). - If you are not using the Orders API to manage orders, provide `transaction_amount_money` with the purchase amount. Square uses this amount to calculate the points earned from the base loyalty program, but not points earned from a loyalty promotion. For spend-based and visit-based programs, the `tax_mode` setting of the accrual rule indicates how taxes should be treated for loyalty points accrual. If the purchase qualifies for program points, call [ListLoyaltyPromotions]($e/Loyalty/ListLoyaltyPromotions) and perform a client-side computation to calculate whether the purchase also qualifies for promotion points. For more information, see [Calculating promotion points](https://developer.squareup.com/docs/loyalty-api/loyalty-promotions#calculate-promotion-points).
		/// - Parameters:
		///   - program_id: The ID of the [loyalty program](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyProgram), which defines the rules for accruing points.
		public init(program_id: String) {
			self.program_id = program_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/loyalty/programs/\(inputs.program_id)/calculate"
		return url
	}
}

/// Lists the loyalty promotions associated with a [loyalty program](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyProgram). Results are sorted by the `created_at` date in descending order (newest to oldest).
public struct ListLoyaltyPromotions: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListLoyaltyPromotionsResponse
	public typealias paramType = Params
	public struct Params {
		let program_id: String
		let status: LoyaltyPromotionStatus?
		let cursor: String?
		let limit: Int?
		/// Lists the loyalty promotions associated with a [loyalty program](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyProgram). Results are sorted by the `created_at` date in descending order (newest to oldest).
		/// - Parameters:
		///   - program_id: The ID of the base [loyalty program](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyProgram). To get the program ID, call [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram) using the `main` keyword.
		///   - status: The status to filter the results by. If a status is provided, only loyalty promotions with the specified status are returned. Otherwise, all loyalty promotions associated with the loyalty program are returned.
		///   - cursor: The cursor returned in the paged response from the previous call to this endpoint. Provide this cursor to retrieve the next page of results for your original request. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
		///   - limit: The maximum number of results to return in a single paged response. The minimum value is 1 and the maximum value is 30. The default value is 30. For more information, see [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination).
		public init(program_id: String, status: LoyaltyPromotionStatus? = nil, cursor: String? = nil, limit: Int? = nil) {
			self.program_id = program_id
			self.status = status
			self.cursor = cursor
			self.limit = limit
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/loyalty/programs/\(inputs.program_id)/promotions"
		var queries = [String]()
		if let v = inputs.status { queries.append("status=\(v)") }
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

/// Creates a loyalty promotion for a [loyalty program](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyProgram). A loyalty promotion enables buyers to earn points in addition to those earned from the base loyalty program. This endpoint sets the loyalty promotion to the `ACTIVE` or `SCHEDULED` status, depending on the `available_time` setting. A loyalty program can have a maximum of 10 loyalty promotions with an `ACTIVE` or `SCHEDULED` status.
public struct CreateLoyaltyPromotion: SquareAPIEndpoint {
	public typealias inputType = CreateLoyaltyPromotionRequest
	public typealias outputType = CreateLoyaltyPromotionResponse
	public typealias paramType = Params
	public struct Params {
		let program_id: String
		/// Creates a loyalty promotion for a [loyalty program](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyProgram). A loyalty promotion enables buyers to earn points in addition to those earned from the base loyalty program. This endpoint sets the loyalty promotion to the `ACTIVE` or `SCHEDULED` status, depending on the `available_time` setting. A loyalty program can have a maximum of 10 loyalty promotions with an `ACTIVE` or `SCHEDULED` status.
		/// - Parameters:
		///   - program_id: The ID of the [loyalty program](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyProgram) to associate with the promotion. To get the program ID, call [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram) using the `main` keyword.
		public init(program_id: String) {
			self.program_id = program_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/loyalty/programs/\(inputs.program_id)/promotions"
		return url
	}
}

/// Retrieves a loyalty promotion.
public struct RetrieveLoyaltyPromotion: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveLoyaltyPromotionResponse
	public typealias paramType = Params
	public struct Params {
		let program_id: String
		let promotion_id: String
		/// Retrieves a loyalty promotion.
		/// - Parameters:
		///   - program_id: The ID of the base [loyalty program](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyProgram). To get the program ID, call [RetrieveLoyaltyProgram](api-endpoint:Loyalty-RetrieveLoyaltyProgram) using the `main` keyword.
		///   - promotion_id: The ID of the [loyalty promotion](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyPromotion) to retrieve.
		public init(program_id: String, promotion_id: String) {
			self.program_id = program_id
			self.promotion_id = promotion_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/loyalty/programs/\(inputs.program_id)/promotions/\(inputs.promotion_id)"
		return url
	}
}

/// Cancels a loyalty promotion. Use this endpoint to cancel an `ACTIVE` promotion earlier than the end date, cancel an `ACTIVE` promotion when an end date is not specified, or cancel a `SCHEDULED` promotion. Because updating a promotion is not supported, you can also use this endpoint to cancel a promotion before you create a new one. This endpoint sets the loyalty promotion to the `CANCELED` state
public struct CancelLoyaltyPromotion: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CancelLoyaltyPromotionResponse
	public typealias paramType = Params
	public struct Params {
		let program_id: String
		let promotion_id: String
		/// Cancels a loyalty promotion. Use this endpoint to cancel an `ACTIVE` promotion earlier than the end date, cancel an `ACTIVE` promotion when an end date is not specified, or cancel a `SCHEDULED` promotion. Because updating a promotion is not supported, you can also use this endpoint to cancel a promotion before you create a new one. This endpoint sets the loyalty promotion to the `CANCELED` state
		/// - Parameters:
		///   - program_id: The ID of the base [loyalty program](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyProgram).
		///   - promotion_id: The ID of the [loyalty promotion](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyPromotion) to cancel. You can cancel a promotion that has an `ACTIVE` or `SCHEDULED` status.
		public init(program_id: String, promotion_id: String) {
			self.program_id = program_id
			self.promotion_id = promotion_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/loyalty/programs/\(inputs.program_id)/promotions/\(inputs.promotion_id)/cancel"
		return url
	}
}

/// Creates a loyalty reward. In the process, the endpoint does following: - Uses the `reward_tier_id` in the request to determine the number of points to lock for this reward. - If the request includes `order_id`, it adds the reward and related discount to the order. After a reward is created, the points are locked and not available for the buyer to redeem another reward.
public struct CreateLoyaltyReward: SquareAPIEndpoint {
	public typealias inputType = CreateLoyaltyRewardRequest
	public typealias outputType = CreateLoyaltyRewardResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/rewards"
	}
}

/// Searches for loyalty rewards. This endpoint accepts a request with no query filters and returns results for all loyalty accounts. If you include a `query` object, `loyalty_account_id` is required and `status` is  optional. If you know a reward ID, use the [RetrieveLoyaltyReward]($e/Loyalty/RetrieveLoyaltyReward) endpoint. Search results are sorted by `updated_at` in descending order.
public struct SearchLoyaltyRewards: SquareAPIEndpoint {
	public typealias inputType = SearchLoyaltyRewardsRequest
	public typealias outputType = SearchLoyaltyRewardsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/rewards/search"
	}
}

/// Retrieves a loyalty reward.
public struct RetrieveLoyaltyReward: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveLoyaltyRewardResponse
	public typealias paramType = Params
	public struct Params {
		let reward_id: String
		/// Retrieves a loyalty reward.
		/// - Parameters:
		///   - reward_id: The ID of the [loyalty reward](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyReward) to retrieve.
		public init(reward_id: String) {
			self.reward_id = reward_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/loyalty/rewards/\(inputs.reward_id)"
		return url
	}
}

/// Deletes a loyalty reward by doing the following: - Returns the loyalty points back to the loyalty account. - If an order ID was specified when the reward was created (see [CreateLoyaltyReward]($e/Loyalty/CreateLoyaltyReward)), it updates the order by removing the reward and related discounts. You cannot delete a reward that has reached the terminal state (REDEEMED).
public struct DeleteLoyaltyReward: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteLoyaltyRewardResponse
	public typealias paramType = Params
	public struct Params {
		let reward_id: String
		/// Deletes a loyalty reward by doing the following: - Returns the loyalty points back to the loyalty account. - If an order ID was specified when the reward was created (see [CreateLoyaltyReward]($e/Loyalty/CreateLoyaltyReward)), it updates the order by removing the reward and related discounts. You cannot delete a reward that has reached the terminal state (REDEEMED).
		/// - Parameters:
		///   - reward_id: The ID of the [loyalty reward](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyReward) to delete.
		public init(reward_id: String) {
			self.reward_id = reward_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/loyalty/rewards/\(inputs.reward_id)"
		return url
	}
}

/// Redeems a loyalty reward. The endpoint sets the reward to the `REDEEMED` terminal state. If you are using your own order processing system (not using the Orders API), you call this endpoint after the buyer paid for the purchase. After the reward reaches the terminal state, it cannot be deleted. In other words, points used for the reward cannot be returned to the account.
public struct RedeemLoyaltyReward: SquareAPIEndpoint {
	public typealias inputType = RedeemLoyaltyRewardRequest
	public typealias outputType = RedeemLoyaltyRewardResponse
	public typealias paramType = Params
	public struct Params {
		let reward_id: String
		/// Redeems a loyalty reward. The endpoint sets the reward to the `REDEEMED` terminal state. If you are using your own order processing system (not using the Orders API), you call this endpoint after the buyer paid for the purchase. After the reward reaches the terminal state, it cannot be deleted. In other words, points used for the reward cannot be returned to the account.
		/// - Parameters:
		///   - reward_id: The ID of the [loyalty reward](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/LoyaltyReward) to redeem.
		public init(reward_id: String) {
			self.reward_id = reward_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/loyalty/rewards/\(inputs.reward_id)/redeem"
		return url
	}
}

