public struct CreateMobileAuthorizationCode: SquareAPIEndpoint {
	public typealias inputType = CreateMobileAuthorizationCodeRequest
	public typealias outputType = CreateMobileAuthorizationCodeResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/mobile/authorization-code"
	}
}

public struct RenewToken: SquareAPIEndpoint {
	public typealias inputType = RenewTokenRequest
	public typealias outputType = RenewTokenResponse
	public typealias paramType = Params
	public struct Params {
		let client_id: String
		public init(client_id: String) {
			self.client_id = client_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/oauth2/clients/\(inputs.client_id)/access-token/renew"
	}
}

public struct RevokeToken: SquareAPIEndpoint {
	public typealias inputType = RevokeTokenRequest
	public typealias outputType = RevokeTokenResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/oauth2/revoke"
	}
}

public struct ObtainToken: SquareAPIEndpoint {
	public typealias inputType = ObtainTokenRequest
	public typealias outputType = ObtainTokenResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/oauth2/token"
	}
}

public struct V1ListEmployees: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Employee]
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/me/employees"
	}
}

public struct V1RetrieveEmployee: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1Employee
	public typealias paramType = Params
	public struct Params {
		let employee_id: String
		public init(employee_id: String) {
			self.employee_id = employee_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/employees/\(inputs.employee_id)"
	}
}

public struct V1ListEmployeeRoles: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1EmployeeRole]
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/me/roles"
	}
}

public struct V1RetrieveEmployeeRole: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1EmployeeRole
	public typealias paramType = Params
	public struct Params {
		let role_id: String
		public init(role_id: String) {
			self.role_id = role_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/roles/\(inputs.role_id)"
	}
}

public struct V1ListTimecards: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Timecard]
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/me/timecards"
	}
}

public struct V1RetrieveTimecard: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1Timecard
	public typealias paramType = Params
	public struct Params {
		let timecard_id: String
		public init(timecard_id: String) {
			self.timecard_id = timecard_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/timecards/\(inputs.timecard_id)"
	}
}

public struct V1ListTimecardEvents: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1TimecardEvent]
	public typealias paramType = Params
	public struct Params {
		let timecard_id: String
		public init(timecard_id: String) {
			self.timecard_id = timecard_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/timecards/\(inputs.timecard_id)/events"
	}
}

public struct V1ListBankAccounts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1BankAccount]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/bank-accounts"
	}
}

public struct V1RetrieveBankAccount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1BankAccount
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let bank_account_id: String
		public init(location_id: String, bank_account_id: String) {
			self.location_id = location_id
			self.bank_account_id = bank_account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/bank-accounts/\(inputs.bank_account_id)"
	}
}

public struct V1ListCashDrawerShifts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1CashDrawerShift]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/cash-drawer-shifts"
	}
}

public struct V1RetrieveCashDrawerShift: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1CashDrawerShift
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let shift_id: String
		public init(location_id: String, shift_id: String) {
			self.location_id = location_id
			self.shift_id = shift_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/cash-drawer-shifts/\(inputs.shift_id)"
	}
}

public struct V1ListCategories: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Category]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/categories"
	}
}

public struct V1ListDiscounts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Discount]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/discounts"
	}
}

public struct V1ListFees: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Fee]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/fees"
	}
}

public struct V1ListInventory: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1InventoryEntry]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/inventory"
	}
}

public struct V1AdjustInventory: SquareAPIEndpoint {
	public typealias inputType = V1AdjustInventoryRequest
	public typealias outputType = V1InventoryEntry
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let variation_id: String
		public init(location_id: String, variation_id: String) {
			self.location_id = location_id
			self.variation_id = variation_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/inventory/\(inputs.variation_id)"
	}
}

public struct V1ListItems: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Item]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/items"
	}
}

public struct V1RetrieveItem: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1Item
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let item_id: String
		public init(location_id: String, item_id: String) {
			self.location_id = location_id
			self.item_id = item_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/items/\(inputs.item_id)"
	}
}

public struct V1CreateVariation: SquareAPIEndpoint {
	public typealias inputType = V1Variation
	public typealias outputType = V1Variation
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let item_id: String
		public init(location_id: String, item_id: String) {
			self.location_id = location_id
			self.item_id = item_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/items/\(inputs.item_id)/variations"
	}
}

public struct V1ListModifierLists: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1ModifierList]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/modifier-lists"
	}
}

public struct V1RetrieveModifierList: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1ModifierList
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let modifier_list_id: String
		public init(location_id: String, modifier_list_id: String) {
			self.location_id = location_id
			self.modifier_list_id = modifier_list_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/modifier-lists/\(inputs.modifier_list_id)"
	}
}

public struct V1CreateModifierOption: SquareAPIEndpoint {
	public typealias inputType = V1ModifierOption
	public typealias outputType = V1ModifierOption
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let modifier_list_id: String
		public init(location_id: String, modifier_list_id: String) {
			self.location_id = location_id
			self.modifier_list_id = modifier_list_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/modifier-lists/\(inputs.modifier_list_id)/modifier-options"
	}
}

public struct V1ListOrders: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Order]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/orders"
	}
}

public struct V1RetrieveOrder: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1Order
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let order_id: String
		public init(location_id: String, order_id: String) {
			self.location_id = location_id
			self.order_id = order_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/orders/\(inputs.order_id)"
	}
}

public struct V1ListPages: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Page]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/pages"
	}
}

public struct V1ListPayments: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Payment]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/payments"
	}
}

public struct V1RetrievePayment: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1Payment
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let payment_id: String
		public init(location_id: String, payment_id: String) {
			self.location_id = location_id
			self.payment_id = payment_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/payments/\(inputs.payment_id)"
	}
}

public struct V1ListRefunds: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Refund]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/refunds"
	}
}

public struct V1ListSettlements: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Settlement]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/settlements"
	}
}

public struct V1RetrieveSettlement: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1Settlement
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let settlement_id: String
		public init(location_id: String, settlement_id: String) {
			self.location_id = location_id
			self.settlement_id = settlement_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/settlements/\(inputs.settlement_id)"
	}
}

public struct RegisterDomain: SquareAPIEndpoint {
	public typealias inputType = RegisterDomainRequest
	public typealias outputType = RegisterDomainResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/apple-pay/domains"
	}
}

public struct ListBankAccounts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListBankAccountsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bank-accounts"
	}
}

public struct GetBankAccountByV1Id: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetBankAccountByV1IdResponse
	public typealias paramType = Params
	public struct Params {
		let v1_bank_account_id: String
		public init(v1_bank_account_id: String) {
			self.v1_bank_account_id = v1_bank_account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bank-accounts/by-v1-id/\(inputs.v1_bank_account_id)"
	}
}

public struct GetBankAccount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetBankAccountResponse
	public typealias paramType = Params
	public struct Params {
		let bank_account_id: String
		public init(bank_account_id: String) {
			self.bank_account_id = bank_account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bank-accounts/\(inputs.bank_account_id)"
	}
}

public struct CreateBooking: SquareAPIEndpoint {
	public typealias inputType = CreateBookingRequest
	public typealias outputType = CreateBookingResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings"
	}
}

public struct SearchAvailability: SquareAPIEndpoint {
	public typealias inputType = SearchAvailabilityRequest
	public typealias outputType = SearchAvailabilityResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings/availability/search"
	}
}

public struct RetrieveBusinessBookingProfile: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveBusinessBookingProfileResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings/business-booking-profile"
	}
}

public struct ListTeamMemberBookingProfiles: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListTeamMemberBookingProfilesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bookings/team-member-booking-profiles"
	}
}

public struct RetrieveTeamMemberBookingProfile: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveTeamMemberBookingProfileResponse
	public typealias paramType = Params
	public struct Params {
		let team_member_id: String
		public init(team_member_id: String) {
			self.team_member_id = team_member_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bookings/team-member-booking-profiles/\(inputs.team_member_id)"
	}
}

public struct RetrieveBooking: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveBookingResponse
	public typealias paramType = Params
	public struct Params {
		let booking_id: String
		public init(booking_id: String) {
			self.booking_id = booking_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bookings/\(inputs.booking_id)"
	}
}

public struct CancelBooking: SquareAPIEndpoint {
	public typealias inputType = CancelBookingRequest
	public typealias outputType = CancelBookingResponse
	public typealias paramType = Params
	public struct Params {
		let booking_id: String
		public init(booking_id: String) {
			self.booking_id = booking_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bookings/\(inputs.booking_id)/cancel"
	}
}

public struct ListCashDrawerShifts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCashDrawerShiftsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/cash-drawers/shifts"
	}
}

public struct RetrieveCashDrawerShift: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveCashDrawerShiftResponse
	public typealias paramType = Params
	public struct Params {
		let shift_id: String
		public init(shift_id: String) {
			self.shift_id = shift_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/cash-drawers/shifts/\(inputs.shift_id)"
	}
}

public struct ListCashDrawerShiftEvents: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCashDrawerShiftEventsResponse
	public typealias paramType = Params
	public struct Params {
		let shift_id: String
		public init(shift_id: String) {
			self.shift_id = shift_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/cash-drawers/shifts/\(inputs.shift_id)/events"
	}
}

public struct BatchDeleteCatalogObjects: SquareAPIEndpoint {
	public typealias inputType = BatchDeleteCatalogObjectsRequest
	public typealias outputType = BatchDeleteCatalogObjectsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/batch-delete"
	}
}

public struct BatchRetrieveCatalogObjects: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveCatalogObjectsRequest
	public typealias outputType = BatchRetrieveCatalogObjectsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/batch-retrieve"
	}
}

public struct BatchUpsertCatalogObjects: SquareAPIEndpoint {
	public typealias inputType = BatchUpsertCatalogObjectsRequest
	public typealias outputType = BatchUpsertCatalogObjectsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/batch-upsert"
	}
}

public struct CatalogInfo: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = CatalogInfoResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/info"
	}
}

public struct ListCatalog: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCatalogResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/list"
	}
}

public struct UpsertCatalogObject: SquareAPIEndpoint {
	public typealias inputType = UpsertCatalogObjectRequest
	public typealias outputType = UpsertCatalogObjectResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/object"
	}
}

public struct RetrieveCatalogObject: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveCatalogObjectResponse
	public typealias paramType = Params
	public struct Params {
		let object_id: String
		public init(object_id: String) {
			self.object_id = object_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/catalog/object/\(inputs.object_id)"
	}
}

public struct SearchCatalogObjects: SquareAPIEndpoint {
	public typealias inputType = SearchCatalogObjectsRequest
	public typealias outputType = SearchCatalogObjectsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/search"
	}
}

public struct SearchCatalogItems: SquareAPIEndpoint {
	public typealias inputType = SearchCatalogItemsRequest
	public typealias outputType = SearchCatalogItemsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/search-catalog-items"
	}
}

public struct UpdateItemModifierLists: SquareAPIEndpoint {
	public typealias inputType = UpdateItemModifierListsRequest
	public typealias outputType = UpdateItemModifierListsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/update-item-modifier-lists"
	}
}

public struct UpdateItemTaxes: SquareAPIEndpoint {
	public typealias inputType = UpdateItemTaxesRequest
	public typealias outputType = UpdateItemTaxesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/update-item-taxes"
	}
}

public struct ListCustomers: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCustomersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers"
	}
}

public struct ListCustomerGroups: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCustomerGroupsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers/groups"
	}
}

public struct RetrieveCustomerGroup: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveCustomerGroupResponse
	public typealias paramType = Params
	public struct Params {
		let group_id: String
		public init(group_id: String) {
			self.group_id = group_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/customers/groups/\(inputs.group_id)"
	}
}

public struct SearchCustomers: SquareAPIEndpoint {
	public typealias inputType = SearchCustomersRequest
	public typealias outputType = SearchCustomersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers/search"
	}
}

public struct ListCustomerSegments: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCustomerSegmentsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/customers/segments"
	}
}

public struct RetrieveCustomerSegment: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveCustomerSegmentResponse
	public typealias paramType = Params
	public struct Params {
		let segment_id: String
		public init(segment_id: String) {
			self.segment_id = segment_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/customers/segments/\(inputs.segment_id)"
	}
}

public struct RetrieveCustomer: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveCustomerResponse
	public typealias paramType = Params
	public struct Params {
		let customer_id: String
		public init(customer_id: String) {
			self.customer_id = customer_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/customers/\(inputs.customer_id)"
	}
}

public struct CreateCustomerCard: SquareAPIEndpoint {
	public typealias inputType = CreateCustomerCardRequest
	public typealias outputType = CreateCustomerCardResponse
	public typealias paramType = Params
	public struct Params {
		let customer_id: String
		public init(customer_id: String) {
			self.customer_id = customer_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/customers/\(inputs.customer_id)/cards"
	}
}

public struct ListDeviceCodes: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListDeviceCodesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/devices/codes"
	}
}

public struct GetDeviceCode: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetDeviceCodeResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/devices/codes/\(inputs.id)"
	}
}

public struct ListDisputes: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListDisputesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/disputes"
	}
}

public struct RetrieveDispute: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveDisputeResponse
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
		public init(dispute_id: String) {
			self.dispute_id = dispute_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)"
	}
}

public struct AcceptDispute: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = AcceptDisputeResponse
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
		public init(dispute_id: String) {
			self.dispute_id = dispute_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)/accept"
	}
}

public struct ListDisputeEvidence: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListDisputeEvidenceResponse
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
		public init(dispute_id: String) {
			self.dispute_id = dispute_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)/evidence"
	}
}

public struct RetrieveDisputeEvidence: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveDisputeEvidenceResponse
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
		let evidence_id: String
		public init(dispute_id: String, evidence_id: String) {
			self.dispute_id = dispute_id
			self.evidence_id = evidence_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)/evidence/\(inputs.evidence_id)"
	}
}

public struct CreateDisputeEvidenceText: SquareAPIEndpoint {
	public typealias inputType = CreateDisputeEvidenceTextRequest
	public typealias outputType = CreateDisputeEvidenceTextResponse
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
		public init(dispute_id: String) {
			self.dispute_id = dispute_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)/evidence_text"
	}
}

public struct SubmitEvidence: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = SubmitEvidenceResponse
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
		public init(dispute_id: String) {
			self.dispute_id = dispute_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/disputes/\(inputs.dispute_id)/submit-evidence"
	}
}

public struct ListEmployees: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListEmployeesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/employees"
	}
}

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

public struct RetrieveInventoryAdjustment: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveInventoryAdjustmentResponse
	public typealias paramType = Params
	public struct Params {
		let adjustment_id: String
		public init(adjustment_id: String) {
			self.adjustment_id = adjustment_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/inventory/adjustment/\(inputs.adjustment_id)"
	}
}

public struct BatchChangeInventory: SquareAPIEndpoint {
	public typealias inputType = BatchChangeInventoryRequest
	public typealias outputType = BatchChangeInventoryResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/inventory/batch-change"
	}
}

public struct BatchRetrieveInventoryChanges: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveInventoryChangesRequest
	public typealias outputType = BatchRetrieveInventoryChangesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/inventory/batch-retrieve-changes"
	}
}

public struct BatchRetrieveInventoryCounts: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveInventoryCountsRequest
	public typealias outputType = BatchRetrieveInventoryCountsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/inventory/batch-retrieve-counts"
	}
}

public struct RetrieveInventoryPhysicalCount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveInventoryPhysicalCountResponse
	public typealias paramType = Params
	public struct Params {
		let physical_count_id: String
		public init(physical_count_id: String) {
			self.physical_count_id = physical_count_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/inventory/physical-count/\(inputs.physical_count_id)"
	}
}

public struct RetrieveInventoryCount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveInventoryCountResponse
	public typealias paramType = Params
	public struct Params {
		let catalog_object_id: String
		public init(catalog_object_id: String) {
			self.catalog_object_id = catalog_object_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/inventory/\(inputs.catalog_object_id)"
	}
}

public struct RetrieveInventoryChanges: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveInventoryChangesResponse
	public typealias paramType = Params
	public struct Params {
		let catalog_object_id: String
		public init(catalog_object_id: String) {
			self.catalog_object_id = catalog_object_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/inventory/\(inputs.catalog_object_id)/changes"
	}
}

public struct ListInvoices: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListInvoicesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/invoices"
	}
}

public struct SearchInvoices: SquareAPIEndpoint {
	public typealias inputType = SearchInvoicesRequest
	public typealias outputType = SearchInvoicesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/invoices/search"
	}
}

public struct GetInvoice: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetInvoiceResponse
	public typealias paramType = Params
	public struct Params {
		let invoice_id: String
		public init(invoice_id: String) {
			self.invoice_id = invoice_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/invoices/\(inputs.invoice_id)"
	}
}

public struct CancelInvoice: SquareAPIEndpoint {
	public typealias inputType = CancelInvoiceRequest
	public typealias outputType = CancelInvoiceResponse
	public typealias paramType = Params
	public struct Params {
		let invoice_id: String
		public init(invoice_id: String) {
			self.invoice_id = invoice_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/invoices/\(inputs.invoice_id)/cancel"
	}
}

public struct PublishInvoice: SquareAPIEndpoint {
	public typealias inputType = PublishInvoiceRequest
	public typealias outputType = PublishInvoiceResponse
	public typealias paramType = Params
	public struct Params {
		let invoice_id: String
		public init(invoice_id: String) {
			self.invoice_id = invoice_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/invoices/\(inputs.invoice_id)/publish"
	}
}

public struct ListBreakTypes: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListBreakTypesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/break-types"
	}
}

public struct GetBreakType: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetBreakTypeResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/labor/break-types/\(inputs.id)"
	}
}

public struct ListEmployeeWages: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListEmployeeWagesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/employee-wages"
	}
}

public struct GetEmployeeWage: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetEmployeeWageResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/labor/employee-wages/\(inputs.id)"
	}
}

public struct CreateShift: SquareAPIEndpoint {
	public typealias inputType = CreateShiftRequest
	public typealias outputType = CreateShiftResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/shifts"
	}
}

public struct SearchShifts: SquareAPIEndpoint {
	public typealias inputType = SearchShiftsRequest
	public typealias outputType = SearchShiftsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/shifts/search"
	}
}

public struct GetShift: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetShiftResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/labor/shifts/\(inputs.id)"
	}
}

public struct ListTeamMemberWages: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListTeamMemberWagesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/team-member-wages"
	}
}

public struct GetTeamMemberWage: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetTeamMemberWageResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/labor/team-member-wages/\(inputs.id)"
	}
}

public struct ListWorkweekConfigs: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListWorkweekConfigsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/labor/workweek-configs"
	}
}

public struct ListLocations: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListLocationsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/locations"
	}
}

public struct RetrieveLocation: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveLocationResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)"
	}
}

public struct CreateCheckout: SquareAPIEndpoint {
	public typealias inputType = CreateCheckoutRequest
	public typealias outputType = CreateCheckoutResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/checkouts"
	}
}

public struct ListRefunds: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListRefundsResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/refunds"
	}
}

public struct ListTransactions: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListTransactionsResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/transactions"
	}
}

public struct RetrieveTransaction: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveTransactionResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let transaction_id: String
		public init(location_id: String, transaction_id: String) {
			self.location_id = location_id
			self.transaction_id = transaction_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/transactions/\(inputs.transaction_id)"
	}
}

public struct CaptureTransaction: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CaptureTransactionResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let transaction_id: String
		public init(location_id: String, transaction_id: String) {
			self.location_id = location_id
			self.transaction_id = transaction_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/transactions/\(inputs.transaction_id)/capture"
	}
}

public struct CreateRefund: SquareAPIEndpoint {
	public typealias inputType = CreateRefundRequest
	public typealias outputType = CreateRefundResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let transaction_id: String
		public init(location_id: String, transaction_id: String) {
			self.location_id = location_id
			self.transaction_id = transaction_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/transactions/\(inputs.transaction_id)/refund"
	}
}

public struct VoidTransaction: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = VoidTransactionResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let transaction_id: String
		public init(location_id: String, transaction_id: String) {
			self.location_id = location_id
			self.transaction_id = transaction_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/locations/\(inputs.location_id)/transactions/\(inputs.transaction_id)/void"
	}
}

public struct CreateLoyaltyAccount: SquareAPIEndpoint {
	public typealias inputType = CreateLoyaltyAccountRequest
	public typealias outputType = CreateLoyaltyAccountResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/accounts"
	}
}

public struct SearchLoyaltyAccounts: SquareAPIEndpoint {
	public typealias inputType = SearchLoyaltyAccountsRequest
	public typealias outputType = SearchLoyaltyAccountsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/accounts/search"
	}
}

public struct RetrieveLoyaltyAccount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveLoyaltyAccountResponse
	public typealias paramType = Params
	public struct Params {
		let account_id: String
		public init(account_id: String) {
			self.account_id = account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/accounts/\(inputs.account_id)"
	}
}

public struct AccumulateLoyaltyPoints: SquareAPIEndpoint {
	public typealias inputType = AccumulateLoyaltyPointsRequest
	public typealias outputType = AccumulateLoyaltyPointsResponse
	public typealias paramType = Params
	public struct Params {
		let account_id: String
		public init(account_id: String) {
			self.account_id = account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/accounts/\(inputs.account_id)/accumulate"
	}
}

public struct AdjustLoyaltyPoints: SquareAPIEndpoint {
	public typealias inputType = AdjustLoyaltyPointsRequest
	public typealias outputType = AdjustLoyaltyPointsResponse
	public typealias paramType = Params
	public struct Params {
		let account_id: String
		public init(account_id: String) {
			self.account_id = account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/accounts/\(inputs.account_id)/adjust"
	}
}

public struct SearchLoyaltyEvents: SquareAPIEndpoint {
	public typealias inputType = SearchLoyaltyEventsRequest
	public typealias outputType = SearchLoyaltyEventsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/events/search"
	}
}

public struct ListLoyaltyPrograms: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListLoyaltyProgramsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/programs"
	}
}

public struct CalculateLoyaltyPoints: SquareAPIEndpoint {
	public typealias inputType = CalculateLoyaltyPointsRequest
	public typealias outputType = CalculateLoyaltyPointsResponse
	public typealias paramType = Params
	public struct Params {
		let program_id: String
		public init(program_id: String) {
			self.program_id = program_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/programs/\(inputs.program_id)/calculate"
	}
}

public struct CreateLoyaltyReward: SquareAPIEndpoint {
	public typealias inputType = CreateLoyaltyRewardRequest
	public typealias outputType = CreateLoyaltyRewardResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/rewards"
	}
}

public struct SearchLoyaltyRewards: SquareAPIEndpoint {
	public typealias inputType = SearchLoyaltyRewardsRequest
	public typealias outputType = SearchLoyaltyRewardsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/loyalty/rewards/search"
	}
}

public struct RetrieveLoyaltyReward: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveLoyaltyRewardResponse
	public typealias paramType = Params
	public struct Params {
		let reward_id: String
		public init(reward_id: String) {
			self.reward_id = reward_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/rewards/\(inputs.reward_id)"
	}
}

public struct RedeemLoyaltyReward: SquareAPIEndpoint {
	public typealias inputType = RedeemLoyaltyRewardRequest
	public typealias outputType = RedeemLoyaltyRewardResponse
	public typealias paramType = Params
	public struct Params {
		let reward_id: String
		public init(reward_id: String) {
			self.reward_id = reward_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/loyalty/rewards/\(inputs.reward_id)/redeem"
	}
}

public struct ListMerchants: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListMerchantsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/merchants"
	}
}

public struct RetrieveMerchant: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveMerchantResponse
	public typealias paramType = Params
	public struct Params {
		let merchant_id: String
		public init(merchant_id: String) {
			self.merchant_id = merchant_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/merchants/\(inputs.merchant_id)"
	}
}

public struct CreateOrder: SquareAPIEndpoint {
	public typealias inputType = CreateOrderRequest
	public typealias outputType = CreateOrderResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders"
	}
}

public struct BatchRetrieveOrders: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveOrdersRequest
	public typealias outputType = BatchRetrieveOrdersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/batch-retrieve"
	}
}

public struct CalculateOrder: SquareAPIEndpoint {
	public typealias inputType = CalculateOrderRequest
	public typealias outputType = CalculateOrderResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/calculate"
	}
}

public struct SearchOrders: SquareAPIEndpoint {
	public typealias inputType = SearchOrdersRequest
	public typealias outputType = SearchOrdersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/orders/search"
	}
}

public struct RetrieveOrder: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveOrderResponse
	public typealias paramType = Params
	public struct Params {
		let order_id: String
		public init(order_id: String) {
			self.order_id = order_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/orders/\(inputs.order_id)"
	}
}

public struct PayOrder: SquareAPIEndpoint {
	public typealias inputType = PayOrderRequest
	public typealias outputType = PayOrderResponse
	public typealias paramType = Params
	public struct Params {
		let order_id: String
		public init(order_id: String) {
			self.order_id = order_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/orders/\(inputs.order_id)/pay"
	}
}

public struct ListPayments: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListPaymentsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/payments"
	}
}

public struct CancelPaymentByIdempotencyKey: SquareAPIEndpoint {
	public typealias inputType = CancelPaymentByIdempotencyKeyRequest
	public typealias outputType = CancelPaymentByIdempotencyKeyResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/payments/cancel"
	}
}

public struct GetPayment: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetPaymentResponse
	public typealias paramType = Params
	public struct Params {
		let payment_id: String
		public init(payment_id: String) {
			self.payment_id = payment_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/payments/\(inputs.payment_id)"
	}
}

public struct CancelPayment: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CancelPaymentResponse
	public typealias paramType = Params
	public struct Params {
		let payment_id: String
		public init(payment_id: String) {
			self.payment_id = payment_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/payments/\(inputs.payment_id)/cancel"
	}
}

public struct CompletePayment: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CompletePaymentResponse
	public typealias paramType = Params
	public struct Params {
		let payment_id: String
		public init(payment_id: String) {
			self.payment_id = payment_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/payments/\(inputs.payment_id)/complete"
	}
}

public struct ListPaymentRefunds: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListPaymentRefundsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/refunds"
	}
}

public struct GetPaymentRefund: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetPaymentRefundResponse
	public typealias paramType = Params
	public struct Params {
		let refund_id: String
		public init(refund_id: String) {
			self.refund_id = refund_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/refunds/\(inputs.refund_id)"
	}
}

public struct CreateSubscription: SquareAPIEndpoint {
	public typealias inputType = CreateSubscriptionRequest
	public typealias outputType = CreateSubscriptionResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/subscriptions"
	}
}

public struct SearchSubscriptions: SquareAPIEndpoint {
	public typealias inputType = SearchSubscriptionsRequest
	public typealias outputType = SearchSubscriptionsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/subscriptions/search"
	}
}

public struct RetrieveSubscription: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveSubscriptionResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/subscriptions/\(inputs.subscription_id)"
	}
}

public struct CancelSubscription: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CancelSubscriptionResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/subscriptions/\(inputs.subscription_id)/cancel"
	}
}

public struct ListSubscriptionEvents: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListSubscriptionEventsResponse
	public typealias paramType = Params
	public struct Params {
		let subscription_id: String
		public init(subscription_id: String) {
			self.subscription_id = subscription_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/subscriptions/\(inputs.subscription_id)/events"
	}
}

public struct CreateTeamMember: SquareAPIEndpoint {
	public typealias inputType = CreateTeamMemberRequest
	public typealias outputType = CreateTeamMemberResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members"
	}
}

public struct BulkCreateTeamMembers: SquareAPIEndpoint {
	public typealias inputType = BulkCreateTeamMembersRequest
	public typealias outputType = BulkCreateTeamMembersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members/bulk-create"
	}
}

public struct BulkUpdateTeamMembers: SquareAPIEndpoint {
	public typealias inputType = BulkUpdateTeamMembersRequest
	public typealias outputType = BulkUpdateTeamMembersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members/bulk-update"
	}
}

public struct SearchTeamMembers: SquareAPIEndpoint {
	public typealias inputType = SearchTeamMembersRequest
	public typealias outputType = SearchTeamMembersResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/team-members/search"
	}
}

public struct RetrieveTeamMember: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveTeamMemberResponse
	public typealias paramType = Params
	public struct Params {
		let team_member_id: String
		public init(team_member_id: String) {
			self.team_member_id = team_member_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/team-members/\(inputs.team_member_id)"
	}
}

public struct RetrieveWageSetting: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveWageSettingResponse
	public typealias paramType = Params
	public struct Params {
		let team_member_id: String
		public init(team_member_id: String) {
			self.team_member_id = team_member_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/team-members/\(inputs.team_member_id)/wage-setting"
	}
}

public struct CreateTerminalCheckout: SquareAPIEndpoint {
	public typealias inputType = CreateTerminalCheckoutRequest
	public typealias outputType = CreateTerminalCheckoutResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/terminals/checkouts"
	}
}

public struct SearchTerminalCheckouts: SquareAPIEndpoint {
	public typealias inputType = SearchTerminalCheckoutsRequest
	public typealias outputType = SearchTerminalCheckoutsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/terminals/checkouts/search"
	}
}

public struct GetTerminalCheckout: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetTerminalCheckoutResponse
	public typealias paramType = Params
	public struct Params {
		let checkout_id: String
		public init(checkout_id: String) {
			self.checkout_id = checkout_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/terminals/checkouts/\(inputs.checkout_id)"
	}
}

public struct CancelTerminalCheckout: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CancelTerminalCheckoutResponse
	public typealias paramType = Params
	public struct Params {
		let checkout_id: String
		public init(checkout_id: String) {
			self.checkout_id = checkout_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/terminals/checkouts/\(inputs.checkout_id)/cancel"
	}
}

public struct CreateTerminalRefund: SquareAPIEndpoint {
	public typealias inputType = CreateTerminalRefundRequest
	public typealias outputType = CreateTerminalRefundResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/terminals/refunds"
	}
}

public struct SearchTerminalRefunds: SquareAPIEndpoint {
	public typealias inputType = SearchTerminalRefundsRequest
	public typealias outputType = SearchTerminalRefundsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/terminals/refunds/search"
	}
}

public struct GetTerminalRefund: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetTerminalRefundResponse
	public typealias paramType = Params
	public struct Params {
		let terminal_refund_id: String
		public init(terminal_refund_id: String) {
			self.terminal_refund_id = terminal_refund_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/terminals/refunds/\(inputs.terminal_refund_id)"
	}
}

public struct CancelTerminalRefund: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = CancelTerminalRefundResponse
	public typealias paramType = Params
	public struct Params {
		let terminal_refund_id: String
		public init(terminal_refund_id: String) {
			self.terminal_refund_id = terminal_refund_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/terminals/refunds/\(inputs.terminal_refund_id)/cancel"
	}
}

