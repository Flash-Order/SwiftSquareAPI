/// Generates code to authorize a mobile application to connect to a Square card reader  Authorization codes are one-time-use and expire __60 minutes__ after being issued.  __Important:__ The `Authorization` header you provide to this endpoint must have the following format:  ``` Authorization: Bearer ACCESS_TOKEN ```  Replace `ACCESS_TOKEN` with a [valid production authorization credential](/docs/build-basics/access-tokens).
public struct CreateMobileAuthorizationCode: SquareAPIEndpoint {
	public typealias inputType = CreateMobileAuthorizationCodeRequest
	public typealias outputType = CreateMobileAuthorizationCodeResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/mobile/authorization-code"
	}
}

/// `RenewToken` is deprecated. For information about refreshing OAuth access tokens, see [Renew OAuth Token](https://developer.squareup.com/docs/oauth-api/cookbook/renew-oauth-tokens).   Renews an OAuth access token before it expires.  OAuth access tokens besides your application's personal access token expire after __30 days__. You can also renew expired tokens within __15 days__ of their expiration. You cannot renew an access token that has been expired for more than 15 days. Instead, the associated user must re-complete the OAuth flow from the beginning.  __Important:__ The `Authorization` header for this endpoint must have the following format:  ``` Authorization: Client APPLICATION_SECRET ```  Replace `APPLICATION_SECRET` with the application secret on the Credentials page in the [application dashboard](https://connect.squareup.com/apps).
@available(*,deprecated)
public struct RenewToken: SquareAPIEndpoint {
	public typealias inputType = RenewTokenRequest
	public typealias outputType = RenewTokenResponse
	public typealias paramType = Params
	public struct Params {
		let client_id: String
		/// `RenewToken` is deprecated. For information about refreshing OAuth access tokens, see [Renew OAuth Token](https://developer.squareup.com/docs/oauth-api/cookbook/renew-oauth-tokens).   Renews an OAuth access token before it expires.  OAuth access tokens besides your application's personal access token expire after __30 days__. You can also renew expired tokens within __15 days__ of their expiration. You cannot renew an access token that has been expired for more than 15 days. Instead, the associated user must re-complete the OAuth flow from the beginning.  __Important:__ The `Authorization` header for this endpoint must have the following format:  ``` Authorization: Client APPLICATION_SECRET ```  Replace `APPLICATION_SECRET` with the application secret on the Credentials page in the [application dashboard](https://connect.squareup.com/apps).
		/// - Parameters:
		///   - client_id: Your application ID, available from the [application dashboard](https://connect.squareup.com/apps).
		public init(client_id: String) {
			self.client_id = client_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/oauth2/clients/\(inputs.client_id)/access-token/renew"
	}
}

/// Revokes an access token generated with the OAuth flow.  If an account has more than one OAuth access token for your application, this endpoint revokes all of them, regardless of which token you specify. When an OAuth access token is revoked, all of the active subscriptions associated with that OAuth token are canceled immediately.  __Important:__ The `Authorization` header for this endpoint must have the following format:  ``` Authorization: Client APPLICATION_SECRET ```  Replace `APPLICATION_SECRET` with the application secret on the Credentials page in the [Developer Dashboard](https://developer.squareup.com/apps).
public struct RevokeToken: SquareAPIEndpoint {
	public typealias inputType = RevokeTokenRequest
	public typealias outputType = RevokeTokenResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/oauth2/revoke"
	}
}

/// Returns an OAuth access token.  The endpoint supports distinct methods of obtaining OAuth access tokens. Applications specify a method by adding the `grant_type` parameter in the request and also provide relevant information.  __Note:__ Regardless of the method application specified, the endpoint always returns two items; an OAuth access token and a refresh token in the response.  __OAuth tokens should only live on secure servers. Application clients should never interact directly with OAuth tokens__.
public struct ObtainToken: SquareAPIEndpoint {
	public typealias inputType = ObtainTokenRequest
	public typealias outputType = ObtainTokenResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/oauth2/token"
	}
}

/// Provides summary information for all of a business's employees.
public struct V1ListEmployees: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Employee]
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/me/employees"
	}
}

/// Provides the details for a single employee.
public struct V1RetrieveEmployee: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1Employee
	public typealias paramType = Params
	public struct Params {
		let employee_id: String
		/// Provides the details for a single employee.
		/// - Parameters:
		///   - employee_id: The employee's ID.
		public init(employee_id: String) {
			self.employee_id = employee_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/employees/\(inputs.employee_id)"
	}
}

/// Provides summary information for all of a business's employee roles.
public struct V1ListEmployeeRoles: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1EmployeeRole]
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/me/roles"
	}
}

/// Provides the details for a single employee role.
public struct V1RetrieveEmployeeRole: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1EmployeeRole
	public typealias paramType = Params
	public struct Params {
		let role_id: String
		/// Provides the details for a single employee role.
		/// - Parameters:
		///   - role_id: The role's ID.
		public init(role_id: String) {
			self.role_id = role_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/roles/\(inputs.role_id)"
	}
}

/// Provides summary information for all of a business's employee timecards.
@available(*,deprecated)
public struct V1ListTimecards: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Timecard]
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/me/timecards"
	}
}

/// Provides the details for a single timecard.   <aside> Only approved accounts can manage their employees with Square. Unapproved accounts cannot use employee management features with the API. </aside>
@available(*,deprecated)
public struct V1RetrieveTimecard: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1Timecard
	public typealias paramType = Params
	public struct Params {
		let timecard_id: String
		/// Provides the details for a single timecard.   <aside> Only approved accounts can manage their employees with Square. Unapproved accounts cannot use employee management features with the API. </aside>
		/// - Parameters:
		///   - timecard_id: The timecard's ID.
		public init(timecard_id: String) {
			self.timecard_id = timecard_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/timecards/\(inputs.timecard_id)"
	}
}

/// Provides summary information for all events associated with a particular timecard.   Only approved accounts can manage their employees with Square. Unapproved accounts cannot use employee management features with the API.
@available(*,deprecated)
public struct V1ListTimecardEvents: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1TimecardEvent]
	public typealias paramType = Params
	public struct Params {
		let timecard_id: String
		/// Provides summary information for all events associated with a particular timecard.   Only approved accounts can manage their employees with Square. Unapproved accounts cannot use employee management features with the API.
		/// - Parameters:
		///   - timecard_id: The ID of the timecard to list events for.
		public init(timecard_id: String) {
			self.timecard_id = timecard_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/timecards/\(inputs.timecard_id)/events"
	}
}

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

/// Provides the details for all of a location's cash drawer shifts during a date range. The date range you specify cannot exceed 90 days.
@available(*,deprecated)
public struct V1ListCashDrawerShifts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1CashDrawerShift]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Provides the details for all of a location's cash drawer shifts during a date range. The date range you specify cannot exceed 90 days.
		/// - Parameters:
		///   - location_id: The ID of the location to list cash drawer shifts for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/cash-drawer-shifts"
	}
}

/// Provides the details for a single cash drawer shift, including all events that occurred during the shift.
@available(*,deprecated)
public struct V1RetrieveCashDrawerShift: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1CashDrawerShift
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let shift_id: String
		/// Provides the details for a single cash drawer shift, including all events that occurred during the shift.
		/// - Parameters:
		///   - location_id: The ID of the location to list cash drawer shifts for.
		///   - shift_id: The shift's ID.
		public init(location_id: String, shift_id: String) {
			self.location_id = location_id
			self.shift_id = shift_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/cash-drawer-shifts/\(inputs.shift_id)"
	}
}

/// Lists all the item categories for a given location.
@available(*,deprecated)
public struct V1ListCategories: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Category]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Lists all the item categories for a given location.
		/// - Parameters:
		///   - location_id: The ID of the location to list categories for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/categories"
	}
}

/// Lists all the discounts for a given location.
@available(*,deprecated)
public struct V1ListDiscounts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Discount]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Lists all the discounts for a given location.
		/// - Parameters:
		///   - location_id: The ID of the location to list categories for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/discounts"
	}
}

/// Lists all the fees (taxes) for a given location.
@available(*,deprecated)
public struct V1ListFees: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Fee]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Lists all the fees (taxes) for a given location.
		/// - Parameters:
		///   - location_id: The ID of the location to list fees for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/fees"
	}
}

/// Provides inventory information for all inventory-enabled item variations.
@available(*,deprecated)
public struct V1ListInventory: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1InventoryEntry]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Provides inventory information for all inventory-enabled item variations.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/inventory"
	}
}

/// Adjusts the current available inventory of an item variation.
@available(*,deprecated)
public struct V1AdjustInventory: SquareAPIEndpoint {
	public typealias inputType = V1AdjustInventoryRequest
	public typealias outputType = V1InventoryEntry
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let variation_id: String
		/// Adjusts the current available inventory of an item variation.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - variation_id: The ID of the variation to adjust inventory information for.
		public init(location_id: String, variation_id: String) {
			self.location_id = location_id
			self.variation_id = variation_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/inventory/\(inputs.variation_id)"
	}
}

/// Provides summary information of all items for a given location.
@available(*,deprecated)
public struct V1ListItems: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Item]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Provides summary information of all items for a given location.
		/// - Parameters:
		///   - location_id: The ID of the location to list items for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/items"
	}
}

/// Provides the details for a single item, including associated modifier lists and fees.
@available(*,deprecated)
public struct V1RetrieveItem: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1Item
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let item_id: String
		/// Provides the details for a single item, including associated modifier lists and fees.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - item_id: The item's ID.
		public init(location_id: String, item_id: String) {
			self.location_id = location_id
			self.item_id = item_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/items/\(inputs.item_id)"
	}
}

/// Creates an item variation for an existing item.
@available(*,deprecated)
public struct V1CreateVariation: SquareAPIEndpoint {
	public typealias inputType = V1Variation
	public typealias outputType = V1Variation
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let item_id: String
		/// Creates an item variation for an existing item.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - item_id: The item's ID.
		public init(location_id: String, item_id: String) {
			self.location_id = location_id
			self.item_id = item_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/items/\(inputs.item_id)/variations"
	}
}

/// Lists all the modifier lists for a given location.
@available(*,deprecated)
public struct V1ListModifierLists: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1ModifierList]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Lists all the modifier lists for a given location.
		/// - Parameters:
		///   - location_id: The ID of the location to list modifier lists for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/modifier-lists"
	}
}

/// Provides the details for a single modifier list.
@available(*,deprecated)
public struct V1RetrieveModifierList: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1ModifierList
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let modifier_list_id: String
		/// Provides the details for a single modifier list.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - modifier_list_id: The modifier list's ID.
		public init(location_id: String, modifier_list_id: String) {
			self.location_id = location_id
			self.modifier_list_id = modifier_list_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/modifier-lists/\(inputs.modifier_list_id)"
	}
}

/// Creates an item modifier option and adds it to a modifier list.
@available(*,deprecated)
public struct V1CreateModifierOption: SquareAPIEndpoint {
	public typealias inputType = V1ModifierOption
	public typealias outputType = V1ModifierOption
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let modifier_list_id: String
		/// Creates an item modifier option and adds it to a modifier list.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - modifier_list_id: The ID of the modifier list to edit.
		public init(location_id: String, modifier_list_id: String) {
			self.location_id = location_id
			self.modifier_list_id = modifier_list_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/modifier-lists/\(inputs.modifier_list_id)/modifier-options"
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

/// Lists all Favorites pages (in Square Point of Sale) for a given location.
@available(*,deprecated)
public struct V1ListPages: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Page]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Lists all Favorites pages (in Square Point of Sale) for a given location.
		/// - Parameters:
		///   - location_id: The ID of the location to list Favorites pages for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/pages"
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

/// Activates a domain for use with Web Apple Pay and Square. A validation will be performed on this domain by Apple to ensure is it properly set up as an Apple Pay enabled domain.  This endpoint provides an easy way for platform developers to bulk activate Web Apple Pay with Square for merchants using their platform.  To learn more about Apple Pay on Web see the Apple Pay section in the [Square Payment Form Walkthrough](/docs/payment-form/payment-form-walkthrough).
public struct RegisterDomain: SquareAPIEndpoint {
	public typealias inputType = RegisterDomainRequest
	public typealias outputType = RegisterDomainResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/apple-pay/domains"
	}
}

/// Returns a list of [BankAccount](#type-bankaccount) objects linked to a Square account.
public struct ListBankAccounts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListBankAccountsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bank-accounts"
	}
}

/// Returns details of a [BankAccount](#type-bankaccount) identified by V1 bank account ID.
public struct GetBankAccountByV1Id: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetBankAccountByV1IdResponse
	public typealias paramType = Params
	public struct Params {
		let v1_bank_account_id: String
		/// Returns details of a [BankAccount](#type-bankaccount) identified by V1 bank account ID.
		/// - Parameters:
		///   - v1_bank_account_id: Connect V1 ID of the desired `BankAccount`. For more information, see  [Retrieve a bank account by using an ID issued by V1 Bank Accounts API](https://developer.squareup.com/docs/docs/bank-accounts-api#retrieve-a-bank-account-by-using-an-id-issued-by-v1-bank-accounts-api).
		public init(v1_bank_account_id: String) {
			self.v1_bank_account_id = v1_bank_account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bank-accounts/by-v1-id/\(inputs.v1_bank_account_id)"
	}
}

/// Returns details of a [BankAccount](#type-bankaccount)  linked to a Square account.
public struct GetBankAccount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetBankAccountResponse
	public typealias paramType = Params
	public struct Params {
		let bank_account_id: String
		/// Returns details of a [BankAccount](#type-bankaccount)  linked to a Square account.
		/// - Parameters:
		///   - bank_account_id: Square-issued ID of the desired `BankAccount`.
		public init(bank_account_id: String) {
			self.bank_account_id = bank_account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bank-accounts/\(inputs.bank_account_id)"
	}
}

/// Creates a booking.
public struct CreateBooking: SquareAPIEndpoint {
	public typealias inputType = CreateBookingRequest
	public typealias outputType = CreateBookingResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings"
	}
}

/// Searches for availabilities for booking.
public struct SearchAvailability: SquareAPIEndpoint {
	public typealias inputType = SearchAvailabilityRequest
	public typealias outputType = SearchAvailabilityResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings/availability/search"
	}
}

/// Retrieves a seller's booking profile.
public struct RetrieveBusinessBookingProfile: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveBusinessBookingProfileResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings/business-booking-profile"
	}
}

/// Lists booking profiles for team members.
public struct ListTeamMemberBookingProfiles: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListTeamMemberBookingProfilesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings/team-member-booking-profiles"
	}
}

/// Retrieves a team member's booking profile.
public struct RetrieveTeamMemberBookingProfile: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveTeamMemberBookingProfileResponse
	public typealias paramType = Params
	public struct Params {
		let team_member_id: String
		/// Retrieves a team member's booking profile.
		/// - Parameters:
		///   - team_member_id: The ID of the team member to retrieve.
		public init(team_member_id: String) {
			self.team_member_id = team_member_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bookings/team-member-booking-profiles/\(inputs.team_member_id)"
	}
}

/// Retrieves a booking.
public struct RetrieveBooking: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveBookingResponse
	public typealias paramType = Params
	public struct Params {
		let booking_id: String
		/// Retrieves a booking.
		/// - Parameters:
		///   - booking_id: The ID of the `Booking` object representing the to-be-retrieved booking.
		public init(booking_id: String) {
			self.booking_id = booking_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bookings/\(inputs.booking_id)"
	}
}

/// Cancels an existing booking.
public struct CancelBooking: SquareAPIEndpoint {
	public typealias inputType = CancelBookingRequest
	public typealias outputType = CancelBookingResponse
	public typealias paramType = Params
	public struct Params {
		let booking_id: String
		/// Cancels an existing booking.
		/// - Parameters:
		///   - booking_id: The ID of the `Booking` object representing the to-be-cancelled booking.
		public init(booking_id: String) {
			self.booking_id = booking_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bookings/\(inputs.booking_id)/cancel"
	}
}

/// Provides the details for all of the cash drawer shifts for a location in a date range.
public struct ListCashDrawerShifts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCashDrawerShiftsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/cash-drawers/shifts"
	}
}

/// Provides the summary details for a single cash drawer shift. See [ListCashDrawerShiftEvents](#endpoint-CashDrawers-ListCashDrawerShiftEvents) for a list of cash drawer shift events.
public struct RetrieveCashDrawerShift: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveCashDrawerShiftResponse
	public typealias paramType = Params
	public struct Params {
		let shift_id: String
		/// Provides the summary details for a single cash drawer shift. See [ListCashDrawerShiftEvents](#endpoint-CashDrawers-ListCashDrawerShiftEvents) for a list of cash drawer shift events.
		/// - Parameters:
		///   - shift_id: The shift ID.
		public init(shift_id: String) {
			self.shift_id = shift_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/cash-drawers/shifts/\(inputs.shift_id)"
	}
}

/// Provides a paginated list of events for a single cash drawer shift.
public struct ListCashDrawerShiftEvents: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCashDrawerShiftEventsResponse
	public typealias paramType = Params
	public struct Params {
		let shift_id: String
		/// Provides a paginated list of events for a single cash drawer shift.
		/// - Parameters:
		///   - shift_id: The shift ID.
		public init(shift_id: String) {
			self.shift_id = shift_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/cash-drawers/shifts/\(inputs.shift_id)/events"
	}
}

/// Deletes a set of [CatalogItem](#type-catalogitem)s based on the provided list of target IDs and returns a set of successfully deleted IDs in the response. Deletion is a cascading event such that all children of the targeted object are also deleted. For example, deleting a CatalogItem will also delete all of its [CatalogItemVariation](#type-catalogitemvariation) children.  `BatchDeleteCatalogObjects` succeeds even if only a portion of the targeted IDs can be deleted. The response will only include IDs that were actually deleted.
public struct BatchDeleteCatalogObjects: SquareAPIEndpoint {
	public typealias inputType = BatchDeleteCatalogObjectsRequest
	public typealias outputType = BatchDeleteCatalogObjectsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/batch-delete"
	}
}

/// Returns a set of objects based on the provided ID. Each [CatalogItem](#type-catalogitem) returned in the set includes all of its child information including: all of its [CatalogItemVariation](#type-catalogitemvariation) objects, references to its [CatalogModifierList](#type-catalogmodifierlist) objects, and the ids of any [CatalogTax](#type-catalogtax) objects that apply to it.
public struct BatchRetrieveCatalogObjects: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveCatalogObjectsRequest
	public typealias outputType = BatchRetrieveCatalogObjectsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/batch-retrieve"
	}
}

/// Creates or updates up to 10,000 target objects based on the provided list of objects. The target objects are grouped into batches and each batch is inserted/updated in an all-or-nothing manner. If an object within a batch is malformed in some way, or violates a database constraint, the entire batch containing that item will be disregarded. However, other batches in the same request may still succeed. Each batch may contain up to 1,000 objects, and batches will be processed in order as long as the total object count for the request (items, variations, modifier lists, discounts, and taxes) is no more than 10,000.
public struct BatchUpsertCatalogObjects: SquareAPIEndpoint {
	public typealias inputType = BatchUpsertCatalogObjectsRequest
	public typealias outputType = BatchUpsertCatalogObjectsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/batch-upsert"
	}
}

/// Retrieves information about the Square Catalog API, such as batch size limits that can be used by the `BatchUpsertCatalogObjects` endpoint.
public struct CatalogInfo: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = CatalogInfoResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/info"
	}
}

/// Returns a list of [CatalogObject](#type-catalogobject)s that includes all objects of a set of desired types (for example, all [CatalogItem](#type-catalogitem) and [CatalogTax](#type-catalogtax) objects) in the catalog. The `types` parameter is specified as a comma-separated list of valid [CatalogObject](#type-catalogobject) types: `ITEM`, `ITEM_VARIATION`, `MODIFIER`, `MODIFIER_LIST`, `CATEGORY`, `DISCOUNT`, `TAX`, `IMAGE`.  __Important:__ ListCatalog does not return deleted catalog items. To retrieve deleted catalog items, use [SearchCatalogObjects](#endpoint-Catalog-SearchCatalogObjects)  and set the `include_deleted_objects` attribute value to `true`.
public struct ListCatalog: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCatalogResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/list"
	}
}

/// Creates or updates the target [CatalogObject](#type-catalogobject).
public struct UpsertCatalogObject: SquareAPIEndpoint {
	public typealias inputType = UpsertCatalogObjectRequest
	public typealias outputType = UpsertCatalogObjectResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/object"
	}
}

/// Returns a single [CatalogItem](#type-catalogitem) as a [CatalogObject](#type-catalogobject) based on the provided ID. The returned object includes all of the relevant [CatalogItem](#type-catalogitem) information including: [CatalogItemVariation](#type-catalogitemvariation) children, references to its [CatalogModifierList](#type-catalogmodifierlist) objects, and the ids of any [CatalogTax](#type-catalogtax) objects that apply to it.
public struct RetrieveCatalogObject: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveCatalogObjectResponse
	public typealias paramType = Params
	public struct Params {
		let object_id: String
		/// Returns a single [CatalogItem](#type-catalogitem) as a [CatalogObject](#type-catalogobject) based on the provided ID. The returned object includes all of the relevant [CatalogItem](#type-catalogitem) information including: [CatalogItemVariation](#type-catalogitemvariation) children, references to its [CatalogModifierList](#type-catalogmodifierlist) objects, and the ids of any [CatalogTax](#type-catalogtax) objects that apply to it.
		/// - Parameters:
		///   - object_id: The object ID of any type of catalog objects to be retrieved.
		public init(object_id: String) {
			self.object_id = object_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/catalog/object/\(inputs.object_id)"
	}
}

/// Searches for [CatalogObject](#type-CatalogObject) of any types against supported search attribute values, excluding custom attribute values on items or item variations, against one or more of the specified query expressions,  This (`SearchCatalogObjects`) endpoint differs from the [SearchCatalogItems](#endpoint-Catalog-SearchCatalogItems) endpoint in the following aspects:  - `SearchCatalogItems` can only search for items or item variations, whereas `SearchCatalogObjects` can search for any type of catalog objects. - `SearchCatalogItems` supports the custom attribute query filters to return items or item variations that contain custom attribute values, where `SearchCatalogObjects` does not. - `SearchCatalogItems` does not support the `include_deleted_objects` filter to search for deleted items or item variations, whereas `SearchCatalogObjects` does. - The both endpoints have different call conventions, including the query filter formats.
public struct SearchCatalogObjects: SquareAPIEndpoint {
	public typealias inputType = SearchCatalogObjectsRequest
	public typealias outputType = SearchCatalogObjectsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/search"
	}
}

/// Searches for catalog items or item variations by matching supported search attribute values, including custom attribute values, against one or more of the specified query expressions,  This (`SearchCatalogItems`) endpoint differs from the [SearchCatalogObjects](#endpoint-Catalog-SearchCatalogObjects) endpoint in the following aspects:  - `SearchCatalogItems` can only search for items or item variations, whereas `SearchCatalogObjects` can search for any type of catalog objects. - `SearchCatalogItems` supports the custom attribute query filters to return items or item variations that contain custom attribute values, where `SearchCatalogObjects` does not. - `SearchCatalogItems` does not support the `include_deleted_objects` filter to search for deleted items or item variations, whereas `SearchCatalogObjects` does. - The both endpoints use different call conventions, including the query filter formats.
public struct SearchCatalogItems: SquareAPIEndpoint {
	public typealias inputType = SearchCatalogItemsRequest
	public typealias outputType = SearchCatalogItemsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/search-catalog-items"
	}
}

/// Updates the [CatalogModifierList](#type-catalogmodifierlist) objects that apply to the targeted [CatalogItem](#type-catalogitem) without having to perform an upsert on the entire item.
public struct UpdateItemModifierLists: SquareAPIEndpoint {
	public typealias inputType = UpdateItemModifierListsRequest
	public typealias outputType = UpdateItemModifierListsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/update-item-modifier-lists"
	}
}

/// Updates the [CatalogTax](#type-catalogtax) objects that apply to the targeted [CatalogItem](#type-catalogitem) without having to perform an upsert on the entire item.
public struct UpdateItemTaxes: SquareAPIEndpoint {
	public typealias inputType = UpdateItemTaxesRequest
	public typealias outputType = UpdateItemTaxesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/update-item-taxes"
	}
}

/// Lists customer profiles associated with a Square account.  Under normal operating conditions, newly created or updated customer profiles become available for the listing operation in well under 30 seconds. Occasionally, propagation of the new or updated profiles can take closer to one minute or longer, especially during network incidents and outages.
public struct ListCustomers: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCustomersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers"
	}
}

/// Retrieves the list of customer groups of a business.
public struct ListCustomerGroups: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCustomerGroupsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers/groups"
	}
}

/// Retrieves a specific customer group as identified by the `group_id` value.
public struct RetrieveCustomerGroup: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveCustomerGroupResponse
	public typealias paramType = Params
	public struct Params {
		let group_id: String
		/// Retrieves a specific customer group as identified by the `group_id` value.
		/// - Parameters:
		///   - group_id: The ID of the customer group to retrieve.
		public init(group_id: String) {
			self.group_id = group_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/customers/groups/\(inputs.group_id)"
	}
}

/// Searches the customer profiles associated with a Square account using a supported query filter.  Calling `SearchCustomers` without any explicit query filter returns all customer profiles ordered alphabetically based on `given_name` and `family_name`.  Under normal operating conditions, newly created or updated customer profiles become available for the search operation in well under 30 seconds. Occasionally, propagation of the new or updated profiles can take closer to one minute or longer, especially during network incidents and outages.
public struct SearchCustomers: SquareAPIEndpoint {
	public typealias inputType = SearchCustomersRequest
	public typealias outputType = SearchCustomersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers/search"
	}
}

/// Retrieves the list of customer segments of a business.
public struct ListCustomerSegments: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCustomerSegmentsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers/segments"
	}
}

/// Retrieves a specific customer segment as identified by the `segment_id` value.
public struct RetrieveCustomerSegment: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveCustomerSegmentResponse
	public typealias paramType = Params
	public struct Params {
		let segment_id: String
		/// Retrieves a specific customer segment as identified by the `segment_id` value.
		/// - Parameters:
		///   - segment_id: The Square-issued ID of the customer segment.
		public init(segment_id: String) {
			self.segment_id = segment_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/customers/segments/\(inputs.segment_id)"
	}
}

/// Returns details for a single customer.
public struct RetrieveCustomer: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveCustomerResponse
	public typealias paramType = Params
	public struct Params {
		let customer_id: String
		/// Returns details for a single customer.
		/// - Parameters:
		///   - customer_id: The ID of the customer to retrieve.
		public init(customer_id: String) {
			self.customer_id = customer_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/customers/\(inputs.customer_id)"
	}
}

/// Adds a card on file to an existing customer.  As with charges, calls to `CreateCustomerCard` are idempotent. Multiple calls with the same card nonce return the same card record that was created with the provided nonce during the _first_ call.
public struct CreateCustomerCard: SquareAPIEndpoint {
	public typealias inputType = CreateCustomerCardRequest
	public typealias outputType = CreateCustomerCardResponse
	public typealias paramType = Params
	public struct Params {
		let customer_id: String
		/// Adds a card on file to an existing customer.  As with charges, calls to `CreateCustomerCard` are idempotent. Multiple calls with the same card nonce return the same card record that was created with the provided nonce during the _first_ call.
		/// - Parameters:
		///   - customer_id: The Square ID of the customer profile the card is linked to.
		public init(customer_id: String) {
			self.customer_id = customer_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/customers/\(inputs.customer_id)/cards"
	}
}

/// Lists all DeviceCodes associated with the merchant.
public struct ListDeviceCodes: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListDeviceCodesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/devices/codes"
	}
}

/// Retrieves DeviceCode with the associated ID.
public struct GetDeviceCode: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetDeviceCodeResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Retrieves DeviceCode with the associated ID.
		/// - Parameters:
		///   - id: The unique identifier for the device code.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/devices/codes/\(inputs.id)"
	}
}

/// Returns a list of disputes associated with a particular account.
public struct ListDisputes: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListDisputesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/disputes"
	}
}

/// Returns details about a specific dispute.
public struct RetrieveDispute: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveDisputeResponse
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
		/// Returns details about a specific dispute.
		/// - Parameters:
		///   - dispute_id: The ID of the dispute you want more details about.
		public init(dispute_id: String) {
			self.dispute_id = dispute_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)"
	}
}

/// Accepts the loss on a dispute. Square returns the disputed amount to the cardholder and updates the dispute state to ACCEPTED.  Square debits the disputed amount from the seller’s Square account. If the Square account does not have sufficient funds, Square debits the associated bank account.
public struct AcceptDispute: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = AcceptDisputeResponse
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
		/// Accepts the loss on a dispute. Square returns the disputed amount to the cardholder and updates the dispute state to ACCEPTED.  Square debits the disputed amount from the seller’s Square account. If the Square account does not have sufficient funds, Square debits the associated bank account.
		/// - Parameters:
		///   - dispute_id: The ID of the dispute you want to accept.
		public init(dispute_id: String) {
			self.dispute_id = dispute_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)/accept"
	}
}

/// Returns a list of evidence associated with a dispute.
public struct ListDisputeEvidence: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListDisputeEvidenceResponse
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
		/// Returns a list of evidence associated with a dispute.
		/// - Parameters:
		///   - dispute_id: The ID of the dispute.
		public init(dispute_id: String) {
			self.dispute_id = dispute_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)/evidence"
	}
}

/// Returns the specific evidence metadata associated with a specific dispute.  You must maintain a copy of the evidence you upload if you want to reference it later. You cannot download the evidence after you upload it.
public struct RetrieveDisputeEvidence: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveDisputeEvidenceResponse
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
		let evidence_id: String
		/// Returns the specific evidence metadata associated with a specific dispute.  You must maintain a copy of the evidence you upload if you want to reference it later. You cannot download the evidence after you upload it.
		/// - Parameters:
		///   - dispute_id: The ID of the dispute that you want to retrieve evidence from.
		///   - evidence_id: The ID of the evidence to retrieve.
		public init(dispute_id: String, evidence_id: String) {
			self.dispute_id = dispute_id
			self.evidence_id = evidence_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)/evidence/\(inputs.evidence_id)"
	}
}

/// Uploads text to use as evidence for a dispute challenge.
public struct CreateDisputeEvidenceText: SquareAPIEndpoint {
	public typealias inputType = CreateDisputeEvidenceTextRequest
	public typealias outputType = CreateDisputeEvidenceTextResponse
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
		/// Uploads text to use as evidence for a dispute challenge.
		/// - Parameters:
		///   - dispute_id: The ID of the dispute you want to upload evidence for.
		public init(dispute_id: String) {
			self.dispute_id = dispute_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)/evidence_text"
	}
}

/// Submits evidence to the cardholder's bank.  Before submitting evidence, Square compiles all available evidence. This includes evidence uploaded using the [CreateDisputeEvidenceFile](/reference/square/disputes-api/create-dispute-evidence-file) and [CreateDisputeEvidenceText](/reference/square/disputes-api/create-dispute-evidence-text) endpoints and evidence automatically provided by Square, when available.
public struct SubmitEvidence: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = SubmitEvidenceResponse
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
		/// Submits evidence to the cardholder's bank.  Before submitting evidence, Square compiles all available evidence. This includes evidence uploaded using the [CreateDisputeEvidenceFile](/reference/square/disputes-api/create-dispute-evidence-file) and [CreateDisputeEvidenceText](/reference/square/disputes-api/create-dispute-evidence-text) endpoints and evidence automatically provided by Square, when available.
		/// - Parameters:
		///   - dispute_id: The ID of the dispute that you want to submit evidence for.
		public init(dispute_id: String) {
			self.dispute_id = dispute_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)/submit-evidence"
	}
}

@available(*,deprecated)
public struct ListEmployees: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListEmployeesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/employees"
	}
}

@available(*,deprecated)
public struct RetrieveEmployee: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveEmployeeResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/employees/\(inputs.id)"
	}
}

/// Returns the [InventoryAdjustment](#type-inventoryadjustment) object with the provided `adjustment_id`.
public struct RetrieveInventoryAdjustment: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveInventoryAdjustmentResponse
	public typealias paramType = Params
	public struct Params {
		let adjustment_id: String
		/// Returns the [InventoryAdjustment](#type-inventoryadjustment) object with the provided `adjustment_id`.
		/// - Parameters:
		///   - adjustment_id: ID of the `InventoryAdjustment` to retrieve.
		public init(adjustment_id: String) {
			self.adjustment_id = adjustment_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/inventory/adjustment/\(inputs.adjustment_id)"
	}
}

/// Applies adjustments and counts to the provided item quantities.  On success: returns the current calculated counts for all objects referenced in the request. On failure: returns a list of related errors.
public struct BatchChangeInventory: SquareAPIEndpoint {
	public typealias inputType = BatchChangeInventoryRequest
	public typealias outputType = BatchChangeInventoryResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/inventory/batch-change"
	}
}

/// Returns historical physical counts and adjustments based on the provided filter criteria.  Results are paginated and sorted in ascending order according their `occurred_at` timestamp (oldest first).  BatchRetrieveInventoryChanges is a catch-all query endpoint for queries that cannot be handled by other, simpler endpoints.
public struct BatchRetrieveInventoryChanges: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveInventoryChangesRequest
	public typealias outputType = BatchRetrieveInventoryChangesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/inventory/batch-retrieve-changes"
	}
}

/// Returns current counts for the provided [CatalogObject](#type-catalogobject)s at the requested [Location](#type-location)s.  Results are paginated and sorted in descending order according to their `calculated_at` timestamp (newest first).  When `updated_after` is specified, only counts that have changed since that time (based on the server timestamp for the most recent change) are returned. This allows clients to perform a "sync" operation, for example in response to receiving a Webhook notification.
public struct BatchRetrieveInventoryCounts: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveInventoryCountsRequest
	public typealias outputType = BatchRetrieveInventoryCountsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/inventory/batch-retrieve-counts"
	}
}

/// Returns the [InventoryPhysicalCount](#type-inventoryphysicalcount) object with the provided `physical_count_id`.
public struct RetrieveInventoryPhysicalCount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveInventoryPhysicalCountResponse
	public typealias paramType = Params
	public struct Params {
		let physical_count_id: String
		/// Returns the [InventoryPhysicalCount](#type-inventoryphysicalcount) object with the provided `physical_count_id`.
		/// - Parameters:
		///   - physical_count_id: ID of the `InventoryPhysicalCount` to retrieve.
		public init(physical_count_id: String) {
			self.physical_count_id = physical_count_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/inventory/physical-count/\(inputs.physical_count_id)"
	}
}

/// Retrieves the current calculated stock count for a given [CatalogObject](#type-catalogobject) at a given set of [Location](#type-location)s. Responses are paginated and unsorted. For more sophisticated queries, use a batch endpoint.
public struct RetrieveInventoryCount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveInventoryCountResponse
	public typealias paramType = Params
	public struct Params {
		let catalog_object_id: String
		/// Retrieves the current calculated stock count for a given [CatalogObject](#type-catalogobject) at a given set of [Location](#type-location)s. Responses are paginated and unsorted. For more sophisticated queries, use a batch endpoint.
		/// - Parameters:
		///   - catalog_object_id: ID of the `CatalogObject` to retrieve.
		public init(catalog_object_id: String) {
			self.catalog_object_id = catalog_object_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/inventory/\(inputs.catalog_object_id)"
	}
}

/// Returns a set of physical counts and inventory adjustments for the provided [CatalogObject](#type-catalogobject) at the requested [Location](#type-location)s.  Results are paginated and sorted in descending order according to their `occurred_at` timestamp (newest first).  There are no limits on how far back the caller can page. This endpoint can be  used to display recent changes for a specific item. For more sophisticated queries, use a batch endpoint.
public struct RetrieveInventoryChanges: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveInventoryChangesResponse
	public typealias paramType = Params
	public struct Params {
		let catalog_object_id: String
		/// Returns a set of physical counts and inventory adjustments for the provided [CatalogObject](#type-catalogobject) at the requested [Location](#type-location)s.  Results are paginated and sorted in descending order according to their `occurred_at` timestamp (newest first).  There are no limits on how far back the caller can page. This endpoint can be  used to display recent changes for a specific item. For more sophisticated queries, use a batch endpoint.
		/// - Parameters:
		///   - catalog_object_id: ID of the `CatalogObject` to retrieve.
		public init(catalog_object_id: String) {
			self.catalog_object_id = catalog_object_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/inventory/\(inputs.catalog_object_id)/changes"
	}
}

/// Returns a list of invoices for a given location. The response  is paginated. If truncated, the response includes a `cursor` that you     use in a subsequent request to fetch the next set of invoices.
public struct ListInvoices: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListInvoicesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/invoices"
	}
}

/// Searches for invoices from a location specified in  the filter. You can optionally specify customers in the filter for whom to  retrieve invoices. In the current implementation, you can only specify one location and  optionally one customer.  The response is paginated. If truncated, the response includes a `cursor`  that you use in a subsequent request to fetch the next set of invoices.
public struct SearchInvoices: SquareAPIEndpoint {
	public typealias inputType = SearchInvoicesRequest
	public typealias outputType = SearchInvoicesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/invoices/search"
	}
}

/// Retrieves an invoice by invoice ID.
public struct GetInvoice: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetInvoiceResponse
	public typealias paramType = Params
	public struct Params {
		let invoice_id: String
		/// Retrieves an invoice by invoice ID.
		/// - Parameters:
		///   - invoice_id: The id of the invoice to retrieve.
		public init(invoice_id: String) {
			self.invoice_id = invoice_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/invoices/\(inputs.invoice_id)"
	}
}

/// Cancels an invoice. The seller cannot collect payments for  the canceled invoice.  You cannot cancel an invoice in a terminal state: `PAID`, `REFUNDED`, `CANCELED`, or `FAILED`.
public struct CancelInvoice: SquareAPIEndpoint {
	public typealias inputType = CancelInvoiceRequest
	public typealias outputType = CancelInvoiceResponse
	public typealias paramType = Params
	public struct Params {
		let invoice_id: String
		/// Cancels an invoice. The seller cannot collect payments for  the canceled invoice.  You cannot cancel an invoice in a terminal state: `PAID`, `REFUNDED`, `CANCELED`, or `FAILED`.
		/// - Parameters:
		///   - invoice_id: The ID of the `invoice` to cancel.
		public init(invoice_id: String) {
			self.invoice_id = invoice_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/invoices/\(inputs.invoice_id)/cancel"
	}
}

/// Publishes the specified draft invoice.   After an invoice is published, Square  follows up based on the invoice configuration. For example, Square  sends the invoice to the customer's email address, charges the customer's card on file, or does  nothing. Square also makes the invoice available on a Square-hosted invoice page.   The invoice `status` also changes from `DRAFT` to a status  based on the invoice configuration. For example, the status changes to `UNPAID` if  Square emails the invoice or `PARTIALLY_PAID` if Square charge a card on file for a portion of the  invoice amount).
public struct PublishInvoice: SquareAPIEndpoint {
	public typealias inputType = PublishInvoiceRequest
	public typealias outputType = PublishInvoiceResponse
	public typealias paramType = Params
	public struct Params {
		let invoice_id: String
		/// Publishes the specified draft invoice.   After an invoice is published, Square  follows up based on the invoice configuration. For example, Square  sends the invoice to the customer's email address, charges the customer's card on file, or does  nothing. Square also makes the invoice available on a Square-hosted invoice page.   The invoice `status` also changes from `DRAFT` to a status  based on the invoice configuration. For example, the status changes to `UNPAID` if  Square emails the invoice or `PARTIALLY_PAID` if Square charge a card on file for a portion of the  invoice amount).
		/// - Parameters:
		///   - invoice_id: The id of the invoice to publish.
		public init(invoice_id: String) {
			self.invoice_id = invoice_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/invoices/\(inputs.invoice_id)/publish"
	}
}

/// Returns a paginated list of `BreakType` instances for a business.
public struct ListBreakTypes: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListBreakTypesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/break-types"
	}
}

/// Returns a single `BreakType` specified by id.
public struct GetBreakType: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetBreakTypeResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Returns a single `BreakType` specified by id.
		/// - Parameters:
		///   - id: UUID for the `BreakType` being retrieved.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/labor/break-types/\(inputs.id)"
	}
}

/// Returns a paginated list of `EmployeeWage` instances for a business.
@available(*,deprecated)
public struct ListEmployeeWages: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListEmployeeWagesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/employee-wages"
	}
}

/// Returns a single `EmployeeWage` specified by id.
@available(*,deprecated)
public struct GetEmployeeWage: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetEmployeeWageResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Returns a single `EmployeeWage` specified by id.
		/// - Parameters:
		///   - id: UUID for the `EmployeeWage` being retrieved.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/labor/employee-wages/\(inputs.id)"
	}
}

/// Creates a new `Shift`.  A `Shift` represents a complete work day for a single employee. You must provide the following values in your request to this endpoint:  - `location_id` - `employee_id` - `start_at`  An attempt to create a new `Shift` can result in a `BAD_REQUEST` error when: - The `status` of the new `Shift` is `OPEN` and the employee has another shift with an `OPEN` status. - The `start_at` date is in the future - the `start_at` or `end_at` overlaps another shift for the same employee - If `Break`s are set in the request, a break `start_at` must not be before the `Shift.start_at`. A break `end_at` must not be after the `Shift.end_at`
public struct CreateShift: SquareAPIEndpoint {
	public typealias inputType = CreateShiftRequest
	public typealias outputType = CreateShiftResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/shifts"
	}
}

/// Returns a paginated list of `Shift` records for a business. The list to be returned can be filtered by: - Location IDs **and** - employee IDs **and** - shift status (`OPEN`, `CLOSED`) **and** - shift start **and** - shift end **and** - work day details  The list can be sorted by: - `start_at` - `end_at` - `created_at` - `updated_at`
public struct SearchShifts: SquareAPIEndpoint {
	public typealias inputType = SearchShiftsRequest
	public typealias outputType = SearchShiftsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/shifts/search"
	}
}

/// Returns a single `Shift` specified by id.
public struct GetShift: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetShiftResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Returns a single `Shift` specified by id.
		/// - Parameters:
		///   - id: UUID for the `Shift` being retrieved.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/labor/shifts/\(inputs.id)"
	}
}

/// Returns a paginated list of `TeamMemberWage` instances for a business.
public struct ListTeamMemberWages: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListTeamMemberWagesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/team-member-wages"
	}
}

/// Returns a single `TeamMemberWage` specified by id.
public struct GetTeamMemberWage: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetTeamMemberWageResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		/// Returns a single `TeamMemberWage` specified by id.
		/// - Parameters:
		///   - id: UUID for the `TeamMemberWage` being retrieved.
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/labor/team-member-wages/\(inputs.id)"
	}
}

/// Returns a list of `WorkweekConfig` instances for a business.
public struct ListWorkweekConfigs: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListWorkweekConfigsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/workweek-configs"
	}
}

/// Provides information of all locations of a business.  Many Square API endpoints require a `location_id` parameter. The `id` field of the [`Location`](#type-location) objects returned by this endpoint correspond to that `location_id` parameter.
public struct ListLocations: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListLocationsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/locations"
	}
}

/// Retrieves details of a location. You can specify "main"  as the location ID to retrieve details of the  main location.
public struct RetrieveLocation: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveLocationResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Retrieves details of a location. You can specify "main"  as the location ID to retrieve details of the  main location.
		/// - Parameters:
		///   - location_id: The ID of the location to retrieve. If you specify the string "main", then the endpoint returns the main location.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)"
	}
}

/// Links a `checkoutId` to a `checkout_page_url` that customers will be directed to in order to provide their payment information using a payment processing workflow hosted on connect.squareup.com.
public struct CreateCheckout: SquareAPIEndpoint {
	public typealias inputType = CreateCheckoutRequest
	public typealias outputType = CreateCheckoutResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Links a `checkoutId` to a `checkout_page_url` that customers will be directed to in order to provide their payment information using a payment processing workflow hosted on connect.squareup.com.
		/// - Parameters:
		///   - location_id: The ID of the business location to associate the checkout with.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/checkouts"
	}
}

/// Lists refunds for one of a business's locations.  In addition to full or partial tender refunds processed through Square APIs, refunds may result from itemized returns or exchanges through Square's Point of Sale applications.  Refunds with a `status` of `PENDING` are not currently included in this endpoint's response.  Max results per [page](#paginatingresults): 50
@available(*,deprecated)
public struct ListRefunds: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListRefundsResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Lists refunds for one of a business's locations.  In addition to full or partial tender refunds processed through Square APIs, refunds may result from itemized returns or exchanges through Square's Point of Sale applications.  Refunds with a `status` of `PENDING` are not currently included in this endpoint's response.  Max results per [page](#paginatingresults): 50
		/// - Parameters:
		///   - location_id: The ID of the location to list refunds for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/refunds"
	}
}

/// Lists transactions for a particular location.  Transactions include payment information from sales and exchanges and refund information from returns and exchanges.  Max results per [page](#paginatingresults): 50
@available(*,deprecated)
public struct ListTransactions: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListTransactionsResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Lists transactions for a particular location.  Transactions include payment information from sales and exchanges and refund information from returns and exchanges.  Max results per [page](#paginatingresults): 50
		/// - Parameters:
		///   - location_id: The ID of the location to list transactions for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/transactions"
	}
}

/// Retrieves details for a single transaction.
@available(*,deprecated)
public struct RetrieveTransaction: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveTransactionResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let transaction_id: String
		/// Retrieves details for a single transaction.
		/// - Parameters:
		///   - location_id: The ID of the transaction's associated location.
		///   - transaction_id: The ID of the transaction to retrieve.
		public init(location_id: String, transaction_id: String) {
			self.location_id = location_id
			self.transaction_id = transaction_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/transactions/\(inputs.transaction_id)"
	}
}

/// Captures a transaction that was created with the [Charge](#endpoint-charge) endpoint with a `delay_capture` value of `true`.   See [Delayed capture transactions](/payments/transactions/overview#delayed-capture) for more information.
@available(*,deprecated)
public struct CaptureTransaction: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CaptureTransactionResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let transaction_id: String
		/// Captures a transaction that was created with the [Charge](#endpoint-charge) endpoint with a `delay_capture` value of `true`.   See [Delayed capture transactions](/payments/transactions/overview#delayed-capture) for more information.
		/// - Parameters:
		///   - location_id: 
		///   - transaction_id: 
		public init(location_id: String, transaction_id: String) {
			self.location_id = location_id
			self.transaction_id = transaction_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/transactions/\(inputs.transaction_id)/capture"
	}
}

/// Initiates a refund for a previously charged tender.  You must issue a refund within 120 days of the associated payment. See [this article](https://squareup.com/help/us/en/article/5060) for more information on refund behavior.  NOTE: Card-present transactions with Interac credit cards **cannot be refunded using the Connect API**. Interac transactions must refunded in-person (e.g., dipping the card using POS app).
@available(*,deprecated)
public struct CreateRefund: SquareAPIEndpoint {
	public typealias inputType = CreateRefundRequest
	public typealias outputType = CreateRefundResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let transaction_id: String
		/// Initiates a refund for a previously charged tender.  You must issue a refund within 120 days of the associated payment. See [this article](https://squareup.com/help/us/en/article/5060) for more information on refund behavior.  NOTE: Card-present transactions with Interac credit cards **cannot be refunded using the Connect API**. Interac transactions must refunded in-person (e.g., dipping the card using POS app).
		/// - Parameters:
		///   - location_id: The ID of the original transaction's associated location.
		///   - transaction_id: The ID of the original transaction that includes the tender to refund.
		public init(location_id: String, transaction_id: String) {
			self.location_id = location_id
			self.transaction_id = transaction_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/transactions/\(inputs.transaction_id)/refund"
	}
}

/// Cancels a transaction that was created with the [Charge](#endpoint-charge) endpoint with a `delay_capture` value of `true`.   See [Delayed capture transactions](/payments/transactions/overview#delayed-capture) for more information.
@available(*,deprecated)
public struct VoidTransaction: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = VoidTransactionResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let transaction_id: String
		/// Cancels a transaction that was created with the [Charge](#endpoint-charge) endpoint with a `delay_capture` value of `true`.   See [Delayed capture transactions](/payments/transactions/overview#delayed-capture) for more information.
		/// - Parameters:
		///   - location_id: 
		///   - transaction_id: 
		public init(location_id: String, transaction_id: String) {
			self.location_id = location_id
			self.transaction_id = transaction_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/transactions/\(inputs.transaction_id)/void"
	}
}

/// Creates a loyalty account.
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
		///   - account_id: The ID of the `loyalty account` to retrieve.
		public init(account_id: String) {
			self.account_id = account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/accounts/\(inputs.account_id)"
	}
}

/// Adds points to a loyalty account.  - If you are using the Orders API to manage orders, you only provide the `order_id`.  The endpoint reads the order to compute points to add to the buyer's account. - If you are not using the Orders API to manage orders,  you first perform a client-side computation to compute the points.   For spend-based and visit-based programs, you can call  [CalculateLoyaltyPoints](#endpoint-Loyalty-CalculateLoyaltyPoints) to compute the points. For more information,  see [Loyalty Program Overview](/docs/loyalty/overview).  You then provide the points in a request to this endpoint.
public struct AccumulateLoyaltyPoints: SquareAPIEndpoint {
	public typealias inputType = AccumulateLoyaltyPointsRequest
	public typealias outputType = AccumulateLoyaltyPointsResponse
	public typealias paramType = Params
	public struct Params {
		let account_id: String
		/// Adds points to a loyalty account.  - If you are using the Orders API to manage orders, you only provide the `order_id`.  The endpoint reads the order to compute points to add to the buyer's account. - If you are not using the Orders API to manage orders,  you first perform a client-side computation to compute the points.   For spend-based and visit-based programs, you can call  [CalculateLoyaltyPoints](#endpoint-Loyalty-CalculateLoyaltyPoints) to compute the points. For more information,  see [Loyalty Program Overview](/docs/loyalty/overview).  You then provide the points in a request to this endpoint.
		/// - Parameters:
		///   - account_id: The `loyalty account` ID to which to add the points.
		public init(account_id: String) {
			self.account_id = account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/accounts/\(inputs.account_id)/accumulate"
	}
}

/// Adds points to or subtracts points from a buyer's account.   Use this endpoint only when you need to manually adjust points. Otherwise, in your application flow, you call  [AccumulateLoyaltyPoints](#endpoint-Loyalty-AccumulateLoyaltyPoints)  to add points when a buyer pays for the purchase.
public struct AdjustLoyaltyPoints: SquareAPIEndpoint {
	public typealias inputType = AdjustLoyaltyPointsRequest
	public typealias outputType = AdjustLoyaltyPointsResponse
	public typealias paramType = Params
	public struct Params {
		let account_id: String
		/// Adds points to or subtracts points from a buyer's account.   Use this endpoint only when you need to manually adjust points. Otherwise, in your application flow, you call  [AccumulateLoyaltyPoints](#endpoint-Loyalty-AccumulateLoyaltyPoints)  to add points when a buyer pays for the purchase.
		/// - Parameters:
		///   - account_id: The ID of the `loyalty account` in which to adjust the points.
		public init(account_id: String) {
			self.account_id = account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/accounts/\(inputs.account_id)/adjust"
	}
}

/// Searches for loyalty events.  A Square loyalty program maintains a ledger of events that occur during the lifetime of a  buyer's loyalty account. Each change in the point balance  (for example, points earned, points redeemed, and points expired) is  recorded in the ledger. Using this endpoint, you can search the ledger for events.
public struct SearchLoyaltyEvents: SquareAPIEndpoint {
	public typealias inputType = SearchLoyaltyEventsRequest
	public typealias outputType = SearchLoyaltyEventsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/events/search"
	}
}

/// Returns a list of loyalty programs in the seller's account. Currently, a seller can only have one loyalty program.
public struct ListLoyaltyPrograms: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListLoyaltyProgramsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/programs"
	}
}

/// Calculates the points a purchase earns.  - If you are using the Orders API to manage orders, you provide `order_id` in the request. The  endpoint calculates the points by reading the order. - If you are not using the Orders API to manage orders, you provide the purchase amount in  the request for the endpoint to calculate the points.  An application might call this endpoint to show the points that a buyer can earn with the  specific purchase.
public struct CalculateLoyaltyPoints: SquareAPIEndpoint {
	public typealias inputType = CalculateLoyaltyPointsRequest
	public typealias outputType = CalculateLoyaltyPointsResponse
	public typealias paramType = Params
	public struct Params {
		let program_id: String
		/// Calculates the points a purchase earns.  - If you are using the Orders API to manage orders, you provide `order_id` in the request. The  endpoint calculates the points by reading the order. - If you are not using the Orders API to manage orders, you provide the purchase amount in  the request for the endpoint to calculate the points.  An application might call this endpoint to show the points that a buyer can earn with the  specific purchase.
		/// - Parameters:
		///   - program_id: The `loyalty program` ID, which defines the rules for accruing points.
		public init(program_id: String) {
			self.program_id = program_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/programs/\(inputs.program_id)/calculate"
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

/// Searches for loyalty rewards in a loyalty account.   In the current implementation, the endpoint supports search by the reward `status`.  If you know a reward ID, use the  [RetrieveLoyaltyReward](#endpoint-Loyalty-RetrieveLoyaltyReward) endpoint.
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
		///   - reward_id: The ID of the `loyalty reward` to retrieve.
		public init(reward_id: String) {
			self.reward_id = reward_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/rewards/\(inputs.reward_id)"
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
		///   - reward_id: The ID of the `loyalty reward` to redeem.
		public init(reward_id: String) {
			self.reward_id = reward_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/rewards/\(inputs.reward_id)/redeem"
	}
}

/// Returns `Merchant` information for a given access token.  If you don't know a `Merchant` ID, you can use this endpoint to retrieve the merchant ID for an access token. You can specify your personal access token to get your own merchant information or specify an OAuth token to get the information for the  merchant that granted you access.  If you know the merchant ID, you can also use the [RetrieveMerchant](#endpoint-merchants-retrievemerchant) endpoint to get the merchant information.
public struct ListMerchants: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListMerchantsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/merchants"
	}
}

/// Retrieve a `Merchant` object for the given `merchant_id`.
public struct RetrieveMerchant: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveMerchantResponse
	public typealias paramType = Params
	public struct Params {
		let merchant_id: String
		/// Retrieve a `Merchant` object for the given `merchant_id`.
		/// - Parameters:
		///   - merchant_id: The ID of the merchant to retrieve. If the string "me" is supplied as the ID, then retrieve the merchant that is currently accessible to this call.
		public init(merchant_id: String) {
			self.merchant_id = merchant_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/merchants/\(inputs.merchant_id)"
	}
}

/// Creates a new [Order](#type-order) which can include information on products for purchase and settings to apply to the purchase.  To pay for a created order, please refer to the [Pay for Orders](/orders-api/pay-for-orders) guide.  You can modify open orders using the [UpdateOrder](#endpoint-orders-updateorder) endpoint.
public struct CreateOrder: SquareAPIEndpoint {
	public typealias inputType = CreateOrderRequest
	public typealias outputType = CreateOrderResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders"
	}
}

/// Retrieves a set of [Order](#type-order)s by their IDs.  If a given Order ID does not exist, the ID is ignored instead of generating an error.
public struct BatchRetrieveOrders: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveOrdersRequest
	public typealias outputType = BatchRetrieveOrdersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/batch-retrieve"
	}
}

/// Calculates an [Order](#type-order).
public struct CalculateOrder: SquareAPIEndpoint {
	public typealias inputType = CalculateOrderRequest
	public typealias outputType = CalculateOrderResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/calculate"
	}
}

/// Search all orders for one or more locations. Orders include all sales, returns, and exchanges regardless of how or when they entered the Square Ecosystem (e.g. Point of Sale, Invoices, Connect APIs, etc).  SearchOrders requests need to specify which locations to search and define a [`SearchOrdersQuery`](#type-searchordersquery) object which controls how to sort or filter the results. Your SearchOrdersQuery can:    Set filter criteria.   Set sort order.   Determine whether to return results as complete Order objects, or as [OrderEntry](#type-orderentry) objects.  Note that details for orders processed with Square Point of Sale while in offline mode may not be transmitted to Square for up to 72 hours. Offline orders have a `created_at` value that reflects the time the order was created, not the time it was subsequently transmitted to Square.
public struct SearchOrders: SquareAPIEndpoint {
	public typealias inputType = SearchOrdersRequest
	public typealias outputType = SearchOrdersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/search"
	}
}

/// Retrieves an [Order](#type-order) by ID.
public struct RetrieveOrder: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveOrderResponse
	public typealias paramType = Params
	public struct Params {
		let order_id: String
		/// Retrieves an [Order](#type-order) by ID.
		/// - Parameters:
		///   - order_id: The ID of the order to retrieve.
		public init(order_id: String) {
			self.order_id = order_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/orders/\(inputs.order_id)"
	}
}

/// Pay for an [order](#type-order) using one or more approved [payments](#type-payment), or settle an order with a total of `0`.  The total of the `payment_ids` listed in the request must be equal to the order total. Orders with a total amount of `0` can be marked as paid by specifying an empty array of `payment_ids` in the request.  To be used with PayOrder, a payment must:  - Reference the order by specifying the `order_id` when [creating the payment](#endpoint-payments-createpayment). Any approved payments that reference the same `order_id` not specified in the `payment_ids` will be canceled. - Be approved with [delayed capture](/payments-api/take-payments#delayed-capture). Using a delayed capture payment with PayOrder will complete the approved payment.
public struct PayOrder: SquareAPIEndpoint {
	public typealias inputType = PayOrderRequest
	public typealias outputType = PayOrderResponse
	public typealias paramType = Params
	public struct Params {
		let order_id: String
		/// Pay for an [order](#type-order) using one or more approved [payments](#type-payment), or settle an order with a total of `0`.  The total of the `payment_ids` listed in the request must be equal to the order total. Orders with a total amount of `0` can be marked as paid by specifying an empty array of `payment_ids` in the request.  To be used with PayOrder, a payment must:  - Reference the order by specifying the `order_id` when [creating the payment](#endpoint-payments-createpayment). Any approved payments that reference the same `order_id` not specified in the `payment_ids` will be canceled. - Be approved with [delayed capture](/payments-api/take-payments#delayed-capture). Using a delayed capture payment with PayOrder will complete the approved payment.
		/// - Parameters:
		///   - order_id: The ID of the order being paid.
		public init(order_id: String) {
			self.order_id = order_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/orders/\(inputs.order_id)/pay"
	}
}

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

/// Creates a subscription for a customer to a subscription plan.  If you provide a card on file in the request, Square charges the card for  the subscription. Otherwise, Square bills an invoice to the customer's email  address. The subscription starts immediately, unless the request includes  the optional `start_date`. Each individual subscription is associated with a particular location.
public struct CreateSubscription: SquareAPIEndpoint {
	public typealias inputType = CreateSubscriptionRequest
	public typealias outputType = CreateSubscriptionResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/subscriptions"
	}
}

/// Searches for subscriptions.  Results are ordered chronologically by subscription creation date. If the request specifies more than one location ID,  the endpoint orders the result  by location ID, and then by creation date within each location. If no locations are given in the query, all locations are searched.  You can also optionally specify `customer_ids` to search by customer.  If left unset, all customers  associated with the specified locations are returned.  If the request specifies customer IDs, the endpoint orders results  first by location, within location by customer ID, and within  customer by subscription creation date.  For more information, see  [Retrieve subscriptions](/docs/subscriptions-api/overview#retrieve-subscriptions).
public struct SearchSubscriptions: SquareAPIEndpoint {
	public typealias inputType = SearchSubscriptionsRequest
	public typealias outputType = SearchSubscriptionsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/subscriptions/search"
	}
}

/// Retrieves a subscription.
public struct RetrieveSubscription: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveSubscriptionResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		/// Retrieves a subscription.
		/// - Parameters:
		///   - subscription_id: The ID of the subscription to retrieve.
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/subscriptions/\(inputs.subscription_id)"
	}
}

/// Sets the `canceled_date` field to the end of the active billing period. After this date, the status changes from ACTIVE to CANCELED.
public struct CancelSubscription: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CancelSubscriptionResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		/// Sets the `canceled_date` field to the end of the active billing period. After this date, the status changes from ACTIVE to CANCELED.
		/// - Parameters:
		///   - subscription_id: The ID of the subscription to cancel.
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/subscriptions/\(inputs.subscription_id)/cancel"
	}
}

/// Lists all events for a specific subscription. In the current implementation, only `START_SUBSCRIPTION` and `STOP_SUBSCRIPTION` (when the subscription was canceled) events are returned.
public struct ListSubscriptionEvents: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListSubscriptionEventsResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		/// Lists all events for a specific subscription. In the current implementation, only `START_SUBSCRIPTION` and `STOP_SUBSCRIPTION` (when the subscription was canceled) events are returned.
		/// - Parameters:
		///   - subscription_id: The ID of the subscription to retrieve the events for.
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/subscriptions/\(inputs.subscription_id)/events"
	}
}

/// Creates a single `TeamMember` object. The `TeamMember` will be returned on successful creates. You must provide the following values in your request to this endpoint: - `given_name` - `family_name`  Learn about [Troubleshooting the Teams API](/docs/team/troubleshooting#createteammember).
public struct CreateTeamMember: SquareAPIEndpoint {
	public typealias inputType = CreateTeamMemberRequest
	public typealias outputType = CreateTeamMemberResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members"
	}
}

/// Creates multiple `TeamMember` objects. The created `TeamMember` objects will be returned on successful creates. This process is non-transactional and will process as much of the request as is possible. If one of the creates in the request cannot be successfully processed, the request will NOT be marked as failed, but the body of the response will contain explicit error information for this particular create.  Learn about [Troubleshooting the Teams API](/docs/team/troubleshooting#bulkcreateteammembers).
public struct BulkCreateTeamMembers: SquareAPIEndpoint {
	public typealias inputType = BulkCreateTeamMembersRequest
	public typealias outputType = BulkCreateTeamMembersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members/bulk-create"
	}
}

/// Updates multiple `TeamMember` objects. The updated `TeamMember` objects will be returned on successful updates. This process is non-transactional and will process as much of the request as is possible. If one of the updates in the request cannot be successfully processed, the request will NOT be marked as failed, but the body of the response will contain explicit error information for this particular update. Learn about [Troubleshooting the Teams API](/docs/team/troubleshooting#bulkupdateteammembers).
public struct BulkUpdateTeamMembers: SquareAPIEndpoint {
	public typealias inputType = BulkUpdateTeamMembersRequest
	public typealias outputType = BulkUpdateTeamMembersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members/bulk-update"
	}
}

/// Returns a paginated list of `TeamMember` objects for a business. The list to be returned can be filtered by: - location IDs **and** - `status`
public struct SearchTeamMembers: SquareAPIEndpoint {
	public typealias inputType = SearchTeamMembersRequest
	public typealias outputType = SearchTeamMembersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members/search"
	}
}

/// Retrieve a `TeamMember` object for the given `TeamMember.id`. Learn about [Troubleshooting the Teams API](/docs/team/troubleshooting#retrieveteammember).
public struct RetrieveTeamMember: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveTeamMemberResponse
	public typealias paramType = Params
	public struct Params {
		let team_member_id: String
		/// Retrieve a `TeamMember` object for the given `TeamMember.id`. Learn about [Troubleshooting the Teams API](/docs/team/troubleshooting#retrieveteammember).
		/// - Parameters:
		///   - team_member_id: The ID of the team member to retrieve.
		public init(team_member_id: String) {
			self.team_member_id = team_member_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/team-members/\(inputs.team_member_id)"
	}
}

/// Retrieve a `WageSetting` object for a team member specified by `TeamMember.id`. Learn about [Troubleshooting the Teams API](/docs/team/troubleshooting#retrievewagesetting).
public struct RetrieveWageSetting: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveWageSettingResponse
	public typealias paramType = Params
	public struct Params {
		let team_member_id: String
		/// Retrieve a `WageSetting` object for a team member specified by `TeamMember.id`. Learn about [Troubleshooting the Teams API](/docs/team/troubleshooting#retrievewagesetting).
		/// - Parameters:
		///   - team_member_id: The ID of the team member to retrieve wage setting for
		public init(team_member_id: String) {
			self.team_member_id = team_member_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/team-members/\(inputs.team_member_id)/wage-setting"
	}
}

/// Creates a new Terminal checkout request and sends it to the specified device to take a payment for the requested amount.
public struct CreateTerminalCheckout: SquareAPIEndpoint {
	public typealias inputType = CreateTerminalCheckoutRequest
	public typealias outputType = CreateTerminalCheckoutResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/terminals/checkouts"
	}
}

/// Retrieves a filtered list of Terminal checkout requests created by the account making the request.
public struct SearchTerminalCheckouts: SquareAPIEndpoint {
	public typealias inputType = SearchTerminalCheckoutsRequest
	public typealias outputType = SearchTerminalCheckoutsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/terminals/checkouts/search"
	}
}

/// Retrieves a Terminal checkout request by checkout_id.
public struct GetTerminalCheckout: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetTerminalCheckoutResponse
	public typealias paramType = Params
	public struct Params {
		let checkout_id: String
		/// Retrieves a Terminal checkout request by checkout_id.
		/// - Parameters:
		///   - checkout_id: Unique ID for the desired `TerminalCheckout`
		public init(checkout_id: String) {
			self.checkout_id = checkout_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/terminals/checkouts/\(inputs.checkout_id)"
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
		///   - checkout_id: Unique ID for the desired `TerminalCheckout`
		public init(checkout_id: String) {
			self.checkout_id = checkout_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/terminals/checkouts/\(inputs.checkout_id)/cancel"
	}
}

/// Creates a request to refund an Interac payment completed on a Square Terminal.
public struct CreateTerminalRefund: SquareAPIEndpoint {
	public typealias inputType = CreateTerminalRefundRequest
	public typealias outputType = CreateTerminalRefundResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/terminals/refunds"
	}
}

/// Retrieves a filtered list of Terminal Interac refund requests created by the seller making the request.
public struct SearchTerminalRefunds: SquareAPIEndpoint {
	public typealias inputType = SearchTerminalRefundsRequest
	public typealias outputType = SearchTerminalRefundsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/terminals/refunds/search"
	}
}

/// Retrieves an Interac terminal refund object by ID.
public struct GetTerminalRefund: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetTerminalRefundResponse
	public typealias paramType = Params
	public struct Params {
		let terminal_refund_id: String
		/// Retrieves an Interac terminal refund object by ID.
		/// - Parameters:
		///   - terminal_refund_id: Unique ID for the desired `TerminalRefund`
		public init(terminal_refund_id: String) {
			self.terminal_refund_id = terminal_refund_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/terminals/refunds/\(inputs.terminal_refund_id)"
	}
}

/// Cancels an Interac terminal refund request by refund request ID if the status of the request permits it.
public struct CancelTerminalRefund: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CancelTerminalRefundResponse
	public typealias paramType = Params
	public struct Params {
		let terminal_refund_id: String
		/// Cancels an Interac terminal refund request by refund request ID if the status of the request permits it.
		/// - Parameters:
		///   - terminal_refund_id: Unique ID for the desired `TerminalRefund`
		public init(terminal_refund_id: String) {
			self.terminal_refund_id = terminal_refund_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/terminals/refunds/\(inputs.terminal_refund_id)/cancel"
	}
}

