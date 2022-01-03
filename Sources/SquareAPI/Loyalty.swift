/// Creates a loyalty account. To create a loyalty account, you must provide the `program_id` and a `mapping` with the `phone_number` of the buyer.
public struct CreateLoyaltyAccount: SquareAPIEndpoint {
	public typealias inputType = CreateLoyaltyAccountRequest
	public typealias outputType = CreateLoyaltyAccountResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/accounts"
	}
}

/// Searches for loyalty accounts in a loyalty program.    You can search for a loyalty account using the phone number or customer ID associated with the account. To return all loyalty accounts, specify an empty `query` object or omit it entirely.    Search results are sorted by `created_at` in ascending order.
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
		///   - account_id: The ID of the [loyalty account](https://developer.squareup.com/reference/square_2021-12-15/objects/LoyaltyAccount) to retrieve.
		public init(account_id: String) {
			self.account_id = account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/loyalty/accounts/\(inputs.account_id)"
		return url
	}
}

/// Adds points to a loyalty account.  - If you are using the Orders API to manage orders, you only provide the `order_id`.  The endpoint reads the order to compute points to add to the buyer's account. - If you are not using the Orders API to manage orders,  you first perform a client-side computation to compute the points.   For spend-based and visit-based programs, you can first call  [CalculateLoyaltyPoints](https://developer.squareup.com/reference/square_2021-12-15/loyalty-api/calculate-loyalty-points) to compute the points   that you provide to this endpoint.   __Note:__ The country of the seller's Square account determines whether tax is included in the purchase amount when accruing points for spend-based and visit-based programs.  For more information, see [Availability of Square Loyalty](https://developer.squareup.com/docs/loyalty-api/overview#loyalty-market-availability).
public struct AccumulateLoyaltyPoints: SquareAPIEndpoint {
	public typealias inputType = AccumulateLoyaltyPointsRequest
	public typealias outputType = AccumulateLoyaltyPointsResponse
	public typealias paramType = Params
	public struct Params {
		let account_id: String
		/// Adds points to a loyalty account.  - If you are using the Orders API to manage orders, you only provide the `order_id`.  The endpoint reads the order to compute points to add to the buyer's account. - If you are not using the Orders API to manage orders,  you first perform a client-side computation to compute the points.   For spend-based and visit-based programs, you can first call  [CalculateLoyaltyPoints](https://developer.squareup.com/reference/square_2021-12-15/loyalty-api/calculate-loyalty-points) to compute the points   that you provide to this endpoint.   __Note:__ The country of the seller's Square account determines whether tax is included in the purchase amount when accruing points for spend-based and visit-based programs.  For more information, see [Availability of Square Loyalty](https://developer.squareup.com/docs/loyalty-api/overview#loyalty-market-availability).
		/// - Parameters:
		///   - account_id: The [loyalty account](https://developer.squareup.com/reference/square_2021-12-15/objects/LoyaltyAccount) ID to which to add the points.
		public init(account_id: String) {
			self.account_id = account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/loyalty/accounts/\(inputs.account_id)/accumulate"
		return url
	}
}

/// Adds points to or subtracts points from a buyer's account.   Use this endpoint only when you need to manually adjust points. Otherwise, in your application flow, you call  [AccumulateLoyaltyPoints](https://developer.squareup.com/reference/square_2021-12-15/loyalty-api/accumulate-loyalty-points)  to add points when a buyer pays for the purchase.
public struct AdjustLoyaltyPoints: SquareAPIEndpoint {
	public typealias inputType = AdjustLoyaltyPointsRequest
	public typealias outputType = AdjustLoyaltyPointsResponse
	public typealias paramType = Params
	public struct Params {
		let account_id: String
		/// Adds points to or subtracts points from a buyer's account.   Use this endpoint only when you need to manually adjust points. Otherwise, in your application flow, you call  [AccumulateLoyaltyPoints](https://developer.squareup.com/reference/square_2021-12-15/loyalty-api/accumulate-loyalty-points)  to add points when a buyer pays for the purchase.
		/// - Parameters:
		///   - account_id: The ID of the [loyalty account](https://developer.squareup.com/reference/square_2021-12-15/objects/LoyaltyAccount) in which to adjust the points.
		public init(account_id: String) {
			self.account_id = account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/loyalty/accounts/\(inputs.account_id)/adjust"
		return url
	}
}

/// Searches for loyalty events.  A Square loyalty program maintains a ledger of events that occur during the lifetime of a  buyer's loyalty account. Each change in the point balance  (for example, points earned, points redeemed, and points expired) is  recorded in the ledger. Using this endpoint, you can search the ledger for events.  Search results are sorted by `created_at` in descending order.
public struct SearchLoyaltyEvents: SquareAPIEndpoint {
	public typealias inputType = SearchLoyaltyEventsRequest
	public typealias outputType = SearchLoyaltyEventsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/events/search"
	}
}

/// Returns a list of loyalty programs in the seller's account. Loyalty programs define how buyers can earn points and redeem points for rewards. Square sellers can have only one loyalty program, which is created and managed from the Seller Dashboard. For more information, see [Loyalty Program Overview](https://developer.squareup.com/docs/loyalty/overview).   Replaced with [RetrieveLoyaltyProgram](https://developer.squareup.com/reference/square_2021-12-15/loyalty-api/retrieve-loyalty-program) when used with the keyword `main`.
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

/// Retrieves the loyalty program in a seller's account, specified by the program ID or the keyword `main`.   Loyalty programs define how buyers can earn points and redeem points for rewards. Square sellers can have only one loyalty program, which is created and managed from the Seller Dashboard. For more information, see [Loyalty Program Overview](https://developer.squareup.com/docs/loyalty/overview).
public struct RetrieveLoyaltyProgram: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveLoyaltyProgramResponse
	public typealias paramType = Params
	public struct Params {
		let program_id: String
		/// Retrieves the loyalty program in a seller's account, specified by the program ID or the keyword `main`.   Loyalty programs define how buyers can earn points and redeem points for rewards. Square sellers can have only one loyalty program, which is created and managed from the Seller Dashboard. For more information, see [Loyalty Program Overview](https://developer.squareup.com/docs/loyalty/overview).
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

/// Calculates the points a purchase earns.  - If you are using the Orders API to manage orders, you provide `order_id` in the request. The  endpoint calculates the points by reading the order. - If you are not using the Orders API to manage orders, you provide the purchase amount in  the request for the endpoint to calculate the points.  An application might call this endpoint to show the points that a buyer can earn with the  specific purchase.  __Note:__ The country of the seller's Square account determines whether tax is included in the purchase amount when accruing points for spend-based and visit-based programs.  For more information, see [Availability of Square Loyalty](https://developer.squareup.com/docs/loyalty-api/overview#loyalty-market-availability).
public struct CalculateLoyaltyPoints: SquareAPIEndpoint {
	public typealias inputType = CalculateLoyaltyPointsRequest
	public typealias outputType = CalculateLoyaltyPointsResponse
	public typealias paramType = Params
	public struct Params {
		let program_id: String
		/// Calculates the points a purchase earns.  - If you are using the Orders API to manage orders, you provide `order_id` in the request. The  endpoint calculates the points by reading the order. - If you are not using the Orders API to manage orders, you provide the purchase amount in  the request for the endpoint to calculate the points.  An application might call this endpoint to show the points that a buyer can earn with the  specific purchase.  __Note:__ The country of the seller's Square account determines whether tax is included in the purchase amount when accruing points for spend-based and visit-based programs.  For more information, see [Availability of Square Loyalty](https://developer.squareup.com/docs/loyalty-api/overview#loyalty-market-availability).
		/// - Parameters:
		///   - program_id: The [loyalty program](https://developer.squareup.com/reference/square_2021-12-15/objects/LoyaltyProgram) ID, which defines the rules for accruing points.
		public init(program_id: String) {
			self.program_id = program_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/loyalty/programs/\(inputs.program_id)/calculate"
		return url
	}
}

/// Creates a loyalty reward. In the process, the endpoint does following:  - Uses the `reward_tier_id` in the request to determine the number of points  to lock for this reward.  - If the request includes `order_id`, it adds the reward and related discount to the order.   After a reward is created, the points are locked and  not available for the buyer to redeem another reward.
public struct CreateLoyaltyReward: SquareAPIEndpoint {
	public typealias inputType = CreateLoyaltyRewardRequest
	public typealias outputType = CreateLoyaltyRewardResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/rewards"
	}
}

/// Searches for loyalty rewards in a loyalty account.   In the current implementation, the endpoint supports search by the reward `status`.  If you know a reward ID, use the  [RetrieveLoyaltyReward](https://developer.squareup.com/reference/square_2021-12-15/loyalty-api/retrieve-loyalty-reward) endpoint.  Search results are sorted by `updated_at` in descending order.
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
		///   - reward_id: The ID of the [loyalty reward](https://developer.squareup.com/reference/square_2021-12-15/objects/LoyaltyReward) to retrieve.
		public init(reward_id: String) {
			self.reward_id = reward_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/loyalty/rewards/\(inputs.reward_id)"
		return url
	}
}

/// Deletes a loyalty reward by doing the following:  - Returns the loyalty points back to the loyalty account. - If an order ID was specified when the reward was created  (see [CreateLoyaltyReward](https://developer.squareup.com/reference/square_2021-12-15/loyalty-api/create-loyalty-reward)),  it updates the order by removing the reward and related  discounts.  You cannot delete a reward that has reached the terminal state (REDEEMED).
public struct DeleteLoyaltyReward: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteLoyaltyRewardResponse
	public typealias paramType = Params
	public struct Params {
		let reward_id: String
		/// Deletes a loyalty reward by doing the following:  - Returns the loyalty points back to the loyalty account. - If an order ID was specified when the reward was created  (see [CreateLoyaltyReward](https://developer.squareup.com/reference/square_2021-12-15/loyalty-api/create-loyalty-reward)),  it updates the order by removing the reward and related  discounts.  You cannot delete a reward that has reached the terminal state (REDEEMED).
		/// - Parameters:
		///   - reward_id: The ID of the [loyalty reward](https://developer.squareup.com/reference/square_2021-12-15/objects/LoyaltyReward) to delete.
		public init(reward_id: String) {
			self.reward_id = reward_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/loyalty/rewards/\(inputs.reward_id)"
		return url
	}
}

/// Redeems a loyalty reward.  The endpoint sets the reward to the `REDEEMED` terminal state.   If you are using your own order processing system (not using the  Orders API), you call this endpoint after the buyer paid for the  purchase.  After the reward reaches the terminal state, it cannot be deleted.  In other words, points used for the reward cannot be returned  to the account.
public struct RedeemLoyaltyReward: SquareAPIEndpoint {
	public typealias inputType = RedeemLoyaltyRewardRequest
	public typealias outputType = RedeemLoyaltyRewardResponse
	public typealias paramType = Params
	public struct Params {
		let reward_id: String
		/// Redeems a loyalty reward.  The endpoint sets the reward to the `REDEEMED` terminal state.   If you are using your own order processing system (not using the  Orders API), you call this endpoint after the buyer paid for the  purchase.  After the reward reaches the terminal state, it cannot be deleted.  In other words, points used for the reward cannot be returned  to the account.
		/// - Parameters:
		///   - reward_id: The ID of the [loyalty reward](https://developer.squareup.com/reference/square_2021-12-15/objects/LoyaltyReward) to redeem.
		public init(reward_id: String) {
			self.reward_id = reward_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/loyalty/rewards/\(inputs.reward_id)/redeem"
		return url
	}
}

