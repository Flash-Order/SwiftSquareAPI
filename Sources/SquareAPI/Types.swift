
/// Basic info about the API
public struct SquareAPIInfo {
	public static var version: String { return "2021-02-26" }

	public static var host: String { return "connect.squareup.com" }
}

/// An empty structure for a useful codable placeholder
public struct Empty: Codable {
	public init() { }
}

/// Defines the request parameters for the `AcceptDispute` endpoint.
public struct AcceptDisputeRequest: Codable {

	/// Defines the request parameters for the `AcceptDispute` endpoint.
	public init() {
	}
}

/// Defines the fields in an `AcceptDispute` response.
public struct AcceptDisputeResponse: Codable {
	/// Details about the accepted dispute.
	public var dispute: Dispute?
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?

	/// Defines the fields in an `AcceptDispute` response.
	/// - Parameters:
	///   - dispute: Details about the accepted dispute.
	///   - errors: Information about errors encountered during the request.
	public init(dispute: Dispute? = nil, errors: [SquareError]? = nil) {
		self.dispute = dispute
		self.errors = errors
	}
}

/// A request to accumulate points for a purchase.
public struct AccumulateLoyaltyPointsRequest: Codable {
	/// The points to add to the account.  If you are using the Orders API to manage orders, you   specify the order ID. Otherwise, specify the  points to add.
	public var accumulate_points: LoyaltyEventAccumulatePoints
	/// A unique string that identifies the `AccumulateLoyaltyPoints` request.  Keys can be any valid string but must be unique for every request.
	public var idempotency_key: String
	/// The `location` where the purchase was made.
	public var location_id: String

	/// A request to accumulate points for a purchase.
	/// - Parameters:
	///   - accumulate_points: The points to add to the account.  If you are using the Orders API to manage orders, you   specify the order ID. Otherwise, specify the  points to add.
	///   - idempotency_key: A unique string that identifies the `AccumulateLoyaltyPoints` request.  Keys can be any valid string but must be unique for every request.
	///   - location_id: The `location` where the purchase was made.
	public init(accumulate_points: LoyaltyEventAccumulatePoints, idempotency_key: String, location_id: String) {
		self.accumulate_points = accumulate_points
		self.idempotency_key = idempotency_key
		self.location_id = location_id
	}
}

/// A response containing the resulting loyalty event.
public struct AccumulateLoyaltyPointsResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The resulting loyalty event.
	public var event: LoyaltyEvent?

	/// A response containing the resulting loyalty event.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - event: The resulting loyalty event.
	public init(errors: [SquareError]? = nil, event: LoyaltyEvent? = nil) {
		self.errors = errors
		self.event = event
	}
}

/// 
public enum ActionCancelReason: String, Codable {
	/// A person canceled the `TerminalCheckout` from a Square device.
	case BUYER_CANCELED
	/// A client canceled the `TerminalCheckout` using the API.
	case SELLER_CANCELED
	/// The `TerminalCheckout` timed out (see `deadline_duration` on the `TerminalCheckout`).
	case TIMED_OUT
}

/// Defines the fields that are included in the request body of a request to the [AddGroupToCustomer](#endpoint-addgrouptocustomer) endpoint.
public struct AddGroupToCustomerRequest: Codable {

	/// Defines the fields that are included in the request body of a request to the [AddGroupToCustomer](#endpoint-addgrouptocustomer) endpoint.
	public init() {
	}
}

/// Defines the fields that are included in the response body of a request to the [AddGroupToCustomer](#endpoint-addgrouptocustomer) endpoint.
public struct AddGroupToCustomerResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// Defines the fields that are included in the response body of a request to the [AddGroupToCustomer](#endpoint-addgrouptocustomer) endpoint.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	public init(errors: [SquareError]? = nil) {
		self.errors = errors
	}
}

/// Represents an additional recipient (other than the merchant) receiving a portion of this tender.
public struct AdditionalRecipient: Codable {
	/// The amount of money distributed to the recipient.
	public var amount_money: Money
	/// The description of the additional recipient.
	public var description: String
	/// The location ID for a recipient (other than the merchant) receiving a portion of this tender.
	public var location_id: String
	/// The unique ID for this `AdditionalRecipientReceivable`, assigned by the server.
	public var receivable_id: String?

	/// Represents an additional recipient (other than the merchant) receiving a portion of this tender.
	/// - Parameters:
	///   - amount_money: The amount of money distributed to the recipient.
	///   - description: The description of the additional recipient.
	///   - location_id: The location ID for a recipient (other than the merchant) receiving a portion of this tender.
	///   - receivable_id: The unique ID for this `AdditionalRecipientReceivable`, assigned by the server.
	public init(amount_money: Money, description: String, location_id: String, receivable_id: String? = nil) {
		self.amount_money = amount_money
		self.description = description
		self.location_id = location_id
		self.receivable_id = receivable_id
	}
}

/// Represents a physical address.
public struct Address: Codable {
	/// The first line of the address.  Fields that start with `address_line` provide the address's most specific details, like street number, street name, and building name. They do *not* provide less specific details like city, state/province, or country (these details are provided in other fields).
	public var address_line_1: String?
	/// The second line of the address, if any.
	public var address_line_2: String?
	/// The third line of the address, if any.
	public var address_line_3: String?
	/// A civil entity within the address's country. In the US, this is the state.
	public var administrative_district_level_1: String?
	/// A civil entity within the address's `administrative_district_level_1`. In the US, this is the county.
	public var administrative_district_level_2: String?
	/// A civil entity within the address's `administrative_district_level_2`, if any.
	public var administrative_district_level_3: String?
	/// The address's country, in ISO 3166-1-alpha-2 format. See [Country](#type-country) for possible values
	public var country: Country?
	/// Optional first name when it's representing recipient.
	public var first_name: String?
	/// Optional last name when it's representing recipient.
	public var last_name: String?
	/// The city or town of the address.
	public var locality: String?
	/// Optional organization name when it's representing recipient.
	public var organization: String?
	/// The address's postal code.
	public var postal_code: String?
	/// A civil region within the address's `locality`, if any.
	public var sublocality: String?
	/// A civil region within the address's `sublocality`, if any.
	public var sublocality_2: String?
	/// A civil region within the address's `sublocality_2`, if any.
	public var sublocality_3: String?

	/// Represents a physical address.
	/// - Parameters:
	///   - address_line_1: The first line of the address.  Fields that start with `address_line` provide the address's most specific details, like street number, street name, and building name. They do *not* provide less specific details like city, state/province, or country (these details are provided in other fields).
	///   - address_line_2: The second line of the address, if any.
	///   - address_line_3: The third line of the address, if any.
	///   - administrative_district_level_1: A civil entity within the address's country. In the US, this is the state.
	///   - administrative_district_level_2: A civil entity within the address's `administrative_district_level_1`. In the US, this is the county.
	///   - administrative_district_level_3: A civil entity within the address's `administrative_district_level_2`, if any.
	///   - country: The address's country, in ISO 3166-1-alpha-2 format. See [Country](#type-country) for possible values
	///   - first_name: Optional first name when it's representing recipient.
	///   - last_name: Optional last name when it's representing recipient.
	///   - locality: The city or town of the address.
	///   - organization: Optional organization name when it's representing recipient.
	///   - postal_code: The address's postal code.
	///   - sublocality: A civil region within the address's `locality`, if any.
	///   - sublocality_2: A civil region within the address's `sublocality`, if any.
	///   - sublocality_3: A civil region within the address's `sublocality_2`, if any.
	public init(address_line_1: String? = nil, address_line_2: String? = nil, address_line_3: String? = nil, administrative_district_level_1: String? = nil, administrative_district_level_2: String? = nil, administrative_district_level_3: String? = nil, country: Country? = nil, first_name: String? = nil, last_name: String? = nil, locality: String? = nil, organization: String? = nil, postal_code: String? = nil, sublocality: String? = nil, sublocality_2: String? = nil, sublocality_3: String? = nil) {
		self.address_line_1 = address_line_1
		self.address_line_2 = address_line_2
		self.address_line_3 = address_line_3
		self.administrative_district_level_1 = administrative_district_level_1
		self.administrative_district_level_2 = administrative_district_level_2
		self.administrative_district_level_3 = administrative_district_level_3
		self.country = country
		self.first_name = first_name
		self.last_name = last_name
		self.locality = locality
		self.organization = organization
		self.postal_code = postal_code
		self.sublocality = sublocality
		self.sublocality_2 = sublocality_2
		self.sublocality_3 = sublocality_3
	}
}

/// A request to adjust (add or subtract) points manually.
public struct AdjustLoyaltyPointsRequest: Codable {
	/// The points to adjust (add or subtract) and the reason for the adjustment.
	public var adjust_points: LoyaltyEventAdjustPoints
	/// A unique string that identifies this `AdjustLoyaltyPoints` request.  Keys can be any valid string, but must be unique for every request.
	public var idempotency_key: String

	/// A request to adjust (add or subtract) points manually.
	/// - Parameters:
	///   - adjust_points: The points to adjust (add or subtract) and the reason for the adjustment.
	///   - idempotency_key: A unique string that identifies this `AdjustLoyaltyPoints` request.  Keys can be any valid string, but must be unique for every request.
	public init(adjust_points: LoyaltyEventAdjustPoints, idempotency_key: String) {
		self.adjust_points = adjust_points
		self.idempotency_key = idempotency_key
	}
}

/// A response that includes the loyalty event that  resulted from the successful API call.
public struct AdjustLoyaltyPointsResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The resulting event data for adjusting points.
	public var event: LoyaltyEvent?

	/// A response that includes the loyalty event that  resulted from the successful API call.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - event: The resulting event data for adjusting points.
	public init(errors: [SquareError]? = nil, event: LoyaltyEvent? = nil) {
		self.errors = errors
		self.event = event
	}
}

/// Defines an appointment segment of a booking.
public struct AppointmentSegment: Codable {
	/// The time span in minutes of an appointment segment.
	public var duration_minutes: Int
	/// The ID of the `CatalogItemVariation` object representing the service booked in this segment.
	public var service_variation_id: String
	/// The current version of the item variation representing the service booked in this segment.
	public var service_variation_version: Int
	/// The ID of the `TeamMember` object representing the team member booked in this segment.
	public var team_member_id: String

	/// Defines an appointment segment of a booking.
	/// - Parameters:
	///   - duration_minutes: The time span in minutes of an appointment segment.
	///   - service_variation_id: The ID of the `CatalogItemVariation` object representing the service booked in this segment.
	///   - service_variation_version: The current version of the item variation representing the service booked in this segment.
	///   - team_member_id: The ID of the `TeamMember` object representing the team member booked in this segment.
	public init(duration_minutes: Int, service_variation_id: String, service_variation_version: Int, team_member_id: String) {
		self.duration_minutes = duration_minutes
		self.service_variation_id = service_variation_id
		self.service_variation_version = service_variation_version
		self.team_member_id = team_member_id
	}
}

/// Describes a slot available for booking, encapsulating appointment segments, the location and starting time.
public struct Availability: Codable {
	/// The list of appointment segments available for booking
	public var appointment_segments: [AppointmentSegment]?
	/// The ID of the location available for booking.
	public var location_id: String?
	/// The RFC-3339 timestamp specifying the beginning time of the slot available for booking.
	public var start_at: Timestamp?

	/// Describes a slot available for booking, encapsulating appointment segments, the location and starting time.
	/// - Parameters:
	///   - appointment_segments: The list of appointment segments available for booking
	///   - location_id: The ID of the location available for booking.
	///   - start_at: The RFC-3339 timestamp specifying the beginning time of the slot available for booking.
	public init(appointment_segments: [AppointmentSegment]? = nil, location_id: String? = nil, start_at: Timestamp? = nil) {
		self.appointment_segments = appointment_segments
		self.location_id = location_id
		self.start_at = start_at
	}
}

/// Reflects the current status of a balance payment.
public struct BalancePaymentDetails: Codable {
	/// The ID of the account used to fund the payment.
	public var account_id: String?
	/// The balance payment’s current state. The state can be COMPLETED or FAILED.
	public var status: String?

	/// Reflects the current status of a balance payment.
	/// - Parameters:
	///   - account_id: The ID of the account used to fund the payment.
	///   - status: The balance payment’s current state. The state can be COMPLETED or FAILED.
	public init(account_id: String? = nil, status: String? = nil) {
		self.account_id = account_id
		self.status = status
	}
}

/// Represents a bank account. For more information about  linking a bank account to a Square account, see  [Bank Accounts API](/docs/bank-accounts-api).
public struct BankAccount: Codable {
	/// The last few digits of the account number.
	public var account_number_suffix: String
	/// The financial purpose of the associated bank account. See [BankAccountType](#type-bankaccounttype) for possible values
	public var account_type: BankAccountType
	/// Read only. Name of actual financial institution.  For example "Bank of America".
	public var bank_name: String?
	/// The ISO 3166 Alpha-2 country code where the bank account is based. See [Country](#type-country) for possible values
	public var country: Country
	/// Indicates whether it is possible for Square to send money to this bank account.
	public var creditable: Bool
	/// The 3-character ISO 4217 currency code indicating the operating currency of the bank account. For example, the currency code for US dollars is `USD`. See [Currency](#type-currency) for possible values
	public var currency: Currency
	/// Reference identifier that will be displayed to UK bank account owners when collecting direct debit authorization. Only required for UK bank accounts.
	public var debit_mandate_reference_id: String?
	/// Indicates whether it is possible for Square to take money from this  bank account.
	public var debitable: Bool
	/// A Square-assigned, unique identifier for the bank account based on the account information. The account fingerprint can be used to compare account entries and determine if the they represent the same real-world bank account.
	public var fingerprint: String?
	/// Name of the account holder. This name must match the name  on the targeted bank account record.
	public var holder_name: String
	/// The unique, Square-issued identifier for the bank account.
	public var id: String
	/// The location to which the bank account belongs.
	public var location_id: String?
	/// Primary identifier for the bank. For more information, see  [Bank Accounts API](https://developer.squareup.com/docs/docs/bank-accounts-api).
	public var primary_bank_identification_number: String
	/// Client-provided identifier for linking the banking account to an entity in a third-party system (for example, a bank account number or a user identifier).
	public var reference_id: String?
	/// Secondary identifier for the bank. For more information, see  [Bank Accounts API](https://developer.squareup.com/docs/docs/bank-accounts-api).
	public var secondary_bank_identification_number: String?
	/// Read-only. The current verification status of this BankAccount object. See [BankAccountStatus](#type-bankaccountstatus) for possible values
	public var status: BankAccountStatus
	/// The current version of the `BankAccount`.
	public var version: Int?

	/// Represents a bank account. For more information about  linking a bank account to a Square account, see  [Bank Accounts API](/docs/bank-accounts-api).
	/// - Parameters:
	///   - account_number_suffix: The last few digits of the account number.
	///   - account_type: The financial purpose of the associated bank account. See [BankAccountType](#type-bankaccounttype) for possible values
	///   - bank_name: Read only. Name of actual financial institution.  For example "Bank of America".
	///   - country: The ISO 3166 Alpha-2 country code where the bank account is based. See [Country](#type-country) for possible values
	///   - creditable: Indicates whether it is possible for Square to send money to this bank account.
	///   - currency: The 3-character ISO 4217 currency code indicating the operating currency of the bank account. For example, the currency code for US dollars is `USD`. See [Currency](#type-currency) for possible values
	///   - debit_mandate_reference_id: Reference identifier that will be displayed to UK bank account owners when collecting direct debit authorization. Only required for UK bank accounts.
	///   - debitable: Indicates whether it is possible for Square to take money from this  bank account.
	///   - fingerprint: A Square-assigned, unique identifier for the bank account based on the account information. The account fingerprint can be used to compare account entries and determine if the they represent the same real-world bank account.
	///   - holder_name: Name of the account holder. This name must match the name  on the targeted bank account record.
	///   - id: The unique, Square-issued identifier for the bank account.
	///   - location_id: The location to which the bank account belongs.
	///   - primary_bank_identification_number: Primary identifier for the bank. For more information, see  [Bank Accounts API](https://developer.squareup.com/docs/docs/bank-accounts-api).
	///   - reference_id: Client-provided identifier for linking the banking account to an entity in a third-party system (for example, a bank account number or a user identifier).
	///   - secondary_bank_identification_number: Secondary identifier for the bank. For more information, see  [Bank Accounts API](https://developer.squareup.com/docs/docs/bank-accounts-api).
	///   - status: Read-only. The current verification status of this BankAccount object. See [BankAccountStatus](#type-bankaccountstatus) for possible values
	///   - version: The current version of the `BankAccount`.
	public init(account_number_suffix: String, account_type: BankAccountType, country: Country, creditable: Bool, currency: Currency, debitable: Bool, holder_name: String, id: String, primary_bank_identification_number: String, status: BankAccountStatus, bank_name: String? = nil, debit_mandate_reference_id: String? = nil, fingerprint: String? = nil, location_id: String? = nil, reference_id: String? = nil, secondary_bank_identification_number: String? = nil, version: Int? = nil) {
		self.account_number_suffix = account_number_suffix
		self.account_type = account_type
		self.country = country
		self.creditable = creditable
		self.currency = currency
		self.debitable = debitable
		self.holder_name = holder_name
		self.id = id
		self.primary_bank_identification_number = primary_bank_identification_number
		self.status = status
		self.bank_name = bank_name
		self.debit_mandate_reference_id = debit_mandate_reference_id
		self.fingerprint = fingerprint
		self.location_id = location_id
		self.reference_id = reference_id
		self.secondary_bank_identification_number = secondary_bank_identification_number
		self.version = version
	}
}

/// Indicates the current verification status of a `BankAccount` object.
public enum BankAccountStatus: String, Codable {
	/// Indicates that the verification process has started. Some features (for example, creditable or debitable) may be provisionally enabled on the bank account.
	case VERIFICATION_IN_PROGRESS
	/// Indicates that the bank account was successfully verified.
	case VERIFIED
	/// Indicates that the bank account is disabled and is permanently unusable for funds transfer. A bank account can be disabled because of a failed verification attempt or a failed deposit attempt.
	case DISABLED
}

/// Indicates the financial purpose of the bank account.
public enum BankAccountType: String, Codable {
	/// An account at a financial institution against which checks can be drawn by the account depositor.
	case CHECKING
	/// An account at a financial institution that pays interest but cannot be used directly as money in the narrow sense of a medium of exchange.
	case SAVINGS
	/// An account at a financial institution that contains a deposit of funds and/or securities.
	case INVESTMENT
	/// An account at a financial institution which cannot be described by the other types.
	case OTHER
	/// An account at a financial institution against which checks can be drawn specifically for business purposes (non-personal use).
	case BUSINESS_CHECKING
}

public struct BatchChangeInventoryRequest: Codable {
	/// The set of physical counts and inventory adjustments to be made. Changes are applied based on the client-supplied timestamp and may be sent out of order.
	public var changes: [InventoryChange]?
	/// A client-supplied, universally unique identifier (UUID) for the request.  See [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency) in the [API Development 101](https://developer.squareup.com/docs/basics/api101/overview) section for more information.
	public var idempotency_key: String?
	/// Indicates whether the current physical count should be ignored if the quantity is unchanged since the last physical count. Default: `true`.
	public var ignore_unchanged_counts: Bool?

	public init(changes: [InventoryChange]? = nil, idempotency_key: String? = nil, ignore_unchanged_counts: Bool? = nil) {
		self.changes = changes
		self.idempotency_key = idempotency_key
		self.ignore_unchanged_counts = ignore_unchanged_counts
	}
}

public struct BatchChangeInventoryResponse: Codable {
	/// The current counts for all objects referenced in the request.
	public var counts: [InventoryCount]?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(counts: [InventoryCount]? = nil, errors: [SquareError]? = nil) {
		self.counts = counts
		self.errors = errors
	}
}

public struct BatchDeleteCatalogObjectsRequest: Codable {
	/// The IDs of the CatalogObjects to be deleted. When an object is deleted, other objects in the graph that depend on that object will be deleted as well (for example, deleting a CatalogItem will delete its CatalogItemVariation.
	public var object_ids: [String]?

	public init(object_ids: [String]? = nil) {
		self.object_ids = object_ids
	}
}

public struct BatchDeleteCatalogObjectsResponse: Codable {
	/// The database [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) of this deletion in RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z".
	public var deleted_at: Timestamp?
	/// The IDs of all CatalogObjects deleted by this request.
	public var deleted_object_ids: [String]?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(deleted_at: Timestamp? = nil, deleted_object_ids: [String]? = nil, errors: [SquareError]? = nil) {
		self.deleted_at = deleted_at
		self.deleted_object_ids = deleted_object_ids
		self.errors = errors
	}
}

public struct BatchRetrieveCatalogObjectsRequest: Codable {
	/// The specific version of the catalog objects to be included in the response.  This allows you to retrieve historical versions of objects. The specified version value is matched against the `CatalogObject`s' `version` attribute.
	public var catalog_version: Int?
	/// If `true`, the response will include additional objects that are related to the requested objects, as follows:  If the `objects` field of the response contains a CatalogItem, its associated CatalogCategory objects, CatalogTax objects, CatalogImage objects and CatalogModifierLists will be returned in the `related_objects` field of the response. If the `objects` field of the response contains a CatalogItemVariation, its parent CatalogItem will be returned in the `related_objects` field of the response.
	public var include_related_objects: Bool?
	/// The IDs of the CatalogObjects to be retrieved.
	public var object_ids: [String]

	public init(object_ids: [String], catalog_version: Int? = nil, include_related_objects: Bool? = nil) {
		self.object_ids = object_ids
		self.catalog_version = catalog_version
		self.include_related_objects = include_related_objects
	}
}

public struct BatchRetrieveCatalogObjectsResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// A list of `CatalogObject`s returned.
	public var objects: [CatalogObject]?
	/// A list of `CatalogObject`s referenced by the object in the `objects` field.
	public var related_objects: [CatalogObject]?

	public init(errors: [SquareError]? = nil, objects: [CatalogObject]? = nil, related_objects: [CatalogObject]? = nil) {
		self.errors = errors
		self.objects = objects
		self.related_objects = related_objects
	}
}

public struct BatchRetrieveInventoryChangesRequest: Codable {
	/// The filter to return results by `CatalogObject` ID. The filter is only applicable when set. The default value is null.
	public var catalog_object_ids: [String]?
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query.  See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
	public var cursor: String?
	/// The filter to return results by `Location` ID.  The filter is only applicable when set. The default value is null.
	public var location_ids: [String]?
	/// The filter to return `ADJUSTMENT` query results by `InventoryState`. This filter is only applied when set. The default value is null. See [InventoryState](#type-inventorystate) for possible values
	public var states: InventoryState?
	/// The filter to return results by `InventoryChangeType` values other than `TRANSFER`. The default value is `[PHYSICAL_COUNT, ADJUSTMENT]`. See [InventoryChangeType](#type-inventorychangetype) for possible values
	public var types: InventoryChangeType?
	/// The filter to return results with their `calculated_at` value   after the given time as specified in an RFC 3339 timestamp.  The default value is the UNIX epoch of (`1970-01-01T00:00:00Z`).
	public var updated_after: Timestamp?
	/// The filter to return results with their `created_at` or `calculated_at` value   strictly before the given time as specified in an RFC 3339 timestamp.  The default value is the UNIX epoch of (`1970-01-01T00:00:00Z`).
	public var updated_before: Timestamp?

	public init(catalog_object_ids: [String]? = nil, cursor: String? = nil, location_ids: [String]? = nil, states: InventoryState? = nil, types: InventoryChangeType? = nil, updated_after: Timestamp? = nil, updated_before: Timestamp? = nil) {
		self.catalog_object_ids = catalog_object_ids
		self.cursor = cursor
		self.location_ids = location_ids
		self.states = states
		self.types = types
		self.updated_after = updated_after
		self.updated_before = updated_before
	}
}

public struct BatchRetrieveInventoryChangesResponse: Codable {
	/// The current calculated inventory changes for the requested objects and locations.
	public var changes: [InventoryChange]?
	/// The pagination cursor to be used in a subsequent request. If unset, this is the final response. See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
	public var cursor: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(changes: [InventoryChange]? = nil, cursor: String? = nil, errors: [SquareError]? = nil) {
		self.changes = changes
		self.cursor = cursor
		self.errors = errors
	}
}

public struct BatchRetrieveInventoryCountsRequest: Codable {
	/// The filter to return results by `CatalogObject` ID. The filter is applicable only when set.  The default is null.
	public var catalog_object_ids: [String]?
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query.  See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
	public var cursor: String?
	/// The filter to return results by `Location` ID.  This filter is applicable only when set. The default is null.
	public var location_ids: [String]?
	/// The filter to return results by `InventoryState`. The filter is only applicable when set. Ignored are untracked states of `NONE`, `SOLD`, and `UNLINKED_RETURN`. The default is null. See [InventoryState](#type-inventorystate) for possible values
	public var states: InventoryState?
	/// The filter to return results with their `calculated_at` value  after the given time as specified in an RFC 3339 timestamp.  The default value is the UNIX epoch of (`1970-01-01T00:00:00Z`).
	public var updated_after: Timestamp?

	public init(catalog_object_ids: [String]? = nil, cursor: String? = nil, location_ids: [String]? = nil, states: InventoryState? = nil, updated_after: Timestamp? = nil) {
		self.catalog_object_ids = catalog_object_ids
		self.cursor = cursor
		self.location_ids = location_ids
		self.states = states
		self.updated_after = updated_after
	}
}

public struct BatchRetrieveInventoryCountsResponse: Codable {
	/// The current calculated inventory counts for the requested objects and locations.
	public var counts: [InventoryCount]?
	/// The pagination cursor to be used in a subsequent request. If unset, this is the final response.  See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
	public var cursor: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(counts: [InventoryCount]? = nil, cursor: String? = nil, errors: [SquareError]? = nil) {
		self.counts = counts
		self.cursor = cursor
		self.errors = errors
	}
}

/// Defines the fields that are included in requests to the BatchRetrieveOrders endpoint.
public struct BatchRetrieveOrdersRequest: Codable {
	/// The ID of the location for these orders. This field is optional: omit it to retrieve orders within the scope of the current authorization's merchant ID.
	public var location_id: String?
	/// The IDs of the orders to retrieve. A maximum of 100 orders can be retrieved per request.
	public var order_ids: [String]

	/// Defines the fields that are included in requests to the BatchRetrieveOrders endpoint.
	/// - Parameters:
	///   - location_id: The ID of the location for these orders. This field is optional: omit it to retrieve orders within the scope of the current authorization's merchant ID.
	///   - order_ids: The IDs of the orders to retrieve. A maximum of 100 orders can be retrieved per request.
	public init(order_ids: [String], location_id: String? = nil) {
		self.order_ids = order_ids
		self.location_id = location_id
	}
}

/// Defines the fields that are included in the response body of a request to the BatchRetrieveOrders endpoint.
public struct BatchRetrieveOrdersResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The requested orders. This will omit any requested orders that do not exist.
	public var orders: [Order]?

	/// Defines the fields that are included in the response body of a request to the BatchRetrieveOrders endpoint.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - orders: The requested orders. This will omit any requested orders that do not exist.
	public init(errors: [SquareError]? = nil, orders: [Order]? = nil) {
		self.errors = errors
		self.orders = orders
	}
}

public struct BatchUpsertCatalogObjectsRequest: Codable {
	/// A batch of CatalogObjects to be inserted/updated atomically. The objects within a batch will be inserted in an all-or-nothing fashion, i.e., if an error occurs attempting to insert or update an object within a batch, the entire batch will be rejected. However, an error in one batch will not affect other batches within the same request.  For each object, its `updated_at` field is ignored and replaced with a current [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates), and its `is_deleted` field must not be set to `true`.  To modify an existing object, supply its ID. To create a new object, use an ID starting with `#`. These IDs may be used to create relationships between an object and attributes of other objects that reference it. For example, you can create a CatalogItem with ID `#ABC` and a CatalogItemVariation with its `item_id` attribute set to `#ABC` in order to associate the CatalogItemVariation with its parent CatalogItem.  Any `#`-prefixed IDs are valid only within a single atomic batch, and will be replaced by server-generated IDs.  Each batch may contain up to 1,000 objects. The total number of objects across all batches for a single request may not exceed 10,000. If either of these limits is violated, an error will be returned and no objects will be inserted or updated.
	public var batches: [CatalogObjectBatch]
	/// A value you specify that uniquely identifies this request among all your requests. A common way to create a valid idempotency key is to use a Universally unique identifier (UUID).  If you're unsure whether a particular request was successful, you can reattempt it with the same idempotency key without worrying about creating duplicate objects.  See [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency) for more information.
	public var idempotency_key: String

	public init(batches: [CatalogObjectBatch], idempotency_key: String) {
		self.batches = batches
		self.idempotency_key = idempotency_key
	}
}

public struct BatchUpsertCatalogObjectsResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The mapping between client and server IDs for this upsert.
	public var id_mappings: [CatalogIdMapping]?
	/// The created successfully created CatalogObjects.
	public var objects: [CatalogObject]?
	/// The database [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) of this update in RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z".
	public var updated_at: Timestamp?

	public init(errors: [SquareError]? = nil, id_mappings: [CatalogIdMapping]? = nil, objects: [CatalogObject]? = nil, updated_at: Timestamp? = nil) {
		self.errors = errors
		self.id_mappings = id_mappings
		self.objects = objects
		self.updated_at = updated_at
	}
}

/// Represents a booking as a time-bound service contract for a seller's staff member to provide a specified service at a given location to a requesting customer in one or more appointment segments.
public struct Booking: Codable {
	/// A list of appointment segments for this booking.
	public var appointment_segments: [AppointmentSegment]?
	/// The timestamp specifying the creation time of this booking.
	public let created_at: Timestamp?
	/// The ID of the `Customer` object representing the customer attending this booking
	public var customer_id: String?
	/// The free-text field for the customer to supply notes about the booking. For example, the note can be preferences that cannot be expressed by supported attributes of a relevant `CatalogObject` instance.
	public var customer_note: String?
	/// A unique ID of this object representing a booking.
	public let id: String?
	/// The ID of the `Location` object representing the location where the booked service is provided.
	public var location_id: String?
	/// The free-text field for the seller to supply notes about the booking. For example, the note can be preferences that cannot be expressed by supported attributes of a specific `CatalogObject` instance. This field should not be visible to customers.
	public var seller_note: String?
	/// The timestamp specifying the starting time of this booking.
	public var start_at: Timestamp?
	/// The status of the booking, describing where the booking stands with respect to the booking state machine. See [BookingStatus](#type-bookingstatus) for possible values
	public let status: BookingStatus?
	/// The timestamp specifying the most recent update time of this booking.
	public let updated_at: Timestamp?
	/// The revision number for the booking used for optimistic concurrency.
	public var version: Int?

	/// Represents a booking as a time-bound service contract for a seller's staff member to provide a specified service at a given location to a requesting customer in one or more appointment segments.
	/// - Parameters:
	///   - appointment_segments: A list of appointment segments for this booking.
	///   - created_at: The timestamp specifying the creation time of this booking.
	///   - customer_id: The ID of the `Customer` object representing the customer attending this booking
	///   - customer_note: The free-text field for the customer to supply notes about the booking. For example, the note can be preferences that cannot be expressed by supported attributes of a relevant `CatalogObject` instance.
	///   - id: A unique ID of this object representing a booking.
	///   - location_id: The ID of the `Location` object representing the location where the booked service is provided.
	///   - seller_note: The free-text field for the seller to supply notes about the booking. For example, the note can be preferences that cannot be expressed by supported attributes of a specific `CatalogObject` instance. This field should not be visible to customers.
	///   - start_at: The timestamp specifying the starting time of this booking.
	///   - status: The status of the booking, describing where the booking stands with respect to the booking state machine. See [BookingStatus](#type-bookingstatus) for possible values
	///   - updated_at: The timestamp specifying the most recent update time of this booking.
	///   - version: The revision number for the booking used for optimistic concurrency.
	public init(appointment_segments: [AppointmentSegment]? = nil, created_at: Timestamp? = nil, customer_id: String? = nil, customer_note: String? = nil, id: String? = nil, location_id: String? = nil, seller_note: String? = nil, start_at: Timestamp? = nil, status: BookingStatus? = nil, updated_at: Timestamp? = nil, version: Int? = nil) {
		self.appointment_segments = appointment_segments
		self.created_at = created_at
		self.customer_id = customer_id
		self.customer_note = customer_note
		self.id = id
		self.location_id = location_id
		self.seller_note = seller_note
		self.start_at = start_at
		self.status = status
		self.updated_at = updated_at
		self.version = version
	}
}

/// Supported booking statuses.
public enum BookingStatus: String, Codable {
	/// An unaccepted booking. It is visible to both sellers and customers.
	case PENDING
	/// A customer-cancelled booking. It is visible to both the seller and the customer.
	case CANCELLED_BY_CUSTOMER
	/// A seller-cancelled booking. It is visible to both the seller and the customer.
	case CANCELLED_BY_SELLER
	/// A declined booking. It had once been pending, but was then declined by the seller.
	case DECLINED
	/// An accepted booking agreed to or accepted by the seller.
	case ACCEPTED
	/// A no-show booking. The booking was accepted at one time, but have now been marked as a no-show by the seller because the client either missed the booking or cancelled it without enough notice.
	case NO_SHOW
}

/// A record of an employee's break during a shift.
public struct Break: Codable {
	/// The `BreakType` this `Break` was templated on.
	public var break_type_id: String
	/// RFC 3339; follows same timezone info as `Shift`. Precision up to the minute is respected; seconds are truncated.
	public var end_at: Timestamp?
	/// Format: RFC-3339 P[n]Y[n]M[n]DT[n]H[n]M[n]S. The expected length of the break.
	public var expected_duration: Timestamp
	/// UUID for this object
	public var id: String?
	/// Whether this break counts towards time worked for compensation purposes.
	public var is_paid: Bool
	/// A human-readable name.
	public var name: String
	/// RFC 3339; follows same timezone info as `Shift`. Precision up to the minute is respected; seconds are truncated.
	public var start_at: Timestamp

	/// A record of an employee's break during a shift.
	/// - Parameters:
	///   - break_type_id: The `BreakType` this `Break` was templated on.
	///   - end_at: RFC 3339; follows same timezone info as `Shift`. Precision up to the minute is respected; seconds are truncated.
	///   - expected_duration: Format: RFC-3339 P[n]Y[n]M[n]DT[n]H[n]M[n]S. The expected length of the break.
	///   - id: UUID for this object
	///   - is_paid: Whether this break counts towards time worked for compensation purposes.
	///   - name: A human-readable name.
	///   - start_at: RFC 3339; follows same timezone info as `Shift`. Precision up to the minute is respected; seconds are truncated.
	public init(break_type_id: String, expected_duration: Timestamp, is_paid: Bool, name: String, start_at: Timestamp, end_at: Timestamp? = nil, id: String? = nil) {
		self.break_type_id = break_type_id
		self.expected_duration = expected_duration
		self.is_paid = is_paid
		self.name = name
		self.start_at = start_at
		self.end_at = end_at
		self.id = id
	}
}

/// A defined break template that sets an expectation for possible `Break` instances on a `Shift`.
public struct BreakType: Codable {
	/// A human-readable name for this type of break. Will be displayed to employees in Square products.
	public var break_name: String
	/// A read-only timestamp in RFC 3339 format.
	public let created_at: Timestamp?
	/// Format: RFC-3339 P[n]Y[n]M[n]DT[n]H[n]M[n]S. The expected length of this break. Precision below minutes is truncated.
	public var expected_duration: Timestamp
	/// UUID for this object.
	public var id: String?
	/// Whether this break counts towards time worked for compensation purposes.
	public var is_paid: Bool
	/// The ID of the business location this type of break applies to.
	public var location_id: String
	/// A read-only timestamp in RFC 3339 format.
	public let updated_at: Timestamp?
	/// Used for resolving concurrency issues; request will fail if version provided does not match server version at time of request. If a value is not provided, Square's servers execute a "blind" write; potentially overwriting another writer's data.
	public var version: Int?

	/// A defined break template that sets an expectation for possible `Break` instances on a `Shift`.
	/// - Parameters:
	///   - break_name: A human-readable name for this type of break. Will be displayed to employees in Square products.
	///   - created_at: A read-only timestamp in RFC 3339 format.
	///   - expected_duration: Format: RFC-3339 P[n]Y[n]M[n]DT[n]H[n]M[n]S. The expected length of this break. Precision below minutes is truncated.
	///   - id: UUID for this object.
	///   - is_paid: Whether this break counts towards time worked for compensation purposes.
	///   - location_id: The ID of the business location this type of break applies to.
	///   - updated_at: A read-only timestamp in RFC 3339 format.
	///   - version: Used for resolving concurrency issues; request will fail if version provided does not match server version at time of request. If a value is not provided, Square's servers execute a "blind" write; potentially overwriting another writer's data.
	public init(break_name: String, expected_duration: Timestamp, is_paid: Bool, location_id: String, created_at: Timestamp? = nil, id: String? = nil, updated_at: Timestamp? = nil, version: Int? = nil) {
		self.break_name = break_name
		self.expected_duration = expected_duration
		self.is_paid = is_paid
		self.location_id = location_id
		self.created_at = created_at
		self.id = id
		self.updated_at = updated_at
		self.version = version
	}
}

/// Represents a bulk create request for `TeamMember` objects.
public struct BulkCreateTeamMembersRequest: Codable {
	/// The data which will be used to create the `TeamMember` objects. Each key is the `idempotency_key` that maps to the `CreateTeamMemberRequest`.
	public var team_members: CreateTeamMemberRequest

	/// Represents a bulk create request for `TeamMember` objects.
	/// - Parameters:
	///   - team_members: The data which will be used to create the `TeamMember` objects. Each key is the `idempotency_key` that maps to the `CreateTeamMemberRequest`.
	public init(team_members: CreateTeamMemberRequest) {
		self.team_members = team_members
	}
}

/// Represents a response from a bulk create request, containing the created `TeamMember` objects or error messages.
public struct BulkCreateTeamMembersResponse: Codable {
	/// The errors that occurred during the request.
	public var errors: [SquareError]?
	/// The successfully created `TeamMember` objects. Each key is the `idempotency_key` that maps to the `CreateTeamMemberRequest`.
	public var team_members: CreateTeamMemberResponse?

	/// Represents a response from a bulk create request, containing the created `TeamMember` objects or error messages.
	/// - Parameters:
	///   - errors: The errors that occurred during the request.
	///   - team_members: The successfully created `TeamMember` objects. Each key is the `idempotency_key` that maps to the `CreateTeamMemberRequest`.
	public init(errors: [SquareError]? = nil, team_members: CreateTeamMemberResponse? = nil) {
		self.errors = errors
		self.team_members = team_members
	}
}

/// Represents a bulk update request for `TeamMember` objects.
public struct BulkUpdateTeamMembersRequest: Codable {
	/// The data which will be used to update the `TeamMember` objects. Each key is the `team_member_id` that maps to the `UpdateTeamMemberRequest`.
	public var team_members: UpdateTeamMemberRequest

	/// Represents a bulk update request for `TeamMember` objects.
	/// - Parameters:
	///   - team_members: The data which will be used to update the `TeamMember` objects. Each key is the `team_member_id` that maps to the `UpdateTeamMemberRequest`.
	public init(team_members: UpdateTeamMemberRequest) {
		self.team_members = team_members
	}
}

/// Represents a response from a bulk update request, containing the updated `TeamMember` objects or error messages.
public struct BulkUpdateTeamMembersResponse: Codable {
	/// The errors that occurred during the request.
	public var errors: [SquareError]?
	/// The successfully updated `TeamMember` objects. Each key is the `team_member_id` that maps to the `UpdateTeamMemberRequest`.
	public var team_members: UpdateTeamMemberResponse?

	/// Represents a response from a bulk update request, containing the updated `TeamMember` objects or error messages.
	/// - Parameters:
	///   - errors: The errors that occurred during the request.
	///   - team_members: The successfully updated `TeamMember` objects. Each key is the `team_member_id` that maps to the `UpdateTeamMemberRequest`.
	public init(errors: [SquareError]? = nil, team_members: UpdateTeamMemberResponse? = nil) {
		self.errors = errors
		self.team_members = team_members
	}
}

/// The service appointment settings, including where and how the service is provided.
public struct BusinessAppointmentSettings: Codable {
	/// The time unit of the service duration for bookings. See [BusinessAppointmentSettingsAlignmentTime](#type-businessappointmentsettingsalignmenttime) for possible values
	public var alignment_time: BusinessAppointmentSettingsAlignmentTime?
	/// Indicates whether a customer can choose from all available time slots and have a staff member assigned automatically (`true`) or not (`false`).
	public var any_team_member_booking_enabled: Bool?
	/// The flat-fee amount charged for a no-show booking.
	public var cancellation_fee_money: Money?
	/// The cancellation policy adopted by the seller. See [BusinessAppointmentSettingsCancellationPolicy](#type-businessappointmentsettingscancellationpolicy) for possible values
	public var cancellation_policy: BusinessAppointmentSettingsCancellationPolicy?
	/// The free-form text of the seller's cancellation policy.
	public var cancellation_policy_text: String?
	/// The cut-off time in seconds for allowing clients to cancel or reschedule an appointment.
	public var cancellation_window_seconds: Int?
	/// Types of the location allowed for bookings. See [BusinessAppointmentSettingsBookingLocationType](#type-businessappointmentsettingsbookinglocationtype) for possible values
	public var location_types: BusinessAppointmentSettingsBookingLocationType?
	/// The maximum number of daily appointments per team member or per location.
	public var max_appointments_per_day_limit: Int?
	/// Indicates whether the daily appointment limit applies to team members or to business locations. See [BusinessAppointmentSettingsMaxAppointmentsPerDayLimitType](#type-businessappointmentsettingsmaxappointmentsperdaylimittype) for possible values
	public var max_appointments_per_day_limit_type: BusinessAppointmentSettingsMaxAppointmentsPerDayLimitType?
	/// The maximum lead time in seconds before a service can be booked. Bookings must be created at most this far ahead of the booking's starting time.
	public var max_booking_lead_time_seconds: Int?
	/// The minimum lead time in seconds before a service can be booked. Bookings must be created at least this far ahead of the booking's starting time.
	public var min_booking_lead_time_seconds: Int?
	/// Indicates whether a customer can book multiple services in a single online booking.
	public var multiple_service_booking_enabled: Bool?
	/// Indicates whether customers has an assigned staff member (`true`) or can select s staff member of their choice (`false`).
	public var skip_booking_flow_staff_selection: Bool?

	/// The service appointment settings, including where and how the service is provided.
	/// - Parameters:
	///   - alignment_time: The time unit of the service duration for bookings. See [BusinessAppointmentSettingsAlignmentTime](#type-businessappointmentsettingsalignmenttime) for possible values
	///   - any_team_member_booking_enabled: Indicates whether a customer can choose from all available time slots and have a staff member assigned automatically (`true`) or not (`false`).
	///   - cancellation_fee_money: The flat-fee amount charged for a no-show booking.
	///   - cancellation_policy: The cancellation policy adopted by the seller. See [BusinessAppointmentSettingsCancellationPolicy](#type-businessappointmentsettingscancellationpolicy) for possible values
	///   - cancellation_policy_text: The free-form text of the seller's cancellation policy.
	///   - cancellation_window_seconds: The cut-off time in seconds for allowing clients to cancel or reschedule an appointment.
	///   - location_types: Types of the location allowed for bookings. See [BusinessAppointmentSettingsBookingLocationType](#type-businessappointmentsettingsbookinglocationtype) for possible values
	///   - max_appointments_per_day_limit: The maximum number of daily appointments per team member or per location.
	///   - max_appointments_per_day_limit_type: Indicates whether the daily appointment limit applies to team members or to business locations. See [BusinessAppointmentSettingsMaxAppointmentsPerDayLimitType](#type-businessappointmentsettingsmaxappointmentsperdaylimittype) for possible values
	///   - max_booking_lead_time_seconds: The maximum lead time in seconds before a service can be booked. Bookings must be created at most this far ahead of the booking's starting time.
	///   - min_booking_lead_time_seconds: The minimum lead time in seconds before a service can be booked. Bookings must be created at least this far ahead of the booking's starting time.
	///   - multiple_service_booking_enabled: Indicates whether a customer can book multiple services in a single online booking.
	///   - skip_booking_flow_staff_selection: Indicates whether customers has an assigned staff member (`true`) or can select s staff member of their choice (`false`).
	public init(alignment_time: BusinessAppointmentSettingsAlignmentTime? = nil, any_team_member_booking_enabled: Bool? = nil, cancellation_fee_money: Money? = nil, cancellation_policy: BusinessAppointmentSettingsCancellationPolicy? = nil, cancellation_policy_text: String? = nil, cancellation_window_seconds: Int? = nil, location_types: BusinessAppointmentSettingsBookingLocationType? = nil, max_appointments_per_day_limit: Int? = nil, max_appointments_per_day_limit_type: BusinessAppointmentSettingsMaxAppointmentsPerDayLimitType? = nil, max_booking_lead_time_seconds: Int? = nil, min_booking_lead_time_seconds: Int? = nil, multiple_service_booking_enabled: Bool? = nil, skip_booking_flow_staff_selection: Bool? = nil) {
		self.alignment_time = alignment_time
		self.any_team_member_booking_enabled = any_team_member_booking_enabled
		self.cancellation_fee_money = cancellation_fee_money
		self.cancellation_policy = cancellation_policy
		self.cancellation_policy_text = cancellation_policy_text
		self.cancellation_window_seconds = cancellation_window_seconds
		self.location_types = location_types
		self.max_appointments_per_day_limit = max_appointments_per_day_limit
		self.max_appointments_per_day_limit_type = max_appointments_per_day_limit_type
		self.max_booking_lead_time_seconds = max_booking_lead_time_seconds
		self.min_booking_lead_time_seconds = min_booking_lead_time_seconds
		self.multiple_service_booking_enabled = multiple_service_booking_enabled
		self.skip_booking_flow_staff_selection = skip_booking_flow_staff_selection
	}
}

/// Time units of a service duration for bookings.
public enum BusinessAppointmentSettingsAlignmentTime: String, Codable {
	/// The service duration unit is one visit of a fixed time interval specified by the seller.
	case SERVICE_DURATION
	/// The service duration unit is a 15-minute interval. Bookings can be scheduled every quarter hour.
	case QUARTER_HOURLY
	/// The service duration unit is a 30-minute interval. Bookings can be scheduled every half hour.
	case HALF_HOURLY
	/// The service duration unit is a 60-minute interval. Bookings can be scheduled every hour.
	case HOURLY
}

/// Types of location where service is provided.
public enum BusinessAppointmentSettingsBookingLocationType: String, Codable {
	/// The service is provided at a seller location.
	case BUSINESS_LOCATION
	/// The service is provided at a customer location.
	case CUSTOMER_LOCATION
	/// The service is provided over the phone.
	case PHONE
}

/// The category of the seller’s cancellation policy.
public enum BusinessAppointmentSettingsCancellationPolicy: String, Codable {
	/// Cancellations are treated as no shows and may incur a fee as specified by `cancellation_fee_money`.
	case CANCELLATION_TREATED_AS_NO_SHOW
	/// Cancellations follow the seller-specified policy that is described in free-form text and not enforced automatically by Square.
	case CUSTOM_POLICY
}

/// Types of daily appointment limits.
public enum BusinessAppointmentSettingsMaxAppointmentsPerDayLimitType: String, Codable {
	/// The maximum number of daily appointments is set on a per team member basis.
	case PER_TEAM_MEMBER
	/// The maximum number of daily appointments is set on a per location basis.
	case PER_LOCATION
}

public struct BusinessBookingProfile: Codable {
	/// Indicates whether customers can cancel or reschedule their own bookings (`true`) or not (`false`).
	public var allow_user_cancel: Bool?
	/// Indicates whether the seller is open for booking.
	public var booking_enabled: Bool?
	/// The policy for the seller to automatically accept booking requests (`ACCEPT_ALL`) or not (`REQUIRES_ACCEPTANCE`). See [BusinessBookingProfileBookingPolicy](#type-businessbookingprofilebookingpolicy) for possible values
	public var booking_policy: BusinessBookingProfileBookingPolicy?
	/// Settings for appointment-type bookings.
	public var business_appointment_settings: BusinessAppointmentSettings?
	/// The RFC-3339 timestamp specifying the booking's creation time.
	public let created_at: Timestamp?
	/// The choice of customer's time zone information of a booking. The Square online booking site and all notifications to customers uses either the seller location’s time zone or the time zone the customer chooses at booking. See [BusinessBookingProfileCustomerTimezoneChoice](#type-businessbookingprofilecustomertimezonechoice) for possible values
	public var customer_timezone_choice: BusinessBookingProfileCustomerTimezoneChoice?
	/// The ID of the seller, obtainable using the Merchants API.
	public var seller_id: String?

	public init(allow_user_cancel: Bool? = nil, booking_enabled: Bool? = nil, booking_policy: BusinessBookingProfileBookingPolicy? = nil, business_appointment_settings: BusinessAppointmentSettings? = nil, created_at: Timestamp? = nil, customer_timezone_choice: BusinessBookingProfileCustomerTimezoneChoice? = nil, seller_id: String? = nil) {
		self.allow_user_cancel = allow_user_cancel
		self.booking_enabled = booking_enabled
		self.booking_policy = booking_policy
		self.business_appointment_settings = business_appointment_settings
		self.created_at = created_at
		self.customer_timezone_choice = customer_timezone_choice
		self.seller_id = seller_id
	}
}

/// Policies for accepting bookings.
public enum BusinessBookingProfileBookingPolicy: String, Codable {
	/// The seller accepts all booking requests automatically.
	case ACCEPT_ALL
	/// The seller must accept requests to complete bookings.
	case REQUIRES_ACCEPTANCE
}

/// Choices of customer-facing time zone used for bookings.
public enum BusinessBookingProfileCustomerTimezoneChoice: String, Codable {
	/// Use the time zone of the business location for bookings.
	case BUSINESS_LOCATION_TIMEZONE
	/// Use the customer-chosen time zone for bookings.
	case CUSTOMER_CHOICE
}

/// Represents the hours of operation for a business location.
public struct BusinessHours: Codable {
	/// The list of time periods during which the business is open. There may be at most 10 periods per day.
	public var periods: [BusinessHoursPeriod]?

	/// Represents the hours of operation for a business location.
	/// - Parameters:
	///   - periods: The list of time periods during which the business is open. There may be at most 10 periods per day.
	public init(periods: [BusinessHoursPeriod]? = nil) {
		self.periods = periods
	}
}

/// Represents a period of time during which a business location is open.
public struct BusinessHoursPeriod: Codable {
	/// The day of week for this time period. See [DayOfWeek](#type-dayofweek) for possible values
	public var day_of_week: DayOfWeek?
	/// The end time of a business hours period, specified in local time using partial-time RFC 3339 format.
	public var end_local_time: Timestamp?
	/// The start time of a business hours period, specified in local time using partial-time RFC 3339 format.
	public var start_local_time: Timestamp?

	/// Represents a period of time during which a business location is open.
	/// - Parameters:
	///   - day_of_week: The day of week for this time period. See [DayOfWeek](#type-dayofweek) for possible values
	///   - end_local_time: The end time of a business hours period, specified in local time using partial-time RFC 3339 format.
	///   - start_local_time: The start time of a business hours period, specified in local time using partial-time RFC 3339 format.
	public init(day_of_week: DayOfWeek? = nil, end_local_time: Timestamp? = nil, start_local_time: Timestamp? = nil) {
		self.day_of_week = day_of_week
		self.end_local_time = end_local_time
		self.start_local_time = start_local_time
	}
}

/// A request to calculate the points that a buyer can earn from  a specified purchase.
public struct CalculateLoyaltyPointsRequest: Codable {
	/// The `order` ID for which to calculate the points. Specify this field if your application uses the Orders API to process orders. Otherwise, specify the `transaction_amount`.
	public var order_id: String?
	/// The purchase amount for which to calculate the points.  Specify this field if your application does not use the Orders API to process orders. Otherwise, specify the `order_id`.
	public var transaction_amount_money: Money?

	/// A request to calculate the points that a buyer can earn from  a specified purchase.
	/// - Parameters:
	///   - order_id: The `order` ID for which to calculate the points. Specify this field if your application uses the Orders API to process orders. Otherwise, specify the `transaction_amount`.
	///   - transaction_amount_money: The purchase amount for which to calculate the points.  Specify this field if your application does not use the Orders API to process orders. Otherwise, specify the `order_id`.
	public init(order_id: String? = nil, transaction_amount_money: Money? = nil) {
		self.order_id = order_id
		self.transaction_amount_money = transaction_amount_money
	}
}

/// A response that includes the points that the buyer can earn from  a specified purchase.
public struct CalculateLoyaltyPointsResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The points that the buyer can earn from a specified purchase.
	public var points: Int?

	/// A response that includes the points that the buyer can earn from  a specified purchase.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - points: The points that the buyer can earn from a specified purchase.
	public init(errors: [SquareError]? = nil, points: Int? = nil) {
		self.errors = errors
		self.points = points
	}
}

public struct CalculateOrderRequest: Codable {
	/// The order to be calculated. Expects the entire order, not a sparse update.
	public var order: Order
	/// Identifies one or more loyalty reward tiers to apply during order calculation. The discounts defined by the reward tiers are added to the order only to preview the effect of applying the specified reward(s). The reward(s) do not correspond to actual redemptions, that is, no `reward`s are created. Therefore, the reward `id`s are random strings used only to reference the reward tier.
	public var proposed_rewards: [OrderReward]?

	public init(order: Order, proposed_rewards: [OrderReward]? = nil) {
		self.order = order
		self.proposed_rewards = proposed_rewards
	}
}

public struct CalculateOrderResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The calculated version of the order provided in the request.
	public var order: Order?

	public init(errors: [SquareError]? = nil, order: Order? = nil) {
		self.errors = errors
		self.order = order
	}
}

public struct CancelBookingRequest: Codable {
	/// The revision number for the booking used for optimistic concurrency.
	public var booking_version: Int?
	/// A unique key to make this request an idempotent operation.
	public var idempotency_key: String?

	public init(booking_version: Int? = nil, idempotency_key: String? = nil) {
		self.booking_version = booking_version
		self.idempotency_key = idempotency_key
	}
}

public struct CancelBookingResponse: Codable {
	/// The booking that was cancelled.
	public var booking: Booking?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(booking: Booking? = nil, errors: [SquareError]? = nil) {
		self.booking = booking
		self.errors = errors
	}
}

/// Describes a `CancelInvoice` request.
public struct CancelInvoiceRequest: Codable {
	/// The version of the `invoice` to cancel. If you do not know the version, you can call  `GetInvoice](#endpoint-Invoices-GetInvoice) or [ListInvoices`.
	public var version: Int

	/// Describes a `CancelInvoice` request.
	/// - Parameters:
	///   - version: The version of the `invoice` to cancel. If you do not know the version, you can call  `GetInvoice](#endpoint-Invoices-GetInvoice) or [ListInvoices`.
	public init(version: Int) {
		self.version = version
	}
}

/// The response returned by the `CancelInvoice` request.
public struct CancelInvoiceResponse: Codable {
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The canceled invoice.
	public var invoice: Invoice?

	/// The response returned by the `CancelInvoice` request.
	/// - Parameters:
	///   - errors: Information about errors encountered during the request.
	///   - invoice: The canceled invoice.
	public init(errors: [SquareError]? = nil, invoice: Invoice? = nil) {
		self.errors = errors
		self.invoice = invoice
	}
}

/// Specifies the idempotency key of a payment to cancel.
public struct CancelPaymentByIdempotencyKeyRequest: Codable {
	/// The `idempotency_key` identifying the payment to be canceled.
	public var idempotency_key: String

	/// Specifies the idempotency key of a payment to cancel.
	/// - Parameters:
	///   - idempotency_key: The `idempotency_key` identifying the payment to be canceled.
	public init(idempotency_key: String) {
		self.idempotency_key = idempotency_key
	}
}

/// The return value from the [CancelPaymentByIdempotencyKey](#endpoint-payments-cancelpaymentbyidempotencykey) endpoint. On success, `errors` is empty.
public struct CancelPaymentByIdempotencyKeyResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// The return value from the [CancelPaymentByIdempotencyKey](#endpoint-payments-cancelpaymentbyidempotencykey) endpoint. On success, `errors` is empty.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	public init(errors: [SquareError]? = nil) {
		self.errors = errors
	}
}

/// Cancels (voids) a payment before it has been completed. Note: Only payments created with `autocomplete` set to `false` can be canceled.
public struct CancelPaymentRequest: Codable {

	/// Cancels (voids) a payment before it has been completed. Note: Only payments created with `autocomplete` set to `false` can be canceled.
	public init() {
	}
}

/// The return value from the [CancelPayment](#endpoint-payments-cancelpayment) endpoint.
public struct CancelPaymentResponse: Codable {
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The successfully canceled `Payment` object.
	public var payment: Payment?

	/// The return value from the [CancelPayment](#endpoint-payments-cancelpayment) endpoint.
	/// - Parameters:
	///   - errors: Information about errors encountered during the request.
	///   - payment: The successfully canceled `Payment` object.
	public init(errors: [SquareError]? = nil, payment: Payment? = nil) {
		self.errors = errors
		self.payment = payment
	}
}

/// Defines parameters in a  [CancelSubscription](#endpoint-subscriptions-cancelsubscription) endpoint request.
public struct CancelSubscriptionRequest: Codable {

	/// Defines parameters in a  [CancelSubscription](#endpoint-subscriptions-cancelsubscription) endpoint request.
	public init() {
	}
}

/// Defines fields that are included in a  [CancelSubscription](#endpoint-subscriptions-cancelsubscription) response.
public struct CancelSubscriptionResponse: Codable {
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The canceled subscription.
	public var subscription: Subscription?

	/// Defines fields that are included in a  [CancelSubscription](#endpoint-subscriptions-cancelsubscription) response.
	/// - Parameters:
	///   - errors: Information about errors encountered during the request.
	///   - subscription: The canceled subscription.
	public init(errors: [SquareError]? = nil, subscription: Subscription? = nil) {
		self.errors = errors
		self.subscription = subscription
	}
}

public struct CancelTerminalCheckoutRequest: Codable {

	public init() {
	}
}

public struct CancelTerminalCheckoutResponse: Codable {
	/// The canceled `TerminalCheckout`
	public var checkout: TerminalCheckout?
	/// Information on errors encountered during the request.
	public var errors: [SquareError]?

	public init(checkout: TerminalCheckout? = nil, errors: [SquareError]? = nil) {
		self.checkout = checkout
		self.errors = errors
	}
}

public struct CancelTerminalRefundRequest: Codable {

	public init() {
	}
}

public struct CancelTerminalRefundResponse: Codable {
	/// Information on errors encountered during the request.
	public var errors: [SquareError]?
	/// The updated `TerminalRefund`
	public var refund: TerminalRefund?

	public init(errors: [SquareError]? = nil, refund: TerminalRefund? = nil) {
		self.errors = errors
		self.refund = refund
	}
}

public struct CaptureTransactionRequest: Codable {

	public init() {
	}
}

/// Defines the fields that are included in the response body of a request to the [CaptureTransaction](#endpoint-capturetransaction) endpoint.
public struct CaptureTransactionResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// Defines the fields that are included in the response body of a request to the [CaptureTransaction](#endpoint-capturetransaction) endpoint.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	public init(errors: [SquareError]? = nil) {
		self.errors = errors
	}
}

/// Represents the payment details of a card to be used for payments. These details are determined by the `card_nonce` generated by `SqPaymentForm`.
public struct Card: Codable {
	/// The billing address for this card.
	public var billing_address: Address?
	/// The first six digits of the card number, known as the Bank Identification Number (BIN). Only the Payments API returns this field.
	public let bin: String?
	/// The card's brand. See [CardBrand](#type-cardbrand) for possible values
	public let card_brand: CardBrand?
	/// The type of the card. The Card object includes this field only in response to Payments API calls. See [CardType](#type-cardtype) for possible values
	public let card_type: CardType?
	/// The name of the cardholder.
	public var cardholder_name: String?
	/// The expiration month of the associated card as an integer between 1 and 12.
	public var exp_month: Int?
	/// The four-digit year of the card's expiration date.
	public var exp_year: Int?
	/// __Not currently set.__ Intended as a Square-assigned identifier, based on the card number, to identify the card across multiple locations within a single application.
	public let fingerprint: String?
	/// Unique ID for this card. Generated by Square.
	public let id: String?
	/// The last 4 digits of the card number.
	public let last_4: String?
	/// Indicates whether the Card is prepaid or not. The Card object includes this field only in response to Payments API calls. See [CardPrepaidType](#type-cardprepaidtype) for possible values
	public let prepaid_type: CardPrepaidType?

	/// Represents the payment details of a card to be used for payments. These details are determined by the `card_nonce` generated by `SqPaymentForm`.
	/// - Parameters:
	///   - billing_address: The billing address for this card.
	///   - bin: The first six digits of the card number, known as the Bank Identification Number (BIN). Only the Payments API returns this field.
	///   - card_brand: The card's brand. See [CardBrand](#type-cardbrand) for possible values
	///   - card_type: The type of the card. The Card object includes this field only in response to Payments API calls. See [CardType](#type-cardtype) for possible values
	///   - cardholder_name: The name of the cardholder.
	///   - exp_month: The expiration month of the associated card as an integer between 1 and 12.
	///   - exp_year: The four-digit year of the card's expiration date.
	///   - fingerprint: __Not currently set.__ Intended as a Square-assigned identifier, based on the card number, to identify the card across multiple locations within a single application.
	///   - id: Unique ID for this card. Generated by Square.
	///   - last_4: The last 4 digits of the card number.
	///   - prepaid_type: Indicates whether the Card is prepaid or not. The Card object includes this field only in response to Payments API calls. See [CardPrepaidType](#type-cardprepaidtype) for possible values
	public init(billing_address: Address? = nil, bin: String? = nil, card_brand: CardBrand? = nil, card_type: CardType? = nil, cardholder_name: String? = nil, exp_month: Int? = nil, exp_year: Int? = nil, fingerprint: String? = nil, id: String? = nil, last_4: String? = nil, prepaid_type: CardPrepaidType? = nil) {
		self.billing_address = billing_address
		self.bin = bin
		self.card_brand = card_brand
		self.card_type = card_type
		self.cardholder_name = cardholder_name
		self.exp_month = exp_month
		self.exp_year = exp_year
		self.fingerprint = fingerprint
		self.id = id
		self.last_4 = last_4
		self.prepaid_type = prepaid_type
	}
}

/// Indicates a card's brand, such as `VISA` or `MASTERCARD`.
public enum CardBrand: String, Codable {
	case OTHER_BRAND
	case VISA
	case MASTERCARD
	case AMERICAN_EXPRESS
	case DISCOVER
	case DISCOVER_DINERS
	case JCB
	case CHINA_UNIONPAY
	case SQUARE_GIFT_CARD
	case SQUARE_CAPITAL_CARD
	case INTERAC
	case EFTPOS
	case FELICA
}

/// Reflects the current status of a card payment.
public struct CardPaymentDetails: Codable {
	/// For EMV payments, the cryptogram generated for the payment.
	public var application_cryptogram: String?
	/// For EMV payments, the application ID identifies the EMV application used for the payment.
	public var application_identifier: String?
	/// For EMV payments, the human-readable name of the EMV application used for the payment.
	public var application_name: String?
	/// The status code returned by the card issuer that describes the payment's authorization status.
	public var auth_result_code: String?
	/// The status code returned from the Address Verification System (AVS) check. The code can be `AVS_ACCEPTED`, `AVS_REJECTED`, or `AVS_NOT_CHECKED`.
	public var avs_status: String?
	/// The credit card's non-confidential details.
	public var card: Card?
	/// The timeline for card payments.
	public var card_payment_timeline: CardPaymentTimeline?
	/// The status code returned from the Card Verification Value (CVV) check. The code can be `CVV_ACCEPTED`, `CVV_REJECTED`, or `CVV_NOT_CHECKED`.
	public var cvv_status: String?
	/// Details about the device that took the payment.
	public var device_details: DeviceDetails?
	/// The method used to enter the card's details for the payment. The method can be `KEYED`, `SWIPED`, `EMV`, `ON_FILE`, or `CONTACTLESS`.
	public var entry_method: String?
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// Whether the card must be physically present for the payment to be refunded.  If set to `true`, the card must be present.
	public var refund_requires_card_presence: Bool?
	/// The statement description sent to the card networks.  Note: The actual statement description varies and is likely to be truncated and appended with additional information on a per issuer basis.
	public var statement_description: String?
	/// The card payment's current state. The state can be AUTHORIZED, CAPTURED, VOIDED, or FAILED.
	public var status: String?
	/// For EMV payments, the method used to verify the cardholder's identity. The method can be `PIN`, `SIGNATURE`, `PIN_AND_SIGNATURE`, `ON_DEVICE`, or `NONE`.
	public var verification_method: String?
	/// For EMV payments, the results of the cardholder verification. The result can be `SUCCESS`, `FAILURE`, or `UNKNOWN`.
	public var verification_results: String?

	/// Reflects the current status of a card payment.
	/// - Parameters:
	///   - application_cryptogram: For EMV payments, the cryptogram generated for the payment.
	///   - application_identifier: For EMV payments, the application ID identifies the EMV application used for the payment.
	///   - application_name: For EMV payments, the human-readable name of the EMV application used for the payment.
	///   - auth_result_code: The status code returned by the card issuer that describes the payment's authorization status.
	///   - avs_status: The status code returned from the Address Verification System (AVS) check. The code can be `AVS_ACCEPTED`, `AVS_REJECTED`, or `AVS_NOT_CHECKED`.
	///   - card: The credit card's non-confidential details.
	///   - card_payment_timeline: The timeline for card payments.
	///   - cvv_status: The status code returned from the Card Verification Value (CVV) check. The code can be `CVV_ACCEPTED`, `CVV_REJECTED`, or `CVV_NOT_CHECKED`.
	///   - device_details: Details about the device that took the payment.
	///   - entry_method: The method used to enter the card's details for the payment. The method can be `KEYED`, `SWIPED`, `EMV`, `ON_FILE`, or `CONTACTLESS`.
	///   - errors: Information about errors encountered during the request.
	///   - refund_requires_card_presence: Whether the card must be physically present for the payment to be refunded.  If set to `true`, the card must be present.
	///   - statement_description: The statement description sent to the card networks.  Note: The actual statement description varies and is likely to be truncated and appended with additional information on a per issuer basis.
	///   - status: The card payment's current state. The state can be AUTHORIZED, CAPTURED, VOIDED, or FAILED.
	///   - verification_method: For EMV payments, the method used to verify the cardholder's identity. The method can be `PIN`, `SIGNATURE`, `PIN_AND_SIGNATURE`, `ON_DEVICE`, or `NONE`.
	///   - verification_results: For EMV payments, the results of the cardholder verification. The result can be `SUCCESS`, `FAILURE`, or `UNKNOWN`.
	public init(application_cryptogram: String? = nil, application_identifier: String? = nil, application_name: String? = nil, auth_result_code: String? = nil, avs_status: String? = nil, card: Card? = nil, card_payment_timeline: CardPaymentTimeline? = nil, cvv_status: String? = nil, device_details: DeviceDetails? = nil, entry_method: String? = nil, errors: [SquareError]? = nil, refund_requires_card_presence: Bool? = nil, statement_description: String? = nil, status: String? = nil, verification_method: String? = nil, verification_results: String? = nil) {
		self.application_cryptogram = application_cryptogram
		self.application_identifier = application_identifier
		self.application_name = application_name
		self.auth_result_code = auth_result_code
		self.avs_status = avs_status
		self.card = card
		self.card_payment_timeline = card_payment_timeline
		self.cvv_status = cvv_status
		self.device_details = device_details
		self.entry_method = entry_method
		self.errors = errors
		self.refund_requires_card_presence = refund_requires_card_presence
		self.statement_description = statement_description
		self.status = status
		self.verification_method = verification_method
		self.verification_results = verification_results
	}
}

/// The timeline for card payments.
public struct CardPaymentTimeline: Codable {
	/// The timestamp when the payment was authorized, in RFC 3339 format.
	public var authorized_at: Timestamp?
	/// The timestamp when the payment was captured, in RFC 3339 format.
	public var captured_at: Timestamp?
	/// The timestamp when the payment was voided, in RFC 3339 format.
	public var voided_at: Timestamp?

	/// The timeline for card payments.
	/// - Parameters:
	///   - authorized_at: The timestamp when the payment was authorized, in RFC 3339 format.
	///   - captured_at: The timestamp when the payment was captured, in RFC 3339 format.
	///   - voided_at: The timestamp when the payment was voided, in RFC 3339 format.
	public init(authorized_at: Timestamp? = nil, captured_at: Timestamp? = nil, voided_at: Timestamp? = nil) {
		self.authorized_at = authorized_at
		self.captured_at = captured_at
		self.voided_at = voided_at
	}
}

/// Indicates a card's prepaid type, such as `NOT_PREPAID` or `PREPAID`.
public enum CardPrepaidType: String, Codable {
	case UNKNOWN_PREPAID_TYPE
	case NOT_PREPAID
	case PREPAID
}

/// 
public enum CardSquareProduct: String, Codable {
	case UNKNOWN_SQUARE_PRODUCT
	case CONNECT_API
	case DASHBOARD
	case REGISTER_CLIENT
	case BUYER_DASHBOARD
	case WEB
	case INVOICES
	case GIFT_CARD
	case VIRTUAL_TERMINAL
	case READER_SDK
}

/// Indicates a card's type, such as `CREDIT` or `DEBIT`.
public enum CardType: String, Codable {
	case UNKNOWN_CARD_TYPE
	case CREDIT
	case DEBIT
}

public struct CashDrawerDevice: Codable {
	/// The device Square-issued ID
	public var id: String?
	/// The device merchant-specified name.
	public var name: String?

	public init(id: String? = nil, name: String? = nil) {
		self.id = id
		self.name = name
	}
}

/// The types of events on a CashDrawerShift. Each event type represents an employee action on the actual cash drawer represented by a CashDrawerShift.
public enum CashDrawerEventType: String, Codable {
	/// Triggered when a no sale occurs on a cash drawer. A CashDrawerEvent of this type must have a zero money amount.
	case NO_SALE
	/// Triggered when a cash tender payment occurs on a cash drawer. A CashDrawerEvent of this type can must not have a negative amount.
	case CASH_TENDER_PAYMENT
	/// Triggered when a check, gift card, or other non-cash payment occurs on a cash drawer. A CashDrawerEvent of this type must have a zero money amount.
	case OTHER_TENDER_PAYMENT
	/// Triggered when a split tender bill is cancelled after cash has been tendered. A CASH_TENDER_CANCELLED_PAYMENT should have a corresponding CASH_TENDER_PAYMENT. A CashDrawerEvent of this type must not have a negative amount.
	case CASH_TENDER_CANCELLED_PAYMENT
	/// Triggered when a split tender bill is cancelled after a non-cash tender has been tendered. An OTHER_TENDER_CANCELLED_PAYMENT should have a corresponding OTHER_TENDER_PAYMENT. A CashDrawerEvent of this type must have a zero money amount.
	case OTHER_TENDER_CANCELLED_PAYMENT
	/// Triggered when a cash tender refund occurs. A CashDrawerEvent of this type must not have a negative amount.
	case CASH_TENDER_REFUND
	/// Triggered when an other tender refund occurs. A CashDrawerEvent of this type must have a zero money amount.
	case OTHER_TENDER_REFUND
	/// Triggered when money unrelated to a payment is added to the cash drawer. For example, an employee adds coins to the drawer. A CashDrawerEvent of this type must not have a negative amount.
	case PAID_IN
	/// Triggered when money is removed from the drawer for other reasons than making change. For example, an employee pays a delivery person with cash from the cash drawer. A CashDrawerEvent of this type must not have a negative amount.
	case PAID_OUT
}

/// This model gives the details of a cash drawer shift. The cash_payment_money, cash_refund_money, cash_paid_in_money, and cash_paid_out_money fields are all computed by summing their respective event types.
public struct CashDrawerShift: Codable {
	/// The amount of money added to the cash drawer for reasons other than cash payments. It is computed by summing the events of type PAID_IN. The amount is always greater than or equal to zero.
	public var cash_paid_in_money: Money?
	/// The amount of money removed from the cash drawer for reasons other than cash refunds. It is computed by summing the events of type PAID_OUT. The amount is always greater than or equal to zero.
	public var cash_paid_out_money: Money?
	/// The amount of money added to the cash drawer from cash payments. This is computed by summing all events with the types CASH_TENDER_PAYMENT and CASH_TENDER_CANCELED_PAYMENT. The amount is always greater than or equal to zero.
	public var cash_payment_money: Money?
	/// The amount of money removed from the cash drawer from cash refunds. It is computed by summing the events of type CASH_TENDER_REFUND. The amount is always greater than or equal to zero.
	public var cash_refunds_money: Money?
	/// The time when the shift was closed, in ISO 8601 format.
	public var closed_at: String?
	/// The amount of money found in the cash drawer at the end of the shift by an auditing employee. The amount should be positive.
	public var closed_cash_money: Money?
	/// The ID of the employee that closed the cash drawer shift by auditing the cash drawer contents.
	public var closing_employee_id: String?
	/// The free-form text description of a cash drawer by an employee.
	public var description: String?
	/// The device running Square Point of Sale that was connected to the cash drawer.
	public var device: CashDrawerDevice?
	/// The IDs of all employees that were logged into Square Point of Sale at any point while the cash drawer shift was open.
	public var employee_ids: [String]?
	/// The time when the shift ended, in ISO 8601 format.
	public var ended_at: String?
	/// The ID of the employee that ended the cash drawer shift.
	public var ending_employee_id: String?
	/// The amount of money that should be in the cash drawer at the end of the shift, based on the shift's other money amounts. This can be negative if employees have not correctly recorded all the events on the cash drawer. cash_paid_out_money is a summation of amounts from cash_payment_money (zero or positive), cash_refunds_money (zero or negative), cash_paid_in_money (zero or positive), and cash_paid_out_money (zero or negative) event types.
	public var expected_cash_money: Money?
	/// The shift unique ID.
	public var id: String?
	/// The time when the shift began, in ISO 8601 format.
	public var opened_at: String?
	/// The amount of money in the cash drawer at the start of the shift. The amount must be greater than or equal to zero.
	public var opened_cash_money: Money?
	/// The ID of the employee that started the cash drawer shift.
	public var opening_employee_id: String?
	/// The shift current state. See [CashDrawerShiftState](#type-cashdrawershiftstate) for possible values
	public var state: CashDrawerShiftState?

	/// This model gives the details of a cash drawer shift. The cash_payment_money, cash_refund_money, cash_paid_in_money, and cash_paid_out_money fields are all computed by summing their respective event types.
	/// - Parameters:
	///   - cash_paid_in_money: The amount of money added to the cash drawer for reasons other than cash payments. It is computed by summing the events of type PAID_IN. The amount is always greater than or equal to zero.
	///   - cash_paid_out_money: The amount of money removed from the cash drawer for reasons other than cash refunds. It is computed by summing the events of type PAID_OUT. The amount is always greater than or equal to zero.
	///   - cash_payment_money: The amount of money added to the cash drawer from cash payments. This is computed by summing all events with the types CASH_TENDER_PAYMENT and CASH_TENDER_CANCELED_PAYMENT. The amount is always greater than or equal to zero.
	///   - cash_refunds_money: The amount of money removed from the cash drawer from cash refunds. It is computed by summing the events of type CASH_TENDER_REFUND. The amount is always greater than or equal to zero.
	///   - closed_at: The time when the shift was closed, in ISO 8601 format.
	///   - closed_cash_money: The amount of money found in the cash drawer at the end of the shift by an auditing employee. The amount should be positive.
	///   - closing_employee_id: The ID of the employee that closed the cash drawer shift by auditing the cash drawer contents.
	///   - description: The free-form text description of a cash drawer by an employee.
	///   - device: The device running Square Point of Sale that was connected to the cash drawer.
	///   - employee_ids: The IDs of all employees that were logged into Square Point of Sale at any point while the cash drawer shift was open.
	///   - ended_at: The time when the shift ended, in ISO 8601 format.
	///   - ending_employee_id: The ID of the employee that ended the cash drawer shift.
	///   - expected_cash_money: The amount of money that should be in the cash drawer at the end of the shift, based on the shift's other money amounts. This can be negative if employees have not correctly recorded all the events on the cash drawer. cash_paid_out_money is a summation of amounts from cash_payment_money (zero or positive), cash_refunds_money (zero or negative), cash_paid_in_money (zero or positive), and cash_paid_out_money (zero or negative) event types.
	///   - id: The shift unique ID.
	///   - opened_at: The time when the shift began, in ISO 8601 format.
	///   - opened_cash_money: The amount of money in the cash drawer at the start of the shift. The amount must be greater than or equal to zero.
	///   - opening_employee_id: The ID of the employee that started the cash drawer shift.
	///   - state: The shift current state. See [CashDrawerShiftState](#type-cashdrawershiftstate) for possible values
	public init(cash_paid_in_money: Money? = nil, cash_paid_out_money: Money? = nil, cash_payment_money: Money? = nil, cash_refunds_money: Money? = nil, closed_at: String? = nil, closed_cash_money: Money? = nil, closing_employee_id: String? = nil, description: String? = nil, device: CashDrawerDevice? = nil, employee_ids: [String]? = nil, ended_at: String? = nil, ending_employee_id: String? = nil, expected_cash_money: Money? = nil, id: String? = nil, opened_at: String? = nil, opened_cash_money: Money? = nil, opening_employee_id: String? = nil, state: CashDrawerShiftState? = nil) {
		self.cash_paid_in_money = cash_paid_in_money
		self.cash_paid_out_money = cash_paid_out_money
		self.cash_payment_money = cash_payment_money
		self.cash_refunds_money = cash_refunds_money
		self.closed_at = closed_at
		self.closed_cash_money = closed_cash_money
		self.closing_employee_id = closing_employee_id
		self.description = description
		self.device = device
		self.employee_ids = employee_ids
		self.ended_at = ended_at
		self.ending_employee_id = ending_employee_id
		self.expected_cash_money = expected_cash_money
		self.id = id
		self.opened_at = opened_at
		self.opened_cash_money = opened_cash_money
		self.opening_employee_id = opening_employee_id
		self.state = state
	}
}

public struct CashDrawerShiftEvent: Codable {
	/// The event time in ISO 8601 format.
	public let created_at: String?
	/// An optional description of the event, entered by the employee that created the event.
	public var description: String?
	/// The ID of the employee that created the event.
	public var employee_id: String?
	/// The amount of money that was added to or removed from the cash drawer in the event. The amount can be positive (for added money) or zero (for other tender type payments). The addition or removal of money can be determined by by the event type.
	public var event_money: Money?
	/// The type of cash drawer shift event. See [CashDrawerEventType](#type-cashdrawereventtype) for possible values
	public var event_type: CashDrawerEventType?
	/// The unique ID of the event.
	public var id: String?

	public init(created_at: String? = nil, description: String? = nil, employee_id: String? = nil, event_money: Money? = nil, event_type: CashDrawerEventType? = nil, id: String? = nil) {
		self.created_at = created_at
		self.description = description
		self.employee_id = employee_id
		self.event_money = event_money
		self.event_type = event_type
		self.id = id
	}
}

/// The current state of a cash drawer shift.
public enum CashDrawerShiftState: String, Codable {
	/// An open cash drawer shift.
	case OPEN
	/// A cash drawer shift that is ended but has not yet had an employee content audit.
	case ENDED
	/// An ended cash drawer shift that is closed with a completed employee content audit and recorded result.
	case CLOSED
}

/// The summary of a closed cash drawer shift. This model contains only the money counted to start a cash drawer shift, counted at the end of the shift, and the amount that should be in the drawer at shift end based on summing all cash drawer shift events.
public struct CashDrawerShiftSummary: Codable {
	/// The shift close time in ISO 8601 format.
	public var closed_at: String?
	/// The amount of money found in the cash drawer at the end of the shift by an auditing employee. The amount must be greater than or equal to zero.
	public var closed_cash_money: Money?
	/// An employee free-text description of a cash drawer shift.
	public var description: String?
	/// The shift end time in ISO 8601 format.
	public var ended_at: String?
	/// The amount of money that should be in the cash drawer at the end of the shift, based on the cash drawer events on the shift. The amount is correct if all shift employees accurately recorded their cash drawer shift events. Unrecorded events and events with the wrong amount result in an incorrect expected_cash_money amount that can be negative.
	public var expected_cash_money: Money?
	/// The shift unique ID.
	public var id: String?
	/// The shift start time in ISO 8601 format.
	public var opened_at: String?
	/// The amount of money in the cash drawer at the start of the shift. This must be a positive amount.
	public var opened_cash_money: Money?
	/// The shift current state. See [CashDrawerShiftState](#type-cashdrawershiftstate) for possible values
	public var state: CashDrawerShiftState?

	/// The summary of a closed cash drawer shift. This model contains only the money counted to start a cash drawer shift, counted at the end of the shift, and the amount that should be in the drawer at shift end based on summing all cash drawer shift events.
	/// - Parameters:
	///   - closed_at: The shift close time in ISO 8601 format.
	///   - closed_cash_money: The amount of money found in the cash drawer at the end of the shift by an auditing employee. The amount must be greater than or equal to zero.
	///   - description: An employee free-text description of a cash drawer shift.
	///   - ended_at: The shift end time in ISO 8601 format.
	///   - expected_cash_money: The amount of money that should be in the cash drawer at the end of the shift, based on the cash drawer events on the shift. The amount is correct if all shift employees accurately recorded their cash drawer shift events. Unrecorded events and events with the wrong amount result in an incorrect expected_cash_money amount that can be negative.
	///   - id: The shift unique ID.
	///   - opened_at: The shift start time in ISO 8601 format.
	///   - opened_cash_money: The amount of money in the cash drawer at the start of the shift. This must be a positive amount.
	///   - state: The shift current state. See [CashDrawerShiftState](#type-cashdrawershiftstate) for possible values
	public init(closed_at: String? = nil, closed_cash_money: Money? = nil, description: String? = nil, ended_at: String? = nil, expected_cash_money: Money? = nil, id: String? = nil, opened_at: String? = nil, opened_cash_money: Money? = nil, state: CashDrawerShiftState? = nil) {
		self.closed_at = closed_at
		self.closed_cash_money = closed_cash_money
		self.description = description
		self.ended_at = ended_at
		self.expected_cash_money = expected_cash_money
		self.id = id
		self.opened_at = opened_at
		self.opened_cash_money = opened_cash_money
		self.state = state
	}
}

/// A category to which a `CatalogItem` instance belongs.
public struct CatalogCategory: Codable {
	/// The category name. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	public var name: String?

	/// A category to which a `CatalogItem` instance belongs.
	/// - Parameters:
	///   - name: The category name. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	public init(name: String? = nil) {
		self.name = name
	}
}

/// Contains information defining a custom attribute. Custom attributes are intended to store additional information about a catalog object or to associate a catalog object with an entity in another system. Do not use custom attributes to store any sensitive information (personally identifiable information, card details, etc.). [Read more about custom attributes](/catalog-api/add-custom-attributes)
public struct CatalogCustomAttributeDefinition: Codable {
	/// The set of Catalog Object Types that this Custom Attribute may be applied to. Currently, only `ITEM` and `ITEM_VARIATION` are allowed. At least one type must be included. See [CatalogObjectType](#type-catalogobjecttype) for possible values
	public var allowed_object_types: CatalogObjectType
	/// The visibility of a custom attribute to applications other than the application that created the attribute. See [CatalogCustomAttributeDefinitionAppVisibility](#type-catalogcustomattributedefinitionappvisibility) for possible values
	public var app_visibility: CatalogCustomAttributeDefinitionAppVisibility?
	/// __Read-only.__ The number of custom attributes that reference this custom attribute definition. Set by the server in response to a ListCatalog request with `include_counts` set to `true`.  If the actual count is greater than 100, `custom_attribute_usage_count` will be set to `100`.
	public let custom_attribute_usage_count: Int?
	/// Seller-oriented description of the meaning of this Custom Attribute, any constraints that the seller should observe, etc. May be displayed as a tooltip in Square UIs.
	public var description: String?
	/// The name of the desired custom attribute key that can be used to access the custom attribute value on catalog objects. Cannot be modified after the custom attribute definition has been created. Must be between 1 and 60 characters, and may only contain the characters `[a-zA-Z0-9_-]`.
	public var key: String?
	///  The name of this definition for API and seller-facing UI purposes. The name must be unique within the (merchant, application) pair. Required. May not be empty and may not exceed 255 characters. Can be modified after creation.
	public var name: String
	/// Optionally, populated when `type` = `NUMBER`, unset otherwise.
	public var number_config: CatalogCustomAttributeDefinitionNumberConfig?
	/// Populated when `type` is set to `SELECTION`, unset otherwise.
	public var selection_config: CatalogCustomAttributeDefinitionSelectionConfig?
	/// The visibility of a custom attribute in seller-facing UIs (including Square Point of Sale applications and Square Dashboard). May be modified. See [CatalogCustomAttributeDefinitionSellerVisibility](#type-catalogcustomattributedefinitionsellervisibility) for possible values
	public var seller_visibility: CatalogCustomAttributeDefinitionSellerVisibility?
	/// __Read only.__ Contains information about the application that created this custom attribute definition.
	public var source_application: SourceApplication?
	/// Optionally, populated when `type` = `STRING`, unset otherwise.
	public var string_config: CatalogCustomAttributeDefinitionStringConfig?
	/// The type of this custom attribute. Cannot be modified after creation. Required. See [CatalogCustomAttributeDefinitionType](#type-catalogcustomattributedefinitiontype) for possible values
	public var type: CatalogCustomAttributeDefinitionType

	/// Contains information defining a custom attribute. Custom attributes are intended to store additional information about a catalog object or to associate a catalog object with an entity in another system. Do not use custom attributes to store any sensitive information (personally identifiable information, card details, etc.). [Read more about custom attributes](/catalog-api/add-custom-attributes)
	/// - Parameters:
	///   - allowed_object_types: The set of Catalog Object Types that this Custom Attribute may be applied to. Currently, only `ITEM` and `ITEM_VARIATION` are allowed. At least one type must be included. See [CatalogObjectType](#type-catalogobjecttype) for possible values
	///   - app_visibility: The visibility of a custom attribute to applications other than the application that created the attribute. See [CatalogCustomAttributeDefinitionAppVisibility](#type-catalogcustomattributedefinitionappvisibility) for possible values
	///   - custom_attribute_usage_count: __Read-only.__ The number of custom attributes that reference this custom attribute definition. Set by the server in response to a ListCatalog request with `include_counts` set to `true`.  If the actual count is greater than 100, `custom_attribute_usage_count` will be set to `100`.
	///   - description: Seller-oriented description of the meaning of this Custom Attribute, any constraints that the seller should observe, etc. May be displayed as a tooltip in Square UIs.
	///   - key: The name of the desired custom attribute key that can be used to access the custom attribute value on catalog objects. Cannot be modified after the custom attribute definition has been created. Must be between 1 and 60 characters, and may only contain the characters `[a-zA-Z0-9_-]`.
	///   - name:  The name of this definition for API and seller-facing UI purposes. The name must be unique within the (merchant, application) pair. Required. May not be empty and may not exceed 255 characters. Can be modified after creation.
	///   - number_config: Optionally, populated when `type` = `NUMBER`, unset otherwise.
	///   - selection_config: Populated when `type` is set to `SELECTION`, unset otherwise.
	///   - seller_visibility: The visibility of a custom attribute in seller-facing UIs (including Square Point of Sale applications and Square Dashboard). May be modified. See [CatalogCustomAttributeDefinitionSellerVisibility](#type-catalogcustomattributedefinitionsellervisibility) for possible values
	///   - source_application: __Read only.__ Contains information about the application that created this custom attribute definition.
	///   - string_config: Optionally, populated when `type` = `STRING`, unset otherwise.
	///   - type: The type of this custom attribute. Cannot be modified after creation. Required. See [CatalogCustomAttributeDefinitionType](#type-catalogcustomattributedefinitiontype) for possible values
	public init(allowed_object_types: CatalogObjectType, name: String, type: CatalogCustomAttributeDefinitionType, app_visibility: CatalogCustomAttributeDefinitionAppVisibility? = nil, custom_attribute_usage_count: Int? = nil, description: String? = nil, key: String? = nil, number_config: CatalogCustomAttributeDefinitionNumberConfig? = nil, selection_config: CatalogCustomAttributeDefinitionSelectionConfig? = nil, seller_visibility: CatalogCustomAttributeDefinitionSellerVisibility? = nil, source_application: SourceApplication? = nil, string_config: CatalogCustomAttributeDefinitionStringConfig? = nil) {
		self.allowed_object_types = allowed_object_types
		self.name = name
		self.type = type
		self.app_visibility = app_visibility
		self.custom_attribute_usage_count = custom_attribute_usage_count
		self.description = description
		self.key = key
		self.number_config = number_config
		self.selection_config = selection_config
		self.seller_visibility = seller_visibility
		self.source_application = source_application
		self.string_config = string_config
	}
}

/// Defines the visibility of a custom attribute to applications other than their creating application.
public enum CatalogCustomAttributeDefinitionAppVisibility: String, Codable {
	/// Other applications cannot read this custom attribute.
	case APP_VISIBILITY_HIDDEN
	/// Other applications can read this custom attribute definition and values.
	case APP_VISIBILITY_READ_ONLY
	/// Other applications can read and write custom attribute values on objects. They can read but cannot edit the custom attribute definition.
	case APP_VISIBILITY_READ_WRITE_VALUES
}

public struct CatalogCustomAttributeDefinitionNumberConfig: Codable {
	/// An integer between 0 and 5 that represents the maximum number of positions allowed after the decimal in number custom attribute values For example:  - if the precision is 0, the quantity can be 1, 2, 3, etc. - if the precision is 1, the quantity can be 0.1, 0.2, etc. - if the precision is 2, the quantity can be 0.01, 0.12, etc.  Default: 5
	public var precision: Int?

	public init(precision: Int? = nil) {
		self.precision = precision
	}
}

/// Configuration associated with `SELECTION`-type custom attribute definitions.
public struct CatalogCustomAttributeDefinitionSelectionConfig: Codable {
	/// The set of valid `CatalogCustomAttributeSelections`. Up to a maximum of 100 selections can be defined. Can be modified.
	public var allowed_selections: [CatalogCustomAttributeDefinitionSelectionConfigCustomAttributeSelection]?
	/// The maximum number of selections that can be set. The maximum value for this attribute is 100. The default value is 1. The value can be modified, but changing the value will not affect existing custom attribute values on objects. Clients need to handle custom attributes with more selected values than allowed by this limit.
	public var max_allowed_selections: Int?

	/// Configuration associated with `SELECTION`-type custom attribute definitions.
	/// - Parameters:
	///   - allowed_selections: The set of valid `CatalogCustomAttributeSelections`. Up to a maximum of 100 selections can be defined. Can be modified.
	///   - max_allowed_selections: The maximum number of selections that can be set. The maximum value for this attribute is 100. The default value is 1. The value can be modified, but changing the value will not affect existing custom attribute values on objects. Clients need to handle custom attributes with more selected values than allowed by this limit.
	public init(allowed_selections: [CatalogCustomAttributeDefinitionSelectionConfigCustomAttributeSelection]? = nil, max_allowed_selections: Int? = nil) {
		self.allowed_selections = allowed_selections
		self.max_allowed_selections = max_allowed_selections
	}
}

/// A named selection for this `SELECTION`-type custom attribute definition.
public struct CatalogCustomAttributeDefinitionSelectionConfigCustomAttributeSelection: Codable {
	/// Selection name, unique within `allowed_selections`.
	public var name: String
	/// Unique ID set by Square.
	public var uid: String?

	/// A named selection for this `SELECTION`-type custom attribute definition.
	/// - Parameters:
	///   - name: Selection name, unique within `allowed_selections`.
	///   - uid: Unique ID set by Square.
	public init(name: String, uid: String? = nil) {
		self.name = name
		self.uid = uid
	}
}

/// Defines the visibility of a custom attribute to sellers in Square client applications, Square APIs or in Square UIs (including Square Point of Sale applications and Square Dashboard).
public enum CatalogCustomAttributeDefinitionSellerVisibility: String, Codable {
	/// Sellers cannot read this custom attribute in Square client applications or Square APIs.
	case SELLER_VISIBILITY_HIDDEN
	/// Sellers can read and write this custom attribute value in catalog objects, but cannot edit the custom attribute definition.
	case SELLER_VISIBILITY_READ_WRITE_VALUES
}

/// Configuration associated with Custom Attribute Definitions of type `STRING`.
public struct CatalogCustomAttributeDefinitionStringConfig: Codable {
	/// If true, each Custom Attribute instance associated with this Custom Attribute Definition must have a unique value within the seller's catalog. For example, this may be used for a value like a SKU that should not be duplicated within a seller's catalog. May not be modified after the definition has been created.
	public var enforce_uniqueness: Bool?

	/// Configuration associated with Custom Attribute Definitions of type `STRING`.
	/// - Parameters:
	///   - enforce_uniqueness: If true, each Custom Attribute instance associated with this Custom Attribute Definition must have a unique value within the seller's catalog. For example, this may be used for a value like a SKU that should not be duplicated within a seller's catalog. May not be modified after the definition has been created.
	public init(enforce_uniqueness: Bool? = nil) {
		self.enforce_uniqueness = enforce_uniqueness
	}
}

/// Defines the possible types for a custom attribute.
public enum CatalogCustomAttributeDefinitionType: String, Codable {
	/// A free-form string containing up to 255 characters.
	case STRING
	/// A `true` or `false` value.
	case BOOLEAN
	/// A decimal string representation of a number. Can support up to 5 digits after the decimal point.
	case NUMBER
	/// One or more choices from `allowed_selections`.
	case SELECTION
}

/// An instance of a custom attribute. Custom attributes can be defined and added to `ITEM` and `ITEM_VARIATION` type catalog objects. [Read more about custom attributes](/catalog-api/add-custom-attributes).
public struct CatalogCustomAttributeValue: Codable {
	/// A `true` or `false` value. Populated if `type` = `BOOLEAN`.
	public var boolean_value: Bool?
	/// __Read-only.__ The id of the `CatalogCustomAttributeDefinition` this value belongs to.
	public let custom_attribute_definition_id: String?
	/// __Read-only.__ A copy of key from the associated `CatalogCustomAttributeDefinition`.
	public let key: String?
	/// The name of the custom attribute.
	public var name: String?
	/// Populated if `type` = `NUMBER`. Contains a string representation of a decimal number, using a `.` as the decimal separator.
	public var number_value: String?
	/// One or more choices from `allowed_selections`. Populated if `type` = `SELECTION`.
	public var selection_uid_values: [String]?
	/// The string value of the custom attribute.  Populated if `type` = `STRING`.
	public var string_value: String?
	/// __Read-only.__ A copy of type from the associated `CatalogCustomAttributeDefinition`. See [CatalogCustomAttributeDefinitionType](#type-catalogcustomattributedefinitiontype) for possible values
	public let type: CatalogCustomAttributeDefinitionType?

	/// An instance of a custom attribute. Custom attributes can be defined and added to `ITEM` and `ITEM_VARIATION` type catalog objects. [Read more about custom attributes](/catalog-api/add-custom-attributes).
	/// - Parameters:
	///   - boolean_value: A `true` or `false` value. Populated if `type` = `BOOLEAN`.
	///   - custom_attribute_definition_id: __Read-only.__ The id of the `CatalogCustomAttributeDefinition` this value belongs to.
	///   - key: __Read-only.__ A copy of key from the associated `CatalogCustomAttributeDefinition`.
	///   - name: The name of the custom attribute.
	///   - number_value: Populated if `type` = `NUMBER`. Contains a string representation of a decimal number, using a `.` as the decimal separator.
	///   - selection_uid_values: One or more choices from `allowed_selections`. Populated if `type` = `SELECTION`.
	///   - string_value: The string value of the custom attribute.  Populated if `type` = `STRING`.
	///   - type: __Read-only.__ A copy of type from the associated `CatalogCustomAttributeDefinition`. See [CatalogCustomAttributeDefinitionType](#type-catalogcustomattributedefinitiontype) for possible values
	public init(boolean_value: Bool? = nil, custom_attribute_definition_id: String? = nil, key: String? = nil, name: String? = nil, number_value: String? = nil, selection_uid_values: [String]? = nil, string_value: String? = nil, type: CatalogCustomAttributeDefinitionType? = nil) {
		self.boolean_value = boolean_value
		self.custom_attribute_definition_id = custom_attribute_definition_id
		self.key = key
		self.name = name
		self.number_value = number_value
		self.selection_uid_values = selection_uid_values
		self.string_value = string_value
		self.type = type
	}
}

/// A discount applicable to items.
public struct CatalogDiscount: Codable {
	/// The amount of the discount. Specify an amount of `0` if `discount_type` is `VARIABLE_AMOUNT`.  Do not use this field for percentage-based or variable discounts.
	public var amount_money: Money?
	/// Indicates whether the discount is a fixed amount or percentage, or entered at the time of sale. See [CatalogDiscountType](#type-catalogdiscounttype) for possible values
	public var discount_type: CatalogDiscountType?
	/// The color of the discount display label in the Square Point of Sale app. This must be a valid hex color code.
	public var label_color: String?
	/// Indicates whether this discount should reduce the price used to calculate tax.  Most discounts should use `MODIFY_TAX_BASIS`. However, in some circumstances taxes must be calculated based on an item's price, ignoring a particular discount. For example, in many US jurisdictions, a manufacturer coupon or instant rebate reduces the price a customer pays but does not reduce the sale price used to calculate how much sales tax is due. In this case, the discount representing that manufacturer coupon should have `DO_NOT_MODIFY_TAX_BASIS` for this field.  If you are unsure whether you need to use this field, consult your tax professional. See [CatalogDiscountModifyTaxBasis](#type-catalogdiscountmodifytaxbasis) for possible values
	public var modify_tax_basis: CatalogDiscountModifyTaxBasis?
	/// The discount name. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	public var name: String?
	/// The percentage of the discount as a string representation of a decimal number, using a `.` as the decimal separator and without a `%` sign. A value of `7.5` corresponds to `7.5%`. Specify a percentage of `0` if `discount_type` is `VARIABLE_PERCENTAGE`.  Do not use this field for amount-based or variable discounts.
	public var percentage: String?
	/// Indicates whether a mobile staff member needs to enter their PIN to apply the discount to a payment in the Square Point of Sale app.
	public var pin_required: Bool?

	/// A discount applicable to items.
	/// - Parameters:
	///   - amount_money: The amount of the discount. Specify an amount of `0` if `discount_type` is `VARIABLE_AMOUNT`.  Do not use this field for percentage-based or variable discounts.
	///   - discount_type: Indicates whether the discount is a fixed amount or percentage, or entered at the time of sale. See [CatalogDiscountType](#type-catalogdiscounttype) for possible values
	///   - label_color: The color of the discount display label in the Square Point of Sale app. This must be a valid hex color code.
	///   - modify_tax_basis: Indicates whether this discount should reduce the price used to calculate tax.  Most discounts should use `MODIFY_TAX_BASIS`. However, in some circumstances taxes must be calculated based on an item's price, ignoring a particular discount. For example, in many US jurisdictions, a manufacturer coupon or instant rebate reduces the price a customer pays but does not reduce the sale price used to calculate how much sales tax is due. In this case, the discount representing that manufacturer coupon should have `DO_NOT_MODIFY_TAX_BASIS` for this field.  If you are unsure whether you need to use this field, consult your tax professional. See [CatalogDiscountModifyTaxBasis](#type-catalogdiscountmodifytaxbasis) for possible values
	///   - name: The discount name. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	///   - percentage: The percentage of the discount as a string representation of a decimal number, using a `.` as the decimal separator and without a `%` sign. A value of `7.5` corresponds to `7.5%`. Specify a percentage of `0` if `discount_type` is `VARIABLE_PERCENTAGE`.  Do not use this field for amount-based or variable discounts.
	///   - pin_required: Indicates whether a mobile staff member needs to enter their PIN to apply the discount to a payment in the Square Point of Sale app.
	public init(amount_money: Money? = nil, discount_type: CatalogDiscountType? = nil, label_color: String? = nil, modify_tax_basis: CatalogDiscountModifyTaxBasis? = nil, name: String? = nil, percentage: String? = nil, pin_required: Bool? = nil) {
		self.amount_money = amount_money
		self.discount_type = discount_type
		self.label_color = label_color
		self.modify_tax_basis = modify_tax_basis
		self.name = name
		self.percentage = percentage
		self.pin_required = pin_required
	}
}

/// 
public enum CatalogDiscountModifyTaxBasis: String, Codable {
	/// Application of the discount will modify the tax basis.
	case MODIFY_TAX_BASIS
	/// Application of the discount will not modify the tax basis.
	case DO_NOT_MODIFY_TAX_BASIS
}

/// How to apply a CatalogDiscount to a CatalogItem.
public enum CatalogDiscountType: String, Codable {
	/// Apply the discount as a fixed percentage (e.g., 5%) off the item price.
	case FIXED_PERCENTAGE
	/// Apply the discount as a fixed amount (e.g., $1.00) off the item price.
	case FIXED_AMOUNT
	/// Apply the discount as a variable percentage off the item price. The percentage will be specified at the time of sale.
	case VARIABLE_PERCENTAGE
	/// Apply the discount as a variable amount off the item price. The amount will be specified at the time of sale.
	case VARIABLE_AMOUNT
}

/// A mapping between a temporary client-supplied ID and a permanent server-generated ID.  When calling [UpsertCatalogObject](#endpoint-Catalog-UpsertCatalogObject) or [BatchUpsertCatalogObjects](#endpoint-Catalog-BatchUpsertCatalogObjects) to create a [CatalogObject](#type-CatalogObject) instance, you can supply a temporary ID for the to-be-created object, especially when the object is to be referenced elsewhere in the same request body. This temporary ID can be any string unique within the call, but must be prefixed by "#".  After the request is submitted and the object created, a permanent server-generated ID is assigned to the new object. The permanent ID is unique across the Square catalog.
public struct CatalogIdMapping: Codable {
	/// The client-supplied temporary `#`-prefixed ID for a new `CatalogObject`.
	public var client_object_id: String?
	/// The permanent ID for the CatalogObject created by the server.
	public var object_id: String?

	/// A mapping between a temporary client-supplied ID and a permanent server-generated ID.  When calling [UpsertCatalogObject](#endpoint-Catalog-UpsertCatalogObject) or [BatchUpsertCatalogObjects](#endpoint-Catalog-BatchUpsertCatalogObjects) to create a [CatalogObject](#type-CatalogObject) instance, you can supply a temporary ID for the to-be-created object, especially when the object is to be referenced elsewhere in the same request body. This temporary ID can be any string unique within the call, but must be prefixed by "#".  After the request is submitted and the object created, a permanent server-generated ID is assigned to the new object. The permanent ID is unique across the Square catalog.
	/// - Parameters:
	///   - client_object_id: The client-supplied temporary `#`-prefixed ID for a new `CatalogObject`.
	///   - object_id: The permanent ID for the CatalogObject created by the server.
	public init(client_object_id: String? = nil, object_id: String? = nil) {
		self.client_object_id = client_object_id
		self.object_id = object_id
	}
}

/// An image file to use in Square catalogs. It can be associated with catalog items, item variations, and categories.
public struct CatalogImage: Codable {
	/// A caption that describes what is shown in the image. Displayed in the Square Online Store. This is a searchable attribute for use in applicable query filters.
	public var caption: String?
	/// The internal name to identify this image in calls to the Square API.
	public var name: String?
	/// The URL of this image, generated by Square after an image is uploaded using the `CreateCatalogImage` endpoint.
	public var url: String?

	/// An image file to use in Square catalogs. It can be associated with catalog items, item variations, and categories.
	/// - Parameters:
	///   - caption: A caption that describes what is shown in the image. Displayed in the Square Online Store. This is a searchable attribute for use in applicable query filters.
	///   - name: The internal name to identify this image in calls to the Square API.
	///   - url: The URL of this image, generated by Square after an image is uploaded using the `CreateCatalogImage` endpoint.
	public init(caption: String? = nil, name: String? = nil, url: String? = nil) {
		self.caption = caption
		self.name = name
		self.url = url
	}
}

public struct CatalogInfoRequest: Codable {

	public init() {
	}
}

public struct CatalogInfoResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// Limits that apply to this API.
	public var limits: CatalogInfoResponseLimits?
	/// Names and abbreviations for standard units.
	public var standard_unit_description_group: StandardUnitDescriptionGroup?

	public init(errors: [SquareError]? = nil, limits: CatalogInfoResponseLimits? = nil, standard_unit_description_group: StandardUnitDescriptionGroup? = nil) {
		self.errors = errors
		self.limits = limits
		self.standard_unit_description_group = standard_unit_description_group
	}
}

public struct CatalogInfoResponseLimits: Codable {
	/// The maximum number of object IDs that may be included in a single `/v2/catalog/batch-delete` request.
	public var batch_delete_max_object_ids: Int?
	/// The maximum number of object IDs that may appear in a `/v2/catalog/batch-retrieve` request.
	public var batch_retrieve_max_object_ids: Int?
	/// The maximum number of objects that may appear within a single batch in a `/v2/catalog/batch-upsert` request.
	public var batch_upsert_max_objects_per_batch: Int?
	/// The maximum number of objects that may appear across all batches in a `/v2/catalog/batch-upsert` request.
	public var batch_upsert_max_total_objects: Int?
	/// The maximum number of results that may be returned in a page of a `/v2/catalog/search` response.
	public var search_max_page_limit: Int?
	/// The maximum number of item IDs that may be included in a single `/v2/catalog/update-item-modifier-lists` request.
	public var update_item_modifier_lists_max_item_ids: Int?
	/// The maximum number of modifier list IDs to be disabled that may be included in a single `/v2/catalog/update-item-modifier-lists` request.
	public var update_item_modifier_lists_max_modifier_lists_to_disable: Int?
	/// The maximum number of modifier list IDs to be enabled that may be included in a single `/v2/catalog/update-item-modifier-lists` request.
	public var update_item_modifier_lists_max_modifier_lists_to_enable: Int?
	/// The maximum number of item IDs that may be included in a single `/v2/catalog/update-item-taxes` request.
	public var update_item_taxes_max_item_ids: Int?
	/// The maximum number of tax IDs to be disabled that may be included in a single `/v2/catalog/update-item-taxes` request.
	public var update_item_taxes_max_taxes_to_disable: Int?
	/// The maximum number of tax IDs to be enabled that may be included in a single `/v2/catalog/update-item-taxes` request.
	public var update_item_taxes_max_taxes_to_enable: Int?

	public init(batch_delete_max_object_ids: Int? = nil, batch_retrieve_max_object_ids: Int? = nil, batch_upsert_max_objects_per_batch: Int? = nil, batch_upsert_max_total_objects: Int? = nil, search_max_page_limit: Int? = nil, update_item_modifier_lists_max_item_ids: Int? = nil, update_item_modifier_lists_max_modifier_lists_to_disable: Int? = nil, update_item_modifier_lists_max_modifier_lists_to_enable: Int? = nil, update_item_taxes_max_item_ids: Int? = nil, update_item_taxes_max_taxes_to_disable: Int? = nil, update_item_taxes_max_taxes_to_enable: Int? = nil) {
		self.batch_delete_max_object_ids = batch_delete_max_object_ids
		self.batch_retrieve_max_object_ids = batch_retrieve_max_object_ids
		self.batch_upsert_max_objects_per_batch = batch_upsert_max_objects_per_batch
		self.batch_upsert_max_total_objects = batch_upsert_max_total_objects
		self.search_max_page_limit = search_max_page_limit
		self.update_item_modifier_lists_max_item_ids = update_item_modifier_lists_max_item_ids
		self.update_item_modifier_lists_max_modifier_lists_to_disable = update_item_modifier_lists_max_modifier_lists_to_disable
		self.update_item_modifier_lists_max_modifier_lists_to_enable = update_item_modifier_lists_max_modifier_lists_to_enable
		self.update_item_taxes_max_item_ids = update_item_taxes_max_item_ids
		self.update_item_taxes_max_taxes_to_disable = update_item_taxes_max_taxes_to_disable
		self.update_item_taxes_max_taxes_to_enable = update_item_taxes_max_taxes_to_enable
	}
}

/// A [CatalogObject](#type-CatalogObject) instance of the `ITEM` type, also referred to as an item, in the catalog.
public struct CatalogItem: Codable {
	/// The text of the item's display label in the Square Point of Sale app. Only up to the first five characters of the string are used. This attribute is searchable, and its value length is of Unicode code points.
	public var abbreviation: String?
	/// If `true`, the item can be added to electronically fulfilled orders from the merchant's online store.
	public var available_electronically: Bool?
	/// If `true`, the item can be added to pickup orders from the merchant's online store.
	public var available_for_pickup: Bool?
	/// If `true`, the item can be added to shipping orders from the merchant's online store.
	public var available_online: Bool?
	/// The ID of the item's category, if any.
	public var category_id: String?
	/// The item's description. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	public var description: String?
	/// List of item options IDs for this item. Used to manage and group item variations in a specified order.  Maximum: 6 item options.
	public var item_options: [CatalogItemOptionForItem]?
	/// The color of the item's display label in the Square Point of Sale app. This must be a valid hex color code.
	public var label_color: String?
	/// A set of `CatalogItemModifierListInfo` objects representing the modifier lists that apply to this item, along with the overrides and min and max limits that are specific to this item. Modifier lists may also be added to or deleted from an item using `UpdateItemModifierLists`.
	public var modifier_list_info: [CatalogItemModifierListInfo]?
	/// The item's name. This is a searchable attribute for use in applicable query filters, its value must not be empty, and the length is of Unicode code points.
	public var name: String?
	/// The product type of the item. May not be changed once an item has been created.  Only items of product type `REGULAR` or `APPOINTMENTS_SERVICE` may be created by this API; items with other product types are read-only. See [CatalogItemProductType](#type-catalogitemproducttype) for possible values
	public var product_type: CatalogItemProductType?
	/// If `false`, the Square Point of Sale app will present the `CatalogItem`'s details screen immediately, allowing the merchant to choose `CatalogModifier`s before adding the item to the cart.  This is the default behavior.  If `true`, the Square Point of Sale app will immediately add the item to the cart with the pre-selected modifiers, and merchants can edit modifiers by drilling down onto the item's details.  Third-party clients are encouraged to implement similar behaviors.
	public var skip_modifier_screen: Bool?
	/// A set of IDs indicating the taxes enabled for this item. When updating an item, any taxes listed here will be added to the item. Taxes may also be added to or deleted from an item using `UpdateItemTaxes`.
	public var tax_ids: [String]?
	/// A list of CatalogObjects containing the `CatalogItemVariation`s for this item.
	public var variations: [CatalogObject]?

	/// A [CatalogObject](#type-CatalogObject) instance of the `ITEM` type, also referred to as an item, in the catalog.
	/// - Parameters:
	///   - abbreviation: The text of the item's display label in the Square Point of Sale app. Only up to the first five characters of the string are used. This attribute is searchable, and its value length is of Unicode code points.
	///   - available_electronically: If `true`, the item can be added to electronically fulfilled orders from the merchant's online store.
	///   - available_for_pickup: If `true`, the item can be added to pickup orders from the merchant's online store.
	///   - available_online: If `true`, the item can be added to shipping orders from the merchant's online store.
	///   - category_id: The ID of the item's category, if any.
	///   - description: The item's description. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	///   - item_options: List of item options IDs for this item. Used to manage and group item variations in a specified order.  Maximum: 6 item options.
	///   - label_color: The color of the item's display label in the Square Point of Sale app. This must be a valid hex color code.
	///   - modifier_list_info: A set of `CatalogItemModifierListInfo` objects representing the modifier lists that apply to this item, along with the overrides and min and max limits that are specific to this item. Modifier lists may also be added to or deleted from an item using `UpdateItemModifierLists`.
	///   - name: The item's name. This is a searchable attribute for use in applicable query filters, its value must not be empty, and the length is of Unicode code points.
	///   - product_type: The product type of the item. May not be changed once an item has been created.  Only items of product type `REGULAR` or `APPOINTMENTS_SERVICE` may be created by this API; items with other product types are read-only. See [CatalogItemProductType](#type-catalogitemproducttype) for possible values
	///   - skip_modifier_screen: If `false`, the Square Point of Sale app will present the `CatalogItem`'s details screen immediately, allowing the merchant to choose `CatalogModifier`s before adding the item to the cart.  This is the default behavior.  If `true`, the Square Point of Sale app will immediately add the item to the cart with the pre-selected modifiers, and merchants can edit modifiers by drilling down onto the item's details.  Third-party clients are encouraged to implement similar behaviors.
	///   - tax_ids: A set of IDs indicating the taxes enabled for this item. When updating an item, any taxes listed here will be added to the item. Taxes may also be added to or deleted from an item using `UpdateItemTaxes`.
	///   - variations: A list of CatalogObjects containing the `CatalogItemVariation`s for this item.
	public init(abbreviation: String? = nil, available_electronically: Bool? = nil, available_for_pickup: Bool? = nil, available_online: Bool? = nil, category_id: String? = nil, description: String? = nil, item_options: [CatalogItemOptionForItem]? = nil, label_color: String? = nil, modifier_list_info: [CatalogItemModifierListInfo]? = nil, name: String? = nil, product_type: CatalogItemProductType? = nil, skip_modifier_screen: Bool? = nil, tax_ids: [String]? = nil, variations: [CatalogObject]? = nil) {
		self.abbreviation = abbreviation
		self.available_electronically = available_electronically
		self.available_for_pickup = available_for_pickup
		self.available_online = available_online
		self.category_id = category_id
		self.description = description
		self.item_options = item_options
		self.label_color = label_color
		self.modifier_list_info = modifier_list_info
		self.name = name
		self.product_type = product_type
		self.skip_modifier_screen = skip_modifier_screen
		self.tax_ids = tax_ids
		self.variations = variations
	}
}

/// Options to control the properties of a `CatalogModifierList` applied to a `CatalogItem` instance.
public struct CatalogItemModifierListInfo: Codable {
	/// If `true`, enable this `CatalogModifierList`. The default value is `true`.
	public var enabled: Bool?
	/// If 0 or larger, the largest number of `CatalogModifier`s that can be selected from this `CatalogModifierList`.
	public var max_selected_modifiers: Int?
	/// If 0 or larger, the smallest number of `CatalogModifier`s that must be selected from this `CatalogModifierList`.
	public var min_selected_modifiers: Int?
	/// The ID of the `CatalogModifierList` controlled by this `CatalogModifierListInfo`.
	public var modifier_list_id: String
	/// A set of `CatalogModifierOverride` objects that override whether a given `CatalogModifier` is enabled by default.
	public var modifier_overrides: [CatalogModifierOverride]?

	/// Options to control the properties of a `CatalogModifierList` applied to a `CatalogItem` instance.
	/// - Parameters:
	///   - enabled: If `true`, enable this `CatalogModifierList`. The default value is `true`.
	///   - max_selected_modifiers: If 0 or larger, the largest number of `CatalogModifier`s that can be selected from this `CatalogModifierList`.
	///   - min_selected_modifiers: If 0 or larger, the smallest number of `CatalogModifier`s that must be selected from this `CatalogModifierList`.
	///   - modifier_list_id: The ID of the `CatalogModifierList` controlled by this `CatalogModifierListInfo`.
	///   - modifier_overrides: A set of `CatalogModifierOverride` objects that override whether a given `CatalogModifier` is enabled by default.
	public init(modifier_list_id: String, enabled: Bool? = nil, max_selected_modifiers: Int? = nil, min_selected_modifiers: Int? = nil, modifier_overrides: [CatalogModifierOverride]? = nil) {
		self.modifier_list_id = modifier_list_id
		self.enabled = enabled
		self.max_selected_modifiers = max_selected_modifiers
		self.min_selected_modifiers = min_selected_modifiers
		self.modifier_overrides = modifier_overrides
	}
}

/// A group of variations for a `CatalogItem`.
public struct CatalogItemOption: Codable {
	/// The item option's human-readable description. Displayed in the Square Point of Sale app for the seller and in the Online Store or on receipts for the buyer. This is a searchable attribute for use in applicable query filters.
	public var description: String?
	/// The item option's display name for the customer. This is a searchable attribute for use in applicable query filters.
	public var display_name: String?
	/// The item option's display name for the seller. Must be unique across all item options. This is a searchable attribute for use in applicable query filters.
	public var name: String?
	/// If true, display colors for entries in `values` when present.
	public var show_colors: Bool?
	/// A list of CatalogObjects containing the `CatalogItemOptionValue`s for this item.
	public var values: [CatalogObject]?

	/// A group of variations for a `CatalogItem`.
	/// - Parameters:
	///   - description: The item option's human-readable description. Displayed in the Square Point of Sale app for the seller and in the Online Store or on receipts for the buyer. This is a searchable attribute for use in applicable query filters.
	///   - display_name: The item option's display name for the customer. This is a searchable attribute for use in applicable query filters.
	///   - name: The item option's display name for the seller. Must be unique across all item options. This is a searchable attribute for use in applicable query filters.
	///   - show_colors: If true, display colors for entries in `values` when present.
	///   - values: A list of CatalogObjects containing the `CatalogItemOptionValue`s for this item.
	public init(description: String? = nil, display_name: String? = nil, name: String? = nil, show_colors: Bool? = nil, values: [CatalogObject]? = nil) {
		self.description = description
		self.display_name = display_name
		self.name = name
		self.show_colors = show_colors
		self.values = values
	}
}

///  An option that can be assigned to an item. For example, a t-shirt item may offer a color option or a size option.
public struct CatalogItemOptionForItem: Codable {
	/// The unique id of the item option, used to form the dimensions of the item option matrix in a specified order.
	public var item_option_id: String?

	///  An option that can be assigned to an item. For example, a t-shirt item may offer a color option or a size option.
	/// - Parameters:
	///   - item_option_id: The unique id of the item option, used to form the dimensions of the item option matrix in a specified order.
	public init(item_option_id: String? = nil) {
		self.item_option_id = item_option_id
	}
}

/// An enumerated value that can link a `CatalogItemVariation` to an item option as one of its item option values.
public struct CatalogItemOptionValue: Codable {
	/// The HTML-supported hex color for the item option (e.g., "#ff8d4e85"). Only displayed if `show_colors` is enabled on the parent `ItemOption`. When left unset, `color` defaults to white ("#ffffff") when `show_colors` is enabled on the parent `ItemOption`.
	public var color: String?
	/// A human-readable description for the option value. This is a searchable attribute for use in applicable query filters.
	public var description: String?
	/// Unique ID of the associated item option.
	public var item_option_id: String?
	/// Name of this item option value. This is a searchable attribute for use in applicable query filters.
	public var name: String?
	/// Determines where this option value appears in a list of option values.
	public var ordinal: Int?

	/// An enumerated value that can link a `CatalogItemVariation` to an item option as one of its item option values.
	/// - Parameters:
	///   - color: The HTML-supported hex color for the item option (e.g., "#ff8d4e85"). Only displayed if `show_colors` is enabled on the parent `ItemOption`. When left unset, `color` defaults to white ("#ffffff") when `show_colors` is enabled on the parent `ItemOption`.
	///   - description: A human-readable description for the option value. This is a searchable attribute for use in applicable query filters.
	///   - item_option_id: Unique ID of the associated item option.
	///   - name: Name of this item option value. This is a searchable attribute for use in applicable query filters.
	///   - ordinal: Determines where this option value appears in a list of option values.
	public init(color: String? = nil, description: String? = nil, item_option_id: String? = nil, name: String? = nil, ordinal: Int? = nil) {
		self.color = color
		self.description = description
		self.item_option_id = item_option_id
		self.name = name
		self.ordinal = ordinal
	}
}

/// A `CatalogItemOptionValue` links an item variation to an item option as an item option value. For example, a t-shirt item may offer a color option and a size option. An item option value would represent each variation of t-shirt: For example, "Color:Red, Size:Small" or "Color:Blue, Size:Medium".
public struct CatalogItemOptionValueForItemVariation: Codable {
	/// The unique id of an item option.
	public var item_option_id: String?
	/// The unique id of the selected value for the item option.
	public var item_option_value_id: String?

	/// A `CatalogItemOptionValue` links an item variation to an item option as an item option value. For example, a t-shirt item may offer a color option and a size option. An item option value would represent each variation of t-shirt: For example, "Color:Red, Size:Small" or "Color:Blue, Size:Medium".
	/// - Parameters:
	///   - item_option_id: The unique id of an item option.
	///   - item_option_value_id: The unique id of the selected value for the item option.
	public init(item_option_id: String? = nil, item_option_value_id: String? = nil) {
		self.item_option_id = item_option_id
		self.item_option_value_id = item_option_value_id
	}
}

/// The type of a CatalogItem. Connect V2 only allows the creation of `REGULAR` or `APPOINTMENTS_SERVICE` items.
public enum CatalogItemProductType: String, Codable {
	/// An ordinary item.
	case REGULAR
	/// A Square gift card.
	case GIFT_CARD
	/// A service that can be booked using the Square Appointments app.
	case APPOINTMENTS_SERVICE
}

/// An item variation (i.e., product) in the Catalog object model. Each item may have a maximum of 250 item variations.
public struct CatalogItemVariation: Codable {
	/// If the `CatalogItem` that owns this item variation is of type `APPOINTMENTS_SERVICE`, a bool representing whether this service is available for booking.
	public var available_for_booking: Bool?
	/// If the inventory quantity for the variation is less than or equal to this value and `inventory_alert_type` is `LOW_QUANTITY`, the variation displays an alert in the merchant dashboard.  This value is always an integer.
	public var inventory_alert_threshold: Int?
	/// Indicates whether the item variation displays an alert when its inventory quantity is less than or equal to its `inventory_alert_threshold`. See [InventoryAlertType](#type-inventoryalerttype) for possible values
	public var inventory_alert_type: InventoryAlertType?
	/// The ID of the `CatalogItem` associated with this item variation.
	public var item_id: String?
	/// List of item option values associated with this item variation. Listed in the same order as the item options of the parent item.
	public var item_option_values: [CatalogItemOptionValueForItemVariation]?
	/// Per-location price and inventory overrides.
	public var location_overrides: [ItemVariationLocationOverrides]?
	/// ID of the ‘CatalogMeasurementUnit’ that is used to measure the quantity sold of this item variation. If left unset, the item will be sold in whole quantities.
	public var measurement_unit_id: String?
	/// The item variation's name. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	public var name: String?
	/// The order in which this item variation should be displayed. This value is read-only. On writes, the ordinal for each item variation within a parent `CatalogItem` is set according to the item variations's position. On reads, the value is not guaranteed to be sequential or unique.
	public let ordinal: Int?
	/// The item variation's price, if fixed pricing is used.
	public var price_money: Money?
	/// Indicates whether the item variation's price is fixed or determined at the time of sale. See [CatalogPricingType](#type-catalogpricingtype) for possible values
	public var pricing_type: CatalogPricingType?
	/// If the `CatalogItem` that owns this item variation is of type `APPOINTMENTS_SERVICE`, then this is the duration of the service in milliseconds. For example, a 30 minute appointment would have the value `1800000`, which is equal to 30 (minutes) * 60 (seconds per minute) * 1000 (milliseconds per second).
	public var service_duration: Int?
	/// The item variation's SKU, if any. This is a searchable attribute for use in applicable query filters.
	public var sku: String?
	/// Tokens of employees that can perform the service represented by this variation. Only valid for variations of type `APPOINTMENTS_SERVICE`.
	public var team_member_ids: [String]?
	/// If `true`, inventory tracking is active for the variation.
	public var track_inventory: Bool?
	/// The universal product code (UPC) of the item variation, if any. This is a searchable attribute for use in applicable query filters.  The value of this attribute should be a number of 12-14 digits long.  This restriction is enforced on the Square Seller Dashboard,  Square Point of Sale or Retail Point of Sale apps, where this attribute shows in the GTIN field. If a non-compliant UPC value is assigned  to this attribute using the API, the value is not editable on the Seller Dashboard, Square Point of Sale or Retail Point of Sale apps  unless it is updated to fit the expected format.
	public var upc: String?
	/// Arbitrary user metadata to associate with the item variation. This attribute value length is of Unicode code points.
	public var user_data: String?

	/// An item variation (i.e., product) in the Catalog object model. Each item may have a maximum of 250 item variations.
	/// - Parameters:
	///   - available_for_booking: If the `CatalogItem` that owns this item variation is of type `APPOINTMENTS_SERVICE`, a bool representing whether this service is available for booking.
	///   - inventory_alert_threshold: If the inventory quantity for the variation is less than or equal to this value and `inventory_alert_type` is `LOW_QUANTITY`, the variation displays an alert in the merchant dashboard.  This value is always an integer.
	///   - inventory_alert_type: Indicates whether the item variation displays an alert when its inventory quantity is less than or equal to its `inventory_alert_threshold`. See [InventoryAlertType](#type-inventoryalerttype) for possible values
	///   - item_id: The ID of the `CatalogItem` associated with this item variation.
	///   - item_option_values: List of item option values associated with this item variation. Listed in the same order as the item options of the parent item.
	///   - location_overrides: Per-location price and inventory overrides.
	///   - measurement_unit_id: ID of the ‘CatalogMeasurementUnit’ that is used to measure the quantity sold of this item variation. If left unset, the item will be sold in whole quantities.
	///   - name: The item variation's name. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	///   - ordinal: The order in which this item variation should be displayed. This value is read-only. On writes, the ordinal for each item variation within a parent `CatalogItem` is set according to the item variations's position. On reads, the value is not guaranteed to be sequential or unique.
	///   - price_money: The item variation's price, if fixed pricing is used.
	///   - pricing_type: Indicates whether the item variation's price is fixed or determined at the time of sale. See [CatalogPricingType](#type-catalogpricingtype) for possible values
	///   - service_duration: If the `CatalogItem` that owns this item variation is of type `APPOINTMENTS_SERVICE`, then this is the duration of the service in milliseconds. For example, a 30 minute appointment would have the value `1800000`, which is equal to 30 (minutes) * 60 (seconds per minute) * 1000 (milliseconds per second).
	///   - sku: The item variation's SKU, if any. This is a searchable attribute for use in applicable query filters.
	///   - team_member_ids: Tokens of employees that can perform the service represented by this variation. Only valid for variations of type `APPOINTMENTS_SERVICE`.
	///   - track_inventory: If `true`, inventory tracking is active for the variation.
	///   - upc: The universal product code (UPC) of the item variation, if any. This is a searchable attribute for use in applicable query filters.  The value of this attribute should be a number of 12-14 digits long.  This restriction is enforced on the Square Seller Dashboard,  Square Point of Sale or Retail Point of Sale apps, where this attribute shows in the GTIN field. If a non-compliant UPC value is assigned  to this attribute using the API, the value is not editable on the Seller Dashboard, Square Point of Sale or Retail Point of Sale apps  unless it is updated to fit the expected format.
	///   - user_data: Arbitrary user metadata to associate with the item variation. This attribute value length is of Unicode code points.
	public init(available_for_booking: Bool? = nil, inventory_alert_threshold: Int? = nil, inventory_alert_type: InventoryAlertType? = nil, item_id: String? = nil, item_option_values: [CatalogItemOptionValueForItemVariation]? = nil, location_overrides: [ItemVariationLocationOverrides]? = nil, measurement_unit_id: String? = nil, name: String? = nil, ordinal: Int? = nil, price_money: Money? = nil, pricing_type: CatalogPricingType? = nil, service_duration: Int? = nil, sku: String? = nil, team_member_ids: [String]? = nil, track_inventory: Bool? = nil, upc: String? = nil, user_data: String? = nil) {
		self.available_for_booking = available_for_booking
		self.inventory_alert_threshold = inventory_alert_threshold
		self.inventory_alert_type = inventory_alert_type
		self.item_id = item_id
		self.item_option_values = item_option_values
		self.location_overrides = location_overrides
		self.measurement_unit_id = measurement_unit_id
		self.name = name
		self.ordinal = ordinal
		self.price_money = price_money
		self.pricing_type = pricing_type
		self.service_duration = service_duration
		self.sku = sku
		self.team_member_ids = team_member_ids
		self.track_inventory = track_inventory
		self.upc = upc
		self.user_data = user_data
	}
}

/// Represents the unit used to measure a `CatalogItemVariation` and specifies the precision for decimal quantities.
public struct CatalogMeasurementUnit: Codable {
	/// Indicates the unit used to measure the quantity of a catalog item variation.
	public var measurement_unit: MeasurementUnit?
	/// An integer between 0 and 5 that represents the maximum number of positions allowed after the decimal in quantities measured with this unit. For example:  - if the precision is 0, the quantity can be 1, 2, 3, etc. - if the precision is 1, the quantity can be 0.1, 0.2, etc. - if the precision is 2, the quantity can be 0.01, 0.12, etc.  Default: 3
	public var precision: Int?

	/// Represents the unit used to measure a `CatalogItemVariation` and specifies the precision for decimal quantities.
	/// - Parameters:
	///   - measurement_unit: Indicates the unit used to measure the quantity of a catalog item variation.
	///   - precision: An integer between 0 and 5 that represents the maximum number of positions allowed after the decimal in quantities measured with this unit. For example:  - if the precision is 0, the quantity can be 1, 2, 3, etc. - if the precision is 1, the quantity can be 0.1, 0.2, etc. - if the precision is 2, the quantity can be 0.01, 0.12, etc.  Default: 3
	public init(measurement_unit: MeasurementUnit? = nil, precision: Int? = nil) {
		self.measurement_unit = measurement_unit
		self.precision = precision
	}
}

/// A modifier applicable to items at the time of sale.
public struct CatalogModifier: Codable {
	/// The ID of the `CatalogModifierList` associated with this modifier.
	public var modifier_list_id: String?
	/// The modifier name.  This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	public var name: String?
	/// Determines where this `CatalogModifier` appears in the `CatalogModifierList`.
	public var ordinal: Int?
	/// The modifier price.
	public var price_money: Money?

	/// A modifier applicable to items at the time of sale.
	/// - Parameters:
	///   - modifier_list_id: The ID of the `CatalogModifierList` associated with this modifier.
	///   - name: The modifier name.  This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	///   - ordinal: Determines where this `CatalogModifier` appears in the `CatalogModifierList`.
	///   - price_money: The modifier price.
	public init(modifier_list_id: String? = nil, name: String? = nil, ordinal: Int? = nil, price_money: Money? = nil) {
		self.modifier_list_id = modifier_list_id
		self.name = name
		self.ordinal = ordinal
		self.price_money = price_money
	}
}

/// A list of modifiers applicable to items at the time of sale.  For example, a "Condiments" modifier list applicable to a "Hot Dog" item may contain "Ketchup", "Mustard", and "Relish" modifiers. Use the `selection_type` field to specify whether or not multiple selections from the modifier list are allowed.
public struct CatalogModifierList: Codable {
	/// The options included in the `CatalogModifierList`. You must include at least one `CatalogModifier`. Each CatalogObject must have type `MODIFIER` and contain `CatalogModifier` data.
	public var modifiers: [CatalogObject]?
	/// The name for the `CatalogModifierList` instance. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	public var name: String?
	/// Determines where this modifier list appears in a list of `CatalogModifierList` values.
	public var ordinal: Int?
	/// Indicates whether multiple options from the modifier list can be applied to a single `CatalogItem`. See [CatalogModifierListSelectionType](#type-catalogmodifierlistselectiontype) for possible values
	public var selection_type: CatalogModifierListSelectionType?

	/// A list of modifiers applicable to items at the time of sale.  For example, a "Condiments" modifier list applicable to a "Hot Dog" item may contain "Ketchup", "Mustard", and "Relish" modifiers. Use the `selection_type` field to specify whether or not multiple selections from the modifier list are allowed.
	/// - Parameters:
	///   - modifiers: The options included in the `CatalogModifierList`. You must include at least one `CatalogModifier`. Each CatalogObject must have type `MODIFIER` and contain `CatalogModifier` data.
	///   - name: The name for the `CatalogModifierList` instance. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	///   - ordinal: Determines where this modifier list appears in a list of `CatalogModifierList` values.
	///   - selection_type: Indicates whether multiple options from the modifier list can be applied to a single `CatalogItem`. See [CatalogModifierListSelectionType](#type-catalogmodifierlistselectiontype) for possible values
	public init(modifiers: [CatalogObject]? = nil, name: String? = nil, ordinal: Int? = nil, selection_type: CatalogModifierListSelectionType? = nil) {
		self.modifiers = modifiers
		self.name = name
		self.ordinal = ordinal
		self.selection_type = selection_type
	}
}

/// Indicates whether a CatalogModifierList supports multiple selections.
public enum CatalogModifierListSelectionType: String, Codable {
	/// Indicates that a CatalogModifierList allows only a single CatalogModifier to be selected.
	case SINGLE
	/// Indicates that a CatalogModifierList allows multiple CatalogModifier to be selected.
	case MULTIPLE
}

/// Options to control how to override the default behavior of the specified modifier.
public struct CatalogModifierOverride: Codable {
	/// The ID of the `CatalogModifier` whose default behavior is being overridden.
	public var modifier_id: String
	/// If `true`, this `CatalogModifier` should be selected by default for this `CatalogItem`.
	public var on_by_default: Bool?

	/// Options to control how to override the default behavior of the specified modifier.
	/// - Parameters:
	///   - modifier_id: The ID of the `CatalogModifier` whose default behavior is being overridden.
	///   - on_by_default: If `true`, this `CatalogModifier` should be selected by default for this `CatalogItem`.
	public init(modifier_id: String, on_by_default: Bool? = nil) {
		self.modifier_id = modifier_id
		self.on_by_default = on_by_default
	}
}

/// The wrapper object for the Catalog entries of a given object type.  The type of a particular `CatalogObject` is determined by the value of the `type` attribute and only the corresponding data attribute can be set on the `CatalogObject` instance. For example, the following list shows some instances of `CatalogObject` of a given `type` and their corresponding data attribute that can be set: - For a `CatalogObject` of the `ITEM` type, set the `item_data` attribute to yield the `CatalogItem` object. - For a `CatalogObject` of the `ITEM_VARIATION` type, set the `item_variation_data` attribute to yield the `CatalogItemVariation` object. - For a `CatalogObject` of the `MODIFIER` type, set the `modifier_data` attribute to yield the `CatalogModifier` object. - For a `CatalogObject` of the `MODIFIER_LIST` type, set the `modifier_list_data` attribute to yield the `CatalogModifierList` object. - For a `CatalogObject` of the `CATEGORY` type, set the `category_data` attribute to yield the `CatalogCategory` object. - For a `CatalogObject` of the `DISCOUNT` type, set the `discount_data` attribute to yield the `CatalogDiscount` object. - For a `CatalogObject` of the `TAX` type, set the `tax_data` attribute to yield the `CatalogTax` object. - For a `CatalogObject` of the `IMAGE` type, set the `image_data` attribute to yield the `CatalogImageData`  object. - For a `CatalogObject` of the `QUICK_AMOUNTS_SETTINGS` type, set the `quick_amounts_settings_data` attribute to yield the `CatalogQuickAmountsSettings` object. - For a `CatalogObject` of the `PRICING_RULE` type, set the `pricing_rule_data` attribute to yield the `CatalogPricingRule` object. - For a `CatalogObject` of the `TIME_PERIOD` type, set the `time_period_data` attribute to yield the `CatalogTimePeriod` object. - For a `CatalogObject` of the `PRODUCT_SET` type, set the `product_set_data` attribute to yield the `CatalogProductSet`  object. - For a `CatalogObject` of the `SUBSCRIPTION_PLAN` type, set the `subscription_plan_data` attribute to yield the `CatalogSubscriptionPlan` object.   For a more detailed discussion of the Catalog data model, please see the [Design a Catalog](/catalog-api/design-a-catalog) guide.
public struct CatalogObject: Codable {
	/// A list of locations where the object is not present, even if `present_at_all_locations` is `true`.
	public var absent_at_location_ids: [String]?
	/// The Connect v1 IDs for this object at each location where it is present, where they differ from the object's Connect V2 ID. The field will only be present for objects that have been created or modified by legacy APIs.
	public var catalog_v1_ids: [CatalogV1Id]?
	/// Structured data for a `CatalogCategory`, set for CatalogObjects of type `CATEGORY`.
	public var category_data: CatalogCategory?
	/// Structured data for a `CatalogCustomAttributeDefinition`, set for CatalogObjects of type `CUSTOM_ATTRIBUTE_DEFINITION`.
	public var custom_attribute_definition_data: CatalogCustomAttributeDefinition?
	/// A map (key-value pairs) of application-defined custom attribute values. The value of a key-value pair is a `CatalogCustomAttributeValue` object. The key is the `key` attribute value defined in the associated `CatalogCustomAttributeDefinition` object defined by the application making the request.  If the `CatalogCustomAttributeDefinition` object is defined by another application, the `CatalogCustomAttributeDefinition`'s key attribute value is prefixed by the defining application ID. For example, if the `CatalogCustomAttributeDefinition` has a `key` attribute of `"cocoa_brand"` and the defining application ID is `"abcd1234"`, the key in the map is `"abcd1234:cocoa_brand"` if the application making the request is different from the application defining the custom attribute definition. Otherwise, the key used in the map is simply `"cocoa_brand"`.  Application-defined custom attributes that are set at a global (location-independent) level. Custom attribute values are intended to store additional information about a catalog object or associations with an entity in another system. Do not use custom attributes to store any sensitive information (personally identifiable information, card details, etc.).
	public var custom_attribute_values: CatalogCustomAttributeValue?
	/// Structured data for a `CatalogDiscount`, set for CatalogObjects of type `DISCOUNT`.
	public var discount_data: CatalogDiscount?
	/// An identifier to reference this object in the catalog. When a new `CatalogObject` is inserted, the client should set the id to a temporary identifier starting with a "`#`" character. Other objects being inserted or updated within the same request may use this identifier to refer to the new object.  When the server receives the new object, it will supply a unique identifier that replaces the temporary identifier for all future references.
	public var id: String
	/// Structured data for a `CatalogImage`, set for CatalogObjects of type `IMAGE`.
	public var image_data: CatalogImage?
	/// Identifies the `CatalogImage` attached to this `CatalogObject`.
	public var image_id: String?
	/// If `true`, the object has been deleted from the database. Must be `false` for new objects being inserted. When deleted, the `updated_at` field will equal the deletion time.
	public var is_deleted: Bool?
	/// Structured data for a `CatalogItem`, set for CatalogObjects of type `ITEM`.
	public var item_data: CatalogItem?
	/// Structured data for a `CatalogItemOption`, set for CatalogObjects of type `ITEM_OPTION`.
	public var item_option_data: CatalogItemOption?
	/// Structured data for a `CatalogItemOptionValue`, set for CatalogObjects of type `ITEM_OPTION_VAL`.
	public var item_option_value_data: CatalogItemOptionValue?
	/// Structured data for a `CatalogItemVariation`, set for CatalogObjects of type `ITEM_VARIATION`.
	public var item_variation_data: CatalogItemVariation?
	/// Structured data for a `CatalogMeasurementUnit`, set for CatalogObjects of type `MEASUREMENT_UNIT`.
	public var measurement_unit_data: CatalogMeasurementUnit?
	/// Structured data for a `CatalogModifier`, set for CatalogObjects of type `MODIFIER`.
	public var modifier_data: CatalogModifier?
	/// Structured data for a `CatalogModifierList`, set for CatalogObjects of type `MODIFIER_LIST`.
	public var modifier_list_data: CatalogModifierList?
	/// If `true`, this object is present at all locations (including future locations), except where specified in the `absent_at_location_ids` field. If `false`, this object is not present at any locations (including future locations), except where specified in the `present_at_location_ids` field. If not specified, defaults to `true`.
	public var present_at_all_locations: Bool?
	/// A list of locations where the object is present, even if `present_at_all_locations` is `false`.
	public var present_at_location_ids: [String]?
	/// Structured data for a `CatalogPricingRule`, set for CatalogObjects of type `PRICING_RULE`. A `CatalogPricingRule` object often works with a `CatalogProductSet` object or a `CatalogTimePeriod` object.
	public var pricing_rule_data: CatalogPricingRule?
	/// Structured data for a `CatalogProductSet`, set for CatalogObjects of type `PRODUCT_SET`.
	public var product_set_data: CatalogProductSet?
	/// Structured data for a `CatalogQuickAmountsSettings`, set for CatalogObjects of type `QUICK_AMOUNTS_SETTINGS`.
	public var quick_amounts_settings_data: CatalogQuickAmountsSettings?
	/// Structured data for a `CatalogSubscriptionPlan`, set for CatalogObjects of type `SUBSCRIPTION_PLAN`.
	public var subscription_plan_data: CatalogSubscriptionPlan?
	/// Structured data for a `CatalogTax`, set for CatalogObjects of type `TAX`.
	public var tax_data: CatalogTax?
	/// Structured data for a `CatalogTimePeriod`, set for CatalogObjects of type `TIME_PERIOD`.
	public var time_period_data: CatalogTimePeriod?
	/// The type of this object. Each object type has expected properties expressed in a structured format within its corresponding `*_data` field below. See [CatalogObjectType](#type-catalogobjecttype) for possible values
	public var type: CatalogObjectType
	/// Last modification [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) in RFC 3339 format, e.g., `"2016-08-15T23:59:33.123Z"` would indicate the UTC time (denoted by `Z`) of August 15, 2016 at 23:59:33 and 123 milliseconds.
	public let updated_at: Timestamp?
	/// The version of the object. When updating an object, the version supplied must match the version in the database, otherwise the write will be rejected as conflicting.
	public var version: Int?

	/// The wrapper object for the Catalog entries of a given object type.  The type of a particular `CatalogObject` is determined by the value of the `type` attribute and only the corresponding data attribute can be set on the `CatalogObject` instance. For example, the following list shows some instances of `CatalogObject` of a given `type` and their corresponding data attribute that can be set: - For a `CatalogObject` of the `ITEM` type, set the `item_data` attribute to yield the `CatalogItem` object. - For a `CatalogObject` of the `ITEM_VARIATION` type, set the `item_variation_data` attribute to yield the `CatalogItemVariation` object. - For a `CatalogObject` of the `MODIFIER` type, set the `modifier_data` attribute to yield the `CatalogModifier` object. - For a `CatalogObject` of the `MODIFIER_LIST` type, set the `modifier_list_data` attribute to yield the `CatalogModifierList` object. - For a `CatalogObject` of the `CATEGORY` type, set the `category_data` attribute to yield the `CatalogCategory` object. - For a `CatalogObject` of the `DISCOUNT` type, set the `discount_data` attribute to yield the `CatalogDiscount` object. - For a `CatalogObject` of the `TAX` type, set the `tax_data` attribute to yield the `CatalogTax` object. - For a `CatalogObject` of the `IMAGE` type, set the `image_data` attribute to yield the `CatalogImageData`  object. - For a `CatalogObject` of the `QUICK_AMOUNTS_SETTINGS` type, set the `quick_amounts_settings_data` attribute to yield the `CatalogQuickAmountsSettings` object. - For a `CatalogObject` of the `PRICING_RULE` type, set the `pricing_rule_data` attribute to yield the `CatalogPricingRule` object. - For a `CatalogObject` of the `TIME_PERIOD` type, set the `time_period_data` attribute to yield the `CatalogTimePeriod` object. - For a `CatalogObject` of the `PRODUCT_SET` type, set the `product_set_data` attribute to yield the `CatalogProductSet`  object. - For a `CatalogObject` of the `SUBSCRIPTION_PLAN` type, set the `subscription_plan_data` attribute to yield the `CatalogSubscriptionPlan` object.   For a more detailed discussion of the Catalog data model, please see the [Design a Catalog](/catalog-api/design-a-catalog) guide.
	/// - Parameters:
	///   - absent_at_location_ids: A list of locations where the object is not present, even if `present_at_all_locations` is `true`.
	///   - catalog_v1_ids: The Connect v1 IDs for this object at each location where it is present, where they differ from the object's Connect V2 ID. The field will only be present for objects that have been created or modified by legacy APIs.
	///   - category_data: Structured data for a `CatalogCategory`, set for CatalogObjects of type `CATEGORY`.
	///   - custom_attribute_definition_data: Structured data for a `CatalogCustomAttributeDefinition`, set for CatalogObjects of type `CUSTOM_ATTRIBUTE_DEFINITION`.
	///   - custom_attribute_values: A map (key-value pairs) of application-defined custom attribute values. The value of a key-value pair is a `CatalogCustomAttributeValue` object. The key is the `key` attribute value defined in the associated `CatalogCustomAttributeDefinition` object defined by the application making the request.  If the `CatalogCustomAttributeDefinition` object is defined by another application, the `CatalogCustomAttributeDefinition`'s key attribute value is prefixed by the defining application ID. For example, if the `CatalogCustomAttributeDefinition` has a `key` attribute of `"cocoa_brand"` and the defining application ID is `"abcd1234"`, the key in the map is `"abcd1234:cocoa_brand"` if the application making the request is different from the application defining the custom attribute definition. Otherwise, the key used in the map is simply `"cocoa_brand"`.  Application-defined custom attributes that are set at a global (location-independent) level. Custom attribute values are intended to store additional information about a catalog object or associations with an entity in another system. Do not use custom attributes to store any sensitive information (personally identifiable information, card details, etc.).
	///   - discount_data: Structured data for a `CatalogDiscount`, set for CatalogObjects of type `DISCOUNT`.
	///   - id: An identifier to reference this object in the catalog. When a new `CatalogObject` is inserted, the client should set the id to a temporary identifier starting with a "`#`" character. Other objects being inserted or updated within the same request may use this identifier to refer to the new object.  When the server receives the new object, it will supply a unique identifier that replaces the temporary identifier for all future references.
	///   - image_data: Structured data for a `CatalogImage`, set for CatalogObjects of type `IMAGE`.
	///   - image_id: Identifies the `CatalogImage` attached to this `CatalogObject`.
	///   - is_deleted: If `true`, the object has been deleted from the database. Must be `false` for new objects being inserted. When deleted, the `updated_at` field will equal the deletion time.
	///   - item_data: Structured data for a `CatalogItem`, set for CatalogObjects of type `ITEM`.
	///   - item_option_data: Structured data for a `CatalogItemOption`, set for CatalogObjects of type `ITEM_OPTION`.
	///   - item_option_value_data: Structured data for a `CatalogItemOptionValue`, set for CatalogObjects of type `ITEM_OPTION_VAL`.
	///   - item_variation_data: Structured data for a `CatalogItemVariation`, set for CatalogObjects of type `ITEM_VARIATION`.
	///   - measurement_unit_data: Structured data for a `CatalogMeasurementUnit`, set for CatalogObjects of type `MEASUREMENT_UNIT`.
	///   - modifier_data: Structured data for a `CatalogModifier`, set for CatalogObjects of type `MODIFIER`.
	///   - modifier_list_data: Structured data for a `CatalogModifierList`, set for CatalogObjects of type `MODIFIER_LIST`.
	///   - present_at_all_locations: If `true`, this object is present at all locations (including future locations), except where specified in the `absent_at_location_ids` field. If `false`, this object is not present at any locations (including future locations), except where specified in the `present_at_location_ids` field. If not specified, defaults to `true`.
	///   - present_at_location_ids: A list of locations where the object is present, even if `present_at_all_locations` is `false`.
	///   - pricing_rule_data: Structured data for a `CatalogPricingRule`, set for CatalogObjects of type `PRICING_RULE`. A `CatalogPricingRule` object often works with a `CatalogProductSet` object or a `CatalogTimePeriod` object.
	///   - product_set_data: Structured data for a `CatalogProductSet`, set for CatalogObjects of type `PRODUCT_SET`.
	///   - quick_amounts_settings_data: Structured data for a `CatalogQuickAmountsSettings`, set for CatalogObjects of type `QUICK_AMOUNTS_SETTINGS`.
	///   - subscription_plan_data: Structured data for a `CatalogSubscriptionPlan`, set for CatalogObjects of type `SUBSCRIPTION_PLAN`.
	///   - tax_data: Structured data for a `CatalogTax`, set for CatalogObjects of type `TAX`.
	///   - time_period_data: Structured data for a `CatalogTimePeriod`, set for CatalogObjects of type `TIME_PERIOD`.
	///   - type: The type of this object. Each object type has expected properties expressed in a structured format within its corresponding `*_data` field below. See [CatalogObjectType](#type-catalogobjecttype) for possible values
	///   - updated_at: Last modification [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) in RFC 3339 format, e.g., `"2016-08-15T23:59:33.123Z"` would indicate the UTC time (denoted by `Z`) of August 15, 2016 at 23:59:33 and 123 milliseconds.
	///   - version: The version of the object. When updating an object, the version supplied must match the version in the database, otherwise the write will be rejected as conflicting.
	public init(id: String, type: CatalogObjectType, absent_at_location_ids: [String]? = nil, catalog_v1_ids: [CatalogV1Id]? = nil, category_data: CatalogCategory? = nil, custom_attribute_definition_data: CatalogCustomAttributeDefinition? = nil, custom_attribute_values: CatalogCustomAttributeValue? = nil, discount_data: CatalogDiscount? = nil, image_data: CatalogImage? = nil, image_id: String? = nil, is_deleted: Bool? = nil, item_data: CatalogItem? = nil, item_option_data: CatalogItemOption? = nil, item_option_value_data: CatalogItemOptionValue? = nil, item_variation_data: CatalogItemVariation? = nil, measurement_unit_data: CatalogMeasurementUnit? = nil, modifier_data: CatalogModifier? = nil, modifier_list_data: CatalogModifierList? = nil, present_at_all_locations: Bool? = nil, present_at_location_ids: [String]? = nil, pricing_rule_data: CatalogPricingRule? = nil, product_set_data: CatalogProductSet? = nil, quick_amounts_settings_data: CatalogQuickAmountsSettings? = nil, subscription_plan_data: CatalogSubscriptionPlan? = nil, tax_data: CatalogTax? = nil, time_period_data: CatalogTimePeriod? = nil, updated_at: Timestamp? = nil, version: Int? = nil) {
		self.id = id
		self.type = type
		self.absent_at_location_ids = absent_at_location_ids
		self.catalog_v1_ids = catalog_v1_ids
		self.category_data = category_data
		self.custom_attribute_definition_data = custom_attribute_definition_data
		self.custom_attribute_values = custom_attribute_values
		self.discount_data = discount_data
		self.image_data = image_data
		self.image_id = image_id
		self.is_deleted = is_deleted
		self.item_data = item_data
		self.item_option_data = item_option_data
		self.item_option_value_data = item_option_value_data
		self.item_variation_data = item_variation_data
		self.measurement_unit_data = measurement_unit_data
		self.modifier_data = modifier_data
		self.modifier_list_data = modifier_list_data
		self.present_at_all_locations = present_at_all_locations
		self.present_at_location_ids = present_at_location_ids
		self.pricing_rule_data = pricing_rule_data
		self.product_set_data = product_set_data
		self.quick_amounts_settings_data = quick_amounts_settings_data
		self.subscription_plan_data = subscription_plan_data
		self.tax_data = tax_data
		self.time_period_data = time_period_data
		self.updated_at = updated_at
		self.version = version
	}
}

/// A batch of catalog objects.
public struct CatalogObjectBatch: Codable {
	/// A list of CatalogObjects belonging to this batch.
	public var objects: [CatalogObject]

	/// A batch of catalog objects.
	/// - Parameters:
	///   - objects: A list of CatalogObjects belonging to this batch.
	public init(objects: [CatalogObject]) {
		self.objects = objects
	}
}

/// A reference to a Catalog object at a specific version. In general this is used as an entry point into a graph of catalog objects, where the objects exist at a specific version.
public struct CatalogObjectReference: Codable {
	/// The version of the object.
	public var catalog_version: Int?
	/// The ID of the referenced object.
	public var object_id: String?

	/// A reference to a Catalog object at a specific version. In general this is used as an entry point into a graph of catalog objects, where the objects exist at a specific version.
	/// - Parameters:
	///   - catalog_version: The version of the object.
	///   - object_id: The ID of the referenced object.
	public init(catalog_version: Int? = nil, object_id: String? = nil) {
		self.catalog_version = catalog_version
		self.object_id = object_id
	}
}

/// Possible types of CatalogObjects returned from the Catalog, each containing type-specific properties in the `*_data` field corresponding to the object type.
public enum CatalogObjectType: String, Codable {
	/// An item, corresponding to `CatalogItem`. The item-specific data will be stored in the `item_data` field.
	case ITEM
	/// An image, corresponding to `CatalogImage`. The image-specific data will be stored in the `image_data` field.
	case IMAGE
	/// A category, corresponding to `CatalogCategory`. The category-specific data will be stored in the `category_data` field.
	case CATEGORY
	/// An item variation, corresponding to `CatalogItemVariation`. The item variation-specific data will be stored in the `item_variation_data` field.
	case ITEM_VARIATION
	/// A tax, corresponding to `CatalogTax`. The tax-specific data will be stored in the `tax_data` field.
	case TAX
	/// A discount, corresponding to `CatalogDiscount`. The discount-specific data will be stored in the `discount_data` field.
	case DISCOUNT
	/// A modifier list, corresponding to `CatalogModifierList`. The modifier list-specific data will be stored in the `modifier_list_data` field.
	case MODIFIER_LIST
	/// A modifier, corresponding to `CatalogModifier`. The modifier-specific data will be stored in the `modifier_data` field.
	case MODIFIER
	/// A pricing rule, corresponding to `CatalogPricingRule`. The pricing-rule-specific data will be stored in the `pricing_rule_data` field.
	case PRICING_RULE
	/// A product set, corresponding to `CatalogProductSet`. The product-set-specific data will be stored in the `product_set_data` field.
	case PRODUCT_SET
	/// A time period, corresponding to `CatalogTimePeriod`. The time-period-specific data will be stored in the `time_period_data` field.
	case TIME_PERIOD
	/// A measurement unit, corresponding to `CatalogMeasurementUnit`. The unit of measure and precision in which an item variation should be sold.
	case MEASUREMENT_UNIT
	/// A subscription plan, corresponding to `CatalogSubscriptionPlan`.  The subscription plan data is stored in the `subscription_plan_data` field of the `CatalogObject`.
	case SUBSCRIPTION_PLAN
	/// Represents a list of item option values that can be assigned to item variations. For example, a color option or size option for a t-shirt.
	case ITEM_OPTION
	/// Represents an option value associated with one or more item options. For example, an item option of "Size" may have item option values such as "Small" or "Medium".
	case ITEM_OPTION_VAL
	/// Represents the definition of a custom attribute
	case CUSTOM_ATTRIBUTE_DEFINITION
	/// Represents a set of Quick Amounts and their settings at each location. For example, a location may have a list of both AUTO and MANUAL quick amounts that are set to DISABLED.
	case QUICK_AMOUNTS_SETTINGS
}

/// Defines how discounts are automatically applied to a set of items that match the pricing rule during the active time period.
public struct CatalogPricingRule: Codable {
	/// __Deprecated__: Please use the `exclude_products_id` field to apply an exclude set instead. Exclude sets allow better control over quantity ranges and offer more flexibility for which matched items receive a discount.  `CatalogProductSet` to apply the pricing to. An apply rule matches within the subset of the cart that fits the match rules (the match set). An apply rule can only match once in the match set. If not supplied, the pricing will be applied to all products in the match set. Other products retain their base price, or a price generated by other rules.
	public var apply_products_id: String?
	/// Unique ID for the `CatalogDiscount` to take off the price of all matched items.
	public var discount_id: String?
	/// `CatalogProductSet` to exclude from the pricing rule. An exclude rule matches within the subset of the cart that fits the match rules (the match set). An exclude rule can only match once in the match set. If not supplied, the pricing will be applied to all products in the match set. Other products retain their base price, or a price generated by other rules.
	public var exclude_products_id: String?
	/// If an `exclude_products_id` was given, controls which subset of matched products is excluded from any discounts.  Default value: `LEAST_EXPENSIVE` See [ExcludeStrategy](#type-excludestrategy) for possible values
	public var exclude_strategy: ExcludeStrategy?
	/// Unique ID for the `CatalogProductSet` that will be matched by this rule. A match rule matches within the entire cart, and can match multiple times. This field will always be set.
	public var match_products_id: String?
	/// User-defined name for the pricing rule. For example, "Buy one get one free" or "10% off".
	public var name: String?
	/// A list of unique IDs for the catalog time periods when this pricing rule is in effect. If left unset, the pricing rule is always in effect.
	public var time_period_ids: [String]?
	/// Represents the date the Pricing Rule is valid from. Represented in RFC 3339 full-date format (YYYY-MM-DD).
	public var valid_from_date: Timestamp?
	/// Represents the local time the pricing rule should be valid from. Represented in RFC 3339 partial-time format (HH:MM:SS). Partial seconds will be truncated.
	public var valid_from_local_time: Timestamp?
	/// Represents the date the Pricing Rule is valid until. Represented in RFC 3339 full-date format (YYYY-MM-DD).
	public var valid_until_date: Timestamp?
	/// Represents the local time the pricing rule should be valid until. Represented in RFC 3339 partial-time format (HH:MM:SS). Partial seconds will be truncated.
	public var valid_until_local_time: Timestamp?

	/// Defines how discounts are automatically applied to a set of items that match the pricing rule during the active time period.
	/// - Parameters:
	///   - apply_products_id: __Deprecated__: Please use the `exclude_products_id` field to apply an exclude set instead. Exclude sets allow better control over quantity ranges and offer more flexibility for which matched items receive a discount.  `CatalogProductSet` to apply the pricing to. An apply rule matches within the subset of the cart that fits the match rules (the match set). An apply rule can only match once in the match set. If not supplied, the pricing will be applied to all products in the match set. Other products retain their base price, or a price generated by other rules.
	///   - discount_id: Unique ID for the `CatalogDiscount` to take off the price of all matched items.
	///   - exclude_products_id: `CatalogProductSet` to exclude from the pricing rule. An exclude rule matches within the subset of the cart that fits the match rules (the match set). An exclude rule can only match once in the match set. If not supplied, the pricing will be applied to all products in the match set. Other products retain their base price, or a price generated by other rules.
	///   - exclude_strategy: If an `exclude_products_id` was given, controls which subset of matched products is excluded from any discounts.  Default value: `LEAST_EXPENSIVE` See [ExcludeStrategy](#type-excludestrategy) for possible values
	///   - match_products_id: Unique ID for the `CatalogProductSet` that will be matched by this rule. A match rule matches within the entire cart, and can match multiple times. This field will always be set.
	///   - name: User-defined name for the pricing rule. For example, "Buy one get one free" or "10% off".
	///   - time_period_ids: A list of unique IDs for the catalog time periods when this pricing rule is in effect. If left unset, the pricing rule is always in effect.
	///   - valid_from_date: Represents the date the Pricing Rule is valid from. Represented in RFC 3339 full-date format (YYYY-MM-DD).
	///   - valid_from_local_time: Represents the local time the pricing rule should be valid from. Represented in RFC 3339 partial-time format (HH:MM:SS). Partial seconds will be truncated.
	///   - valid_until_date: Represents the date the Pricing Rule is valid until. Represented in RFC 3339 full-date format (YYYY-MM-DD).
	///   - valid_until_local_time: Represents the local time the pricing rule should be valid until. Represented in RFC 3339 partial-time format (HH:MM:SS). Partial seconds will be truncated.
	public init(apply_products_id: String? = nil, discount_id: String? = nil, exclude_products_id: String? = nil, exclude_strategy: ExcludeStrategy? = nil, match_products_id: String? = nil, name: String? = nil, time_period_ids: [String]? = nil, valid_from_date: Timestamp? = nil, valid_from_local_time: Timestamp? = nil, valid_until_date: Timestamp? = nil, valid_until_local_time: Timestamp? = nil) {
		self.apply_products_id = apply_products_id
		self.discount_id = discount_id
		self.exclude_products_id = exclude_products_id
		self.exclude_strategy = exclude_strategy
		self.match_products_id = match_products_id
		self.name = name
		self.time_period_ids = time_period_ids
		self.valid_from_date = valid_from_date
		self.valid_from_local_time = valid_from_local_time
		self.valid_until_date = valid_until_date
		self.valid_until_local_time = valid_until_local_time
	}
}

/// Indicates whether the price of a CatalogItemVariation should be entered manually at the time of sale.
public enum CatalogPricingType: String, Codable {
	/// The catalog item variation's price is fixed.
	case FIXED_PRICING
	/// The catalog item variation's price is entered at the time of sale.
	case VARIABLE_PRICING
}

/// Represents a collection of catalog objects for the purpose of applying a `PricingRule`. Including a catalog object will include all of its subtypes. For example, including a category in a product set will include all of its items and associated item variations in the product set. Including an item in a product set will also include its item variations.
public struct CatalogProductSet: Codable {
	/// If set to `true`, the product set will include every item in the catalog. Only one of `product_ids_all`, `product_ids_any`, or `all_products` can be set.
	public var all_products: Bool?
	/// User-defined name for the product set. For example, "Clearance Items" or "Winter Sale Items".
	public var name: String?
	/// Unique IDs for any `CatalogObject` included in this product set. All objects in this set must be included in an order for a pricing rule to apply.  Only one of `product_ids_all`, `product_ids_any`, or `all_products` can be set.  Max: 500 catalog object IDs.
	public var product_ids_all: [String]?
	///  Unique IDs for any `CatalogObject` included in this product set. Any number of these catalog objects can be in an order for a pricing rule to apply.  This can be used with `product_ids_all` in a parent `CatalogProductSet` to match groups of products for a bulk discount, such as a discount for an entree and side combo.  Only one of `product_ids_all`, `product_ids_any`, or `all_products` can be set.  Max: 500 catalog object IDs.
	public var product_ids_any: [String]?
	/// If set, there must be exactly this many items from `products_any` or `products_all` in the cart for the discount to apply.  Cannot be combined with either `quantity_min` or `quantity_max`.
	public var quantity_exact: Int?
	/// If set, the pricing rule will apply to a maximum of this many items from `products_any` or `products_all`.
	public var quantity_max: Int?
	/// If set, there must be at least this many items from `products_any` or `products_all` in a cart for the discount to apply. See `quantity_exact`. Defaults to 0 if `quantity_exact`, `quantity_min` and `quantity_max` are all unspecified.
	public var quantity_min: Int?

	/// Represents a collection of catalog objects for the purpose of applying a `PricingRule`. Including a catalog object will include all of its subtypes. For example, including a category in a product set will include all of its items and associated item variations in the product set. Including an item in a product set will also include its item variations.
	/// - Parameters:
	///   - all_products: If set to `true`, the product set will include every item in the catalog. Only one of `product_ids_all`, `product_ids_any`, or `all_products` can be set.
	///   - name: User-defined name for the product set. For example, "Clearance Items" or "Winter Sale Items".
	///   - product_ids_all: Unique IDs for any `CatalogObject` included in this product set. All objects in this set must be included in an order for a pricing rule to apply.  Only one of `product_ids_all`, `product_ids_any`, or `all_products` can be set.  Max: 500 catalog object IDs.
	///   - product_ids_any:  Unique IDs for any `CatalogObject` included in this product set. Any number of these catalog objects can be in an order for a pricing rule to apply.  This can be used with `product_ids_all` in a parent `CatalogProductSet` to match groups of products for a bulk discount, such as a discount for an entree and side combo.  Only one of `product_ids_all`, `product_ids_any`, or `all_products` can be set.  Max: 500 catalog object IDs.
	///   - quantity_exact: If set, there must be exactly this many items from `products_any` or `products_all` in the cart for the discount to apply.  Cannot be combined with either `quantity_min` or `quantity_max`.
	///   - quantity_max: If set, the pricing rule will apply to a maximum of this many items from `products_any` or `products_all`.
	///   - quantity_min: If set, there must be at least this many items from `products_any` or `products_all` in a cart for the discount to apply. See `quantity_exact`. Defaults to 0 if `quantity_exact`, `quantity_min` and `quantity_max` are all unspecified.
	public init(all_products: Bool? = nil, name: String? = nil, product_ids_all: [String]? = nil, product_ids_any: [String]? = nil, quantity_exact: Int? = nil, quantity_max: Int? = nil, quantity_min: Int? = nil) {
		self.all_products = all_products
		self.name = name
		self.product_ids_all = product_ids_all
		self.product_ids_any = product_ids_any
		self.quantity_exact = quantity_exact
		self.quantity_max = quantity_max
		self.quantity_min = quantity_min
	}
}

/// A query composed of one or more different types of filters to narrow the scope of targeted objects when calling the `SearchCatalogObjects` endpoint.  Although a query can have multiple filters, only certain query types can be combined per call to [SearchCatalogObjects](#endpoint-Catalog-SearchCatalogObjects). Any combination of the following types may be used together: - [exact_query](#type-CatalogExactQuery) - [prefix_query](#type-CatalogPrefixQuery) - [range_query](#type-CatalogRangeQuery) - [sorted_attribute_query](#type-CatalogSortedAttribute) - [text_query](#type-CatalogTextQuery) All other query types cannot be combined with any others.  When a query filter is based on an attribute, the attribute must be searchable. Searchable attributes are listed as follows, along their parent types that can be searched for with applicable query filters.  * Searchable attribute and objects queryable by searchable attributes ** - `name`:  `CatalogItem`, `CatalogItemVariation`, `CatalogCategory`, `CatalogTax`, `CatalogDiscount`, `CatalogModifier`, 'CatalogModifierList`, `CatalogItemOption`, `CatalogItemOptionValue` - `description`: `CatalogItem`, `CatalogItemOptionValue` - `abbreviation`: `CatalogItem` - `upc`: `CatalogItemVariation` - `sku`: `CatalogItemVariation` - `caption`: `CatalogImage` - `display_name`: `CatalogItemOption`  For example, to search for [CatalogItem](#type-CatalogItem) objects by searchable attributes, you can use the `"name"`, `"description"`, or `"abbreviation"` attribute in an applicable query filter.
public struct CatalogQuery: Codable {
	/// An exact query expression to return objects with attribute name and value matching the specified attribute name and value exactly. Value matching is case insensitive.
	public var exact_query: CatalogQueryExact?
	/// A query expression to return item variations (of the `CatalogItemVariation` that contain all of the specified `CatalogItemOption` IDs.
	public var item_variations_for_item_option_values_query: CatalogQueryItemVariationsForItemOptionValues?
	/// A query expression to return items that contains the specified item options (as identified the corresponding `CatalogItemOption` IDs).
	public var items_for_item_options_query: CatalogQueryItemsForItemOptions?
	/// A query expression to return items that have any of the given modifier list (as identified by the corresponding `CatalogModifierList`s IDs) enabled.
	public var items_for_modifier_list_query: CatalogQueryItemsForModifierList?
	/// A query expression to return items that have any of the specified taxes (as identified by the corresponding `CatalogTax` object IDs) enabled.
	public var items_for_tax_query: CatalogQueryItemsForTax?
	/// A prefix query expression to return objects with attribute values that have a prefix matching the specified string value. Value matching is case insensitive.
	public var prefix_query: CatalogQueryPrefix?
	/// A range query expression to return objects with numeric values that lie in the specified range.
	public var range_query: CatalogQueryRange?
	/// A set query expression to return objects with attribute name and value matching the specified attribute name and any of the specified attribute values exactly. Value matching is case insensitive.
	public var set_query: CatalogQuerySet?
	/// A query expression to sort returned query result by the given attribute.
	public var sorted_attribute_query: CatalogQuerySortedAttribute?
	/// A text query expression to return objects whose searchable attributes contain all of the given keywords, irrespective of their order. For example, if a `CatalogItem` contains custom attribute values of `{"name": "t-shirt"}` and `{"description": "Small, Purple"}`, the query filter of `{"keywords": ["shirt", "sma", "purp"]}` returns this item.
	public var text_query: CatalogQueryText?

	/// A query composed of one or more different types of filters to narrow the scope of targeted objects when calling the `SearchCatalogObjects` endpoint.  Although a query can have multiple filters, only certain query types can be combined per call to [SearchCatalogObjects](#endpoint-Catalog-SearchCatalogObjects). Any combination of the following types may be used together: - [exact_query](#type-CatalogExactQuery) - [prefix_query](#type-CatalogPrefixQuery) - [range_query](#type-CatalogRangeQuery) - [sorted_attribute_query](#type-CatalogSortedAttribute) - [text_query](#type-CatalogTextQuery) All other query types cannot be combined with any others.  When a query filter is based on an attribute, the attribute must be searchable. Searchable attributes are listed as follows, along their parent types that can be searched for with applicable query filters.  * Searchable attribute and objects queryable by searchable attributes ** - `name`:  `CatalogItem`, `CatalogItemVariation`, `CatalogCategory`, `CatalogTax`, `CatalogDiscount`, `CatalogModifier`, 'CatalogModifierList`, `CatalogItemOption`, `CatalogItemOptionValue` - `description`: `CatalogItem`, `CatalogItemOptionValue` - `abbreviation`: `CatalogItem` - `upc`: `CatalogItemVariation` - `sku`: `CatalogItemVariation` - `caption`: `CatalogImage` - `display_name`: `CatalogItemOption`  For example, to search for [CatalogItem](#type-CatalogItem) objects by searchable attributes, you can use the `"name"`, `"description"`, or `"abbreviation"` attribute in an applicable query filter.
	/// - Parameters:
	///   - exact_query: An exact query expression to return objects with attribute name and value matching the specified attribute name and value exactly. Value matching is case insensitive.
	///   - item_variations_for_item_option_values_query: A query expression to return item variations (of the `CatalogItemVariation` that contain all of the specified `CatalogItemOption` IDs.
	///   - items_for_item_options_query: A query expression to return items that contains the specified item options (as identified the corresponding `CatalogItemOption` IDs).
	///   - items_for_modifier_list_query: A query expression to return items that have any of the given modifier list (as identified by the corresponding `CatalogModifierList`s IDs) enabled.
	///   - items_for_tax_query: A query expression to return items that have any of the specified taxes (as identified by the corresponding `CatalogTax` object IDs) enabled.
	///   - prefix_query: A prefix query expression to return objects with attribute values that have a prefix matching the specified string value. Value matching is case insensitive.
	///   - range_query: A range query expression to return objects with numeric values that lie in the specified range.
	///   - set_query: A set query expression to return objects with attribute name and value matching the specified attribute name and any of the specified attribute values exactly. Value matching is case insensitive.
	///   - sorted_attribute_query: A query expression to sort returned query result by the given attribute.
	///   - text_query: A text query expression to return objects whose searchable attributes contain all of the given keywords, irrespective of their order. For example, if a `CatalogItem` contains custom attribute values of `{"name": "t-shirt"}` and `{"description": "Small, Purple"}`, the query filter of `{"keywords": ["shirt", "sma", "purp"]}` returns this item.
	public init(exact_query: CatalogQueryExact? = nil, item_variations_for_item_option_values_query: CatalogQueryItemVariationsForItemOptionValues? = nil, items_for_item_options_query: CatalogQueryItemsForItemOptions? = nil, items_for_modifier_list_query: CatalogQueryItemsForModifierList? = nil, items_for_tax_query: CatalogQueryItemsForTax? = nil, prefix_query: CatalogQueryPrefix? = nil, range_query: CatalogQueryRange? = nil, set_query: CatalogQuerySet? = nil, sorted_attribute_query: CatalogQuerySortedAttribute? = nil, text_query: CatalogQueryText? = nil) {
		self.exact_query = exact_query
		self.item_variations_for_item_option_values_query = item_variations_for_item_option_values_query
		self.items_for_item_options_query = items_for_item_options_query
		self.items_for_modifier_list_query = items_for_modifier_list_query
		self.items_for_tax_query = items_for_tax_query
		self.prefix_query = prefix_query
		self.range_query = range_query
		self.set_query = set_query
		self.sorted_attribute_query = sorted_attribute_query
		self.text_query = text_query
	}
}

/// The query filter to return the search result by exact match of the specified attribute name and value.
public struct CatalogQueryExact: Codable {
	/// The name of the attribute to be searched. Matching of the attribute name is exact.
	public var attribute_name: String
	/// The desired value of the search attribute. Matching of the attribute value is case insensitive and can be partial. For example, if a specified value of "sma", objects with the named attribute value of "Small", "small" are both matched.
	public var attribute_value: String

	/// The query filter to return the search result by exact match of the specified attribute name and value.
	/// - Parameters:
	///   - attribute_name: The name of the attribute to be searched. Matching of the attribute name is exact.
	///   - attribute_value: The desired value of the search attribute. Matching of the attribute value is case insensitive and can be partial. For example, if a specified value of "sma", objects with the named attribute value of "Small", "small" are both matched.
	public init(attribute_name: String, attribute_value: String) {
		self.attribute_name = attribute_name
		self.attribute_value = attribute_value
	}
}

/// The query filter to return the item variations containing the specified item option value IDs.
public struct CatalogQueryItemVariationsForItemOptionValues: Codable {
	/// A set of `CatalogItemOptionValue` IDs to be used to find associated `CatalogItemVariation`s. All ItemVariations that contain all of the given Item Option Values (in any order) will be returned.
	public var item_option_value_ids: [String]?

	/// The query filter to return the item variations containing the specified item option value IDs.
	/// - Parameters:
	///   - item_option_value_ids: A set of `CatalogItemOptionValue` IDs to be used to find associated `CatalogItemVariation`s. All ItemVariations that contain all of the given Item Option Values (in any order) will be returned.
	public init(item_option_value_ids: [String]? = nil) {
		self.item_option_value_ids = item_option_value_ids
	}
}

/// The query filter to return the items containing the specified item option IDs.
public struct CatalogQueryItemsForItemOptions: Codable {
	/// A set of `CatalogItemOption` IDs to be used to find associated `CatalogItem`s. All Items that contain all of the given Item Options (in any order) will be returned.
	public var item_option_ids: [String]?

	/// The query filter to return the items containing the specified item option IDs.
	/// - Parameters:
	///   - item_option_ids: A set of `CatalogItemOption` IDs to be used to find associated `CatalogItem`s. All Items that contain all of the given Item Options (in any order) will be returned.
	public init(item_option_ids: [String]? = nil) {
		self.item_option_ids = item_option_ids
	}
}

/// The query filter to return the items containing the specified modifier list IDs.
public struct CatalogQueryItemsForModifierList: Codable {
	/// A set of `CatalogModifierList` IDs to be used to find associated `CatalogItem`s.
	public var modifier_list_ids: [String]

	/// The query filter to return the items containing the specified modifier list IDs.
	/// - Parameters:
	///   - modifier_list_ids: A set of `CatalogModifierList` IDs to be used to find associated `CatalogItem`s.
	public init(modifier_list_ids: [String]) {
		self.modifier_list_ids = modifier_list_ids
	}
}

/// The query filter to return the items containing the specified tax IDs.
public struct CatalogQueryItemsForTax: Codable {
	/// A set of `CatalogTax` IDs to be used to find associated `CatalogItem`s.
	public var tax_ids: [String]

	/// The query filter to return the items containing the specified tax IDs.
	/// - Parameters:
	///   - tax_ids: A set of `CatalogTax` IDs to be used to find associated `CatalogItem`s.
	public init(tax_ids: [String]) {
		self.tax_ids = tax_ids
	}
}

/// The query filter to return the search result whose named attribute values are prefixed by the specified attribute value.
public struct CatalogQueryPrefix: Codable {
	/// The name of the attribute to be searched.
	public var attribute_name: String
	/// The desired prefix of the search attribute value.
	public var attribute_prefix: String

	/// The query filter to return the search result whose named attribute values are prefixed by the specified attribute value.
	/// - Parameters:
	///   - attribute_name: The name of the attribute to be searched.
	///   - attribute_prefix: The desired prefix of the search attribute value.
	public init(attribute_name: String, attribute_prefix: String) {
		self.attribute_name = attribute_name
		self.attribute_prefix = attribute_prefix
	}
}

/// The query filter to return the search result whose named attribute values fall between the specified range.
public struct CatalogQueryRange: Codable {
	/// The desired maximum value for the search attribute (inclusive).
	public var attribute_max_value: Int?
	/// The desired minimum value for the search attribute (inclusive).
	public var attribute_min_value: Int?
	/// The name of the attribute to be searched.
	public var attribute_name: String

	/// The query filter to return the search result whose named attribute values fall between the specified range.
	/// - Parameters:
	///   - attribute_max_value: The desired maximum value for the search attribute (inclusive).
	///   - attribute_min_value: The desired minimum value for the search attribute (inclusive).
	///   - attribute_name: The name of the attribute to be searched.
	public init(attribute_name: String, attribute_max_value: Int? = nil, attribute_min_value: Int? = nil) {
		self.attribute_name = attribute_name
		self.attribute_max_value = attribute_max_value
		self.attribute_min_value = attribute_min_value
	}
}

/// The query filter to return the search result(s) by exact match of the specified `attribute_name` and any of the `attribute_values`.
public struct CatalogQuerySet: Codable {
	/// The name of the attribute to be searched. Matching of the attribute name is exact.
	public var attribute_name: String
	/// The desired values of the search attribute. Matching of the attribute values is exact and case insensitive. A maximum of 250 values may be searched in a request.
	public var attribute_values: [String]

	/// The query filter to return the search result(s) by exact match of the specified `attribute_name` and any of the `attribute_values`.
	/// - Parameters:
	///   - attribute_name: The name of the attribute to be searched. Matching of the attribute name is exact.
	///   - attribute_values: The desired values of the search attribute. Matching of the attribute values is exact and case insensitive. A maximum of 250 values may be searched in a request.
	public init(attribute_name: String, attribute_values: [String]) {
		self.attribute_name = attribute_name
		self.attribute_values = attribute_values
	}
}

/// The query expression to specify the key to sort search results.
public struct CatalogQuerySortedAttribute: Codable {
	/// The attribute whose value is used as the sort key.
	public var attribute_name: String
	/// The first attribute value to be returned by the query. Ascending sorts will return only objects with this value or greater, while descending sorts will return only objects with this value or less. If unset, start at the beginning (for ascending sorts) or end (for descending sorts).
	public var initial_attribute_value: String?
	/// The desired sort order, `"ASC"` (ascending) or `"DESC"` (descending). See [SortOrder](#type-sortorder) for possible values
	public var sort_order: SortOrder?

	/// The query expression to specify the key to sort search results.
	/// - Parameters:
	///   - attribute_name: The attribute whose value is used as the sort key.
	///   - initial_attribute_value: The first attribute value to be returned by the query. Ascending sorts will return only objects with this value or greater, while descending sorts will return only objects with this value or less. If unset, start at the beginning (for ascending sorts) or end (for descending sorts).
	///   - sort_order: The desired sort order, `"ASC"` (ascending) or `"DESC"` (descending). See [SortOrder](#type-sortorder) for possible values
	public init(attribute_name: String, initial_attribute_value: String? = nil, sort_order: SortOrder? = nil) {
		self.attribute_name = attribute_name
		self.initial_attribute_value = initial_attribute_value
		self.sort_order = sort_order
	}
}

/// The query filter to return the search result whose searchable attribute values contain all of the specified keywords or tokens, independent of the token order or case.
public struct CatalogQueryText: Codable {
	/// A list of 1, 2, or 3 search keywords. Keywords with fewer than 3 characters are ignored.
	public var keywords: [String]

	/// The query filter to return the search result whose searchable attribute values contain all of the specified keywords or tokens, independent of the token order or case.
	/// - Parameters:
	///   - keywords: A list of 1, 2, or 3 search keywords. Keywords with fewer than 3 characters are ignored.
	public init(keywords: [String]) {
		self.keywords = keywords
	}
}

/// Represents a Quick Amount in the Catalog.
public struct CatalogQuickAmount: Codable {
	/// Represents the actual amount of the Quick Amount with Money type.
	public var amount: Money
	/// The order in which this Quick Amount should be displayed.
	public var ordinal: Int?
	/// Describes the ranking of the Quick Amount provided by machine learning model, in the range [0, 100]. MANUAL type amount will always have score = 100.
	public var score: Int?
	/// Represents the type of the Quick Amount. See [CatalogQuickAmountType](#type-catalogquickamounttype) for possible values
	public var type: CatalogQuickAmountType

	/// Represents a Quick Amount in the Catalog.
	/// - Parameters:
	///   - amount: Represents the actual amount of the Quick Amount with Money type.
	///   - ordinal: The order in which this Quick Amount should be displayed.
	///   - score: Describes the ranking of the Quick Amount provided by machine learning model, in the range [0, 100]. MANUAL type amount will always have score = 100.
	///   - type: Represents the type of the Quick Amount. See [CatalogQuickAmountType](#type-catalogquickamounttype) for possible values
	public init(amount: Money, type: CatalogQuickAmountType, ordinal: Int? = nil, score: Int? = nil) {
		self.amount = amount
		self.type = type
		self.ordinal = ordinal
		self.score = score
	}
}

/// Determines the type of a specific Quick Amount.
public enum CatalogQuickAmountType: String, Codable {
	/// Quick Amount is created manually by the seller.
	case QUICK_AMOUNT_TYPE_MANUAL
	/// Quick Amount is generated automatically by machine learning algorithms.
	case QUICK_AMOUNT_TYPE_AUTO
}

/// A parent Catalog Object model represents a set of Quick Amounts and the settings control the amounts.
public struct CatalogQuickAmountsSettings: Codable {
	/// Represents a set of Quick Amounts at this location.
	public var amounts: [CatalogQuickAmount]?
	/// Represents location's eligibility for auto amounts The boolean should be consistent with whether there are AUTO amounts in the `amounts`.
	public var eligible_for_auto_amounts: Bool?
	/// Represents the option seller currently uses on Quick Amounts. See [CatalogQuickAmountsSettingsOption](#type-catalogquickamountssettingsoption) for possible values
	public var option: CatalogQuickAmountsSettingsOption

	/// A parent Catalog Object model represents a set of Quick Amounts and the settings control the amounts.
	/// - Parameters:
	///   - amounts: Represents a set of Quick Amounts at this location.
	///   - eligible_for_auto_amounts: Represents location's eligibility for auto amounts The boolean should be consistent with whether there are AUTO amounts in the `amounts`.
	///   - option: Represents the option seller currently uses on Quick Amounts. See [CatalogQuickAmountsSettingsOption](#type-catalogquickamountssettingsoption) for possible values
	public init(option: CatalogQuickAmountsSettingsOption, amounts: [CatalogQuickAmount]? = nil, eligible_for_auto_amounts: Bool? = nil) {
		self.option = option
		self.amounts = amounts
		self.eligible_for_auto_amounts = eligible_for_auto_amounts
	}
}

/// Determines a seller's option on Quick Amounts feature.
public enum CatalogQuickAmountsSettingsOption: String, Codable {
	/// Option for seller to disable Quick Amounts.
	case DISABLED
	/// Option for seller to choose manually created Quick Amounts.
	case MANUAL
	/// Option for seller to choose automatically created Quick Amounts.
	case AUTO
}

/// Describes a subscription plan. For more information, see [Set Up and Manage a Subscription Plan](/docs/subscriptions-api/setup-plan).
public struct CatalogSubscriptionPlan: Codable {
	/// The name of the plan.
	public var name: String?
	/// A list of SubscriptionPhase containing the `SubscriptionPhase` for this plan.
	public var phases: [SubscriptionPhase]?

	/// Describes a subscription plan. For more information, see [Set Up and Manage a Subscription Plan](/docs/subscriptions-api/setup-plan).
	/// - Parameters:
	///   - name: The name of the plan.
	///   - phases: A list of SubscriptionPhase containing the `SubscriptionPhase` for this plan.
	public init(name: String? = nil, phases: [SubscriptionPhase]? = nil) {
		self.name = name
		self.phases = phases
	}
}

/// A tax applicable to an item.
public struct CatalogTax: Codable {
	/// If `true`, the fee applies to custom amounts entered into the Square Point of Sale app that are not associated with a particular `CatalogItem`.
	public var applies_to_custom_amounts: Bool?
	/// Whether the tax is calculated based on a payment's subtotal or total. See [TaxCalculationPhase](#type-taxcalculationphase) for possible values
	public var calculation_phase: TaxCalculationPhase?
	/// A Boolean flag to indicate whether the tax is displayed as enabled (`true`) in the Square Point of Sale app or not (`false`).
	public var enabled: Bool?
	/// Whether the tax is `ADDITIVE` or `INCLUSIVE`. See [TaxInclusionType](#type-taxinclusiontype) for possible values
	public var inclusion_type: TaxInclusionType?
	/// The tax's name. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	public var name: String?
	/// The percentage of the tax in decimal form, using a `'.'` as the decimal separator and without a `'%'` sign. A value of `7.5` corresponds to 7.5%.
	public var percentage: String?

	/// A tax applicable to an item.
	/// - Parameters:
	///   - applies_to_custom_amounts: If `true`, the fee applies to custom amounts entered into the Square Point of Sale app that are not associated with a particular `CatalogItem`.
	///   - calculation_phase: Whether the tax is calculated based on a payment's subtotal or total. See [TaxCalculationPhase](#type-taxcalculationphase) for possible values
	///   - enabled: A Boolean flag to indicate whether the tax is displayed as enabled (`true`) in the Square Point of Sale app or not (`false`).
	///   - inclusion_type: Whether the tax is `ADDITIVE` or `INCLUSIVE`. See [TaxInclusionType](#type-taxinclusiontype) for possible values
	///   - name: The tax's name. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	///   - percentage: The percentage of the tax in decimal form, using a `'.'` as the decimal separator and without a `'%'` sign. A value of `7.5` corresponds to 7.5%.
	public init(applies_to_custom_amounts: Bool? = nil, calculation_phase: TaxCalculationPhase? = nil, enabled: Bool? = nil, inclusion_type: TaxInclusionType? = nil, name: String? = nil, percentage: String? = nil) {
		self.applies_to_custom_amounts = applies_to_custom_amounts
		self.calculation_phase = calculation_phase
		self.enabled = enabled
		self.inclusion_type = inclusion_type
		self.name = name
		self.percentage = percentage
	}
}

/// Represents a time period - either a single period or a repeating period.
public struct CatalogTimePeriod: Codable {
	/// An iCalendar (RFC 5545) [event](https://tools.ietf.org/html/rfc5545#section-3.6.1), which specifies the name, timing, duration and recurrence of this time period.  Example:  ``` DTSTART:20190707T180000 DURATION:P2H RRULE:FREQ=WEEKLY;BYDAY=MO,WE,FR ```  Only `SUMMARY`, `DTSTART`, `DURATION` and `RRULE` fields are supported. `DTSTART` must be in local (unzoned) time format. Note that while `BEGIN:VEVENT` and `END:VEVENT` is not required in the request. The response will always include them.
	public var event: String?

	/// Represents a time period - either a single period or a repeating period.
	/// - Parameters:
	///   - event: An iCalendar (RFC 5545) [event](https://tools.ietf.org/html/rfc5545#section-3.6.1), which specifies the name, timing, duration and recurrence of this time period.  Example:  ``` DTSTART:20190707T180000 DURATION:P2H RRULE:FREQ=WEEKLY;BYDAY=MO,WE,FR ```  Only `SUMMARY`, `DTSTART`, `DURATION` and `RRULE` fields are supported. `DTSTART` must be in local (unzoned) time format. Note that while `BEGIN:VEVENT` and `END:VEVENT` is not required in the request. The response will always include them.
	public init(event: String? = nil) {
		self.event = event
	}
}

/// A Square API V1 identifier of an item, including the object ID and its associated location ID.
public struct CatalogV1Id: Codable {
	/// The ID for an object used in the Square API V1, if the object ID differs from the Square API V2 object ID.
	public var catalog_v1_id: String?
	/// The ID of the `Location` this Connect V1 ID is associated with.
	public var location_id: String?

	/// A Square API V1 identifier of an item, including the object ID and its associated location ID.
	/// - Parameters:
	///   - catalog_v1_id: The ID for an object used in the Square API V1, if the object ID differs from the Square API V2 object ID.
	///   - location_id: The ID of the `Location` this Connect V1 ID is associated with.
	public init(catalog_v1_id: String? = nil, location_id: String? = nil) {
		self.catalog_v1_id = catalog_v1_id
		self.location_id = location_id
	}
}

/// Defines the parameters that can be included in the body of a request to the [Charge](#endpoint-charge) endpoint.  Deprecated - recommend using [CreatePayment](#endpoint-payments-createpayment)
public struct ChargeRequest: Codable {
	/// The basic primitive of multi-party transaction. The value is optional. The transaction facilitated by you can be split from here.  If you provide this value, the `amount_money` value in your additional_recipients must not be more than 90% of the `amount_money` value in the charge request. The `location_id` must be the valid location of the app owner merchant.  This field requires the `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission.  This field is currently not supported in sandbox.
	public var additional_recipients: [AdditionalRecipient]?
	/// The amount of money to charge.  Note that you specify the amount in the __smallest denomination of the applicable currency__. For example, US dollar amounts are specified in cents. See [Working with monetary amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts) for details.  The value of `currency` must match the currency associated with the business that is charging the card.
	public var amount_money: Money
	/// The buyer's billing address. This value is optional, but this transaction is ineligible for chargeback protection if neither this parameter nor `shipping_address` is provided.
	public var billing_address: Address?
	/// The buyer's email address, if available. This value is optional, but this transaction is ineligible for chargeback protection if it is not provided.
	public var buyer_email_address: String?
	/// A nonce generated from the `SqPaymentForm` that represents the card to charge.  The application that provides a nonce to this endpoint must be the _same application_ that generated the nonce with the `SqPaymentForm`. Otherwise, the nonce is invalid.  Do not provide a value for this field if you provide a value for `customer_card_id`.
	public var card_nonce: String?
	/// The ID of the customer card on file to charge. Do not provide a value for this field if you provide a value for `card_nonce`.  If you provide this value, you _must_ also provide a value for `customer_id`.
	public var customer_card_id: String?
	/// The ID of the customer to associate this transaction with. This field is required if you provide a value for `customer_card_id`, and optional otherwise.
	public var customer_id: String?
	/// If `true`, the request will only perform an Auth on the provided card. You can then later perform either a Capture (with the `CaptureTransaction` or a Void (with the `VoidTransaction`.  Default value: `false`
	public var delay_capture: Bool?
	/// A value you specify that uniquely identifies this transaction among transactions you've created.  If you're unsure whether a particular transaction succeeded, you can reattempt it with the same idempotency key without worrying about double-charging the buyer.  See [Idempotency keys](#idempotencykeys) for more information.
	public var idempotency_key: String
	/// An optional note to associate with the transaction.  This value cannot exceed 60 characters.
	public var note: String?
	/// The ID of the order to associate with this transaction.  If you provide this value, the `amount_money` value of your request must __exactly match__ the value of the order's `total_money` field.
	public var order_id: String?
	/// An optional ID you can associate with the transaction for your own purposes (such as to associate the transaction with an entity ID in your own database).  This value cannot exceed 40 characters.
	public var reference_id: String?
	/// The buyer's shipping address, if available. This value is optional, but this transaction is ineligible for chargeback protection if neither this parameter nor `billing_address` is provided.
	public var shipping_address: Address?
	/// A token generated by SqPaymentForm's verifyBuyer() that represents customer's device info and 3ds challenge result.
	public var verification_token: String?

	/// Defines the parameters that can be included in the body of a request to the [Charge](#endpoint-charge) endpoint.  Deprecated - recommend using [CreatePayment](#endpoint-payments-createpayment)
	/// - Parameters:
	///   - additional_recipients: The basic primitive of multi-party transaction. The value is optional. The transaction facilitated by you can be split from here.  If you provide this value, the `amount_money` value in your additional_recipients must not be more than 90% of the `amount_money` value in the charge request. The `location_id` must be the valid location of the app owner merchant.  This field requires the `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission.  This field is currently not supported in sandbox.
	///   - amount_money: The amount of money to charge.  Note that you specify the amount in the __smallest denomination of the applicable currency__. For example, US dollar amounts are specified in cents. See [Working with monetary amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts) for details.  The value of `currency` must match the currency associated with the business that is charging the card.
	///   - billing_address: The buyer's billing address. This value is optional, but this transaction is ineligible for chargeback protection if neither this parameter nor `shipping_address` is provided.
	///   - buyer_email_address: The buyer's email address, if available. This value is optional, but this transaction is ineligible for chargeback protection if it is not provided.
	///   - card_nonce: A nonce generated from the `SqPaymentForm` that represents the card to charge.  The application that provides a nonce to this endpoint must be the _same application_ that generated the nonce with the `SqPaymentForm`. Otherwise, the nonce is invalid.  Do not provide a value for this field if you provide a value for `customer_card_id`.
	///   - customer_card_id: The ID of the customer card on file to charge. Do not provide a value for this field if you provide a value for `card_nonce`.  If you provide this value, you _must_ also provide a value for `customer_id`.
	///   - customer_id: The ID of the customer to associate this transaction with. This field is required if you provide a value for `customer_card_id`, and optional otherwise.
	///   - delay_capture: If `true`, the request will only perform an Auth on the provided card. You can then later perform either a Capture (with the `CaptureTransaction` or a Void (with the `VoidTransaction`.  Default value: `false`
	///   - idempotency_key: A value you specify that uniquely identifies this transaction among transactions you've created.  If you're unsure whether a particular transaction succeeded, you can reattempt it with the same idempotency key without worrying about double-charging the buyer.  See [Idempotency keys](#idempotencykeys) for more information.
	///   - note: An optional note to associate with the transaction.  This value cannot exceed 60 characters.
	///   - order_id: The ID of the order to associate with this transaction.  If you provide this value, the `amount_money` value of your request must __exactly match__ the value of the order's `total_money` field.
	///   - reference_id: An optional ID you can associate with the transaction for your own purposes (such as to associate the transaction with an entity ID in your own database).  This value cannot exceed 40 characters.
	///   - shipping_address: The buyer's shipping address, if available. This value is optional, but this transaction is ineligible for chargeback protection if neither this parameter nor `billing_address` is provided.
	///   - verification_token: A token generated by SqPaymentForm's verifyBuyer() that represents customer's device info and 3ds challenge result.
	public init(amount_money: Money, idempotency_key: String, additional_recipients: [AdditionalRecipient]? = nil, billing_address: Address? = nil, buyer_email_address: String? = nil, card_nonce: String? = nil, customer_card_id: String? = nil, customer_id: String? = nil, delay_capture: Bool? = nil, note: String? = nil, order_id: String? = nil, reference_id: String? = nil, shipping_address: Address? = nil, verification_token: String? = nil) {
		self.amount_money = amount_money
		self.idempotency_key = idempotency_key
		self.additional_recipients = additional_recipients
		self.billing_address = billing_address
		self.buyer_email_address = buyer_email_address
		self.card_nonce = card_nonce
		self.customer_card_id = customer_card_id
		self.customer_id = customer_id
		self.delay_capture = delay_capture
		self.note = note
		self.order_id = order_id
		self.reference_id = reference_id
		self.shipping_address = shipping_address
		self.verification_token = verification_token
	}
}

/// Represents an additional recipient (other than the merchant) entitled to a portion of the tender. Support is currently limited to USD, CAD and GBP currencies
public struct ChargeRequestAdditionalRecipient: Codable {
	/// The amount of money distributed to the recipient.
	public var amount_money: Money
	/// The description of the additional recipient.
	public var description: String
	/// The location ID for a recipient (other than the merchant) receiving a portion of the tender.
	public var location_id: String

	/// Represents an additional recipient (other than the merchant) entitled to a portion of the tender. Support is currently limited to USD, CAD and GBP currencies
	/// - Parameters:
	///   - amount_money: The amount of money distributed to the recipient.
	///   - description: The description of the additional recipient.
	///   - location_id: The location ID for a recipient (other than the merchant) receiving a portion of the tender.
	public init(amount_money: Money, description: String, location_id: String) {
		self.amount_money = amount_money
		self.description = description
		self.location_id = location_id
	}
}

/// Defines the fields that are included in the response body of a request to the [Charge](#endpoint-charge) endpoint.  One of `errors` or `transaction` is present in a given response (never both).
public struct ChargeResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The created transaction.
	public var transaction: Transaction?

	/// Defines the fields that are included in the response body of a request to the [Charge](#endpoint-charge) endpoint.  One of `errors` or `transaction` is present in a given response (never both).
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - transaction: The created transaction.
	public init(errors: [SquareError]? = nil, transaction: Transaction? = nil) {
		self.errors = errors
		self.transaction = transaction
	}
}

public struct CheckAppointmentsOnboardedRequest: Codable {

	public init() {
	}
}

public struct CheckAppointmentsOnboardedResponse: Codable {
	/// Indicates whether the seller has enabled the Square Appointments service (`true`) or not (`false`).
	public var appointments_onboarded: Bool?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(appointments_onboarded: Bool? = nil, errors: [SquareError]? = nil) {
		self.appointments_onboarded = appointments_onboarded
		self.errors = errors
	}
}

/// Square Checkout lets merchants accept online payments for supported payment types using a checkout workflow hosted on squareup.com.
public struct Checkout: Codable {
	/// Additional recipients (other than the merchant) receiving a portion of this checkout. For example, fees assessed on the purchase by a third party integration.
	public var additional_recipients: [AdditionalRecipient]?
	/// If `true`, Square Checkout will collect shipping information on your behalf and store that information with the transaction information in your Square Dashboard.  Default: `false`.
	public var ask_for_shipping_address: Bool?
	/// The URL that the buyer's browser should be redirected to after the checkout is completed.
	public var checkout_page_url: String?
	/// The time when the checkout was created, in RFC 3339 format.
	public let created_at: Timestamp?
	/// ID generated by Square Checkout when a new checkout is requested.
	public var id: String?
	/// The email address to display on the Square Checkout confirmation page and confirmation email that the buyer can use to contact the merchant.  If this value is not set, the confirmation page and email will display the primary email address associated with the merchant's Square account.  Default: none; only exists if explicitly set.
	public var merchant_support_email: String?
	/// Order to be checked out.
	public var order: Order?
	/// If provided, the buyer's email is pre-populated on the checkout page as an editable text field.  Default: none; only exists if explicitly set.
	public var pre_populate_buyer_email: String?
	/// If provided, the buyer's shipping info is pre-populated on the checkout page as editable text fields.  Default: none; only exists if explicitly set.
	public var pre_populate_shipping_address: Address?
	/// The URL to redirect to after checkout is completed with `checkoutId`, Square's `orderId`, `transactionId`, and `referenceId` appended as URL parameters. For example, if the provided redirect_url is `http://www.example.com/order-complete`, a successful transaction redirects the customer to:  <pre><code>http://www.example.com/order-complete?checkoutId=xxxxxx&amp;orderId=xxxxxx&amp;referenceId=xxxxxx&amp;transactionId=xxxxxx</code></pre>  If you do not provide a redirect URL, Square Checkout will display an order confirmation page on your behalf; however Square strongly recommends that you provide a redirect URL so you can verify the transaction results and finalize the order through your existing/normal confirmation workflow.
	public var redirect_url: String?

	/// Square Checkout lets merchants accept online payments for supported payment types using a checkout workflow hosted on squareup.com.
	/// - Parameters:
	///   - additional_recipients: Additional recipients (other than the merchant) receiving a portion of this checkout. For example, fees assessed on the purchase by a third party integration.
	///   - ask_for_shipping_address: If `true`, Square Checkout will collect shipping information on your behalf and store that information with the transaction information in your Square Dashboard.  Default: `false`.
	///   - checkout_page_url: The URL that the buyer's browser should be redirected to after the checkout is completed.
	///   - created_at: The time when the checkout was created, in RFC 3339 format.
	///   - id: ID generated by Square Checkout when a new checkout is requested.
	///   - merchant_support_email: The email address to display on the Square Checkout confirmation page and confirmation email that the buyer can use to contact the merchant.  If this value is not set, the confirmation page and email will display the primary email address associated with the merchant's Square account.  Default: none; only exists if explicitly set.
	///   - order: Order to be checked out.
	///   - pre_populate_buyer_email: If provided, the buyer's email is pre-populated on the checkout page as an editable text field.  Default: none; only exists if explicitly set.
	///   - pre_populate_shipping_address: If provided, the buyer's shipping info is pre-populated on the checkout page as editable text fields.  Default: none; only exists if explicitly set.
	///   - redirect_url: The URL to redirect to after checkout is completed with `checkoutId`, Square's `orderId`, `transactionId`, and `referenceId` appended as URL parameters. For example, if the provided redirect_url is `http://www.example.com/order-complete`, a successful transaction redirects the customer to:  <pre><code>http://www.example.com/order-complete?checkoutId=xxxxxx&amp;orderId=xxxxxx&amp;referenceId=xxxxxx&amp;transactionId=xxxxxx</code></pre>  If you do not provide a redirect URL, Square Checkout will display an order confirmation page on your behalf; however Square strongly recommends that you provide a redirect URL so you can verify the transaction results and finalize the order through your existing/normal confirmation workflow.
	public init(additional_recipients: [AdditionalRecipient]? = nil, ask_for_shipping_address: Bool? = nil, checkout_page_url: String? = nil, created_at: Timestamp? = nil, id: String? = nil, merchant_support_email: String? = nil, order: Order? = nil, pre_populate_buyer_email: String? = nil, pre_populate_shipping_address: Address? = nil, redirect_url: String? = nil) {
		self.additional_recipients = additional_recipients
		self.ask_for_shipping_address = ask_for_shipping_address
		self.checkout_page_url = checkout_page_url
		self.created_at = created_at
		self.id = id
		self.merchant_support_email = merchant_support_email
		self.order = order
		self.pre_populate_buyer_email = pre_populate_buyer_email
		self.pre_populate_shipping_address = pre_populate_shipping_address
		self.redirect_url = redirect_url
	}
}

/// Completes (captures) a payment.  By default, payments are set to `autocomplete` immediately after they are created. To complete payments manually, set `autocomplete` to `false`.
public struct CompletePaymentRequest: Codable {

	/// Completes (captures) a payment.  By default, payments are set to `autocomplete` immediately after they are created. To complete payments manually, set `autocomplete` to `false`.
	public init() {
	}
}

/// The return value from a [CompletePayment](#endpoint-payments-completepayment) call.
public struct CompletePaymentResponse: Codable {
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The successfully completed payment.
	public var payment: Payment?

	/// The return value from a [CompletePayment](#endpoint-payments-completepayment) call.
	/// - Parameters:
	///   - errors: Information about errors encountered during the request.
	///   - payment: The successfully completed payment.
	public init(errors: [SquareError]? = nil, payment: Payment? = nil) {
		self.errors = errors
		self.payment = payment
	}
}

/// Latitude and longitude coordinates.
public struct Coordinates: Codable {
	/// The latitude of the coordinate expressed in degrees.
	public var latitude: StringNumber?
	/// The longitude of the coordinate expressed in degrees.
	public var longitude: StringNumber?

	/// Latitude and longitude coordinates.
	/// - Parameters:
	///   - latitude: The latitude of the coordinate expressed in degrees.
	///   - longitude: The longitude of the coordinate expressed in degrees.
	public init(latitude: StringNumber? = nil, longitude: StringNumber? = nil) {
		self.latitude = latitude
		self.longitude = longitude
	}
}

/// Indicates the country associated with another entity, such as a business. Values are in [ISO 3166-1-alpha-2 format](http://www.iso.org/iso/home/standards/country_codes.htm).
public enum Country: String, Codable {
	/// Unknown
	case ZZ
	/// Andorra
	case AD
	/// United Arab Emirates
	case AE
	/// Afghanistan
	case AF
	/// Antigua and Barbuda
	case AG
	/// Anguilla
	case AI
	/// Albania
	case AL
	/// Armenia
	case AM
	/// Angola
	case AO
	/// Antartica
	case AQ
	/// Argentina
	case AR
	/// American Samoa
	case AS
	/// Austria
	case AT
	/// Australia
	case AU
	/// Aruba
	case AW
	/// Åland Islands
	case AX
	/// Azerbaijan
	case AZ
	/// Bosnia and Herzegovina
	case BA
	/// Barbados
	case BB
	/// Bangladesh
	case BD
	/// Belgium
	case BE
	/// Burkina Faso
	case BF
	/// Bulgaria
	case BG
	/// Bahrain
	case BH
	/// Burundi
	case BI
	/// Benin
	case BJ
	/// Saint Barthélemy
	case BL
	/// Bermuda
	case BM
	/// Brunei
	case BN
	/// Bolivia
	case BO
	/// Bonaire
	case BQ
	/// Brazil
	case BR
	/// Bahamas
	case BS
	/// Bhutan
	case BT
	/// Bouvet Island
	case BV
	/// Botswana
	case BW
	/// Belarus
	case BY
	/// Belize
	case BZ
	/// Canada
	case CA
	/// Cocos Islands
	case CC
	/// Democratic Republic of the Congo
	case CD
	/// Central African Republic
	case CF
	/// Congo
	case CG
	/// Switzerland
	case CH
	/// Ivory Coast
	case CI
	/// Cook Islands
	case CK
	/// Chile
	case CL
	/// Cameroon
	case CM
	/// China
	case CN
	/// Colombia
	case CO
	/// Costa Rica
	case CR
	/// Cuba
	case CU
	/// Cabo Verde
	case CV
	/// Curaçao
	case CW
	/// Christmas Island
	case CX
	/// Cyprus
	case CY
	/// Czechia
	case CZ
	/// Germany
	case DE
	/// Djibouti
	case DJ
	/// Denmark
	case DK
	/// Dominica
	case DM
	/// Dominican Republic
	case DO
	/// Algeria
	case DZ
	/// Ecuador
	case EC
	/// Estonia
	case EE
	/// Egypt
	case EG
	/// Western Sahara
	case EH
	/// Eritrea
	case ER
	/// Spain
	case ES
	/// Ethiopia
	case ET
	/// Finland
	case FI
	/// Fiji
	case FJ
	/// Falkland Islands
	case FK
	/// Federated States of Micronesia
	case FM
	/// Faroe Islands
	case FO
	/// France
	case FR
	/// Gabon
	case GA
	/// United Kingdom
	case GB
	/// Grenada
	case GD
	/// Georgia
	case GE
	/// French Guiana
	case GF
	/// Guernsey
	case GG
	/// Ghana
	case GH
	/// Gibraltar
	case GI
	/// Greenland
	case GL
	/// Gambia
	case GM
	/// Guinea
	case GN
	/// Guadeloupe
	case GP
	/// Equatorial Guinea
	case GQ
	/// Greece
	case GR
	/// South Georgia and the South Sandwich Islands
	case GS
	/// Guatemala
	case GT
	/// Guam
	case GU
	/// Guinea-Bissau
	case GW
	/// Guyana
	case GY
	/// Hong Kong
	case HK
	/// Heard Island and McDonald Islands
	case HM
	/// Honduras
	case HN
	/// Croatia
	case HR
	/// Haiti
	case HT
	/// Hungary
	case HU
	/// Indonesia
	case ID
	/// Ireland
	case IE
	/// Israel
	case IL
	/// Isle of Man
	case IM
	/// India
	case IN
	/// British Indian Ocean Territory
	case IO
	/// Iraq
	case IQ
	/// Iran
	case IR
	/// Iceland
	case IS
	/// Italy
	case IT
	/// Jersey
	case JE
	/// Jamaica
	case JM
	/// Jordan
	case JO
	/// Japan
	case JP
	/// Kenya
	case KE
	/// Kyrgyzstan
	case KG
	/// Cambodia
	case KH
	/// Kiribati
	case KI
	/// Comoros
	case KM
	/// Saint Kitts and Nevis
	case KN
	/// Democratic People's Republic of Korea
	case KP
	/// Republic of Korea
	case KR
	/// Kuwait
	case KW
	/// Cayman Islands
	case KY
	/// Kazakhstan
	case KZ
	/// Lao People's Democratic Republic
	case LA
	/// Lebanon
	case LB
	/// Saint Lucia
	case LC
	/// Liechtenstein
	case LI
	/// Sri Lanka
	case LK
	/// Liberia
	case LR
	/// Lesotho
	case LS
	/// Lithuania
	case LT
	/// Luxembourg
	case LU
	/// Latvia
	case LV
	/// Libya
	case LY
	/// Morocco
	case MA
	/// Monaco
	case MC
	/// Moldova
	case MD
	/// Montenegro
	case ME
	/// Saint Martin
	case MF
	/// Madagascar
	case MG
	/// Marshall Islands
	case MH
	/// North Macedonia
	case MK
	/// Mali
	case ML
	/// Myanmar
	case MM
	/// Mongolia
	case MN
	/// Macao
	case MO
	/// Northern Mariana Islands
	case MP
	/// Martinique
	case MQ
	/// Mauritania
	case MR
	/// Montserrat
	case MS
	/// Malta
	case MT
	/// Mauritius
	case MU
	/// Maldives
	case MV
	/// Malawi
	case MW
	/// Mexico
	case MX
	/// Malaysia
	case MY
	/// Mozambique
	case MZ
	/// Namibia
	case NA
	/// New Caledonia
	case NC
	/// Niger
	case NE
	/// Norfolk Island
	case NF
	/// Nigeria
	case NG
	/// Nicaragua
	case NI
	/// Netherlands
	case NL
	/// Norway
	case NO
	/// Nepal
	case NP
	/// Nauru
	case NR
	/// Niue
	case NU
	/// New Zealand
	case NZ
	/// Oman
	case OM
	/// Panama
	case PA
	/// Peru
	case PE
	/// French Polynesia
	case PF
	/// Papua New Guinea
	case PG
	/// Philippines
	case PH
	/// Pakistan
	case PK
	/// Poland
	case PL
	/// Saint Pierre and Miquelon
	case PM
	/// Pitcairn
	case PN
	/// Puerto Rico
	case PR
	/// Palestine
	case PS
	/// Portugal
	case PT
	/// Palau
	case PW
	/// Paraguay
	case PY
	/// Qatar
	case QA
	/// Réunion
	case RE
	/// Romania
	case RO
	/// Serbia
	case RS
	/// Russia
	case RU
	/// Rwanda
	case RW
	/// Saudi Arabia
	case SA
	/// Solomon Islands
	case SB
	/// Seychelles
	case SC
	/// Sudan
	case SD
	/// Sweden
	case SE
	/// Singapore
	case SG
	/// Saint Helena, Ascension and Tristan da Cunha
	case SH
	/// Slovenia
	case SI
	/// Svalbard and Jan Mayen
	case SJ
	/// Slovakia
	case SK
	/// Sierra Leone
	case SL
	/// San Marino
	case SM
	/// Senegal
	case SN
	/// Somalia
	case SO
	/// Suriname
	case SR
	/// South Sudan
	case SS
	/// Sao Tome and Principe
	case ST
	/// El Salvador
	case SV
	/// Sint Maarten
	case SX
	/// Syrian Arab Republic
	case SY
	/// Eswatini
	case SZ
	/// Turks and Caicos Islands
	case TC
	/// Chad
	case TD
	/// French Southern Territories
	case TF
	/// Togo
	case TG
	/// Thailand
	case TH
	/// Tajikistan
	case TJ
	/// Tokelau
	case TK
	/// Timor-Leste
	case TL
	/// Turkmenistan
	case TM
	/// Tunisia
	case TN
	/// Tonga
	case TO
	/// Turkey
	case TR
	/// Trinidad and Tobago
	case TT
	/// Tuvalu
	case TV
	/// Taiwan
	case TW
	/// Tanzania
	case TZ
	/// Ukraine
	case UA
	/// Uganda
	case UG
	/// United States Minor Outlying Islands
	case UM
	/// United States of America
	case US
	/// Uruguay
	case UY
	/// Uzbekistan
	case UZ
	/// Vatican City
	case VA
	/// Saint Vincent and the Grenadines
	case VC
	/// Venezuela
	case VE
	/// British Virgin Islands
	case VG
	/// U.S. Virgin Islands
	case VI
	/// Vietnam
	case VN
	/// Vanuatu
	case VU
	/// Wallis and Futuna
	case WF
	/// Samoa
	case WS
	/// Yemen
	case YE
	/// Mayotte
	case YT
	/// South Africa
	case ZA
	/// Zambia
	case ZM
	/// Zimbabwe
	case ZW
}

public struct CreateBookingRequest: Codable {
	/// The details of the booking to be created.
	public var booking: Booking
	/// A unique key to make this request an idempotent operation.
	public var idempotency_key: String?

	public init(booking: Booking, idempotency_key: String? = nil) {
		self.booking = booking
		self.idempotency_key = idempotency_key
	}
}

public struct CreateBookingResponse: Codable {
	/// The booking that was created.
	public var booking: Booking?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(booking: Booking? = nil, errors: [SquareError]? = nil) {
		self.booking = booking
		self.errors = errors
	}
}

/// A request to create a new `BreakType`
public struct CreateBreakTypeRequest: Codable {
	/// The `BreakType` to be created.
	public var break_type: BreakType
	/// Unique string value to insure idempotency of the operation
	public var idempotency_key: String?

	/// A request to create a new `BreakType`
	/// - Parameters:
	///   - break_type: The `BreakType` to be created.
	///   - idempotency_key: Unique string value to insure idempotency of the operation
	public init(break_type: BreakType, idempotency_key: String? = nil) {
		self.break_type = break_type
		self.idempotency_key = idempotency_key
	}
}

/// The response to the request to create a `BreakType`. Contains the created `BreakType` object. May contain a set of `Error` objects if the request resulted in errors.
public struct CreateBreakTypeResponse: Codable {
	/// The `BreakType` that was created by the request.
	public var break_type: BreakType?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// The response to the request to create a `BreakType`. Contains the created `BreakType` object. May contain a set of `Error` objects if the request resulted in errors.
	/// - Parameters:
	///   - break_type: The `BreakType` that was created by the request.
	///   - errors: Any errors that occurred during the request.
	public init(break_type: BreakType? = nil, errors: [SquareError]? = nil) {
		self.break_type = break_type
		self.errors = errors
	}
}

/// Defines the parameters that can be included in the body of a request to the __CreateCheckout__ endpoint.
public struct CreateCheckoutRequest: Codable {
	/// The basic primitive of multi-party transaction. The value is optional. The transaction facilitated by you can be split from here.  If you provide this value, the `amount_money` value in your additional_recipients must not be more than 90% of the `total_money` calculated by Square for your order. The `location_id` must be the valid location of the app owner merchant.  This field requires `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission.  This field is currently not supported in sandbox.
	public var additional_recipients: [ChargeRequestAdditionalRecipient]?
	/// If `true`, Square Checkout will collect shipping information on your behalf and store that information with the transaction information in your Square Dashboard.  Default: `false`.
	public var ask_for_shipping_address: Bool?
	/// A unique string that identifies this checkout among others you've created. It can be any valid string but must be unique for every order sent to Square Checkout for a given location ID.  The idempotency key is used to avoid processing the same order more than once. If you're unsure whether a particular checkout was created successfully, you can reattempt it with the same idempotency key and all the same other parameters without worrying about creating duplicates.  We recommend using a random number/string generator native to the language you are working in to generate strings for your idempotency keys.  See the [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency) guide for more information.
	public var idempotency_key: String
	/// The email address to display on the Square Checkout confirmation page and confirmation email that the buyer can use to contact the merchant.  If this value is not set, the confirmation page and email will display the primary email address associated with the merchant's Square account.  Default: none; only exists if explicitly set.
	public var merchant_support_email: String?
	/// An optional note to associate with the checkout object.  This value cannot exceed 60 characters.
	public var note: String?
	/// The order including line items to be checked out.
	public var order: CreateOrderRequest
	/// If provided, the buyer's email is pre-populated on the checkout page as an editable text field.  Default: none; only exists if explicitly set.
	public var pre_populate_buyer_email: String?
	/// If provided, the buyer's shipping info is pre-populated on the checkout page as editable text fields.  Default: none; only exists if explicitly set.
	public var pre_populate_shipping_address: Address?
	/// The URL to redirect to after checkout is completed with `checkoutId`, Square's `orderId`, `transactionId`, and `referenceId` appended as URL parameters. For example, if the provided redirect_url is `http://www.example.com/order-complete`, a successful transaction redirects the customer to:  <pre><code>http://www.example.com/order-complete?checkoutId=xxxxxx&amp;orderId=xxxxxx&amp;referenceId=xxxxxx&amp;transactionId=xxxxxx</code></pre>  If you do not provide a redirect URL, Square Checkout will display an order confirmation page on your behalf; however Square strongly recommends that you provide a redirect URL so you can verify the transaction results and finalize the order through your existing/normal confirmation workflow.  Default: none; only exists if explicitly set.
	public var redirect_url: String?

	/// Defines the parameters that can be included in the body of a request to the __CreateCheckout__ endpoint.
	/// - Parameters:
	///   - additional_recipients: The basic primitive of multi-party transaction. The value is optional. The transaction facilitated by you can be split from here.  If you provide this value, the `amount_money` value in your additional_recipients must not be more than 90% of the `total_money` calculated by Square for your order. The `location_id` must be the valid location of the app owner merchant.  This field requires `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission.  This field is currently not supported in sandbox.
	///   - ask_for_shipping_address: If `true`, Square Checkout will collect shipping information on your behalf and store that information with the transaction information in your Square Dashboard.  Default: `false`.
	///   - idempotency_key: A unique string that identifies this checkout among others you've created. It can be any valid string but must be unique for every order sent to Square Checkout for a given location ID.  The idempotency key is used to avoid processing the same order more than once. If you're unsure whether a particular checkout was created successfully, you can reattempt it with the same idempotency key and all the same other parameters without worrying about creating duplicates.  We recommend using a random number/string generator native to the language you are working in to generate strings for your idempotency keys.  See the [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency) guide for more information.
	///   - merchant_support_email: The email address to display on the Square Checkout confirmation page and confirmation email that the buyer can use to contact the merchant.  If this value is not set, the confirmation page and email will display the primary email address associated with the merchant's Square account.  Default: none; only exists if explicitly set.
	///   - note: An optional note to associate with the checkout object.  This value cannot exceed 60 characters.
	///   - order: The order including line items to be checked out.
	///   - pre_populate_buyer_email: If provided, the buyer's email is pre-populated on the checkout page as an editable text field.  Default: none; only exists if explicitly set.
	///   - pre_populate_shipping_address: If provided, the buyer's shipping info is pre-populated on the checkout page as editable text fields.  Default: none; only exists if explicitly set.
	///   - redirect_url: The URL to redirect to after checkout is completed with `checkoutId`, Square's `orderId`, `transactionId`, and `referenceId` appended as URL parameters. For example, if the provided redirect_url is `http://www.example.com/order-complete`, a successful transaction redirects the customer to:  <pre><code>http://www.example.com/order-complete?checkoutId=xxxxxx&amp;orderId=xxxxxx&amp;referenceId=xxxxxx&amp;transactionId=xxxxxx</code></pre>  If you do not provide a redirect URL, Square Checkout will display an order confirmation page on your behalf; however Square strongly recommends that you provide a redirect URL so you can verify the transaction results and finalize the order through your existing/normal confirmation workflow.  Default: none; only exists if explicitly set.
	public init(idempotency_key: String, order: CreateOrderRequest, additional_recipients: [ChargeRequestAdditionalRecipient]? = nil, ask_for_shipping_address: Bool? = nil, merchant_support_email: String? = nil, note: String? = nil, pre_populate_buyer_email: String? = nil, pre_populate_shipping_address: Address? = nil, redirect_url: String? = nil) {
		self.idempotency_key = idempotency_key
		self.order = order
		self.additional_recipients = additional_recipients
		self.ask_for_shipping_address = ask_for_shipping_address
		self.merchant_support_email = merchant_support_email
		self.note = note
		self.pre_populate_buyer_email = pre_populate_buyer_email
		self.pre_populate_shipping_address = pre_populate_shipping_address
		self.redirect_url = redirect_url
	}
}

/// Defines the fields that are included in the response body of a request to the __CreateCheckout__ endpoint.
public struct CreateCheckoutResponse: Codable {
	/// The newly created checkout. If the same request was made with the same idempotency_key, this will be the checkout created with the idempotency_key.
	public var checkout: Checkout?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// Defines the fields that are included in the response body of a request to the __CreateCheckout__ endpoint.
	/// - Parameters:
	///   - checkout: The newly created checkout. If the same request was made with the same idempotency_key, this will be the checkout created with the idempotency_key.
	///   - errors: Any errors that occurred during the request.
	public init(checkout: Checkout? = nil, errors: [SquareError]? = nil) {
		self.checkout = checkout
		self.errors = errors
	}
}

/// Defines the fields that are included in the request body of a request to the CreateCustomerCard endpoint.
public struct CreateCustomerCardRequest: Codable {
	/// Address information for the card on file. Only the `postal_code` field is required for payments in the US and Canada.
	public var billing_address: Address?
	/// A card nonce representing the credit card to link to the customer.  Card nonces are generated by the Square Payment Form when customers enter their card information. See [Embedding the payment form](https://developer.squareup.com/docs/payment-form/payment-form-walkthrough) for more information.  __NOTE:__ Card nonces generated by digital wallets (e.g., Apple Pay) cannot be used to create a customer card.
	public var card_nonce: String
	/// The full name printed on the credit card.
	public var cardholder_name: String?
	/// An identifying token generated by `SqPaymentForm.verifyBuyer()`. Verification tokens encapsulate customer device information and 3-D Secure challenge results to indicate that Square has verified the buyer identity.
	public var verification_token: String?

	/// Defines the fields that are included in the request body of a request to the CreateCustomerCard endpoint.
	/// - Parameters:
	///   - billing_address: Address information for the card on file. Only the `postal_code` field is required for payments in the US and Canada.
	///   - card_nonce: A card nonce representing the credit card to link to the customer.  Card nonces are generated by the Square Payment Form when customers enter their card information. See [Embedding the payment form](https://developer.squareup.com/docs/payment-form/payment-form-walkthrough) for more information.  __NOTE:__ Card nonces generated by digital wallets (e.g., Apple Pay) cannot be used to create a customer card.
	///   - cardholder_name: The full name printed on the credit card.
	///   - verification_token: An identifying token generated by `SqPaymentForm.verifyBuyer()`. Verification tokens encapsulate customer device information and 3-D Secure challenge results to indicate that Square has verified the buyer identity.
	public init(card_nonce: String, billing_address: Address? = nil, cardholder_name: String? = nil, verification_token: String? = nil) {
		self.card_nonce = card_nonce
		self.billing_address = billing_address
		self.cardholder_name = cardholder_name
		self.verification_token = verification_token
	}
}

/// Defines the fields that are included in the response body of a request to the CreateCustomerCard endpoint.  One of `errors` or `card` is present in a given response (never both).
public struct CreateCustomerCardResponse: Codable {
	/// The created card on file.
	public var card: Card?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// Defines the fields that are included in the response body of a request to the CreateCustomerCard endpoint.  One of `errors` or `card` is present in a given response (never both).
	/// - Parameters:
	///   - card: The created card on file.
	///   - errors: Any errors that occurred during the request.
	public init(card: Card? = nil, errors: [SquareError]? = nil) {
		self.card = card
		self.errors = errors
	}
}

/// Defines the body parameters that can be provided in a request to the [CreateCustomerGroup](#endpoint-createcustomegroup) endpoint.
public struct CreateCustomerGroupRequest: Codable {
	/// The customer group to create.
	public var group: CustomerGroup
	/// The idempotency key for the request. See the [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency) guide for more information.
	public var idempotency_key: String?

	/// Defines the body parameters that can be provided in a request to the [CreateCustomerGroup](#endpoint-createcustomegroup) endpoint.
	/// - Parameters:
	///   - group: The customer group to create.
	///   - idempotency_key: The idempotency key for the request. See the [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency) guide for more information.
	public init(group: CustomerGroup, idempotency_key: String? = nil) {
		self.group = group
		self.idempotency_key = idempotency_key
	}
}

/// Defines the fields that are included in the response body of a request to the [CreateCustomerGroup](#endpoint-createcustomergroup) endpoint.  One of `errors` or `group` is present in a given response (never both).
public struct CreateCustomerGroupResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The successfully created customer group.
	public var group: CustomerGroup?

	/// Defines the fields that are included in the response body of a request to the [CreateCustomerGroup](#endpoint-createcustomergroup) endpoint.  One of `errors` or `group` is present in a given response (never both).
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - group: The successfully created customer group.
	public init(errors: [SquareError]? = nil, group: CustomerGroup? = nil) {
		self.errors = errors
		self.group = group
	}
}

/// Defines the body parameters that can be provided in a request to the CreateCustomer endpoint.
public struct CreateCustomerRequest: Codable {
	/// The physical address associated with the customer profile.
	public var address: Address?
	/// The birthday associated with the customer profile, in RFC 3339 format. Year is optional, timezone and times are not allowed. For example: `0000-09-01T00:00:00-00:00` indicates a birthday on September 1st. `1998-09-01T00:00:00-00:00` indications a birthday on September 1st __1998__.
	public var birthday: Timestamp?
	/// A business name associated with the customer profile.
	public var company_name: String?
	/// The email address associated with the customer profile.
	public var email_address: String?
	/// The family (i.e., last) name associated with the customer profile.
	public var family_name: String?
	/// The given (i.e., first) name associated with the customer profile.
	public var given_name: String?
	/// The idempotency key for the request.	See the [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency) guide for more information.
	public var idempotency_key: String?
	/// A nickname for the customer profile.
	public var nickname: String?
	/// A custom note associated with the customer profile.
	public var note: String?
	/// The 11-digit phone number associated with the customer profile.
	public var phone_number: String?
	/// An optional, second ID used to associate the customer profile with an entity in another system.
	public var reference_id: String?

	/// Defines the body parameters that can be provided in a request to the CreateCustomer endpoint.
	/// - Parameters:
	///   - address: The physical address associated with the customer profile.
	///   - birthday: The birthday associated with the customer profile, in RFC 3339 format. Year is optional, timezone and times are not allowed. For example: `0000-09-01T00:00:00-00:00` indicates a birthday on September 1st. `1998-09-01T00:00:00-00:00` indications a birthday on September 1st __1998__.
	///   - company_name: A business name associated with the customer profile.
	///   - email_address: The email address associated with the customer profile.
	///   - family_name: The family (i.e., last) name associated with the customer profile.
	///   - given_name: The given (i.e., first) name associated with the customer profile.
	///   - idempotency_key: The idempotency key for the request.	See the [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency) guide for more information.
	///   - nickname: A nickname for the customer profile.
	///   - note: A custom note associated with the customer profile.
	///   - phone_number: The 11-digit phone number associated with the customer profile.
	///   - reference_id: An optional, second ID used to associate the customer profile with an entity in another system.
	public init(address: Address? = nil, birthday: Timestamp? = nil, company_name: String? = nil, email_address: String? = nil, family_name: String? = nil, given_name: String? = nil, idempotency_key: String? = nil, nickname: String? = nil, note: String? = nil, phone_number: String? = nil, reference_id: String? = nil) {
		self.address = address
		self.birthday = birthday
		self.company_name = company_name
		self.email_address = email_address
		self.family_name = family_name
		self.given_name = given_name
		self.idempotency_key = idempotency_key
		self.nickname = nickname
		self.note = note
		self.phone_number = phone_number
		self.reference_id = reference_id
	}
}

/// Defines the fields that are included in the response body of a request to the CreateCustomer endpoint.  One of `errors` or `customer` is present in a given response (never both).
public struct CreateCustomerResponse: Codable {
	/// The created customer.
	public var customer: Customer?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// Defines the fields that are included in the response body of a request to the CreateCustomer endpoint.  One of `errors` or `customer` is present in a given response (never both).
	/// - Parameters:
	///   - customer: The created customer.
	///   - errors: Any errors that occurred during the request.
	public init(customer: Customer? = nil, errors: [SquareError]? = nil) {
		self.customer = customer
		self.errors = errors
	}
}

public struct CreateDeviceCodeRequest: Codable {
	/// The device code to create.
	public var device_code: DeviceCode
	/// A unique string that identifies this CreateDeviceCode request. Keys can be any valid string but must be unique for every CreateDeviceCode request.  See [Idempotency keys](https://developer.squareup.com/docs/basics/api101/idempotency) for more information.
	public var idempotency_key: String

	public init(device_code: DeviceCode, idempotency_key: String) {
		self.device_code = device_code
		self.idempotency_key = idempotency_key
	}
}

public struct CreateDeviceCodeResponse: Codable {
	/// The created DeviceCode object containing the device code string.
	public var device_code: DeviceCode?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(device_code: DeviceCode? = nil, errors: [SquareError]? = nil) {
		self.device_code = device_code
		self.errors = errors
	}
}

/// Defines the parameters for a `CreateDisputeEvidenceText` request.
public struct CreateDisputeEvidenceTextRequest: Codable {
	/// The evidence string.
	public var evidence_text: String
	/// The type of evidence you are uploading. See [DisputeEvidenceType](#type-disputeevidencetype) for possible values
	public var evidence_type: DisputeEvidenceType?
	/// The Unique ID. For more information, see [Idempotency](https://developer.squareup.com/docs/docs/working-with-apis/idempotency).
	public var idempotency_key: String

	/// Defines the parameters for a `CreateDisputeEvidenceText` request.
	/// - Parameters:
	///   - evidence_text: The evidence string.
	///   - evidence_type: The type of evidence you are uploading. See [DisputeEvidenceType](#type-disputeevidencetype) for possible values
	///   - idempotency_key: The Unique ID. For more information, see [Idempotency](https://developer.squareup.com/docs/docs/working-with-apis/idempotency).
	public init(evidence_text: String, idempotency_key: String, evidence_type: DisputeEvidenceType? = nil) {
		self.evidence_text = evidence_text
		self.idempotency_key = idempotency_key
		self.evidence_type = evidence_type
	}
}

/// Defines the fields in a `CreateDisputeEvidenceText` response.
public struct CreateDisputeEvidenceTextResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The newly uploaded dispute evidence metadata.
	public var evidence: DisputeEvidence?

	/// Defines the fields in a `CreateDisputeEvidenceText` response.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - evidence: The newly uploaded dispute evidence metadata.
	public init(errors: [SquareError]? = nil, evidence: DisputeEvidence? = nil) {
		self.errors = errors
		self.evidence = evidence
	}
}

/// Describes a `CreateInvoice` request.
public struct CreateInvoiceRequest: Codable {
	/// A unique string that identifies the `CreateInvoice` request. If you do not  provide `idempotency_key` (or provide an empty string as the value), the endpoint  treats each request as independent.  For more information, see [Idempotency](https://developer.squareup.com/docs/docs/working-with-apis/idempotency).
	public var idempotency_key: String?
	/// The invoice to create.
	public var invoice: Invoice

	/// Describes a `CreateInvoice` request.
	/// - Parameters:
	///   - idempotency_key: A unique string that identifies the `CreateInvoice` request. If you do not  provide `idempotency_key` (or provide an empty string as the value), the endpoint  treats each request as independent.  For more information, see [Idempotency](https://developer.squareup.com/docs/docs/working-with-apis/idempotency).
	///   - invoice: The invoice to create.
	public init(invoice: Invoice, idempotency_key: String? = nil) {
		self.invoice = invoice
		self.idempotency_key = idempotency_key
	}
}

/// The response returned by the `CreateInvoice` request.
public struct CreateInvoiceResponse: Codable {
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The newly created invoice.
	public var invoice: Invoice?

	/// The response returned by the `CreateInvoice` request.
	/// - Parameters:
	///   - errors: Information about errors encountered during the request.
	///   - invoice: The newly created invoice.
	public init(errors: [SquareError]? = nil, invoice: Invoice? = nil) {
		self.errors = errors
		self.invoice = invoice
	}
}

/// Request object for the [CreateLocation](#endpoint-createlocation) endpoint.
public struct CreateLocationRequest: Codable {
	/// The initial values of the location being created. The `name` field is required and must be unique within a seller account. All other fields are optional. Unspecified fields will be set to default values using existing location data.
	public var location: Location?

	/// Request object for the [CreateLocation](#endpoint-createlocation) endpoint.
	/// - Parameters:
	///   - location: The initial values of the location being created. The `name` field is required and must be unique within a seller account. All other fields are optional. Unspecified fields will be set to default values using existing location data.
	public init(location: Location? = nil) {
		self.location = location
	}
}

/// Response object returned by the [CreateLocation](#endpoint-createlocation) endpoint.
public struct CreateLocationResponse: Codable {
	/// Information on errors encountered during the request.
	public var errors: [SquareError]?
	/// The newly created `Location`.
	public var location: Location?

	/// Response object returned by the [CreateLocation](#endpoint-createlocation) endpoint.
	/// - Parameters:
	///   - errors: Information on errors encountered during the request.
	///   - location: The newly created `Location`.
	public init(errors: [SquareError]? = nil, location: Location? = nil) {
		self.errors = errors
		self.location = location
	}
}

/// A request to create a new loyalty account.
public struct CreateLoyaltyAccountRequest: Codable {
	/// A unique string that identifies this `CreateLoyaltyAccount` request.  Keys can be any valid string, but must be unique for every request.
	public var idempotency_key: String
	/// The loyalty account to create.
	public var loyalty_account: LoyaltyAccount

	/// A request to create a new loyalty account.
	/// - Parameters:
	///   - idempotency_key: A unique string that identifies this `CreateLoyaltyAccount` request.  Keys can be any valid string, but must be unique for every request.
	///   - loyalty_account: The loyalty account to create.
	public init(idempotency_key: String, loyalty_account: LoyaltyAccount) {
		self.idempotency_key = idempotency_key
		self.loyalty_account = loyalty_account
	}
}

/// A response that includes loyalty account created.
public struct CreateLoyaltyAccountResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The newly created loyalty account.
	public var loyalty_account: LoyaltyAccount?

	/// A response that includes loyalty account created.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - loyalty_account: The newly created loyalty account.
	public init(errors: [SquareError]? = nil, loyalty_account: LoyaltyAccount? = nil) {
		self.errors = errors
		self.loyalty_account = loyalty_account
	}
}

/// A request to create a loyalty reward.
public struct CreateLoyaltyRewardRequest: Codable {
	/// A unique string that identifies this `CreateLoyaltyReward` request.  Keys can be any valid string, but must be unique for every request.
	public var idempotency_key: String
	/// The reward to create.
	public var reward: LoyaltyReward

	/// A request to create a loyalty reward.
	/// - Parameters:
	///   - idempotency_key: A unique string that identifies this `CreateLoyaltyReward` request.  Keys can be any valid string, but must be unique for every request.
	///   - reward: The reward to create.
	public init(idempotency_key: String, reward: LoyaltyReward) {
		self.idempotency_key = idempotency_key
		self.reward = reward
	}
}

/// A response that includes the loyalty reward created.
public struct CreateLoyaltyRewardResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The loyalty reward created.
	public var reward: LoyaltyReward?

	/// A response that includes the loyalty reward created.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - reward: The loyalty reward created.
	public init(errors: [SquareError]? = nil, reward: LoyaltyReward? = nil) {
		self.errors = errors
		self.reward = reward
	}
}

/// Defines the body parameters that can be provided in a request to the __CreateMobileAuthorizationCode__ endpoint.
public struct CreateMobileAuthorizationCodeRequest: Codable {
	/// The Square location ID the authorization code should be tied to.
	public var location_id: String?

	/// Defines the body parameters that can be provided in a request to the __CreateMobileAuthorizationCode__ endpoint.
	/// - Parameters:
	///   - location_id: The Square location ID the authorization code should be tied to.
	public init(location_id: String? = nil) {
		self.location_id = location_id
	}
}

/// Defines the fields that are included in the response body of a request to the __CreateMobileAuthorizationCode__ endpoint.
public struct CreateMobileAuthorizationCodeResponse: Codable {
	/// Generated authorization code that connects a mobile application instance to a Square account.
	public var authorization_code: String?
	/// An error object that provides details about how creation of authorization code failed.
	public var error: SquareError?
	/// The timestamp when `authorization_code` expires in [RFC 3339](https://tools.ietf.org/html/rfc3339) format, e.g., "2016-09-04T23:59:33.123Z".
	public var expires_at: Timestamp?

	/// Defines the fields that are included in the response body of a request to the __CreateMobileAuthorizationCode__ endpoint.
	/// - Parameters:
	///   - authorization_code: Generated authorization code that connects a mobile application instance to a Square account.
	///   - error: An error object that provides details about how creation of authorization code failed.
	///   - expires_at: The timestamp when `authorization_code` expires in [RFC 3339](https://tools.ietf.org/html/rfc3339) format, e.g., "2016-09-04T23:59:33.123Z".
	public init(authorization_code: String? = nil, error: SquareError? = nil, expires_at: Timestamp? = nil) {
		self.authorization_code = authorization_code
		self.error = error
		self.expires_at = expires_at
	}
}

public struct CreateOrderRequest: Codable {
	/// A value you specify that uniquely identifies this order among orders you've created.  If you're unsure whether a particular order was created successfully, you can reattempt it with the same idempotency key without worrying about creating duplicate orders.  See [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency) for more information.
	public var idempotency_key: String?
	/// The order to create. If this field is set, then the only other top-level field that can be set is the idempotency_key.
	public var order: Order?

	public init(idempotency_key: String? = nil, order: Order? = nil) {
		self.idempotency_key = idempotency_key
		self.order = order
	}
}

/// Defines the fields that are included in the response body of a request to the CreateOrder endpoint.  One of `errors` or `order` is present in a given response (never both).
public struct CreateOrderResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The newly created order.
	public var order: Order?

	/// Defines the fields that are included in the response body of a request to the CreateOrder endpoint.  One of `errors` or `order` is present in a given response (never both).
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - order: The newly created order.
	public init(errors: [SquareError]? = nil, order: Order? = nil) {
		self.errors = errors
		self.order = order
	}
}

/// Creates a payment from a provided source (such as a nonce or a card on file).  The `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission is required to enable application fees.  For more information, see [Payments and Refunds APIs Overview](/payments-api/overview).  For information about application fees in a payment, see [Take Payments and Collect Fees](/payments-api/take-payments-and-collect-fees).
public struct CreatePaymentRequest: Codable {
	/// If set to `true` and charging a Square Gift Card, a payment might be returned with `amount_money` equal to less than what was requested. For example, a request for $20 when charging a Square Gift Card with a balance of $5 results in an APPROVED payment of $5. You might choose to prompt the buyer for an additional payment to cover the remainder or cancel the Gift Card payment. This field cannot be `true` when `autocomplete = true`.  For more information, see [Partial amount with Square Gift Cards](https://developer.squareup.com/docs/payments-api/take-payments#partial-payment-gift-card).  Default: false
	public var accept_partial_authorization: Bool?
	/// The amount of money to accept for this payment, not including `tip_money`.  The amount must be specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).  The currency code must match the currency associated with the business that is accepting the payment.
	public var amount_money: Money
	/// The amount of money that the developer is taking as a fee for facilitating the payment on behalf of the seller.  The amount cannot be more than 90% of the total amount of the payment.  The amount must be specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).  The fee currency code must match the currency associated with the seller that is accepting the payment. The application must be from a developer account in the same country and using the same currency code as the seller.  For more information about the application fee scenario, see [Take Payments and Collect Fees](https://developer.squareup.com/docs/payments-api/take-payments-and-collect-fees).
	public var app_fee_money: Money?
	/// If set to `true`, this payment will be completed when possible. If set to `false`, this payment is held in an approved state until either explicitly completed (captured) or canceled (voided). For more information, see [Delayed capture](https://developer.squareup.com/docs/payments-api/take-payments#delayed-payments).  Default: true
	public var autocomplete: Bool?
	/// The buyer's billing address.
	public var billing_address: Address?
	/// The buyer's email address.
	public var buyer_email_address: String?
	/// The `Customer` ID of the customer associated with the payment.  This is required if the `source_id` refers to a card on file created using the Customers API.
	public var customer_id: String?
	/// The duration of time after the payment's creation when Square automatically cancels the payment. This automatic cancellation applies only to payments that do not reach a terminal state (COMPLETED, CANCELED, or FAILED) before the `delay_duration` time period.  This parameter should be specified as a time duration, in RFC 3339 format, with a minimum value of 1 minute.  Note: This feature is only supported for card payments. This parameter can only be set for a delayed capture payment (`autocomplete=false`).  Default:  - Card-present payments: "PT36H" (36 hours) from the creation time. - Card-not-present payments: "P7D" (7 days) from the creation time.
	public var delay_duration: Timestamp?
	/// A unique string that identifies this `CreatePayment` request. Keys can be any valid string but must be unique for every `CreatePayment` request.  Max: 45 characters  Note: The number of allowed characters might be less than the stated maximum, if multi-byte characters are used.  For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
	public var idempotency_key: String
	/// The location ID to associate with the payment. If not specified, the default location is used.
	public var location_id: String?
	/// An optional note to be entered by the developer when creating a payment.  Limit 500 characters.
	public var note: String?
	/// Associates a previously created order with this payment.
	public var order_id: String?
	/// A user-defined ID to associate with the payment.  You can use this field to associate the payment to an entity in an external system  (for example, you might specify an order ID that is generated by a third-party shopping cart).  Limit 40 characters.
	public var reference_id: String?
	/// The buyer's shipping address.
	public var shipping_address: Address?
	/// The ID for the source of funds for this payment. This can be a nonce generated by the Square payment form or a card on file made with the Customers API.
	public var source_id: String
	/// Optional additional payment information to include on the customer's card statement as part of the statement description. This can be, for example, an invoice number, ticket number, or short description that uniquely identifies the purchase.  Note that the `statement_description_identifier` might get truncated on the statement description to fit the required information including the Square identifier (SQ *) and name of the seller taking the payment.
	public var statement_description_identifier: String?
	/// The amount designated as a tip, in addition to `amount_money`.  The amount must be specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).  The currency code must match the currency associated with the business that is accepting the payment.
	public var tip_money: Money?
	/// An identifying token generated by `SqPaymentForm.verifyBuyer()`. Verification tokens encapsulate customer device information and 3-D Secure challenge results to indicate that Square has verified the buyer identity.  For more information, see [SCA Overview](https://developer.squareup.com/docs/sca-overview).
	public var verification_token: String?

	/// Creates a payment from a provided source (such as a nonce or a card on file).  The `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission is required to enable application fees.  For more information, see [Payments and Refunds APIs Overview](/payments-api/overview).  For information about application fees in a payment, see [Take Payments and Collect Fees](/payments-api/take-payments-and-collect-fees).
	/// - Parameters:
	///   - accept_partial_authorization: If set to `true` and charging a Square Gift Card, a payment might be returned with `amount_money` equal to less than what was requested. For example, a request for $20 when charging a Square Gift Card with a balance of $5 results in an APPROVED payment of $5. You might choose to prompt the buyer for an additional payment to cover the remainder or cancel the Gift Card payment. This field cannot be `true` when `autocomplete = true`.  For more information, see [Partial amount with Square Gift Cards](https://developer.squareup.com/docs/payments-api/take-payments#partial-payment-gift-card).  Default: false
	///   - amount_money: The amount of money to accept for this payment, not including `tip_money`.  The amount must be specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).  The currency code must match the currency associated with the business that is accepting the payment.
	///   - app_fee_money: The amount of money that the developer is taking as a fee for facilitating the payment on behalf of the seller.  The amount cannot be more than 90% of the total amount of the payment.  The amount must be specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).  The fee currency code must match the currency associated with the seller that is accepting the payment. The application must be from a developer account in the same country and using the same currency code as the seller.  For more information about the application fee scenario, see [Take Payments and Collect Fees](https://developer.squareup.com/docs/payments-api/take-payments-and-collect-fees).
	///   - autocomplete: If set to `true`, this payment will be completed when possible. If set to `false`, this payment is held in an approved state until either explicitly completed (captured) or canceled (voided). For more information, see [Delayed capture](https://developer.squareup.com/docs/payments-api/take-payments#delayed-payments).  Default: true
	///   - billing_address: The buyer's billing address.
	///   - buyer_email_address: The buyer's email address.
	///   - customer_id: The `Customer` ID of the customer associated with the payment.  This is required if the `source_id` refers to a card on file created using the Customers API.
	///   - delay_duration: The duration of time after the payment's creation when Square automatically cancels the payment. This automatic cancellation applies only to payments that do not reach a terminal state (COMPLETED, CANCELED, or FAILED) before the `delay_duration` time period.  This parameter should be specified as a time duration, in RFC 3339 format, with a minimum value of 1 minute.  Note: This feature is only supported for card payments. This parameter can only be set for a delayed capture payment (`autocomplete=false`).  Default:  - Card-present payments: "PT36H" (36 hours) from the creation time. - Card-not-present payments: "P7D" (7 days) from the creation time.
	///   - idempotency_key: A unique string that identifies this `CreatePayment` request. Keys can be any valid string but must be unique for every `CreatePayment` request.  Max: 45 characters  Note: The number of allowed characters might be less than the stated maximum, if multi-byte characters are used.  For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
	///   - location_id: The location ID to associate with the payment. If not specified, the default location is used.
	///   - note: An optional note to be entered by the developer when creating a payment.  Limit 500 characters.
	///   - order_id: Associates a previously created order with this payment.
	///   - reference_id: A user-defined ID to associate with the payment.  You can use this field to associate the payment to an entity in an external system  (for example, you might specify an order ID that is generated by a third-party shopping cart).  Limit 40 characters.
	///   - shipping_address: The buyer's shipping address.
	///   - source_id: The ID for the source of funds for this payment. This can be a nonce generated by the Square payment form or a card on file made with the Customers API.
	///   - statement_description_identifier: Optional additional payment information to include on the customer's card statement as part of the statement description. This can be, for example, an invoice number, ticket number, or short description that uniquely identifies the purchase.  Note that the `statement_description_identifier` might get truncated on the statement description to fit the required information including the Square identifier (SQ *) and name of the seller taking the payment.
	///   - tip_money: The amount designated as a tip, in addition to `amount_money`.  The amount must be specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).  The currency code must match the currency associated with the business that is accepting the payment.
	///   - verification_token: An identifying token generated by `SqPaymentForm.verifyBuyer()`. Verification tokens encapsulate customer device information and 3-D Secure challenge results to indicate that Square has verified the buyer identity.  For more information, see [SCA Overview](https://developer.squareup.com/docs/sca-overview).
	public init(amount_money: Money, idempotency_key: String, source_id: String, accept_partial_authorization: Bool? = nil, app_fee_money: Money? = nil, autocomplete: Bool? = nil, billing_address: Address? = nil, buyer_email_address: String? = nil, customer_id: String? = nil, delay_duration: Timestamp? = nil, location_id: String? = nil, note: String? = nil, order_id: String? = nil, reference_id: String? = nil, shipping_address: Address? = nil, statement_description_identifier: String? = nil, tip_money: Money? = nil, verification_token: String? = nil) {
		self.amount_money = amount_money
		self.idempotency_key = idempotency_key
		self.source_id = source_id
		self.accept_partial_authorization = accept_partial_authorization
		self.app_fee_money = app_fee_money
		self.autocomplete = autocomplete
		self.billing_address = billing_address
		self.buyer_email_address = buyer_email_address
		self.customer_id = customer_id
		self.delay_duration = delay_duration
		self.location_id = location_id
		self.note = note
		self.order_id = order_id
		self.reference_id = reference_id
		self.shipping_address = shipping_address
		self.statement_description_identifier = statement_description_identifier
		self.tip_money = tip_money
		self.verification_token = verification_token
	}
}

/// Defines the fields that are included in the response body of a request to the [CreatePayment](#endpoint-payments-createpayment) endpoint.  Note: If there are errors processing the request, the payment field might not be present, or it might be present with a status of `FAILED`.
public struct CreatePaymentResponse: Codable {
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The newly created payment.
	public var payment: Payment?

	/// Defines the fields that are included in the response body of a request to the [CreatePayment](#endpoint-payments-createpayment) endpoint.  Note: If there are errors processing the request, the payment field might not be present, or it might be present with a status of `FAILED`.
	/// - Parameters:
	///   - errors: Information about errors encountered during the request.
	///   - payment: The newly created payment.
	public init(errors: [SquareError]? = nil, payment: Payment? = nil) {
		self.errors = errors
		self.payment = payment
	}
}

/// Defines the body parameters that can be included in a request to the [CreateRefund](#endpoint-createrefund) endpoint.  Deprecated - recommend using [RefundPayment](#endpoint-refunds-refundpayment)
public struct CreateRefundRequest: Codable {
	/// The amount of money to refund.  Note that you specify the amount in the __smallest denomination of the applicable currency__. For example, US dollar amounts are specified in cents. See [Working with monetary amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts) for details.  This amount cannot exceed the amount that was originally charged to the tender that corresponds to `tender_id`.
	public var amount_money: Money
	/// A value you specify that uniquely identifies this refund among refunds you've created for the tender.  If you're unsure whether a particular refund succeeded, you can reattempt it with the same idempotency key without worrying about duplicating the refund.  See [Idempotency keys](#idempotencykeys) for more information.
	public var idempotency_key: String
	/// A description of the reason for the refund.  Default value: `Refund via API`
	public var reason: String?
	/// The ID of the tender to refund.  A ``Transaction`` has one or more `tenders` (i.e., methods of payment) associated with it, and you refund each tender separately with the Connect API.
	public var tender_id: String

	/// Defines the body parameters that can be included in a request to the [CreateRefund](#endpoint-createrefund) endpoint.  Deprecated - recommend using [RefundPayment](#endpoint-refunds-refundpayment)
	/// - Parameters:
	///   - amount_money: The amount of money to refund.  Note that you specify the amount in the __smallest denomination of the applicable currency__. For example, US dollar amounts are specified in cents. See [Working with monetary amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts) for details.  This amount cannot exceed the amount that was originally charged to the tender that corresponds to `tender_id`.
	///   - idempotency_key: A value you specify that uniquely identifies this refund among refunds you've created for the tender.  If you're unsure whether a particular refund succeeded, you can reattempt it with the same idempotency key without worrying about duplicating the refund.  See [Idempotency keys](#idempotencykeys) for more information.
	///   - reason: A description of the reason for the refund.  Default value: `Refund via API`
	///   - tender_id: The ID of the tender to refund.  A ``Transaction`` has one or more `tenders` (i.e., methods of payment) associated with it, and you refund each tender separately with the Connect API.
	public init(amount_money: Money, idempotency_key: String, tender_id: String, reason: String? = nil) {
		self.amount_money = amount_money
		self.idempotency_key = idempotency_key
		self.tender_id = tender_id
		self.reason = reason
	}
}

/// Defines the fields that are included in the response body of a request to the [CreateRefund](#endpoint-createrefund) endpoint.  One of `errors` or `refund` is present in a given response (never both).
public struct CreateRefundResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The created refund.
	public var refund: Refund?

	/// Defines the fields that are included in the response body of a request to the [CreateRefund](#endpoint-createrefund) endpoint.  One of `errors` or `refund` is present in a given response (never both).
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - refund: The created refund.
	public init(errors: [SquareError]? = nil, refund: Refund? = nil) {
		self.errors = errors
		self.refund = refund
	}
}

/// Represents a request to create a `Shift`
public struct CreateShiftRequest: Codable {
	/// Unique string value to insure the idempotency of the operation.
	public var idempotency_key: String?
	/// The `Shift` to be created
	public var shift: Shift

	/// Represents a request to create a `Shift`
	/// - Parameters:
	///   - idempotency_key: Unique string value to insure the idempotency of the operation.
	///   - shift: The `Shift` to be created
	public init(shift: Shift, idempotency_key: String? = nil) {
		self.shift = shift
		self.idempotency_key = idempotency_key
	}
}

/// The response to the request to create a `Shift`. Contains the created `Shift` object. May contain a set of `Error` objects if the request resulted in errors.
public struct CreateShiftResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The `Shift` that was created on the request.
	public var shift: Shift?

	/// The response to the request to create a `Shift`. Contains the created `Shift` object. May contain a set of `Error` objects if the request resulted in errors.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - shift: The `Shift` that was created on the request.
	public init(errors: [SquareError]? = nil, shift: Shift? = nil) {
		self.errors = errors
		self.shift = shift
	}
}

/// Defines parameters in a  [CreateSubscription](#endpoint-subscriptions-createsubscription) endpoint request.
public struct CreateSubscriptionRequest: Codable {
	/// The date when the subscription should be canceled, in  YYYY-MM-DD format (for example, 2025-02-29). This overrides the plan configuration  if it comes before the date the subscription would otherwise end.
	public var canceled_date: String?
	/// The ID of the `customer](#type-customer) [card` to charge. If not specified, Square sends an invoice via email. For an example to create a customer and add a card on file, see [Subscriptions Walkthrough](https://developer.squareup.com/docs/docs/subscriptions-api/walkthrough).
	public var card_id: String?
	/// The ID of the `customer` profile.
	public var customer_id: String
	/// A unique string that identifies this `CreateSubscription` request. If you do not provide a unique string (or provide an empty string as the value), the endpoint treats each request as independent.  For more information, see [Idempotency keys](https://developer.squareup.com/docs/docs/working-with-apis/idempotency).
	public var idempotency_key: String
	/// The ID of the location the subscription is associated with.
	public var location_id: String
	/// The ID of the subscription plan. For more information, see  [Subscription Plan Overview](https://developer.squareup.com/docs/docs/subscriptions/overview).
	public var plan_id: String
	/// A custom price to apply for the subscription. If specified,  it overrides the price configured by the subscription plan.
	public var price_override_money: Money?
	/// The start date of the subscription, in YYYY-MM-DD format. For example, 2013-01-15. If the start date is left empty, the subscription begins  immediately.
	public var start_date: String?
	/// The tax to add when billing the subscription. The percentage is expressed in decimal form, using a `'.'` as the decimal separator and without a `'%'` sign. For example, a value of 7.5 corresponds to 7.5%.
	public var tax_percentage: String?
	/// The timezone that is used in date calculations for the subscription. If unset, defaults to the location timezone. If a timezone is not configured for the location, defaults to "America/New_York". Format: the IANA Timezone Database identifier for the location timezone. For a list of time zones, see [List of tz database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).
	public var timezone: String?

	/// Defines parameters in a  [CreateSubscription](#endpoint-subscriptions-createsubscription) endpoint request.
	/// - Parameters:
	///   - canceled_date: The date when the subscription should be canceled, in  YYYY-MM-DD format (for example, 2025-02-29). This overrides the plan configuration  if it comes before the date the subscription would otherwise end.
	///   - card_id: The ID of the `customer](#type-customer) [card` to charge. If not specified, Square sends an invoice via email. For an example to create a customer and add a card on file, see [Subscriptions Walkthrough](https://developer.squareup.com/docs/docs/subscriptions-api/walkthrough).
	///   - customer_id: The ID of the `customer` profile.
	///   - idempotency_key: A unique string that identifies this `CreateSubscription` request. If you do not provide a unique string (or provide an empty string as the value), the endpoint treats each request as independent.  For more information, see [Idempotency keys](https://developer.squareup.com/docs/docs/working-with-apis/idempotency).
	///   - location_id: The ID of the location the subscription is associated with.
	///   - plan_id: The ID of the subscription plan. For more information, see  [Subscription Plan Overview](https://developer.squareup.com/docs/docs/subscriptions/overview).
	///   - price_override_money: A custom price to apply for the subscription. If specified,  it overrides the price configured by the subscription plan.
	///   - start_date: The start date of the subscription, in YYYY-MM-DD format. For example, 2013-01-15. If the start date is left empty, the subscription begins  immediately.
	///   - tax_percentage: The tax to add when billing the subscription. The percentage is expressed in decimal form, using a `'.'` as the decimal separator and without a `'%'` sign. For example, a value of 7.5 corresponds to 7.5%.
	///   - timezone: The timezone that is used in date calculations for the subscription. If unset, defaults to the location timezone. If a timezone is not configured for the location, defaults to "America/New_York". Format: the IANA Timezone Database identifier for the location timezone. For a list of time zones, see [List of tz database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).
	public init(customer_id: String, idempotency_key: String, location_id: String, plan_id: String, canceled_date: String? = nil, card_id: String? = nil, price_override_money: Money? = nil, start_date: String? = nil, tax_percentage: String? = nil, timezone: String? = nil) {
		self.customer_id = customer_id
		self.idempotency_key = idempotency_key
		self.location_id = location_id
		self.plan_id = plan_id
		self.canceled_date = canceled_date
		self.card_id = card_id
		self.price_override_money = price_override_money
		self.start_date = start_date
		self.tax_percentage = tax_percentage
		self.timezone = timezone
	}
}

/// Defines the fields that are included in the response from the [CreateSubscription](#endpoint-subscriptions-createsubscription) endpoint.
public struct CreateSubscriptionResponse: Codable {
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The newly created subscription.   For more information, see  [Subscription object](https://developer.squareup.com/docs/docs/subscriptions-api/overview#subscription-object).
	public var subscription: Subscription?

	/// Defines the fields that are included in the response from the [CreateSubscription](#endpoint-subscriptions-createsubscription) endpoint.
	/// - Parameters:
	///   - errors: Information about errors encountered during the request.
	///   - subscription: The newly created subscription.   For more information, see  [Subscription object](https://developer.squareup.com/docs/docs/subscriptions-api/overview#subscription-object).
	public init(errors: [SquareError]? = nil, subscription: Subscription? = nil) {
		self.errors = errors
		self.subscription = subscription
	}
}

/// Represents a create request for a `TeamMember` object.
public struct CreateTeamMemberRequest: Codable {
	/// A unique string that identifies this CreateTeamMember request. Keys can be any valid string but must be unique for every request. See [Idempotency keys](https://developer.squareup.com/docs/basics/api101/idempotency) for more information. <br> <b>Min Length 1    Max Length 45</b>
	public var idempotency_key: String?
	/// <b>Required</b> The data which will be used to create the `TeamMember` object.
	public var team_member: TeamMember?

	/// Represents a create request for a `TeamMember` object.
	/// - Parameters:
	///   - idempotency_key: A unique string that identifies this CreateTeamMember request. Keys can be any valid string but must be unique for every request. See [Idempotency keys](https://developer.squareup.com/docs/basics/api101/idempotency) for more information. <br> <b>Min Length 1    Max Length 45</b>
	///   - team_member: <b>Required</b> The data which will be used to create the `TeamMember` object.
	public init(idempotency_key: String? = nil, team_member: TeamMember? = nil) {
		self.idempotency_key = idempotency_key
		self.team_member = team_member
	}
}

/// Represents a response from a create request, containing the created `TeamMember` object or error messages.
public struct CreateTeamMemberResponse: Codable {
	/// The errors that occurred during the request.
	public var errors: [SquareError]?
	/// The successfully created `TeamMember` object.
	public var team_member: TeamMember?

	/// Represents a response from a create request, containing the created `TeamMember` object or error messages.
	/// - Parameters:
	///   - errors: The errors that occurred during the request.
	///   - team_member: The successfully created `TeamMember` object.
	public init(errors: [SquareError]? = nil, team_member: TeamMember? = nil) {
		self.errors = errors
		self.team_member = team_member
	}
}

public struct CreateTerminalCheckoutRequest: Codable {
	/// The checkout to create.
	public var checkout: TerminalCheckout
	/// A unique string that identifies this `CreateCheckout` request. Keys can be any valid string but must be unique for every `CreateCheckout` request.  See [Idempotency keys](https://developer.squareup.com/docs/basics/api101/idempotency) for more information.
	public var idempotency_key: String

	public init(checkout: TerminalCheckout, idempotency_key: String) {
		self.checkout = checkout
		self.idempotency_key = idempotency_key
	}
}

public struct CreateTerminalCheckoutResponse: Codable {
	/// The created `TerminalCheckout`
	public var checkout: TerminalCheckout?
	/// Information on errors encountered during the request.
	public var errors: [SquareError]?

	public init(checkout: TerminalCheckout? = nil, errors: [SquareError]? = nil) {
		self.checkout = checkout
		self.errors = errors
	}
}

public struct CreateTerminalRefundRequest: Codable {
	/// A unique string that identifies this `CreateRefund` request. Keys can be any valid string but must be unique for every `CreateRefund` request.  See [Idempotency keys](https://developer.squareup.com/docs/basics/api101/idempotency) for more information.
	public var idempotency_key: String
	/// The refund to create.
	public var refund: TerminalRefund?

	public init(idempotency_key: String, refund: TerminalRefund? = nil) {
		self.idempotency_key = idempotency_key
		self.refund = refund
	}
}

public struct CreateTerminalRefundResponse: Codable {
	/// Information on errors encountered during the request.
	public var errors: [SquareError]?
	/// The created `TerminalRefund`
	public var refund: TerminalRefund?

	public init(errors: [SquareError]? = nil, refund: TerminalRefund? = nil) {
		self.errors = errors
		self.refund = refund
	}
}

/// Indicates the associated currency for an amount of money. Values correspond to [ISO 4217](https://wikipedia.org/wiki/ISO_4217).
public enum Currency: String, Codable {
	/// Unknown currency
	case UNKNOWN_CURRENCY
	/// United Arab Emirates dirham
	case AED
	/// Afghan afghani
	case AFN
	/// Albanian lek
	case ALL
	/// Armenian dram
	case AMD
	/// Netherlands Antillean guilder
	case ANG
	/// Angolan kwanza
	case AOA
	/// Argentine peso
	case ARS
	/// Australian dollar
	case AUD
	/// Aruban florin
	case AWG
	/// Azerbaijani manat
	case AZN
	/// Bosnia and Herzegovina convertible mark
	case BAM
	/// Barbados dollar
	case BBD
	/// Bangladeshi taka
	case BDT
	/// Bulgarian lev
	case BGN
	/// Bahraini dinar
	case BHD
	/// Burundian franc
	case BIF
	/// Bermudian dollar
	case BMD
	/// Brunei dollar
	case BND
	/// Boliviano
	case BOB
	/// Bolivian Mvdol
	case BOV
	/// Brazilian real
	case BRL
	/// Bahamian dollar
	case BSD
	/// Bhutanese ngultrum
	case BTN
	/// Botswana pula
	case BWP
	/// Belarusian ruble
	case BYR
	/// Belize dollar
	case BZD
	/// Canadian dollar
	case CAD
	/// Congolese franc
	case CDF
	/// WIR Euro
	case CHE
	/// Swiss franc
	case CHF
	/// WIR Franc
	case CHW
	/// Unidad de Fomento
	case CLF
	/// Chilean peso
	case CLP
	/// Chinese yuan
	case CNY
	/// Colombian peso
	case COP
	/// Unidad de Valor Real
	case COU
	/// Costa Rican colon
	case CRC
	/// Cuban convertible peso
	case CUC
	/// Cuban peso
	case CUP
	/// Cape Verdean escudo
	case CVE
	/// Czech koruna
	case CZK
	/// Djiboutian franc
	case DJF
	/// Danish krone
	case DKK
	/// Dominican peso
	case DOP
	/// Algerian dinar
	case DZD
	/// Egyptian pound
	case EGP
	/// Eritrean nakfa
	case ERN
	/// Ethiopian birr
	case ETB
	/// Euro
	case EUR
	/// Fiji dollar
	case FJD
	/// Falkland Islands pound
	case FKP
	/// Pound sterling
	case GBP
	/// Georgian lari
	case GEL
	/// Ghanaian cedi
	case GHS
	/// Gibraltar pound
	case GIP
	/// Gambian dalasi
	case GMD
	/// Guinean franc
	case GNF
	/// Guatemalan quetzal
	case GTQ
	/// Guyanese dollar
	case GYD
	/// Hong Kong dollar
	case HKD
	/// Honduran lempira
	case HNL
	/// Croatian kuna
	case HRK
	/// Haitian gourde
	case HTG
	/// Hungarian forint
	case HUF
	/// Indonesian rupiah
	case IDR
	/// Israeli new shekel
	case ILS
	/// Indian rupee
	case INR
	/// Iraqi dinar
	case IQD
	/// Iranian rial
	case IRR
	/// Icelandic króna
	case ISK
	/// Jamaican dollar
	case JMD
	/// Jordanian dinar
	case JOD
	/// Japanese yen
	case JPY
	/// Kenyan shilling
	case KES
	/// Kyrgyzstani som
	case KGS
	/// Cambodian riel
	case KHR
	/// Comoro franc
	case KMF
	/// North Korean won
	case KPW
	/// South Korean won
	case KRW
	/// Kuwaiti dinar
	case KWD
	/// Cayman Islands dollar
	case KYD
	/// Kazakhstani tenge
	case KZT
	/// Lao kip
	case LAK
	/// Lebanese pound
	case LBP
	/// Sri Lankan rupee
	case LKR
	/// Liberian dollar
	case LRD
	/// Lesotho loti
	case LSL
	/// Lithuanian litas
	case LTL
	/// Latvian lats
	case LVL
	/// Libyan dinar
	case LYD
	/// Moroccan dirham
	case MAD
	/// Moldovan leu
	case MDL
	/// Malagasy ariary
	case MGA
	/// Macedonian denar
	case MKD
	/// Myanmar kyat
	case MMK
	/// Mongolian tögrög
	case MNT
	/// Macanese pataca
	case MOP
	/// Mauritanian ouguiya
	case MRO
	/// Mauritian rupee
	case MUR
	/// Maldivian rufiyaa
	case MVR
	/// Malawian kwacha
	case MWK
	/// Mexican peso
	case MXN
	/// Mexican Unidad de Inversion
	case MXV
	/// Malaysian ringgit
	case MYR
	/// Mozambican metical
	case MZN
	/// Namibian dollar
	case NAD
	/// Nigerian naira
	case NGN
	/// Nicaraguan córdoba
	case NIO
	/// Norwegian krone
	case NOK
	/// Nepalese rupee
	case NPR
	/// New Zealand dollar
	case NZD
	/// Omani rial
	case OMR
	/// Panamanian balboa
	case PAB
	/// Peruvian sol
	case PEN
	/// Papua New Guinean kina
	case PGK
	/// Philippine peso
	case PHP
	/// Pakistani rupee
	case PKR
	/// Polish złoty
	case PLN
	/// Paraguayan guaraní
	case PYG
	/// Qatari riyal
	case QAR
	/// Romanian leu
	case RON
	/// Serbian dinar
	case RSD
	/// Russian ruble
	case RUB
	/// Rwandan franc
	case RWF
	/// Saudi riyal
	case SAR
	/// Solomon Islands dollar
	case SBD
	/// Seychelles rupee
	case SCR
	/// Sudanese pound
	case SDG
	/// Swedish krona
	case SEK
	/// Singapore dollar
	case SGD
	/// Saint Helena pound
	case SHP
	/// Sierra Leonean leone
	case SLL
	/// Somali shilling
	case SOS
	/// Surinamese dollar
	case SRD
	/// South Sudanese pound
	case SSP
	/// São Tomé and Príncipe dobra
	case STD
	/// Salvadoran colón
	case SVC
	/// Syrian pound
	case SYP
	/// Swazi lilangeni
	case SZL
	/// Thai baht
	case THB
	/// Tajikstani somoni
	case TJS
	/// Turkmenistan manat
	case TMT
	/// Tunisian dinar
	case TND
	/// Tongan pa'anga
	case TOP
	/// Turkish lira
	case TRY
	/// Trinidad and Tobago dollar
	case TTD
	/// New Taiwan dollar
	case TWD
	/// Tanzanian shilling
	case TZS
	/// Ukrainian hryvnia
	case UAH
	/// Ugandan shilling
	case UGX
	/// United States dollar
	case USD
	/// United States dollar (next day)
	case USN
	/// United States dollar (same day)
	case USS
	/// Uruguay Peso en Unidedades Indexadas
	case UYI
	/// Uruguyan peso
	case UYU
	/// Uzbekistan som
	case UZS
	/// Venezuelan bolívar soberano
	case VEF
	/// Vietnamese đồng
	case VND
	/// Vanuatu vatu
	case VUV
	/// Samoan tala
	case WST
	/// CFA franc BEAC
	case XAF
	/// Silver
	case XAG
	/// Gold
	case XAU
	/// European Composite Unit
	case XBA
	/// European Monetary Unit
	case XBB
	/// European Unit of Account 9
	case XBC
	/// European Unit of Account 17
	case XBD
	/// East Caribbean dollar
	case XCD
	/// Special drawing rights (International Monetary Fund)
	case XDR
	/// CFA franc BCEAO
	case XOF
	/// Palladium
	case XPD
	/// CFP franc
	case XPF
	/// Platinum
	case XPT
	/// Code reserved for testing
	case XTS
	/// No currency
	case XXX
	/// Yemeni rial
	case YER
	/// South African rand
	case ZAR
	/// Zambian kwacha
	case ZMK
	/// Zambian kwacha
	case ZMW
	/// Bitcoin
	case BTC
}

/// Supported custom attribute query expressions for calling the [SearchCatalogItems](#endpoint-Catalog-SearchCatalogItems) endpoint to search for items or item variations.
public struct CustomAttributeFilter: Codable {
	/// A query expression to filter items or item variations by matching their custom attributes' `boolean_value` property values against the specified Boolean expression.
	public var bool_filter: Bool?
	/// A query expression to filter items or item variations by matching their custom attributes' `custom_attribute_definition_id` property value against the the specified id.
	public var custom_attribute_definition_id: String?
	/// A query expression to filter items or item variations by matching their custom attributes' `key` property value against the specified key.
	public var key: String?
	/// A query expression to filter items or item variations with their custom attributes containing a number value within the specified range.
	public var number_filter: Range?
	/// A query expression to filter items or item variations by matching  their custom attributes' `selection_uid_values` values against the specified selection uids.
	public var selection_uids_filter: [String]?
	/// A query expression to filter items or item variations by matching their custom attributes' `string_value`  property value against the specified text.
	public var string_filter: String?

	/// Supported custom attribute query expressions for calling the [SearchCatalogItems](#endpoint-Catalog-SearchCatalogItems) endpoint to search for items or item variations.
	/// - Parameters:
	///   - bool_filter: A query expression to filter items or item variations by matching their custom attributes' `boolean_value` property values against the specified Boolean expression.
	///   - custom_attribute_definition_id: A query expression to filter items or item variations by matching their custom attributes' `custom_attribute_definition_id` property value against the the specified id.
	///   - key: A query expression to filter items or item variations by matching their custom attributes' `key` property value against the specified key.
	///   - number_filter: A query expression to filter items or item variations with their custom attributes containing a number value within the specified range.
	///   - selection_uids_filter: A query expression to filter items or item variations by matching  their custom attributes' `selection_uid_values` values against the specified selection uids.
	///   - string_filter: A query expression to filter items or item variations by matching their custom attributes' `string_value`  property value against the specified text.
	public init(bool_filter: Bool? = nil, custom_attribute_definition_id: String? = nil, key: String? = nil, number_filter: Range? = nil, selection_uids_filter: [String]? = nil, string_filter: String? = nil) {
		self.bool_filter = bool_filter
		self.custom_attribute_definition_id = custom_attribute_definition_id
		self.key = key
		self.number_filter = number_filter
		self.selection_uids_filter = selection_uids_filter
		self.string_filter = string_filter
	}
}

/// Represents a Square customer profile, which can have one or more cards on file associated with it.
public struct Customer: Codable {
	/// The physical address associated with the customer profile.
	public var address: Address?
	/// The birthday associated with the customer profile, in RFC 3339 format. Year is optional, timezone and times are not allowed. For example: `0000-09-01T00:00:00-00:00` indicates a birthday on September 1st. `1998-09-01T00:00:00-00:00` indications a birthday on September 1st __1998__.
	public var birthday: Timestamp?
	/// Payment details of cards stored on file for the customer profile.
	public var cards: [Card]?
	/// A business name associated with the customer profile.
	public var company_name: String?
	/// The timestamp when the customer profile was created, in RFC 3339 format.
	public let created_at: Timestamp?
	/// A creation source represents the method used to create the customer profile. See [CustomerCreationSource](#type-customercreationsource) for possible values
	public var creation_source: CustomerCreationSource?
	/// The email address associated with the customer profile.
	public var email_address: String?
	/// The family (i.e., last) name associated with the customer profile.
	public var family_name: String?
	/// The given (i.e., first) name associated with the customer profile.
	public var given_name: String?
	/// The IDs of customer groups the customer belongs to.
	public var group_ids: [String]?
	/// The customer groups and segments the customer belongs to. This deprecated field has been replaced with  the dedicated `group_ids` for customer groups and the dedicated `segment_ids` field for customer segments. You can retrieve information about a given customer group and segment respectively using the Customer Groups API and Customer Segments API.
	public var groups: [CustomerGroupInfo]?
	/// A unique Square-assigned ID for the customer profile.
	public var id: String?
	/// A nickname for the customer profile.
	public var nickname: String?
	/// A custom note associated with the customer profile.
	public var note: String?
	/// The 11-digit phone number associated with the customer profile.
	public var phone_number: String?
	/// Represents general customer preferences.
	public var preferences: CustomerPreferences?
	/// An optional, second ID used to associate the customer profile with an entity in another system.
	public var reference_id: String?
	/// The IDs of segments the customer belongs to.
	public var segment_ids: [String]?
	/// The timestamp when the customer profile was last updated, in RFC 3339 format.
	public let updated_at: Timestamp?

	/// Represents a Square customer profile, which can have one or more cards on file associated with it.
	/// - Parameters:
	///   - address: The physical address associated with the customer profile.
	///   - birthday: The birthday associated with the customer profile, in RFC 3339 format. Year is optional, timezone and times are not allowed. For example: `0000-09-01T00:00:00-00:00` indicates a birthday on September 1st. `1998-09-01T00:00:00-00:00` indications a birthday on September 1st __1998__.
	///   - cards: Payment details of cards stored on file for the customer profile.
	///   - company_name: A business name associated with the customer profile.
	///   - created_at: The timestamp when the customer profile was created, in RFC 3339 format.
	///   - creation_source: A creation source represents the method used to create the customer profile. See [CustomerCreationSource](#type-customercreationsource) for possible values
	///   - email_address: The email address associated with the customer profile.
	///   - family_name: The family (i.e., last) name associated with the customer profile.
	///   - given_name: The given (i.e., first) name associated with the customer profile.
	///   - group_ids: The IDs of customer groups the customer belongs to.
	///   - groups: The customer groups and segments the customer belongs to. This deprecated field has been replaced with  the dedicated `group_ids` for customer groups and the dedicated `segment_ids` field for customer segments. You can retrieve information about a given customer group and segment respectively using the Customer Groups API and Customer Segments API.
	///   - id: A unique Square-assigned ID for the customer profile.
	///   - nickname: A nickname for the customer profile.
	///   - note: A custom note associated with the customer profile.
	///   - phone_number: The 11-digit phone number associated with the customer profile.
	///   - preferences: Represents general customer preferences.
	///   - reference_id: An optional, second ID used to associate the customer profile with an entity in another system.
	///   - segment_ids: The IDs of segments the customer belongs to.
	///   - updated_at: The timestamp when the customer profile was last updated, in RFC 3339 format.
	public init(address: Address? = nil, birthday: Timestamp? = nil, cards: [Card]? = nil, company_name: String? = nil, created_at: Timestamp? = nil, creation_source: CustomerCreationSource? = nil, email_address: String? = nil, family_name: String? = nil, given_name: String? = nil, group_ids: [String]? = nil, groups: [CustomerGroupInfo]? = nil, id: String? = nil, nickname: String? = nil, note: String? = nil, phone_number: String? = nil, preferences: CustomerPreferences? = nil, reference_id: String? = nil, segment_ids: [String]? = nil, updated_at: Timestamp? = nil) {
		self.address = address
		self.birthday = birthday
		self.cards = cards
		self.company_name = company_name
		self.created_at = created_at
		self.creation_source = creation_source
		self.email_address = email_address
		self.family_name = family_name
		self.given_name = given_name
		self.group_ids = group_ids
		self.groups = groups
		self.id = id
		self.nickname = nickname
		self.note = note
		self.phone_number = phone_number
		self.preferences = preferences
		self.reference_id = reference_id
		self.segment_ids = segment_ids
		self.updated_at = updated_at
	}
}

/// Indicates the method used to create the customer profile.
public enum CustomerCreationSource: String, Codable {
	/// Default creation source. Typically used for backward/future compatibility when the original source of a customer profile is unrecognized. For example, when older clients do not support newer source types.
	case OTHER
	/// Customer profile created automatically when an appointment was scheduled.
	case APPOINTMENTS
	/// Customer profile created automatically when a coupon was issued using Square Point of Sale.
	case COUPON
	/// Customer profile restored through Square's deletion recovery process.
	case DELETION_RECOVERY
	/// Customer profile created manually through Square Dashboard or Point of Sale application.
	case DIRECTORY
	/// Customer profile created automatically when a gift card was issued using Square Point of Sale. Customer profiles are created for both the purchaser and the recipient of the gift card.
	case EGIFTING
	/// Customer profile created through Square Point of Sale when signing up for marketing emails during checkout.
	case EMAIL_COLLECTION
	/// Customer profile created automatically when providing feedback through a digital receipt.
	case FEEDBACK
	/// Customer profile created automatically when importing customer data through Square Dashboard.
	case IMPORT
	/// Customer profile created automatically during an invoice payment.
	case INVOICES
	/// Customer profile created automatically when customers provide a phone number for loyalty reward programs during checkout.
	case LOYALTY
	/// Customer profile created as the result of a campaign managed through Square’s Facebook integration.
	case MARKETING
	/// Customer profile created as the result of explicitly merging multiple customer profiles through the Square Dashboard or Point of Sale application.
	case MERGE
	/// Customer profile created through Square's Online Store solution (legacy service).
	case ONLINE_STORE
	/// Customer profile created automatically as the result of a successful transaction that did not explicitly link to an existing customer profile.
	case INSTANT_PROFILE
	/// Customer profile created through Square's Virtual Terminal.
	case TERMINAL
	/// Customer profile created through a Square API call.
	case THIRD_PARTY
	/// Customer profile created by a third-party product and imported through an official integration.
	case THIRD_PARTY_IMPORT
	/// Customer profile restored through Square's unmerge recovery process.
	case UNMERGE_RECOVERY
}

/// Creation source filter.  If one or more creation sources are set, customer profiles are included in, or excluded from, the result if they match at least one of the filter criteria.
public struct CustomerCreationSourceFilter: Codable {
	/// Indicates whether a customer profile matching the filter criteria should be included in the result or excluded from the result.  Default: `INCLUDE`. See [CustomerInclusionExclusion](#type-customerinclusionexclusion) for possible values
	public var rule: CustomerInclusionExclusion?
	/// The list of creation sources used as filtering criteria. See [CustomerCreationSource](#type-customercreationsource) for possible values
	public var values: CustomerCreationSource?

	/// Creation source filter.  If one or more creation sources are set, customer profiles are included in, or excluded from, the result if they match at least one of the filter criteria.
	/// - Parameters:
	///   - rule: Indicates whether a customer profile matching the filter criteria should be included in the result or excluded from the result.  Default: `INCLUDE`. See [CustomerInclusionExclusion](#type-customerinclusionexclusion) for possible values
	///   - values: The list of creation sources used as filtering criteria. See [CustomerCreationSource](#type-customercreationsource) for possible values
	public init(rule: CustomerInclusionExclusion? = nil, values: CustomerCreationSource? = nil) {
		self.rule = rule
		self.values = values
	}
}

/// Represents a set of `CustomerQuery` filters used to limit the set of `Customers` returned by `SearchCustomers`.
public struct CustomerFilter: Codable {
	/// A filter to select customers based on when they were created.
	public var created_at: TimeRange?
	/// A filter to select customers based on their creation source.
	public var creation_source: CustomerCreationSourceFilter?
	/// A filter to [select customers by email address](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#search-by-email-address)  visible to the seller.  This filter is case insensitive.  For [exact matching](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#exact-search-by-email-address), this filter causes the search to return customer profiles  whose `email_address` field value are identical to the email address provided in the query.  For [fuzzy matching](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#fuzzy-search-by-email-address),  this filter causes the search to return customer profiles  whose `email_address` field value has a token-wise partial match against the filtering  expression in the query. For example, with `Steven gmail` provided in a search query, the search returns customers whose email address can be `steven.johnson&#64;gmail.com`  or `mygmail&#64;stevensbakery.com`. Email addresses are tokenized by replacing, by spaces,  punctuations including periods (`.`), underscores (`_`), and the `&#64;` symbols. A match is found if a tokenized email address contains all the tokens in the search query,  irrespective of the token order.
	public var email_address: CustomerTextFilter?
	/// A filter to select customers based on their group membership.  The `group_ids` is a JSON object of the following general format: ``` "group_ids": { "any":  ["{group_a_id}", "{group_b_id}", ...], "all":  ["{group_1_id}", "{group_2_id}", ...], 'none": ["{group_i_id}", "{group_ii_id}", ...] } ```  You can use any combination of the above `group_ids` fields (also known as `FilterValue` properties)  to specify how customers are selected based on their group membership.   With the `any` option, the search returns customers in Groups `A` or `B` or ... of the list. With the `all` option, the search returns customers in Groups `1` and `2` and ... of the list. With the `none` option, the search returns customers not in Groups `i` and not in `ii` and not in ... of the list.  If any of the search conditions are not met, including when an invalid or non-existent group ID is provided, the result is an empty list.   You can use the `group_ids` search filter with other available filters.   You cannot use the `group_ids` filter to select customers based on segment membership.
	public var group_ids: FilterValue?
	/// A filter to [select customers by their phone numbers](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#search-by-phone-number) visible to the seller.  This filter is case insensitive.   For [exact matching](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#exact-search-by-phone-number),  this filter causes the search to return customers whose phone number matches the specified query expression. The number in the query must be of an E.164-compliant form. In particular, it must include the leading `+` sign followed by a country code and then a subscriber number. The standard E.614 form of a US phone number is `+12061112222` of the domestic version or `+0012061112222` of the international version. The E.164-compliant variations include `+1 (206) 111-2222` or `+001 (206) 111-2222`, respectively. To match the query expression, stored customers' phone numbers are converted to the standard E.164 form of the national and internationalized versions.   For [fuzzy matching](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#fuzzy-search-by-phone-number),  this filter causes the search to return customers whose phone number matches partially  the token or tokens provided in the query expression. For example, if the search query contains  `415-123-45`, the filter selects those customers with phone numbers of `415-123-4567` or  `234-151-2345`. The search does not return customers with the phone number of `415-123-4678`. Similarly, if the search query contains `415` as part of the phone number, the search returns those customers with phone numbers of `(415)-123-4567`, `(123) 415-1567`, and `1 (415) 123-4567`.
	public var phone_number: CustomerTextFilter?
	/// A filter to [select customers by their reference IDs](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#search-by-reference-id). This filter is case insensitive.  [Exact matching](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#exact-search-by-reference-id)  of a customer's reference ID against a query's reference ID is evaluated as exact match between two strings, character by character in the given order.  [Fuzzy matching](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#fuzzy-search-by-reference-id) of stored reference IDs against queried reference IDs works  exactly the same as fuzzy matching on email addresses. Non-alphanumeric characters  are replaced by spaces to tokenize stored and queried reference IDs. A match is found if a tokenized stored reference ID contains all tokens specified in any order in the query. For example, a query of `NYC M` will match customer profiles with the `reference_id` value of `NYC_M_35_JOHNSON` and `NYC_27_MURRAY`.
	public var reference_id: CustomerTextFilter?
	/// A filter to select customers based on when they were updated.
	public var updated_at: TimeRange?

	/// Represents a set of `CustomerQuery` filters used to limit the set of `Customers` returned by `SearchCustomers`.
	/// - Parameters:
	///   - created_at: A filter to select customers based on when they were created.
	///   - creation_source: A filter to select customers based on their creation source.
	///   - email_address: A filter to [select customers by email address](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#search-by-email-address)  visible to the seller.  This filter is case insensitive.  For [exact matching](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#exact-search-by-email-address), this filter causes the search to return customer profiles  whose `email_address` field value are identical to the email address provided in the query.  For [fuzzy matching](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#fuzzy-search-by-email-address),  this filter causes the search to return customer profiles  whose `email_address` field value has a token-wise partial match against the filtering  expression in the query. For example, with `Steven gmail` provided in a search query, the search returns customers whose email address can be `steven.johnson&#64;gmail.com`  or `mygmail&#64;stevensbakery.com`. Email addresses are tokenized by replacing, by spaces,  punctuations including periods (`.`), underscores (`_`), and the `&#64;` symbols. A match is found if a tokenized email address contains all the tokens in the search query,  irrespective of the token order.
	///   - group_ids: A filter to select customers based on their group membership.  The `group_ids` is a JSON object of the following general format: ``` "group_ids": { "any":  ["{group_a_id}", "{group_b_id}", ...], "all":  ["{group_1_id}", "{group_2_id}", ...], 'none": ["{group_i_id}", "{group_ii_id}", ...] } ```  You can use any combination of the above `group_ids` fields (also known as `FilterValue` properties)  to specify how customers are selected based on their group membership.   With the `any` option, the search returns customers in Groups `A` or `B` or ... of the list. With the `all` option, the search returns customers in Groups `1` and `2` and ... of the list. With the `none` option, the search returns customers not in Groups `i` and not in `ii` and not in ... of the list.  If any of the search conditions are not met, including when an invalid or non-existent group ID is provided, the result is an empty list.   You can use the `group_ids` search filter with other available filters.   You cannot use the `group_ids` filter to select customers based on segment membership.
	///   - phone_number: A filter to [select customers by their phone numbers](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#search-by-phone-number) visible to the seller.  This filter is case insensitive.   For [exact matching](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#exact-search-by-phone-number),  this filter causes the search to return customers whose phone number matches the specified query expression. The number in the query must be of an E.164-compliant form. In particular, it must include the leading `+` sign followed by a country code and then a subscriber number. The standard E.614 form of a US phone number is `+12061112222` of the domestic version or `+0012061112222` of the international version. The E.164-compliant variations include `+1 (206) 111-2222` or `+001 (206) 111-2222`, respectively. To match the query expression, stored customers' phone numbers are converted to the standard E.164 form of the national and internationalized versions.   For [fuzzy matching](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#fuzzy-search-by-phone-number),  this filter causes the search to return customers whose phone number matches partially  the token or tokens provided in the query expression. For example, if the search query contains  `415-123-45`, the filter selects those customers with phone numbers of `415-123-4567` or  `234-151-2345`. The search does not return customers with the phone number of `415-123-4678`. Similarly, if the search query contains `415` as part of the phone number, the search returns those customers with phone numbers of `(415)-123-4567`, `(123) 415-1567`, and `1 (415) 123-4567`.
	///   - reference_id: A filter to [select customers by their reference IDs](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#search-by-reference-id). This filter is case insensitive.  [Exact matching](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#exact-search-by-reference-id)  of a customer's reference ID against a query's reference ID is evaluated as exact match between two strings, character by character in the given order.  [Fuzzy matching](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#fuzzy-search-by-reference-id) of stored reference IDs against queried reference IDs works  exactly the same as fuzzy matching on email addresses. Non-alphanumeric characters  are replaced by spaces to tokenize stored and queried reference IDs. A match is found if a tokenized stored reference ID contains all tokens specified in any order in the query. For example, a query of `NYC M` will match customer profiles with the `reference_id` value of `NYC_M_35_JOHNSON` and `NYC_27_MURRAY`.
	///   - updated_at: A filter to select customers based on when they were updated.
	public init(created_at: TimeRange? = nil, creation_source: CustomerCreationSourceFilter? = nil, email_address: CustomerTextFilter? = nil, group_ids: FilterValue? = nil, phone_number: CustomerTextFilter? = nil, reference_id: CustomerTextFilter? = nil, updated_at: TimeRange? = nil) {
		self.created_at = created_at
		self.creation_source = creation_source
		self.email_address = email_address
		self.group_ids = group_ids
		self.phone_number = phone_number
		self.reference_id = reference_id
		self.updated_at = updated_at
	}
}

/// Represents a group of customer profiles.   Customer groups can be created, modified, and have their membership defined either via  the Customers API or within Customer Directory in the Square Dashboard or Point of Sale.
public struct CustomerGroup: Codable {
	/// The timestamp when the customer group was created, in RFC 3339 format.
	public let created_at: Timestamp?
	/// Unique Square-generated ID for the customer group.
	public let id: String?
	/// Name of the customer group.
	public var name: String
	/// The timestamp when the customer group was last updated, in RFC 3339 format.
	public let updated_at: Timestamp?

	/// Represents a group of customer profiles.   Customer groups can be created, modified, and have their membership defined either via  the Customers API or within Customer Directory in the Square Dashboard or Point of Sale.
	/// - Parameters:
	///   - created_at: The timestamp when the customer group was created, in RFC 3339 format.
	///   - id: Unique Square-generated ID for the customer group.
	///   - name: Name of the customer group.
	///   - updated_at: The timestamp when the customer group was last updated, in RFC 3339 format.
	public init(name: String, created_at: Timestamp? = nil, id: String? = nil, updated_at: Timestamp? = nil) {
		self.name = name
		self.created_at = created_at
		self.id = id
		self.updated_at = updated_at
	}
}

/// Contains some brief information about a Customer Group with its identifier included.
public struct CustomerGroupInfo: Codable {
	/// The ID of the Customer Group.
	public var id: String
	/// The name of the Customer Group.
	public var name: String

	/// Contains some brief information about a Customer Group with its identifier included.
	/// - Parameters:
	///   - id: The ID of the Customer Group.
	///   - name: The name of the Customer Group.
	public init(id: String, name: String) {
		self.id = id
		self.name = name
	}
}

/// Indicates whether customers should be included in, or excluded from, the result set when they match the filtering criteria.
public enum CustomerInclusionExclusion: String, Codable {
	/// Customers should be included in the result set when they match the filtering criteria.
	case INCLUDE
	/// Customers should be excluded from the result set when they match the filtering criteria.
	case EXCLUDE
}

/// Represents communication preferences for the customer profile.
public struct CustomerPreferences: Codable {
	/// The customer has unsubscribed from receiving marketing campaign emails.
	public var email_unsubscribed: Bool?

	/// Represents communication preferences for the customer profile.
	/// - Parameters:
	///   - email_unsubscribed: The customer has unsubscribed from receiving marketing campaign emails.
	public init(email_unsubscribed: Bool? = nil) {
		self.email_unsubscribed = email_unsubscribed
	}
}

/// Represents a query (including filtering criteria, sorting criteria, or both) used to search for customer profiles.
public struct CustomerQuery: Codable {
	/// A list of filtering criteria.
	public var filter: CustomerFilter?
	/// Sorting criteria for query results. The default behavior is to sort  customers alphabetically by `given_name` and `family_name`.
	public var sort: CustomerSort?

	/// Represents a query (including filtering criteria, sorting criteria, or both) used to search for customer profiles.
	/// - Parameters:
	///   - filter: A list of filtering criteria.
	///   - sort: Sorting criteria for query results. The default behavior is to sort  customers alphabetically by `given_name` and `family_name`.
	public init(filter: CustomerFilter? = nil, sort: CustomerSort? = nil) {
		self.filter = filter
		self.sort = sort
	}
}

/// Represents a group of customer profiles that match one or more predefined filter criteria.   Segments (also known as Smart Groups) are defined and created within Customer Directory in the Square Dashboard or Point of Sale.
public struct CustomerSegment: Codable {
	/// The timestamp when the segment was created, in RFC 3339 format.
	public let created_at: Timestamp?
	/// Unique Square-generated ID for the segment.
	public let id: String?
	/// Name of the segment.
	public let name: String
	/// The timestamp when the segment was last updated, in RFC 3339 format.
	public let updated_at: Timestamp?

	// no init-- this struct is read-only
}

/// Specifies how searched customers profiles are sorted, including the sort key and sort order.
public struct CustomerSort: Codable {
	///  Use one or more customer attributes as the sort key to sort searched customer profiles.  For example, use creation date (`created_at`) of customers or default attributes as the sort key.   Default: `DEFAULT`. See [CustomerSortField](#type-customersortfield) for possible values
	public var field: CustomerSortField?
	/// Indicates the order in which results should be sorted based on the sort field value. Strings use standard alphabetic comparison to determine order. Strings representing numbers are sorted as strings.  Default: `ASC`. See [SortOrder](#type-sortorder) for possible values
	public var order: SortOrder?

	/// Specifies how searched customers profiles are sorted, including the sort key and sort order.
	/// - Parameters:
	///   - field:  Use one or more customer attributes as the sort key to sort searched customer profiles.  For example, use creation date (`created_at`) of customers or default attributes as the sort key.   Default: `DEFAULT`. See [CustomerSortField](#type-customersortfield) for possible values
	///   - order: Indicates the order in which results should be sorted based on the sort field value. Strings use standard alphabetic comparison to determine order. Strings representing numbers are sorted as strings.  Default: `ASC`. See [SortOrder](#type-sortorder) for possible values
	public init(field: CustomerSortField? = nil, order: SortOrder? = nil) {
		self.field = field
		self.order = order
	}
}

/// Specifies customer attributes as the sort key to customer profiles returned from a search.
public enum CustomerSortField: String, Codable {
	/// Use the default sort key. By default, customers are sorted alphanumerically by concatenating their `given_name` and `family_name`. If neither name field is set, string comparison is performed using one of the remaining fields in the following order: `company_name`, `email`, `phone_number`.
	case DEFAULT
	/// Use the creation date attribute (`created_at`) of customer profiles as the sort key.
	case CREATED_AT
}

/// A filter to select customers based on exact or fuzzy matching of customer attributes against a specified query. Depending on customer attributes,  the filter can be case sensitive. This filter can be either exact or fuzzy. It cannot be both.
public struct CustomerTextFilter: Codable {
	/// Use the exact filter to select customers whose attributes match exactly the specified query.
	public var exact: String?
	/// Use the fuzzy filter to select customers whose attributes match the specified query  in a fuzzy manner. When the fuzzy option is used, search queries are tokenized, and then  each query token must be matched somewhere in the searched attribute. For single token queries,  this is effectively the same behavior as a partial match operation.
	public var fuzzy: String?

	/// A filter to select customers based on exact or fuzzy matching of customer attributes against a specified query. Depending on customer attributes,  the filter can be case sensitive. This filter can be either exact or fuzzy. It cannot be both.
	/// - Parameters:
	///   - exact: Use the exact filter to select customers whose attributes match exactly the specified query.
	///   - fuzzy: Use the fuzzy filter to select customers whose attributes match the specified query  in a fuzzy manner. When the fuzzy option is used, search queries are tokenized, and then  each query token must be matched somewhere in the searched attribute. For single token queries,  this is effectively the same behavior as a partial match operation.
	public init(exact: String? = nil, fuzzy: String? = nil) {
		self.exact = exact
		self.fuzzy = fuzzy
	}
}

/// A range defined by two dates. Used for filtering a query for Connect v2 objects that have date properties.
public struct DateRange: Codable {
	/// String in `YYYY-MM-DD` format, e.g. `2017-10-31` per the ISO 8601 extended format for calendar dates. The end of a date range (inclusive)
	public var end_date: String?
	/// String in `YYYY-MM-DD` format, e.g. `2017-10-31` per the ISO 8601 extended format for calendar dates. The beginning of a date range (inclusive)
	public var start_date: String?

	/// A range defined by two dates. Used for filtering a query for Connect v2 objects that have date properties.
	/// - Parameters:
	///   - end_date: String in `YYYY-MM-DD` format, e.g. `2017-10-31` per the ISO 8601 extended format for calendar dates. The end of a date range (inclusive)
	///   - start_date: String in `YYYY-MM-DD` format, e.g. `2017-10-31` per the ISO 8601 extended format for calendar dates. The beginning of a date range (inclusive)
	public init(end_date: String? = nil, start_date: String? = nil) {
		self.end_date = end_date
		self.start_date = start_date
	}
}

/// Indicates the specific day  of the week.
public enum DayOfWeek: String, Codable {
	/// Sunday
	case SUN
	/// Monday
	case MON
	/// Tuesday
	case TUE
	/// Wednesday
	case WED
	/// Thursday
	case THU
	/// Friday
	case FRI
	/// Saturday
	case SAT
}

/// A request to delete a `BreakType`
public struct DeleteBreakTypeRequest: Codable {

	/// A request to delete a `BreakType`
	public init() {
	}
}

/// The response to a request to delete a `BreakType`. May contain a set  of `Error` objects if the request resulted in errors.
public struct DeleteBreakTypeResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// The response to a request to delete a `BreakType`. May contain a set  of `Error` objects if the request resulted in errors.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	public init(errors: [SquareError]? = nil) {
		self.errors = errors
	}
}

public struct DeleteCatalogObjectRequest: Codable {

	public init() {
	}
}

public struct DeleteCatalogObjectResponse: Codable {
	/// The database [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) of this deletion in RFC 3339 format, e.g., `2016-09-04T23:59:33.123Z`.
	public var deleted_at: Timestamp?
	/// The IDs of all catalog objects deleted by this request. Multiple IDs may be returned when associated objects are also deleted, for example a catalog item variation will be deleted (and its ID included in this field) when its parent catalog item is deleted.
	public var deleted_object_ids: [String]?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(deleted_at: Timestamp? = nil, deleted_object_ids: [String]? = nil, errors: [SquareError]? = nil) {
		self.deleted_at = deleted_at
		self.deleted_object_ids = deleted_object_ids
		self.errors = errors
	}
}

/// Defines the fields that are included in requests to the DeleteCustomerCard endpoint.
public struct DeleteCustomerCardRequest: Codable {

	/// Defines the fields that are included in requests to the DeleteCustomerCard endpoint.
	public init() {
	}
}

/// Defines the fields that are included in the response body of a request to the DeleteCustomerCard endpoint.
public struct DeleteCustomerCardResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// Defines the fields that are included in the response body of a request to the DeleteCustomerCard endpoint.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	public init(errors: [SquareError]? = nil) {
		self.errors = errors
	}
}

/// Defines the fields that can be provided in a request to the [DeleteCustomerGroup](#endpoint-deletecustomergroup) endpoint.
public struct DeleteCustomerGroupRequest: Codable {

	/// Defines the fields that can be provided in a request to the [DeleteCustomerGroup](#endpoint-deletecustomergroup) endpoint.
	public init() {
	}
}

/// Defines the fields that are included in the response body of a request to the [DeleteCustomerGroup](#endpoint-deletecustomergroup) endpoint.
public struct DeleteCustomerGroupResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// Defines the fields that are included in the response body of a request to the [DeleteCustomerGroup](#endpoint-deletecustomergroup) endpoint.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	public init(errors: [SquareError]? = nil) {
		self.errors = errors
	}
}

/// Defines the fields that are included in a request to the DeleteCustomer endpoint.
public struct DeleteCustomerRequest: Codable {

	/// Defines the fields that are included in a request to the DeleteCustomer endpoint.
	public init() {
	}
}

/// Defines the fields that are included in the response body of a request to the DeleteCustomer endpoint.
public struct DeleteCustomerResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// Defines the fields that are included in the response body of a request to the DeleteCustomer endpoint.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	public init(errors: [SquareError]? = nil) {
		self.errors = errors
	}
}

/// Describes a `DeleteInvoice` request.
public struct DeleteInvoiceRequest: Codable {
	/// The version of the `invoice` to delete. If you do not know the version, you can call `GetInvoice` or  `ListInvoices`.
	public var version: Int?

	/// Describes a `DeleteInvoice` request.
	/// - Parameters:
	///   - version: The version of the `invoice` to delete. If you do not know the version, you can call `GetInvoice` or  `ListInvoices`.
	public init(version: Int? = nil) {
		self.version = version
	}
}

/// Describes a `DeleteInvoice` response.
public struct DeleteInvoiceResponse: Codable {
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?

	/// Describes a `DeleteInvoice` response.
	/// - Parameters:
	///   - errors: Information about errors encountered during the request.
	public init(errors: [SquareError]? = nil) {
		self.errors = errors
	}
}

/// A request to delete a loyalty reward.
public struct DeleteLoyaltyRewardRequest: Codable {

	/// A request to delete a loyalty reward.
	public init() {
	}
}

/// A response returned by the API call.
public struct DeleteLoyaltyRewardResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// A response returned by the API call.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	public init(errors: [SquareError]? = nil) {
		self.errors = errors
	}
}

/// A request to delete a `Shift`
public struct DeleteShiftRequest: Codable {

	/// A request to delete a `Shift`
	public init() {
	}
}

/// The response to a request to delete a `Shift`. May contain a set of  `Error` objects if the request resulted in errors.
public struct DeleteShiftResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// The response to a request to delete a `Shift`. May contain a set of  `Error` objects if the request resulted in errors.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	public init(errors: [SquareError]? = nil) {
		self.errors = errors
	}
}

public struct Device: Codable {
	/// The device's Square-issued ID.
	public var id: String?
	/// The device's merchant-specified name.
	public var name: String?

	public init(id: String? = nil, name: String? = nil) {
		self.id = id
		self.name = name
	}
}

public struct DeviceCheckoutOptions: Codable {
	/// The unique ID of the device intended for this `TerminalCheckout`. A list of `DeviceCode` objects can be retrieved from the /v2/devices/codes endpoint. Match a `DeviceCode.device_id` value with `device_id` to get the associated device code.
	public var device_id: String
	/// Instruct the device to skip the receipt screen. Defaults to false.
	public var skip_receipt_screen: Bool?
	/// Tip specific settings
	public var tip_settings: TipSettings?

	public init(device_id: String, skip_receipt_screen: Bool? = nil, tip_settings: TipSettings? = nil) {
		self.device_id = device_id
		self.skip_receipt_screen = skip_receipt_screen
		self.tip_settings = tip_settings
	}
}

public struct DeviceCode: Codable {
	/// The unique code that can be used to login.
	public let code: String?
	/// When this DeviceCode was created. Timestamp in RFC 3339 format.
	public let created_at: Timestamp?
	/// The unique id of the device that used this code. Populated when the device is paired up.
	public let device_id: String?
	/// The unique id for this device code.
	public let id: String?
	/// The location assigned to this code.
	public var location_id: String?
	/// An optional user-defined name for the device code.
	public var name: String?
	/// When this DeviceCode will expire and no longer login. Timestamp in RFC 3339 format.
	public let pair_by: Timestamp?
	/// When this DeviceCode was paired. Timestamp in RFC 3339 format.
	public let paired_at: Timestamp?
	/// The targeting product type of the device code. See [ProductType](#type-producttype) for possible values
	public var product_type: ProductType
	/// The pairing status of the device code. See [DeviceCodeStatus](#type-devicecodestatus) for possible values
	public let status: DeviceCodeStatus?
	/// When this DeviceCode's status was last changed. Timestamp in RFC 3339 format.
	public let status_changed_at: Timestamp?

	public init(product_type: ProductType, code: String? = nil, created_at: Timestamp? = nil, device_id: String? = nil, id: String? = nil, location_id: String? = nil, name: String? = nil, pair_by: Timestamp? = nil, paired_at: Timestamp? = nil, status: DeviceCodeStatus? = nil, status_changed_at: Timestamp? = nil) {
		self.product_type = product_type
		self.code = code
		self.created_at = created_at
		self.device_id = device_id
		self.id = id
		self.location_id = location_id
		self.name = name
		self.pair_by = pair_by
		self.paired_at = paired_at
		self.status = status
		self.status_changed_at = status_changed_at
	}
}

/// DeviceCode.Status enum.
public enum DeviceCodeStatus: String, Codable {
	/// The status cannot be determined or does not exist.
	case UNKNOWN
	/// The device code is just created and unpaired.
	case UNPAIRED
	/// The device code has been signed in and paired to a device.
	case PAIRED
	/// The device code was unpaired and expired before it was paired.
	case EXPIRED
}

/// Details about the device that took the payment.
public struct DeviceDetails: Codable {
	/// The Square-issued ID of the device.
	public var device_id: String?
	/// The Square-issued installation ID for the device.
	public var device_installation_id: String?
	/// The name of the device set by the seller.
	public var device_name: String?

	/// Details about the device that took the payment.
	/// - Parameters:
	///   - device_id: The Square-issued ID of the device.
	///   - device_installation_id: The Square-issued installation ID for the device.
	///   - device_name: The name of the device set by the seller.
	public init(device_id: String? = nil, device_installation_id: String? = nil, device_name: String? = nil) {
		self.device_id = device_id
		self.device_installation_id = device_installation_id
		self.device_name = device_name
	}
}

/// Represents a dispute a cardholder initiated with their bank.
public struct Dispute: Codable {
	/// The disputed amount. The amount can be less than the entire transaction amount. For example, a cardholder purchased multiple items, however initiated dispute only for some of the items.
	public var amount_money: Money?
	/// The ID of the dispute in the card brand system, generated by the card brand.
	public var brand_dispute_id: String?
	/// The card brand used in the disputed payment. See [CardBrand](#type-cardbrand) for possible values
	public var card_brand: CardBrand?
	/// The timestamp when the dispute was created, in RFC 3339 format.
	public let created_at: Timestamp?
	/// The unique ID for this `Dispute`, generated by Square.
	public var dispute_id: String?
	/// The payment challenged in this dispute.
	public var disputed_payment: DisputedPayment?
	/// The time when the next action is due, in RFC 3339 format.
	public var due_at: Timestamp?
	/// The IDs of the evidence associated with the dispute.
	public var evidence_ids: [String]?
	/// The ID of the location where the dispute originated.
	public var location_id: String?
	/// The dispute reason why the cardholder initiated the dispute with their bank. See [DisputeReason](#type-disputereason) for possible values
	public var reason: DisputeReason?
	/// The timestamp when the dispute was reported, in RFC 3339 format.
	public var reported_date: Timestamp?
	/// The current state of this dispute. See [DisputeState](#type-disputestate) for possible values
	public var state: DisputeState?
	/// The timestamp when the dispute was last updated, in RFC 3339 format.
	public let updated_at: Timestamp?
	/// The current version of the `Dispute`.
	public var version: Int?

	/// Represents a dispute a cardholder initiated with their bank.
	/// - Parameters:
	///   - amount_money: The disputed amount. The amount can be less than the entire transaction amount. For example, a cardholder purchased multiple items, however initiated dispute only for some of the items.
	///   - brand_dispute_id: The ID of the dispute in the card brand system, generated by the card brand.
	///   - card_brand: The card brand used in the disputed payment. See [CardBrand](#type-cardbrand) for possible values
	///   - created_at: The timestamp when the dispute was created, in RFC 3339 format.
	///   - dispute_id: The unique ID for this `Dispute`, generated by Square.
	///   - disputed_payment: The payment challenged in this dispute.
	///   - due_at: The time when the next action is due, in RFC 3339 format.
	///   - evidence_ids: The IDs of the evidence associated with the dispute.
	///   - location_id: The ID of the location where the dispute originated.
	///   - reason: The dispute reason why the cardholder initiated the dispute with their bank. See [DisputeReason](#type-disputereason) for possible values
	///   - reported_date: The timestamp when the dispute was reported, in RFC 3339 format.
	///   - state: The current state of this dispute. See [DisputeState](#type-disputestate) for possible values
	///   - updated_at: The timestamp when the dispute was last updated, in RFC 3339 format.
	///   - version: The current version of the `Dispute`.
	public init(amount_money: Money? = nil, brand_dispute_id: String? = nil, card_brand: CardBrand? = nil, created_at: Timestamp? = nil, dispute_id: String? = nil, disputed_payment: DisputedPayment? = nil, due_at: Timestamp? = nil, evidence_ids: [String]? = nil, location_id: String? = nil, reason: DisputeReason? = nil, reported_date: Timestamp? = nil, state: DisputeState? = nil, updated_at: Timestamp? = nil, version: Int? = nil) {
		self.amount_money = amount_money
		self.brand_dispute_id = brand_dispute_id
		self.card_brand = card_brand
		self.created_at = created_at
		self.dispute_id = dispute_id
		self.disputed_payment = disputed_payment
		self.due_at = due_at
		self.evidence_ids = evidence_ids
		self.location_id = location_id
		self.reason = reason
		self.reported_date = reported_date
		self.state = state
		self.updated_at = updated_at
		self.version = version
	}
}

public struct DisputeEvidence: Codable {
	/// The ID of the dispute the evidence is associated with.
	public var dispute_id: String?
	/// The Square-generated ID of the evidence.
	public var evidence_id: String?
	/// The type of the evidence. See [DisputeEvidenceType](#type-disputeevidencetype) for possible values
	public var evidence_type: DisputeEvidenceType?
	/// The time when the next action is due, in RFC 3339 format.
	public var uploaded_at: Timestamp?

	public init(dispute_id: String? = nil, evidence_id: String? = nil, evidence_type: DisputeEvidenceType? = nil, uploaded_at: Timestamp? = nil) {
		self.dispute_id = dispute_id
		self.evidence_id = evidence_id
		self.evidence_type = evidence_type
		self.uploaded_at = uploaded_at
	}
}

/// A file to be uploaded as dispute evidence.
public struct DisputeEvidenceFile: Codable {
	/// The file name including the file extension. For example: "receipt.tiff".
	public var filename: String?
	/// Dispute evidence files must be application/pdf, image/heic, image/heif, image/jpeg, image/png, or image/tiff formats.
	public var filetype: String?

	/// A file to be uploaded as dispute evidence.
	/// - Parameters:
	///   - filename: The file name including the file extension. For example: "receipt.tiff".
	///   - filetype: Dispute evidence files must be application/pdf, image/heic, image/heif, image/jpeg, image/png, or image/tiff formats.
	public init(filename: String? = nil, filetype: String? = nil) {
		self.filename = filename
		self.filetype = filetype
	}
}

/// The type of the dispute evidence.
public enum DisputeEvidenceType: String, Codable {
	/// Square assumes this evidence type if you do not provide a type when uploading evidence.  Use when uploading evidence as a file or string.
	case GENERIC_EVIDENCE
	/// Server or activity logs that show proof of the cardholder’s identity and that the cardholder successfully ordered and received the goods (digitally or otherwise). Example evidence includes IP addresses, corresponding timestamps/dates, cardholder’s name and email address linked to a cardholder profile held by the seller, proof the same device and card (used in dispute) were previously used in prior undisputed transaction, and any related detailed activity.  Use when uploading evidence as a file or string.
	case ONLINE_OR_APP_ACCESS_LOG
	/// Evidence that the cardholder did provide authorization for the charge. Example evidence includes a signed credit card authorization.  Use when uploading evidence as a file.
	case AUTHORIZATION_DOCUMENTATION
	/// Evidence that the cardholder acknowledged your refund or cancellation policy. Example evidence includes a signature or checkbox showing the cardholder’s acknowledgement of your refund or cancellation policy.  Use when uploading evidence as a file or string.
	case CANCELLATION_OR_REFUND_DOCUMENTATION
	/// Evidence that shows relevant communication with the cardholder. Example evidence includes emails or texts that show the cardholder received goods/services or demonstrate cardholder satisfaction.  Use when uploading evidence as a file.
	case CARDHOLDER_COMMUNICATION
	/// Evidence that validates the customer's identity. Example evidence includes personally identifiable details such as name, email address, purchaser IP address, and a copy of the cardholder ID.  Use when uploading evidence as a file or string.
	case CARDHOLDER_INFORMATION
	/// Evidence that shows proof of the sale/transaction. Example evidence includes an invoice, contract, or other item showing the customer’s acknowledgement of the purchase and your terms.  Use when uploading evidence as a file or string.
	case PURCHASE_ACKNOWLEDGEMENT
	/// Evidence that shows the charges in question are valid and distinct from one another. Example evidence includes receipts, shipping labels, and invoices along with their distinct payment IDs.  Use when uploading evidence as a file.
	case DUPLICATE_CHARGE_DOCUMENTATION
	/// A description of the product or service sold.  Use when uploading evidence as a file or string.
	case PRODUCT_OR_SERVICE_DESCRIPTION
	/// A receipt or message sent to the cardholder detailing the charge. Note: You do not need to upload the Square receipt; Square submits the receipt on your behalf.  Use when uploading evidence as a file or string.
	case RECEIPT
	/// Evidence that the service was provided to the cardholder or the expected date that services will be rendered. Example evidence includes a signed delivery form, work order, expected delivery date, or other written agreements.  Use when uploading evidence as a file or string.
	case SERVICE_RECEIVED_DOCUMENTATION
	/// Evidence that shows the product was provided to the cardholder or the expected date of delivery. Example evidence includes a signed delivery form or written agreement acknowledging receipt of the goods or services.  Use when uploading evidence as a file or string.
	case PROOF_OF_DELIVERY_DOCUMENTATION
	/// Evidence that shows the cardholder previously processed transactions on the same card and did not dispute them. Note: Square automatically provides up to five distinct Square receipts for related transactions, when available.  Use when uploading evidence as a file or string.
	case RELATED_TRANSACTION_DOCUMENTATION
	/// An explanation of why the cardholder’s claim is invalid. Example evidence includes an explanation of why each distinct charge is a legitimate purchase, why the cardholder’s claim for credit owed due to their attempt to cancel, return, or refund is invalid per your stated policy and cardholder agreement, or an explanation of how the cardholder did not attempt to remedy the issue with you first to receive credit.  Use when uploading evidence as a file or string.
	case REBUTTAL_EXPLANATION
	/// The tracking number for the order provided by the shipping carrier. If you have multiple numbers, they need to be submitted individually as separate pieces of evidence.  Use when uploading evidence as a string.
	case TRACKING_NUMBER
}

/// The list of possible reasons why a cardholder might initiate a dispute with their bank.
public enum DisputeReason: String, Codable {
	/// The cardholder claims that they were charged the wrong amount for the purchase. To challenge this dispute, provide specific and concrete evidence that the cardholder agreed to the amount charged.
	case AMOUNT_DIFFERS
	/// The cardholder claims that they attempted to return the goods or cancel the service. To challenge this dispute, provide specific and concrete evidence to prove that the cardholder is not due a refund and that the cardholder acknowledged your cancellation policy.
	case CANCELLED
	/// The cardholder claims that they were charged twice for the same purchase. To challenge this dispute, provide specific and concrete evidence that shows both charges are legitimate and independent of one another.
	case DUPLICATE
	/// The cardholder claims that they did not make this purchase nor authorized the charge. To challenge this dispute, provide specific and concrete evidence that proves that the cardholder identity was verified at the time of purchase and that the purchase was authorized.
	case NO_KNOWLEDGE
	/// The cardholder claims the product or service was provided, but the quality of the deliverable did not align with the expectations of the cardholder based on the description. To challenge this dispute, provide specific and concrete evidence that shows the cardholder is in possession of the product as described or received the service as described and agreed on.
	case NOT_AS_DESCRIBED
	/// The cardholder claims the product or service was not received by the cardholder within the stated time frame. To challenge this dispute, provide specific and concrete evidence to prove that the cardholder is in possession of or received the product or service sold.
	case NOT_RECEIVED
	/// The cardholder claims that they previously paid for this purchase. To challenge this dispute, provide specific and concrete evidence that shows both charges are legitimate and independent of one another or proof that you already provided a credit for the charge.
	case PAID_BY_OTHER_MEANS
	/// The cardholder claims that the purchase was canceled or returned, but they have not yet received the credit. To challenge this dispute, provide specific and concrete evidence to prove that the cardholder is not due a refund and that they acknowledged your cancellation and/or refund policy.
	case CUSTOMER_REQUESTS_CREDIT
	/// A chip-enabled card was not processed through a compliant chip-card reader (for example, it was swiped instead of dipped into a chip-card reader). You cannot challenge this dispute because the payment did not comply with EMV security requirements. For more information, see [What Is EMV?](https://squareup.com/emv)
	case EMV_LIABILITY_SHIFT
}

/// The list of possible dispute states.
public enum DisputeState: String, Codable {
	case UNKNOWN_STATE
	case INQUIRY_EVIDENCE_REQUIRED
	case INQUIRY_PROCESSING
	case INQUIRY_CLOSED
	case EVIDENCE_REQUIRED
	case PROCESSING
	case WON
	case LOST
	case ACCEPTED
	case WAITING_THIRD_PARTY
}

/// The payment the cardholder disputed.
public struct DisputedPayment: Codable {
	/// Square-generated unique ID of the payment being disputed.
	public var payment_id: String?

	/// The payment the cardholder disputed.
	/// - Parameters:
	///   - payment_id: Square-generated unique ID of the payment being disputed.
	public init(payment_id: String? = nil) {
		self.payment_id = payment_id
	}
}

/// Determines item visibility in Ecom (Online Store) and Online Checkout.
public enum EcomVisibility: String, Codable {
	/// Item is not synced with Ecom (Weebly). This is the default state
	case UNINDEXED
	/// Item is synced but is unavailable within Ecom (Weebly) and Online Checkout
	case UNAVAILABLE
	/// Option for seller to choose manually created Quick Amounts.
	case HIDDEN
	/// Item is synced but available within Ecom (Weebly) and Online Checkout but is hidden from Ecom Store.
	case VISIBLE
}

/// An employee object that is used by the external API.
public struct Employee: Codable {
	/// A read-only timestamp in RFC 3339 format.
	public let created_at: Timestamp?
	/// The employee's email address
	public var email: String?
	/// The employee's first name.
	public var first_name: String?
	/// UUID for this object.
	public var id: String?
	/// Whether this employee is the owner of the merchant. Each merchant has one owner employee, and that employee has full authority over the account.
	public var is_owner: Bool?
	/// The employee's last name.
	public var last_name: String?
	/// A list of location IDs where this employee has access to.
	public var location_ids: [String]?
	/// The employee's phone number in E.164 format, i.e. "+12125554250"
	public var phone_number: String?
	/// Specifies the status of the employees being fetched. See [EmployeeStatus](#type-employeestatus) for possible values
	public var status: EmployeeStatus?
	/// A read-only timestamp in RFC 3339 format.
	public let updated_at: Timestamp?

	/// An employee object that is used by the external API.
	/// - Parameters:
	///   - created_at: A read-only timestamp in RFC 3339 format.
	///   - email: The employee's email address
	///   - first_name: The employee's first name.
	///   - id: UUID for this object.
	///   - is_owner: Whether this employee is the owner of the merchant. Each merchant has one owner employee, and that employee has full authority over the account.
	///   - last_name: The employee's last name.
	///   - location_ids: A list of location IDs where this employee has access to.
	///   - phone_number: The employee's phone number in E.164 format, i.e. "+12125554250"
	///   - status: Specifies the status of the employees being fetched. See [EmployeeStatus](#type-employeestatus) for possible values
	///   - updated_at: A read-only timestamp in RFC 3339 format.
	public init(created_at: Timestamp? = nil, email: String? = nil, first_name: String? = nil, id: String? = nil, is_owner: Bool? = nil, last_name: String? = nil, location_ids: [String]? = nil, phone_number: String? = nil, status: EmployeeStatus? = nil, updated_at: Timestamp? = nil) {
		self.created_at = created_at
		self.email = email
		self.first_name = first_name
		self.id = id
		self.is_owner = is_owner
		self.last_name = last_name
		self.location_ids = location_ids
		self.phone_number = phone_number
		self.status = status
		self.updated_at = updated_at
	}
}

/// The status of the Employee being retrieved.
public enum EmployeeStatus: String, Codable {
	/// Specifies that the employee is in the Active state.
	case ACTIVE
	/// Specifies that the employee is in the Inactive state.
	case INACTIVE
}

/// The hourly wage rate that an employee will earn on a `Shift` for doing the job specified by the `title` property of this object. Deprecated at verison 2020-08-26. Use `TeamMemberWage` instead.
public struct EmployeeWage: Codable {
	/// The `Employee` that this wage is assigned to.
	public var employee_id: String?
	/// Can be a custom-set hourly wage or the calculated effective hourly wage based on annual wage and hours worked per week.
	public var hourly_rate: Money?
	/// UUID for this object.
	public var id: String?
	/// The job title that this wage relates to.
	public var title: String?

	/// The hourly wage rate that an employee will earn on a `Shift` for doing the job specified by the `title` property of this object. Deprecated at verison 2020-08-26. Use `TeamMemberWage` instead.
	/// - Parameters:
	///   - employee_id: The `Employee` that this wage is assigned to.
	///   - hourly_rate: Can be a custom-set hourly wage or the calculated effective hourly wage based on annual wage and hours worked per week.
	///   - id: UUID for this object.
	///   - title: The job title that this wage relates to.
	public init(employee_id: String? = nil, hourly_rate: Money? = nil, id: String? = nil, title: String? = nil) {
		self.employee_id = employee_id
		self.hourly_rate = hourly_rate
		self.id = id
		self.title = title
	}
}

/// Represents an error encountered during a request to the Connect API.  See [Handling errors](#handlingerrors) for more information.
public struct SquareError: Codable {
	/// The high-level category for the error. See [ErrorCategory](#type-errorcategory) for possible values
	public var category: ErrorCategory
	/// The specific code of the error. See [ErrorCode](#type-errorcode) for possible values
	public var code: ErrorCode
	/// A human-readable description of the error for debugging purposes.
	public var detail: String?
	/// The name of the field provided in the original request (if any) that the error pertains to.
	public var field: String?

	/// Represents an error encountered during a request to the Connect API.  See [Handling errors](#handlingerrors) for more information.
	/// - Parameters:
	///   - category: The high-level category for the error. See [ErrorCategory](#type-errorcategory) for possible values
	///   - code: The specific code of the error. See [ErrorCode](#type-errorcode) for possible values
	///   - detail: A human-readable description of the error for debugging purposes.
	///   - field: The name of the field provided in the original request (if any) that the error pertains to.
	public init(category: ErrorCategory, code: ErrorCode, detail: String? = nil, field: String? = nil) {
		self.category = category
		self.code = code
		self.detail = detail
		self.field = field
	}
}

/// Indicates which high-level category of error has occurred during a request to the Connect API.
public enum ErrorCategory: String, Codable {
	/// An error occurred with the Connect API itself.
	case API_ERROR
	/// An authentication error occurred. Most commonly, the request had a missing, malformed, or otherwise invalid `Authorization` header.
	case AUTHENTICATION_ERROR
	/// The request was invalid. Most commonly, a required parameter was missing, or a provided parameter had an invalid value.
	case INVALID_REQUEST_ERROR
	/// Your application reached the Connect API rate limit. Retry your request after a while.
	case RATE_LIMIT_ERROR
	/// An error occurred while processing a payment method. Most commonly, the details of the payment method were invalid (such as a card's CVV or expiration date).
	case PAYMENT_METHOD_ERROR
	/// An error occurred while attempting to process a refund.
	case REFUND_ERROR
}

/// Indicates the specific error that occurred during a request to a Square API.
public enum ErrorCode: String, Codable {
	/// A general server error occurred.
	case INTERNAL_SERVER_ERROR
	/// A general authorization error occurred.
	case UNAUTHORIZED
	/// The provided access token has expired.
	case ACCESS_TOKEN_EXPIRED
	/// The provided access token has been revoked.
	case ACCESS_TOKEN_REVOKED
	/// The provided client has been disabled.
	case CLIENT_DISABLED
	/// A general access error occurred.
	case FORBIDDEN
	/// The provided access token does not have permission to execute the requested action.
	case INSUFFICIENT_SCOPES
	/// The calling application was disabled.
	case APPLICATION_DISABLED
	/// The calling application was created prior to 2016-03-30 and is not compatible with v2 Square API calls.
	case V1_APPLICATION
	/// The calling application is using an access token created prior to 2016-03-30 and is not compatible with v2 Square API calls.
	case V1_ACCESS_TOKEN
	/// The location provided in the API call is not enabled for credit card processing.
	case CARD_PROCESSING_NOT_ENABLED
	/// A general error occurred with the request.
	case BAD_REQUEST
	/// The request is missing a required path, query, or body parameter.
	case MISSING_REQUIRED_PARAMETER
	/// The value provided in the request is the wrong type. For example, a string instead of an integer.
	case INCORRECT_TYPE
	/// Formatting for the provided time value is incorrect.
	case INVALID_TIME
	/// The time range provided in the request is invalid. For example, the end time is before the start time.
	case INVALID_TIME_RANGE
	/// The provided value is invalid. For example, including `%` in a phone number.
	case INVALID_VALUE
	/// The pagination cursor included in the request is invalid.
	case INVALID_CURSOR
	/// The query parameters provided is invalid for the requested endpoint.
	case UNKNOWN_QUERY_PARAMETER
	/// One or more of the request parameters conflict with each other.
	case CONFLICTING_PARAMETERS
	/// The request body is not a JSON object.
	case EXPECTED_JSON_BODY
	/// The provided sort order is not a valid key. Currently, sort order must be `ASC` or `DESC`.
	case INVALID_SORT_ORDER
	/// The provided value does not match an expected regular expression.
	case VALUE_REGEX_MISMATCH
	/// The provided string value is shorter than the minimum length allowed.
	case VALUE_TOO_SHORT
	/// The provided string value is longer than the maximum length allowed.
	case VALUE_TOO_LONG
	/// The provided value is less than the supported minimum.
	case VALUE_TOO_LOW
	/// The provided value is greater than the supported maximum.
	case VALUE_TOO_HIGH
	/// The provided value has a default (empty) value such as a blank string.
	case VALUE_EMPTY
	/// The provided array has too many elements.
	case ARRAY_LENGTH_TOO_LONG
	/// The provided array has too few elements.
	case ARRAY_LENGTH_TOO_SHORT
	/// The provided array is empty.
	case ARRAY_EMPTY
	/// The endpoint expected the provided value to be a boolean.
	case EXPECTED_BOOLEAN
	/// The endpoint expected the provided value to be an integer.
	case EXPECTED_INTEGER
	/// The endpoint expected the provided value to be a float.
	case EXPECTED_FLOAT
	/// The endpoint expected the provided value to be a string.
	case EXPECTED_STRING
	/// The endpoint expected the provided value to be a JSON object.
	case EXPECTED_OBJECT
	/// The endpoint expected the provided value to be an array or list.
	case EXPECTED_ARRAY
	/// The endpoint expected the provided value to be a map or associative array.
	case EXPECTED_MAP
	/// The endpoint expected the provided value to be an array encoded in base64.
	case EXPECTED_BASE64_ENCODED_BYTE_ARRAY
	/// One or more objects in the array does not match the array type.
	case INVALID_ARRAY_VALUE
	/// The provided static string is not valid for the field.
	case INVALID_ENUM_VALUE
	/// Invalid content type header.
	case INVALID_CONTENT_TYPE
	/// Only relevant for applications created prior to 2016-03-30. Indicates there was an error while parsing form values.
	case INVALID_FORM_VALUE
	/// The provided customer id can't be found in the merchant's customers list.
	case CUSTOMER_NOT_FOUND
	/// A general error occurred.
	case ONE_INSTRUMENT_EXPECTED
	/// A general error occurred.
	case NO_FIELDS_SET
	/// Too many entries in the map field.
	case TOO_MANY_MAP_ENTRIES
	/// The length of one of the provided keys in the map is too short.
	case MAP_KEY_LENGTH_TOO_SHORT
	/// The length of one of the provided keys in the map is too long.
	case MAP_KEY_LENGTH_TOO_LONG
	/// The card issuer declined the request because the card is expired.
	case CARD_EXPIRED
	/// The expiration date for the payment card is invalid. For example, it indicates a date in the past.
	case INVALID_EXPIRATION
	/// The expiration year for the payment card is invalid. For example, it indicates a year in the past or contains invalid characters.
	case INVALID_EXPIRATION_YEAR
	/// The expiration date for the payment card is invalid. For example, it contains invalid characters.
	case INVALID_EXPIRATION_DATE
	/// The credit card provided is not from a supported issuer.
	case UNSUPPORTED_CARD_BRAND
	/// The entry method for the credit card (swipe, dip, tap) is not supported.
	case UNSUPPORTED_ENTRY_METHOD
	/// The encrypted card information is invalid.
	case INVALID_ENCRYPTED_CARD
	/// The credit card cannot be validated based on the provided details.
	case INVALID_CARD
	/// Square received a decline from the cardholder's bank without any  additional information. If the card information seems correct, the card  holder can contact their card issuer to ask for more information.
	case GENERIC_DECLINE
	/// The card issuer declined the request because the CVV value is invalid.
	case CVV_FAILURE
	/// The card issuer declined the request because the postal code is invalid.
	case ADDRESS_VERIFICATION_FAILURE
	/// The card issuer was not able to locate account on record.
	case INVALID_ACCOUNT
	/// The currency associated with the payment is not valid for the provided funding source. For example, a gift card funded in USD cannot be used to process payments in GBP.
	case CURRENCY_MISMATCH
	/// The funding source has insufficient funds to cover the payment.
	case INSUFFICIENT_FUNDS
	/// The Square account does not have the permissions to accept this payment. For example, Square may limit which merchants are allowed to receive gift card payments.
	case INSUFFICIENT_PERMISSIONS
	/// The card issuer has declined the transaction due to restrictions on where the card can be used. For example, a gift card is limited to a single merchant.
	case CARDHOLDER_INSUFFICIENT_PERMISSIONS
	/// The Square account cannot take payments in the specified region. A Square account can take payments only from the region where the account was created.
	case INVALID_LOCATION
	/// The card issuer has determined the payment amount is either too high or too low. The API returns the error code mostly for credit cards (for example, the card reached the credit limit). However, sometimes the issuer bank can indicate the error for debit or prepaid cards (for example, card has insufficient funds).
	case TRANSACTION_LIMIT
	/// The card issuer declined the request because the issuer requires voice authorization from the cardholder.
	case VOICE_FAILURE
	/// The specified card number is invalid. For example, it is of incorrect length or is incorrectly formatted.
	case PAN_FAILURE
	/// The card expiration date is either invalid or indicates that the card is expired.
	case EXPIRATION_FAILURE
	/// The card is not supported either in the geographic region or by the MCC [merchant category code](https://developer.squareup.com/docs/docs/api/connect/v2#navsection-connectapibasics)
	case CARD_NOT_SUPPORTED
	/// The card issuer declined the request because the PIN is invalid.
	case INVALID_PIN
	/// The postal code is incorrectly formatted.
	case INVALID_POSTAL_CODE
	/// The app_fee_money on a payment is too high.
	case INVALID_FEES
	/// The card must be swiped, tapped, or dipped. Payments attempted by manually entering the card number are declined.
	case MANUALLY_ENTERED_PAYMENT_NOT_SUPPORTED
	/// Square declined the request because the payment amount exceeded the processing limit for this merchant.
	case PAYMENT_LIMIT_EXCEEDED
	/// When a Gift Card is a payment source, you can allow taking a partial payment  by adding the `accept_partial_authorization` parameter in the request.  However, taking such a partial payment does not work if your request also includes  `tip_money`, `app_fee_money`, or both. Square declines such payments and returns  the `GIFT_CARD_AVAILABLE_AMOUNT` error.  For more information, see  [CreatePayment errors (additional information)](https://developer.squareup.com/docs/docs/payments-api/error-codes#createpayment-errors-additional-information).
	case GIFT_CARD_AVAILABLE_AMOUNT
	/// The application tried to update a delayed-capture payment that has expired.
	case DELAYED_TRANSACTION_EXPIRED
	/// The application tried to cancel a delayed-capture payment that was already cancelled.
	case DELAYED_TRANSACTION_CANCELED
	/// The application tried to capture a delayed-capture payment that was already captured.
	case DELAYED_TRANSACTION_CAPTURED
	/// The application tried to update a delayed-capture payment that failed.
	case DELAYED_TRANSACTION_FAILED
	/// The provided card token (nonce) has expired.
	case CARD_TOKEN_EXPIRED
	/// The provided card token (nonce) was already used to process payment.
	case CARD_TOKEN_USED
	/// The requested payment amount is too high for the provided payment source.
	case AMOUNT_TOO_HIGH
	/// The API request references an unsupported instrument type/
	case UNSUPPORTED_INSTRUMENT_TYPE
	/// The requested refund amount exceeds the amount available to refund.
	case REFUND_AMOUNT_INVALID
	/// The payment already has a pending refund.
	case REFUND_ALREADY_PENDING
	/// The payment is not refundable. For example, a previous refund has already been rejected and no new refunds can be accepted.
	case PAYMENT_NOT_REFUNDABLE
	/// Request failed - The card issuer declined the refund.
	case REFUND_DECLINED
	/// Generic error - the provided card data is invalid.
	case INVALID_CARD_DATA
	/// The provided source id was already used to create a card.
	case SOURCE_USED
	/// The provided source id has expired.
	case SOURCE_EXPIRED
	/// The referenced loyalty program reward tier is not supported. This could happen if the reward tier created in a first party application is incompatible with the Loyalty API.
	case UNSUPPORTED_LOYALTY_REWARD_TIER
	/// Generic error - the given location does not matching what is expected.
	case LOCATION_MISMATCH
	/// The provided idempotency key has already been used.
	case IDEMPOTENCY_KEY_REUSED
	/// General error - the value provided was unexpected.
	case UNEXPECTED_VALUE
	/// The API request is not supported in sandbox.
	case SANDBOX_NOT_SUPPORTED
	/// The provided email address is invalid.
	case INVALID_EMAIL_ADDRESS
	/// The provided phone number is invalid.
	case INVALID_PHONE_NUMBER
	/// The provided checkout URL has expired.
	case CHECKOUT_EXPIRED
	/// Bad certificate.
	case BAD_CERTIFICATE
	/// The provided Square-Version is incorrectly formatted.
	case INVALID_SQUARE_VERSION_FORMAT
	/// The provided Square-Version is incompatible with the requested action.
	case API_VERSION_INCOMPATIBLE
	/// The card was declined.
	case CARD_DECLINED
	/// The CVV could not be verified.
	case VERIFY_CVV_FAILURE
	/// The AVS could not be verified.
	case VERIFY_AVS_FAILURE
	/// The payment card was declined with a request for the card holder to call the issuer.
	case CARD_DECLINED_CALL_ISSUER
	/// The payment card was declined with a request for additional verification.
	case CARD_DECLINED_VERIFICATION_REQUIRED
	/// The card expiration date is either missing or incorrectly formatted.
	case BAD_EXPIRATION
	/// The card issuer requires that the card be read using a chip reader.
	case CHIP_INSERTION_REQUIRED
	/// The card has exhausted its available pin entry retries set by the card issuer. Resolving the error typically requires the card holder to contact the card issuer.
	case ALLOWABLE_PIN_TRIES_EXCEEDED
	/// The card issuer declined the refund.
	case RESERVATION_DECLINED
	/// Not Found - a general error occurred.
	case NOT_FOUND
	/// Square could not find the associated Apple Pay certificate.
	case APPLE_PAYMENT_PROCESSING_CERTIFICATE_HASH_NOT_FOUND
	/// Method Not Allowed - a general error occurred.
	case METHOD_NOT_ALLOWED
	/// Not Acceptable - a general error occurred.
	case NOT_ACCEPTABLE
	/// Request Timeout - a general error occurred.
	case REQUEST_TIMEOUT
	/// Conflict - a general error occurred.
	case CONFLICT
	/// The target resource is no longer available and this condition is likely to be permanent.
	case GONE
	/// Request Entity Too Large - a general error occurred.
	case REQUEST_ENTITY_TOO_LARGE
	/// Unsupported Media Type - a general error occurred.
	case UNSUPPORTED_MEDIA_TYPE
	/// Unprocessable Entity - a general error occurred.
	case UNPROCESSABLE_ENTITY
	/// Rate Limited - a general error occurred.
	case RATE_LIMITED
	/// Not Implemented - a general error occurred.
	case NOT_IMPLEMENTED
	/// Bad Gateway - a general error occurred.
	case BAD_GATEWAY
	/// Service Unavailable - a general error occurred.
	case SERVICE_UNAVAILABLE
	/// A temporary internal error occurred. You can safely retry your call using the same idempotency key.
	case TEMPORARY_ERROR
	/// Gateway Timeout - a general error occurred.
	case GATEWAY_TIMEOUT
}

/// Indicates which products matched by a CatalogPricingRule will be excluded if the pricing rule uses an exclude set.
public enum ExcludeStrategy: String, Codable {
	/// The least expensive matched products are excluded from the pricing. If the pricing rule is set to exclude one product and multiple products in the match set qualify as least expensive, then one will be excluded at random.  Excluding the least expensive product gives the best discount value to the buyer.
	case LEAST_EXPENSIVE
	/// The most expensive matched product is excluded from the pricing rule. If multiple products have the same price and all qualify as least expensive, one will be excluded at random.  This guarantees that the most expensive product is purchased at full price.
	case MOST_EXPENSIVE
}

/// A filter to select resources based on an exact field value. For any given value, the value can only be in one property. Depending on the field, either all properties can be set or only a subset will be available.  Refer to the documentation of the field.
public struct FilterValue: Codable {
	/// A list of terms that must be present on the field of the resource.
	public var all: [String]?
	/// A list of terms where at least one of them must be present on the field of the resource.
	public var any: [String]?
	/// A list of terms that must not be present on the field the resource
	public var none: [String]?

	/// A filter to select resources based on an exact field value. For any given value, the value can only be in one property. Depending on the field, either all properties can be set or only a subset will be available.  Refer to the documentation of the field.
	/// - Parameters:
	///   - all: A list of terms that must be present on the field of the resource.
	///   - any: A list of terms where at least one of them must be present on the field of the resource.
	///   - none: A list of terms that must not be present on the field the resource
	public init(all: [String]? = nil, any: [String]? = nil, none: [String]? = nil) {
		self.all = all
		self.any = any
		self.none = none
	}
}

/// Request object for fetching a specific `BankAccount` by the object ID.
public struct GetBankAccountByV1IdRequest: Codable {

	/// Request object for fetching a specific `BankAccount` by the object ID.
	public init() {
	}
}

/// Response object returned by GetBankAccountByV1Id.
public struct GetBankAccountByV1IdResponse: Codable {
	/// The requested `BankAccount` object.
	public var bank_account: BankAccount?
	/// Information on errors encountered during the request.
	public var errors: [SquareError]?

	/// Response object returned by GetBankAccountByV1Id.
	/// - Parameters:
	///   - bank_account: The requested `BankAccount` object.
	///   - errors: Information on errors encountered during the request.
	public init(bank_account: BankAccount? = nil, errors: [SquareError]? = nil) {
		self.bank_account = bank_account
		self.errors = errors
	}
}

/// Request object to fetch a specific `BankAccount` by the object ID.
public struct GetBankAccountRequest: Codable {

	/// Request object to fetch a specific `BankAccount` by the object ID.
	public init() {
	}
}

/// Response object returned by `GetBankAccount`.
public struct GetBankAccountResponse: Codable {
	/// The requested `BankAccount` object.
	public var bank_account: BankAccount?
	/// Information on errors encountered during the request.
	public var errors: [SquareError]?

	/// Response object returned by `GetBankAccount`.
	/// - Parameters:
	///   - bank_account: The requested `BankAccount` object.
	///   - errors: Information on errors encountered during the request.
	public init(bank_account: BankAccount? = nil, errors: [SquareError]? = nil) {
		self.bank_account = bank_account
		self.errors = errors
	}
}

/// A request to GET a `BreakType` by ID
public struct GetBreakTypeRequest: Codable {

	/// A request to GET a `BreakType` by ID
	public init() {
	}
}

/// The response to a request to get a `BreakType`. Contains the requested `BreakType` objects. May contain a set of `Error` objects if the request resulted in errors.
public struct GetBreakTypeResponse: Codable {
	/// The response object.
	public var break_type: BreakType?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// The response to a request to get a `BreakType`. Contains the requested `BreakType` objects. May contain a set of `Error` objects if the request resulted in errors.
	/// - Parameters:
	///   - break_type: The response object.
	///   - errors: Any errors that occurred during the request.
	public init(break_type: BreakType? = nil, errors: [SquareError]? = nil) {
		self.break_type = break_type
		self.errors = errors
	}
}

public struct GetDeviceCodeRequest: Codable {

	public init() {
	}
}

public struct GetDeviceCodeResponse: Codable {
	/// The queried DeviceCode.
	public var device_code: DeviceCode?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(device_code: DeviceCode? = nil, errors: [SquareError]? = nil) {
		self.device_code = device_code
		self.errors = errors
	}
}

/// A request to get an `EmployeeWage`
public struct GetEmployeeWageRequest: Codable {

	/// A request to get an `EmployeeWage`
	public init() {
	}
}

/// A response to a request to get an `EmployeeWage`. Contains the requested `EmployeeWage` objects. May contain a set of `Error` objects if the request resulted in errors.
public struct GetEmployeeWageResponse: Codable {
	/// The requested `EmployeeWage` object.
	public var employee_wage: EmployeeWage?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// A response to a request to get an `EmployeeWage`. Contains the requested `EmployeeWage` objects. May contain a set of `Error` objects if the request resulted in errors.
	/// - Parameters:
	///   - employee_wage: The requested `EmployeeWage` object.
	///   - errors: Any errors that occurred during the request.
	public init(employee_wage: EmployeeWage? = nil, errors: [SquareError]? = nil) {
		self.employee_wage = employee_wage
		self.errors = errors
	}
}

/// Describes a `GetInvoice` request.
public struct GetInvoiceRequest: Codable {

	/// Describes a `GetInvoice` request.
	public init() {
	}
}

/// Describes a `GetInvoice` response.
public struct GetInvoiceResponse: Codable {
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The invoice requested.
	public var invoice: Invoice?

	/// Describes a `GetInvoice` response.
	/// - Parameters:
	///   - errors: Information about errors encountered during the request.
	///   - invoice: The invoice requested.
	public init(errors: [SquareError]? = nil, invoice: Invoice? = nil) {
		self.errors = errors
		self.invoice = invoice
	}
}

/// Retrieves a specific `Refund` using the `refund_id`.
public struct GetPaymentRefundRequest: Codable {

	/// Retrieves a specific `Refund` using the `refund_id`.
	public init() {
	}
}

/// Defines the fields that are included in the response body of a request to the [GetRefund](#endpoint-refunds-getpaymentrefund) endpoint.  Note: If there are errors processing the request, the refund field might not be present or it might be present in a FAILED state.
public struct GetPaymentRefundResponse: Codable {
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The requested `PaymentRefund`.
	public var refund: PaymentRefund?

	/// Defines the fields that are included in the response body of a request to the [GetRefund](#endpoint-refunds-getpaymentrefund) endpoint.  Note: If there are errors processing the request, the refund field might not be present or it might be present in a FAILED state.
	/// - Parameters:
	///   - errors: Information about errors encountered during the request.
	///   - refund: The requested `PaymentRefund`.
	public init(errors: [SquareError]? = nil, refund: PaymentRefund? = nil) {
		self.errors = errors
		self.refund = refund
	}
}

/// Retrieve details for a specific payment.
public struct GetPaymentRequest: Codable {

	/// Retrieve details for a specific payment.
	public init() {
	}
}

/// Defines the fields that are included in the response body of a request to the [GetPayment](#endpoint-payments-getpayment) endpoint.
public struct GetPaymentResponse: Codable {
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The requested `Payment`.
	public var payment: Payment?

	/// Defines the fields that are included in the response body of a request to the [GetPayment](#endpoint-payments-getpayment) endpoint.
	/// - Parameters:
	///   - errors: Information about errors encountered during the request.
	///   - payment: The requested `Payment`.
	public init(errors: [SquareError]? = nil, payment: Payment? = nil) {
		self.errors = errors
		self.payment = payment
	}
}

/// A request to get a `Shift` by ID
public struct GetShiftRequest: Codable {

	/// A request to get a `Shift` by ID
	public init() {
	}
}

/// A response to request to get a `Shift`. Contains the requested `Shift` object. May contain a set of `Error` objects if the request resulted in errors.
public struct GetShiftResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The requested `Shift`.
	public var shift: Shift?

	/// A response to request to get a `Shift`. Contains the requested `Shift` object. May contain a set of `Error` objects if the request resulted in errors.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - shift: The requested `Shift`.
	public init(errors: [SquareError]? = nil, shift: Shift? = nil) {
		self.errors = errors
		self.shift = shift
	}
}

/// A request to get an `TeamMemberWage`
public struct GetTeamMemberWageRequest: Codable {

	/// A request to get an `TeamMemberWage`
	public init() {
	}
}

/// A response to a request to get a `TeamMemberWage`. Contains the requested `TeamMemberWage` objects. May contain a set of `Error` objects if the request resulted in errors.
public struct GetTeamMemberWageResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The requested `TeamMemberWage` object.
	public var team_member_wage: TeamMemberWage?

	/// A response to a request to get a `TeamMemberWage`. Contains the requested `TeamMemberWage` objects. May contain a set of `Error` objects if the request resulted in errors.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - team_member_wage: The requested `TeamMemberWage` object.
	public init(errors: [SquareError]? = nil, team_member_wage: TeamMemberWage? = nil) {
		self.errors = errors
		self.team_member_wage = team_member_wage
	}
}

public struct GetTerminalCheckoutRequest: Codable {

	public init() {
	}
}

public struct GetTerminalCheckoutResponse: Codable {
	/// The requested `TerminalCheckout`
	public var checkout: TerminalCheckout?
	/// Information on errors encountered during the request.
	public var errors: [SquareError]?

	public init(checkout: TerminalCheckout? = nil, errors: [SquareError]? = nil) {
		self.checkout = checkout
		self.errors = errors
	}
}

public struct GetTerminalRefundRequest: Codable {

	public init() {
	}
}

public struct GetTerminalRefundResponse: Codable {
	/// Information on errors encountered during the request.
	public var errors: [SquareError]?
	/// The requested `Refund`
	public var refund: TerminalRefund?

	public init(errors: [SquareError]? = nil, refund: TerminalRefund? = nil) {
		self.errors = errors
		self.refund = refund
	}
}

/// Object types to inline under their respective parent object in certain connect v2 responses
public enum InlineTypes: String, Codable {
	case INLINE_NONE
	case INLINE_VARIATIONS
	case INLINE_ALL
}

/// Represents a change in state or quantity of product inventory at a particular time and location.
public struct InventoryAdjustment: Codable {
	/// The Square generated ID of the `CatalogObject` being tracked.
	public var catalog_object_id: String?
	/// The `CatalogObjectType` of the `CatalogObject` being tracked. Tracking is only supported for the `ITEM_VARIATION` type.
	public var catalog_object_type: String?
	/// A read-only timestamp in RFC 3339 format that indicates when Square received the adjustment.
	public let created_at: Timestamp?
	/// The Square ID of the `Employee` responsible for the inventory adjustment.
	public var employee_id: String?
	/// The `InventoryState` of the related quantity of items before the adjustment. See [InventoryState](#type-inventorystate) for possible values
	public var from_state: InventoryState?
	/// The read-only Square ID of the Square goods receipt that caused the adjustment. Only relevant for state transitions from the Square for Retail app.
	public var goods_receipt_id: String?
	/// A unique ID generated by Square for the `InventoryAdjustment`.
	public var id: String?
	/// The Square ID of the `Location` where the related quantity of items are being tracked.
	public var location_id: String?
	/// A client-generated timestamp in RFC 3339 format that indicates when the adjustment took place. For write actions, the `occurred_at` timestamp cannot be older than 24 hours or in the future relative to the time of the request.
	public var occurred_at: Timestamp?
	/// The read-only Square ID of the purchase order that caused the adjustment. Only relevant for state transitions from the Square for Retail app.
	public var purchase_order_id: String?
	/// The number of items affected by the adjustment as a decimal string. Can support up to 5 digits after the decimal point.
	public var quantity: String?
	/// An optional ID provided by the application to tie the `InventoryAdjustment` to an external system.
	public var reference_id: String?
	/// The read-only Square ID of the [Refund][#type-refund] that caused the adjustment. Only relevant for refund-related state transitions.
	public var refund_id: String?
	/// Read-only information about the application that caused the inventory adjustment.
	public var source: SourceApplication?
	/// The `InventoryState` of the related quantity of items after the adjustment. See [InventoryState](#type-inventorystate) for possible values
	public var to_state: InventoryState?
	/// The read-only total price paid for goods associated with the adjustment. Present if and only if `to_state` is `SOLD`. Always non-negative.
	public var total_price_money: Money?
	/// The read-only Square ID of the [Transaction][#type-transaction] that caused the adjustment. Only relevant for payment-related state transitions.
	public var transaction_id: String?

	/// Represents a change in state or quantity of product inventory at a particular time and location.
	/// - Parameters:
	///   - catalog_object_id: The Square generated ID of the `CatalogObject` being tracked.
	///   - catalog_object_type: The `CatalogObjectType` of the `CatalogObject` being tracked. Tracking is only supported for the `ITEM_VARIATION` type.
	///   - created_at: A read-only timestamp in RFC 3339 format that indicates when Square received the adjustment.
	///   - employee_id: The Square ID of the `Employee` responsible for the inventory adjustment.
	///   - from_state: The `InventoryState` of the related quantity of items before the adjustment. See [InventoryState](#type-inventorystate) for possible values
	///   - goods_receipt_id: The read-only Square ID of the Square goods receipt that caused the adjustment. Only relevant for state transitions from the Square for Retail app.
	///   - id: A unique ID generated by Square for the `InventoryAdjustment`.
	///   - location_id: The Square ID of the `Location` where the related quantity of items are being tracked.
	///   - occurred_at: A client-generated timestamp in RFC 3339 format that indicates when the adjustment took place. For write actions, the `occurred_at` timestamp cannot be older than 24 hours or in the future relative to the time of the request.
	///   - purchase_order_id: The read-only Square ID of the purchase order that caused the adjustment. Only relevant for state transitions from the Square for Retail app.
	///   - quantity: The number of items affected by the adjustment as a decimal string. Can support up to 5 digits after the decimal point.
	///   - reference_id: An optional ID provided by the application to tie the `InventoryAdjustment` to an external system.
	///   - refund_id: The read-only Square ID of the [Refund][#type-refund] that caused the adjustment. Only relevant for refund-related state transitions.
	///   - source: Read-only information about the application that caused the inventory adjustment.
	///   - to_state: The `InventoryState` of the related quantity of items after the adjustment. See [InventoryState](#type-inventorystate) for possible values
	///   - total_price_money: The read-only total price paid for goods associated with the adjustment. Present if and only if `to_state` is `SOLD`. Always non-negative.
	///   - transaction_id: The read-only Square ID of the [Transaction][#type-transaction] that caused the adjustment. Only relevant for payment-related state transitions.
	public init(catalog_object_id: String? = nil, catalog_object_type: String? = nil, created_at: Timestamp? = nil, employee_id: String? = nil, from_state: InventoryState? = nil, goods_receipt_id: String? = nil, id: String? = nil, location_id: String? = nil, occurred_at: Timestamp? = nil, purchase_order_id: String? = nil, quantity: String? = nil, reference_id: String? = nil, refund_id: String? = nil, source: SourceApplication? = nil, to_state: InventoryState? = nil, total_price_money: Money? = nil, transaction_id: String? = nil) {
		self.catalog_object_id = catalog_object_id
		self.catalog_object_type = catalog_object_type
		self.created_at = created_at
		self.employee_id = employee_id
		self.from_state = from_state
		self.goods_receipt_id = goods_receipt_id
		self.id = id
		self.location_id = location_id
		self.occurred_at = occurred_at
		self.purchase_order_id = purchase_order_id
		self.quantity = quantity
		self.reference_id = reference_id
		self.refund_id = refund_id
		self.source = source
		self.to_state = to_state
		self.total_price_money = total_price_money
		self.transaction_id = transaction_id
	}
}

/// Indicates whether Square should alert the merchant when the inventory quantity of a CatalogItemVariation is low.
public enum InventoryAlertType: String, Codable {
	/// The variation does not display an alert.
	case NONE
	/// The variation generates an alert when its quantity is low.
	case LOW_QUANTITY
}

/// Represents a single physical count, inventory, adjustment, or transfer that is part of the history of inventory changes for a particular `CatalogObject`.
public struct InventoryChange: Codable {
	/// Contains details about the inventory adjustment when `type` is `ADJUSTMENT` and unset for all other types.
	public var adjustment: InventoryAdjustment?
	/// Contains details about the physical count when `type` is `PHYSICAL_COUNT` and unset for all other types.
	public var physical_count: InventoryPhysicalCount?
	/// Contains details about the inventory transfer when `type` is `TRANSFER` and unset for all other types.  _Note:_ An `InventoryTransfer` object is read-only and can only be present in a `RetrieveInventoryChangesResponse` and `BatchRetrieveInventoryChangesResponse` object.
	public var transfer: InventoryTransfer?
	/// Indicates how the inventory change was applied. See `InventoryChangeType` for all possible values. See [InventoryChangeType](#type-inventorychangetype) for possible values
	public var type: InventoryChangeType?

	/// Represents a single physical count, inventory, adjustment, or transfer that is part of the history of inventory changes for a particular `CatalogObject`.
	/// - Parameters:
	///   - adjustment: Contains details about the inventory adjustment when `type` is `ADJUSTMENT` and unset for all other types.
	///   - physical_count: Contains details about the physical count when `type` is `PHYSICAL_COUNT` and unset for all other types.
	///   - transfer: Contains details about the inventory transfer when `type` is `TRANSFER` and unset for all other types.  _Note:_ An `InventoryTransfer` object is read-only and can only be present in a `RetrieveInventoryChangesResponse` and `BatchRetrieveInventoryChangesResponse` object.
	///   - type: Indicates how the inventory change was applied. See `InventoryChangeType` for all possible values. See [InventoryChangeType](#type-inventorychangetype) for possible values
	public init(adjustment: InventoryAdjustment? = nil, physical_count: InventoryPhysicalCount? = nil, transfer: InventoryTransfer? = nil, type: InventoryChangeType? = nil) {
		self.adjustment = adjustment
		self.physical_count = physical_count
		self.transfer = transfer
		self.type = type
	}
}

/// Indicates how the inventory change was applied to a tracked quantity of items.
public enum InventoryChangeType: String, Codable {
	/// The change occurred as part of a physical count update.
	case PHYSICAL_COUNT
	/// The change occurred as part of the normal lifecycle of goods (e.g., as an inventory adjustment).
	case ADJUSTMENT
	/// The change occurred as part of an inventory transfer.
	case TRANSFER
}

/// Represents Square's estimated quantity of items in a particular state at a particular location based on the known history of physical counts and inventory adjustments.
public struct InventoryCount: Codable {
	/// A read-only timestamp in RFC 3339 format that indicates when Square received the most recent physical count or adjustment that had an affect on the estimated count.
	public var calculated_at: Timestamp?
	/// The Square generated ID of the `CatalogObject` being tracked.
	public var catalog_object_id: String?
	/// The `CatalogObjectType` of the `CatalogObject` being tracked. Tracking is only supported for the `ITEM_VARIATION` type.
	public var catalog_object_type: String?
	/// The Square ID of the `Location` where the related quantity of items are being tracked.
	public var location_id: String?
	/// The number of items affected by the estimated count as a decimal string. Can support up to 5 digits after the decimal point.
	public var quantity: String?
	/// The current `InventoryState` for the related quantity of items. See [InventoryState](#type-inventorystate) for possible values
	public var state: InventoryState?

	/// Represents Square's estimated quantity of items in a particular state at a particular location based on the known history of physical counts and inventory adjustments.
	/// - Parameters:
	///   - calculated_at: A read-only timestamp in RFC 3339 format that indicates when Square received the most recent physical count or adjustment that had an affect on the estimated count.
	///   - catalog_object_id: The Square generated ID of the `CatalogObject` being tracked.
	///   - catalog_object_type: The `CatalogObjectType` of the `CatalogObject` being tracked. Tracking is only supported for the `ITEM_VARIATION` type.
	///   - location_id: The Square ID of the `Location` where the related quantity of items are being tracked.
	///   - quantity: The number of items affected by the estimated count as a decimal string. Can support up to 5 digits after the decimal point.
	///   - state: The current `InventoryState` for the related quantity of items. See [InventoryState](#type-inventorystate) for possible values
	public init(calculated_at: Timestamp? = nil, catalog_object_id: String? = nil, catalog_object_type: String? = nil, location_id: String? = nil, quantity: String? = nil, state: InventoryState? = nil) {
		self.calculated_at = calculated_at
		self.catalog_object_id = catalog_object_id
		self.catalog_object_type = catalog_object_type
		self.location_id = location_id
		self.quantity = quantity
		self.state = state
	}
}

/// Represents the quantity of an item variation that is physically present at a specific location, verified by a seller or a seller's employee. For example, a physical count might come from an employee counting the item variations on hand or from syncing with an external system.
public struct InventoryPhysicalCount: Codable {
	/// The Square generated ID of the `CatalogObject` being tracked.
	public var catalog_object_id: String?
	/// The `CatalogObjectType` of the `CatalogObject` being tracked. Tracking is only supported for the `ITEM_VARIATION` type.
	public var catalog_object_type: String?
	/// A read-only timestamp in RFC 3339 format that indicates when Square received the physical count.
	public let created_at: Timestamp?
	/// The Square ID of the `Employee` responsible for the physical count.
	public var employee_id: String?
	/// A unique ID generated by Square for the `InventoryPhysicalCount`.
	public var id: String?
	/// The Square ID of the `Location` where the related quantity of items are being tracked.
	public var location_id: String?
	/// A client-generated timestamp in RFC 3339 format that indicates when the physical count took place. For write actions, the `occurred_at` timestamp cannot be older than 24 hours or in the future relative to the time of the request.
	public var occurred_at: Timestamp?
	/// The number of items affected by the physical count as a decimal string. Can support up to 5 digits after the decimal point.
	public var quantity: String?
	/// An optional ID provided by the application to tie the `InventoryPhysicalCount` to an external system.
	public var reference_id: String?
	/// Read-only information about the application that submitted the physical count.
	public var source: SourceApplication?
	/// The current `InventoryState` for the related quantity of items. See [InventoryState](#type-inventorystate) for possible values
	public var state: InventoryState?

	/// Represents the quantity of an item variation that is physically present at a specific location, verified by a seller or a seller's employee. For example, a physical count might come from an employee counting the item variations on hand or from syncing with an external system.
	/// - Parameters:
	///   - catalog_object_id: The Square generated ID of the `CatalogObject` being tracked.
	///   - catalog_object_type: The `CatalogObjectType` of the `CatalogObject` being tracked. Tracking is only supported for the `ITEM_VARIATION` type.
	///   - created_at: A read-only timestamp in RFC 3339 format that indicates when Square received the physical count.
	///   - employee_id: The Square ID of the `Employee` responsible for the physical count.
	///   - id: A unique ID generated by Square for the `InventoryPhysicalCount`.
	///   - location_id: The Square ID of the `Location` where the related quantity of items are being tracked.
	///   - occurred_at: A client-generated timestamp in RFC 3339 format that indicates when the physical count took place. For write actions, the `occurred_at` timestamp cannot be older than 24 hours or in the future relative to the time of the request.
	///   - quantity: The number of items affected by the physical count as a decimal string. Can support up to 5 digits after the decimal point.
	///   - reference_id: An optional ID provided by the application to tie the `InventoryPhysicalCount` to an external system.
	///   - source: Read-only information about the application that submitted the physical count.
	///   - state: The current `InventoryState` for the related quantity of items. See [InventoryState](#type-inventorystate) for possible values
	public init(catalog_object_id: String? = nil, catalog_object_type: String? = nil, created_at: Timestamp? = nil, employee_id: String? = nil, id: String? = nil, location_id: String? = nil, occurred_at: Timestamp? = nil, quantity: String? = nil, reference_id: String? = nil, source: SourceApplication? = nil, state: InventoryState? = nil) {
		self.catalog_object_id = catalog_object_id
		self.catalog_object_type = catalog_object_type
		self.created_at = created_at
		self.employee_id = employee_id
		self.id = id
		self.location_id = location_id
		self.occurred_at = occurred_at
		self.quantity = quantity
		self.reference_id = reference_id
		self.source = source
		self.state = state
	}
}

/// Indicates the state of a tracked item quantity in the lifecycle of goods.
public enum InventoryState: String, Codable {
	/// The related quantity of items are in a custom state. **READ-ONLY**: the Inventory API cannot move quantities to or from this state.
	case CUSTOM
	/// The related quantity of items are on hand and available for sale.
	case IN_STOCK
	/// The related quantity of items were sold as part of an itemized transaction. Quantities in the `SOLD` state are no longer tracked.
	case SOLD
	/// The related quantity of items were returned through the Square Point of Sale application, but are not yet available for sale. **READ-ONLY**: the Inventory API cannot move quantities to or from this state.
	case RETURNED_BY_CUSTOMER
	/// The related quantity of items are on hand, but not currently available for sale. **READ-ONLY**: the Inventory API cannot move quantities to or from this state.
	case RESERVED_FOR_SALE
	/// The related quantity of items were sold online. **READ-ONLY**: the Inventory API cannot move quantities to or from this state.
	case SOLD_ONLINE
	/// The related quantity of items were ordered from a vendor but not yet received. **READ-ONLY**: the Inventory API cannot move quantities to or from this state.
	case ORDERED_FROM_VENDOR
	/// The related quantity of items were received from a vendor but are not yet available for sale. **READ-ONLY**: the Inventory API cannot move quantities to or from this state.
	case RECEIVED_FROM_VENDOR
	/// The related quantity of items are in transit between locations. *READ-ONLY**: the Inventory API cannot move quantities to or from this state.
	case IN_TRANSIT_TO
	/// A placeholder indicating that the related quantity of items are not currently tracked in Square. Transferring quantities from the `NONE` state to a tracked state (e.g., `IN_STOCK`) introduces stock into the system.
	case NONE
	/// The related quantity of items are lost or damaged and cannot be sold.
	case WASTE
	/// The related quantity of items were returned but not linked to a previous transaction. Unlinked returns are not tracked in Square. Transferring a quantity from `UNLINKED_RETURN` to a tracked state (e.g., `IN_STOCK`) introduces new stock into the system.
	case UNLINKED_RETURN
}

/// Represents the transfer of a quantity of product inventory at a particular time from one location to another.
public struct InventoryTransfer: Codable {
	/// The Square generated ID of the `CatalogObject` being tracked.
	public var catalog_object_id: String?
	/// The `CatalogObjectType` of the `CatalogObject` being tracked.Tracking is only supported for the `ITEM_VARIATION` type.
	public var catalog_object_type: String?
	/// A read-only timestamp in RFC 3339 format that indicates when Square received the transfer request.
	public let created_at: Timestamp?
	/// The Square ID of the `Employee` responsible for the inventory transfer.
	public var employee_id: String?
	/// The Square ID of the `Location` where the related quantity of items were tracked before the transfer.
	public var from_location_id: String?
	/// A unique ID generated by Square for the `InventoryTransfer`.
	public var id: String?
	/// A client-generated timestamp in RFC 3339 format that indicates when the transfer took place. For write actions, the `occurred_at` timestamp cannot be older than 24 hours or in the future relative to the time of the request.
	public var occurred_at: Timestamp?
	/// The number of items affected by the transfer as a decimal string. Can support up to 5 digits after the decimal point.
	public var quantity: String?
	/// An optional ID provided by the application to tie the `InventoryTransfer` to an external system.
	public var reference_id: String?
	/// Read-only information about the application that initiated the inventory transfer.
	public var source: SourceApplication?
	/// The `InventoryState` for the quantity of items being transferred. See [InventoryState](#type-inventorystate) for possible values
	public var state: InventoryState?
	/// The Square ID of the `Location` where the related quantity of items were tracked after the transfer.
	public var to_location_id: String?

	/// Represents the transfer of a quantity of product inventory at a particular time from one location to another.
	/// - Parameters:
	///   - catalog_object_id: The Square generated ID of the `CatalogObject` being tracked.
	///   - catalog_object_type: The `CatalogObjectType` of the `CatalogObject` being tracked.Tracking is only supported for the `ITEM_VARIATION` type.
	///   - created_at: A read-only timestamp in RFC 3339 format that indicates when Square received the transfer request.
	///   - employee_id: The Square ID of the `Employee` responsible for the inventory transfer.
	///   - from_location_id: The Square ID of the `Location` where the related quantity of items were tracked before the transfer.
	///   - id: A unique ID generated by Square for the `InventoryTransfer`.
	///   - occurred_at: A client-generated timestamp in RFC 3339 format that indicates when the transfer took place. For write actions, the `occurred_at` timestamp cannot be older than 24 hours or in the future relative to the time of the request.
	///   - quantity: The number of items affected by the transfer as a decimal string. Can support up to 5 digits after the decimal point.
	///   - reference_id: An optional ID provided by the application to tie the `InventoryTransfer` to an external system.
	///   - source: Read-only information about the application that initiated the inventory transfer.
	///   - state: The `InventoryState` for the quantity of items being transferred. See [InventoryState](#type-inventorystate) for possible values
	///   - to_location_id: The Square ID of the `Location` where the related quantity of items were tracked after the transfer.
	public init(catalog_object_id: String? = nil, catalog_object_type: String? = nil, created_at: Timestamp? = nil, employee_id: String? = nil, from_location_id: String? = nil, id: String? = nil, occurred_at: Timestamp? = nil, quantity: String? = nil, reference_id: String? = nil, source: SourceApplication? = nil, state: InventoryState? = nil, to_location_id: String? = nil) {
		self.catalog_object_id = catalog_object_id
		self.catalog_object_type = catalog_object_type
		self.created_at = created_at
		self.employee_id = employee_id
		self.from_location_id = from_location_id
		self.id = id
		self.occurred_at = occurred_at
		self.quantity = quantity
		self.reference_id = reference_id
		self.source = source
		self.state = state
		self.to_location_id = to_location_id
	}
}

/// Stores information about an invoice. You use the Invoices API to create and manage invoices. For more information, see [Manage Invoices Using the Invoices API](/docs/invoices-api/overview).
public struct Invoice: Codable {
	/// The timestamp when the invoice was created, in RFC 3339 format.
	public let created_at: Timestamp?
	/// Additional seller-defined fields to render on the invoice. These fields are visible to sellers and buyers on the Square-hosted invoice page and in emailed or PDF copies of invoices. For more information, see [Custom fields](https://developer.squareup.com/docs/docs/invoices-api/overview#custom-fields).  Max: 2 custom fields
	public var custom_fields: [InvoiceCustomField]?
	/// The delivery method that Square uses to send the invoice, reminders, and receipts to the customer. After the invoice is published, Square processes the invoice based on the delivery method and payment request settings, either immediately or at the `scheduled_at` date, if specified. For example, Square might send the invoice or receipt for an automatic payment. For invoices with automatic payments, this field must be set to `EMAIL`.  One of the following is required when creating an invoice: - (Recommended) This `delivery_method` field. To configure an automatic payment, the `automatic_payment_source` field of the payment request is also required. - The deprecated `request_method` field of the payment request. Note that `invoice` objects returned in responses do not include `request_method`.
	public var delivery_method: InvoiceDeliveryMethod?
	/// The description of the invoice. This is visible to the customer receiving the invoice.
	public var description: String?
	/// The Square-assigned ID of the invoice.
	public let id: String?
	/// A user-friendly invoice number. The value is unique within a location. If not provided when creating an invoice, Square assigns a value. It increments from 1 and padded with zeros making it 7 characters long for example, 0000001, 0000002.
	public var invoice_number: String?
	/// The ID of the location that this invoice is associated with. This field is required when creating an invoice.
	public var location_id: String?
	/// The current amount due for the invoice. In addition to the amount due on the next payment request, this also includes any overdue payment amounts.
	public let next_payment_amount_money: Money?
	/// The ID of the `order` for which the invoice is created.  This order must be in the `OPEN` state and must belong to the `location_id` specified for this invoice. This field is required when creating an invoice.
	public var order_id: String?
	/// The payment schedule for the invoice, represented by one or more payment requests that define payment settings, such as amount due and due date. You can specify a maximum of 13 payment requests, with up to 12 `INSTALLMENT` request types. For more information, see [Payment requests](https://developer.squareup.com/docs/docs/invoices-api/overview#payment-requests).  This field is required when creating an invoice. It must contain at least one payment request.
	public var payment_requests: [InvoicePaymentRequest]?
	/// The customer who gets the invoice. Square uses the contact information to deliver the invoice. This field is required to publish an invoice.
	public var primary_recipient: InvoiceRecipient?
	/// The URL of the Square-hosted invoice page. After you publish the invoice using the `PublishInvoice` endpoint, Square hosts the invoice page and returns the page URL in the response.
	public let public_url: String?
	/// The timestamp when the invoice is scheduled for processing, in RFC 3339 format. After the invoice is published, Square processes the invoice on the specified date, according to the delivery method and payment request settings.  If the field is not set, Square processes the invoice immediately after it is published.
	public var scheduled_at: Timestamp?
	/// The status of the invoice. See [InvoiceStatus](#type-invoicestatus) for possible values
	public let status: InvoiceStatus?
	/// The time zone of the date values (for example, `due_date`) specified in the invoice.
	public let timezone: String?
	/// The title of the invoice.
	public var title: String?
	/// The timestamp when the invoice was last updated, in RFC 3339 format.
	public let updated_at: Timestamp?
	/// The Square-assigned version number, which is incremented each time an update is committed to the invoice.
	public var version: Int?

	/// Stores information about an invoice. You use the Invoices API to create and manage invoices. For more information, see [Manage Invoices Using the Invoices API](/docs/invoices-api/overview).
	/// - Parameters:
	///   - created_at: The timestamp when the invoice was created, in RFC 3339 format.
	///   - custom_fields: Additional seller-defined fields to render on the invoice. These fields are visible to sellers and buyers on the Square-hosted invoice page and in emailed or PDF copies of invoices. For more information, see [Custom fields](https://developer.squareup.com/docs/docs/invoices-api/overview#custom-fields).  Max: 2 custom fields
	///   - delivery_method: The delivery method that Square uses to send the invoice, reminders, and receipts to the customer. After the invoice is published, Square processes the invoice based on the delivery method and payment request settings, either immediately or at the `scheduled_at` date, if specified. For example, Square might send the invoice or receipt for an automatic payment. For invoices with automatic payments, this field must be set to `EMAIL`.  One of the following is required when creating an invoice: - (Recommended) This `delivery_method` field. To configure an automatic payment, the `automatic_payment_source` field of the payment request is also required. - The deprecated `request_method` field of the payment request. Note that `invoice` objects returned in responses do not include `request_method`.
	///   - description: The description of the invoice. This is visible to the customer receiving the invoice.
	///   - id: The Square-assigned ID of the invoice.
	///   - invoice_number: A user-friendly invoice number. The value is unique within a location. If not provided when creating an invoice, Square assigns a value. It increments from 1 and padded with zeros making it 7 characters long for example, 0000001, 0000002.
	///   - location_id: The ID of the location that this invoice is associated with. This field is required when creating an invoice.
	///   - next_payment_amount_money: The current amount due for the invoice. In addition to the amount due on the next payment request, this also includes any overdue payment amounts.
	///   - order_id: The ID of the `order` for which the invoice is created.  This order must be in the `OPEN` state and must belong to the `location_id` specified for this invoice. This field is required when creating an invoice.
	///   - payment_requests: The payment schedule for the invoice, represented by one or more payment requests that define payment settings, such as amount due and due date. You can specify a maximum of 13 payment requests, with up to 12 `INSTALLMENT` request types. For more information, see [Payment requests](https://developer.squareup.com/docs/docs/invoices-api/overview#payment-requests).  This field is required when creating an invoice. It must contain at least one payment request.
	///   - primary_recipient: The customer who gets the invoice. Square uses the contact information to deliver the invoice. This field is required to publish an invoice.
	///   - public_url: The URL of the Square-hosted invoice page. After you publish the invoice using the `PublishInvoice` endpoint, Square hosts the invoice page and returns the page URL in the response.
	///   - scheduled_at: The timestamp when the invoice is scheduled for processing, in RFC 3339 format. After the invoice is published, Square processes the invoice on the specified date, according to the delivery method and payment request settings.  If the field is not set, Square processes the invoice immediately after it is published.
	///   - status: The status of the invoice. See [InvoiceStatus](#type-invoicestatus) for possible values
	///   - timezone: The time zone of the date values (for example, `due_date`) specified in the invoice.
	///   - title: The title of the invoice.
	///   - updated_at: The timestamp when the invoice was last updated, in RFC 3339 format.
	///   - version: The Square-assigned version number, which is incremented each time an update is committed to the invoice.
	public init(created_at: Timestamp? = nil, custom_fields: [InvoiceCustomField]? = nil, delivery_method: InvoiceDeliveryMethod? = nil, description: String? = nil, id: String? = nil, invoice_number: String? = nil, location_id: String? = nil, next_payment_amount_money: Money? = nil, order_id: String? = nil, payment_requests: [InvoicePaymentRequest]? = nil, primary_recipient: InvoiceRecipient? = nil, public_url: String? = nil, scheduled_at: Timestamp? = nil, status: InvoiceStatus? = nil, timezone: String? = nil, title: String? = nil, updated_at: Timestamp? = nil, version: Int? = nil) {
		self.created_at = created_at
		self.custom_fields = custom_fields
		self.delivery_method = delivery_method
		self.description = description
		self.id = id
		self.invoice_number = invoice_number
		self.location_id = location_id
		self.next_payment_amount_money = next_payment_amount_money
		self.order_id = order_id
		self.payment_requests = payment_requests
		self.primary_recipient = primary_recipient
		self.public_url = public_url
		self.scheduled_at = scheduled_at
		self.status = status
		self.timezone = timezone
		self.title = title
		self.updated_at = updated_at
		self.version = version
	}
}

/// Indicates the automatic payment method for an `invoice payment request`.
public enum InvoiceAutomaticPaymentSource: String, Codable {
	/// An automatic payment is not configured for the payment request.
	case NONE
	/// Use a card on file as the automatic payment method. On the due date, Square charges the card for the amount of the payment request.  For `CARD_ON_FILE` payments, the invoice delivery method must be `EMAIL` and `card_id` must be specified for the payment request before the invoice can be published.
	case CARD_ON_FILE
	/// Use a bank account on file as the automatic payment method. On the due date, Square charges the bank account for the amount of the payment request.  This payment method applies only to recurring invoices that sellers create in the Seller Dashboard or other Square first-party application. The bank account is provided by the customer during the payment flow.   You cannot set `BANK_ON_FILE` as a payment method using the Invoices API, but you can change a `BANK_ON_FILE` payment method to `NONE` or `CARD_ON_FILE`. For `BANK_ON_FILE` payments, the invoice delivery method must be `EMAIL`.
	case BANK_ON_FILE
}

/// An additional seller-defined and customer-facing field to include on the invoice. For more information,  see [Custom fields](/docs/invoices-api/overview#custom-fields).
public struct InvoiceCustomField: Codable {
	/// The label or title of the custom field. This field is required for a custom field.
	public var label: String?
	/// The location of the custom field on the invoice. This field is required for a custom field. See [InvoiceCustomFieldPlacement](#type-invoicecustomfieldplacement) for possible values
	public var placement: InvoiceCustomFieldPlacement?
	/// The text of the custom field. If omitted, only the label is rendered.
	public var value: String?

	/// An additional seller-defined and customer-facing field to include on the invoice. For more information,  see [Custom fields](/docs/invoices-api/overview#custom-fields).
	/// - Parameters:
	///   - label: The label or title of the custom field. This field is required for a custom field.
	///   - placement: The location of the custom field on the invoice. This field is required for a custom field. See [InvoiceCustomFieldPlacement](#type-invoicecustomfieldplacement) for possible values
	///   - value: The text of the custom field. If omitted, only the label is rendered.
	public init(label: String? = nil, placement: InvoiceCustomFieldPlacement? = nil, value: String? = nil) {
		self.label = label
		self.placement = placement
		self.value = value
	}
}

/// Indicates where to render a custom field on the Square-hosted invoice page and in emailed or PDF  copies of the invoice.
public enum InvoiceCustomFieldPlacement: String, Codable {
	/// Render the custom field above the invoice line items.
	case ABOVE_LINE_ITEMS
	/// Render the custom field below the invoice line items.
	case BELOW_LINE_ITEMS
}

/// Indicates how Square delivers the `invoice` to the customer.
public enum InvoiceDeliveryMethod: String, Codable {
	/// Directs Square to send the invoice, reminders, and receipts to the customer using email.
	case EMAIL
	/// Directs Square to take no action on the invoice. In this case, the seller or application developer follows up with the customer for payment. For example, a seller might collect a payment in the Seller Dashboard or Point of Sale (POS) application. The seller might also share the URL of the Square-hosted invoice page (`public_url`) with the customer to request payment.
	case SHARE_MANUALLY
}

/// Describes query filters to apply.
public struct InvoiceFilter: Codable {
	/// Limits the search to the specified customers, within the specified locations.  Specifying a customer is optional. In the current implementation,  a maximum of one customer can be specified.
	public var customer_ids: [String]?
	/// Limits the search to the specified locations. A location is required.  In the current implementation, only one location can be specified.
	public var location_ids: [String]

	/// Describes query filters to apply.
	/// - Parameters:
	///   - customer_ids: Limits the search to the specified customers, within the specified locations.  Specifying a customer is optional. In the current implementation,  a maximum of one customer can be specified.
	///   - location_ids: Limits the search to the specified locations. A location is required.  In the current implementation, only one location can be specified.
	public init(location_ids: [String], customer_ids: [String]? = nil) {
		self.location_ids = location_ids
		self.customer_ids = customer_ids
	}
}

/// Describes a payment request reminder (automatic notification) that Square sends to the customer. You configure a reminder relative to the payment request `due_date`.
public struct InvoicePaymentReminder: Codable {
	/// The reminder message.
	public var message: String?
	/// The number of days before (a negative number) or after (a positive number) the payment request `due_date` when the reminder is sent. For example, -3 indicates that the reminder should be sent 3 days before the payment request `due_date`.
	public var relative_scheduled_days: Int?
	/// If sent, the timestamp when the reminder was sent, in RFC 3339 format.
	public let sent_at: Timestamp?
	/// The status of the reminder. See [InvoicePaymentReminderStatus](#type-invoicepaymentreminderstatus) for possible values
	public let status: InvoicePaymentReminderStatus?
	/// A Square-assigned ID that uniquely identifies the reminder within the `InvoicePaymentRequest`.
	public let uid: String?

	/// Describes a payment request reminder (automatic notification) that Square sends to the customer. You configure a reminder relative to the payment request `due_date`.
	/// - Parameters:
	///   - message: The reminder message.
	///   - relative_scheduled_days: The number of days before (a negative number) or after (a positive number) the payment request `due_date` when the reminder is sent. For example, -3 indicates that the reminder should be sent 3 days before the payment request `due_date`.
	///   - sent_at: If sent, the timestamp when the reminder was sent, in RFC 3339 format.
	///   - status: The status of the reminder. See [InvoicePaymentReminderStatus](#type-invoicepaymentreminderstatus) for possible values
	///   - uid: A Square-assigned ID that uniquely identifies the reminder within the `InvoicePaymentRequest`.
	public init(message: String? = nil, relative_scheduled_days: Int? = nil, sent_at: Timestamp? = nil, status: InvoicePaymentReminderStatus? = nil, uid: String? = nil) {
		self.message = message
		self.relative_scheduled_days = relative_scheduled_days
		self.sent_at = sent_at
		self.status = status
		self.uid = uid
	}
}

/// The status of a payment request reminder.
public enum InvoicePaymentReminderStatus: String, Codable {
	/// The reminder is to be sent on the `relative_scheduled_date` (if the invoice is published).
	case PENDING
	/// The reminder is not applicable and is not sent. The following are examples of when reminders are not applicable and are not sent: - You schedule a reminder to be sent before the invoice is published. - The invoice is configured with multiple payment requests and a payment request reminder is configured to be sent after the next payment request `due_date`. - Two reminders (for different payment requests) are configured to be sent on the same date. Therefore, only one reminder is sent. - You configure a reminder to be sent on the date that the invoice is scheduled to be sent. - The payment request is already paid. - The invoice status is `CANCELED` or `FAILED`.
	case NOT_APPLICABLE
	/// The reminder is sent.
	case SENT
}

/// Represents a payment request for an [invoice](#type-Invoice). Invoices can specify a maximum of 13 payment requests, with up to 12 `INSTALLMENT` request types.  For more information,  see [Payment requests](/docs/invoices-api/overview#payment-requests).
public struct InvoicePaymentRequest: Codable {
	/// The payment method for an automatic payment.  The default value is `NONE`. See [InvoiceAutomaticPaymentSource](#type-invoiceautomaticpaymentsource) for possible values
	public var automatic_payment_source: InvoiceAutomaticPaymentSource?
	/// The ID of the card on file to charge for the payment request. To get the customer’s card on file, use the `customer_id` of the invoice recipient to call `RetrieveCustomer` in the Customers API. Then, get the ID of the target card from the `cards` field in the response.
	public var card_id: String?
	/// The amount of the payment request, computed using the order amount and information from the various payment request fields (`request_type`,  `fixed_amount_requested_money`, and `percentage_requested`).
	public let computed_amount_money: Money?
	/// The due date (in the invoice location's time zone) for the payment request, in `YYYY-MM-DD` format.  After this date, the invoice becomes overdue. This field is required to create a payment request.
	public var due_date: String?
	/// If the payment request specifies `DEPOSIT` or `INSTALLMENT` as the  `request_type`,  this indicates the request amount. You cannot specify this when `request_type` is `BALANCE` or when the  payment request includes the `percentage_requested` field.
	public var fixed_amount_requested_money: Money?
	/// Specifies the amount for the payment request in percentage:  - When the payment `request_type` is `DEPOSIT`, it is the percentage of the order total amount. - When the payment `request_type` is `INSTALLMENT`, it is the percentage of the order total less  the deposit, if requested. The sum of the `percentage_requested` in all installment  payment requests must be equal to 100.  You cannot specify this when the payment `request_type` is `BALANCE` or when the  payment request specifies the `fixed_amount_requested_money` field.
	public var percentage_requested: String?
	/// A list of one or more reminders to send for the payment request.
	public var reminders: [InvoicePaymentReminder]?
	/// Indicates how Square processes the payment request. DEPRECATED at version 2021-01-21. Replaced by the `Invoice.delivery_method` and `InvoicePaymentRequest.automatic_payment_source` fields.  One of the following is required when creating an invoice: - (Recommended) The `delivery_method` field of the invoice. To configure an automatic payment, the `automatic_payment_source` field of the payment request is also required. - This `request_method` field. Note that `invoice` objects returned in responses do not include `request_method`. See [InvoiceRequestMethod](#type-invoicerequestmethod) for possible values
	public var request_method: InvoiceRequestMethod?
	/// Identifies the payment request type. This type defines how the payment request amount is determined. This field is required to create a payment request. See [InvoiceRequestType](#type-invoicerequesttype) for possible values
	public var request_type: InvoiceRequestType?
	/// If the most recent payment was a cash payment  in a currency that rounds cash payments (such as, `CAD` or `AUD`) and the payment  is rounded from `computed_amount_money` in the payment request, then this  field specifies the rounding adjustment applied. This amount  might be negative.
	public let rounding_adjustment_included_money: Money?
	/// If set to true, the Square-hosted invoice page (the `public_url` field of the invoice)  provides a place for the customer to pay a tip.   This field is allowed only on the final payment request   and the payment `request_type` must be `BALANCE` or `INSTALLMENT`.
	public var tipping_enabled: Bool?
	/// The amount of money already paid for the specific payment request.  This amount might include a rounding adjustment if the most recent invoice payment  was in cash in a currency that rounds cash payments (such as, `CAD` or `AUD`).
	public let total_completed_amount_money: Money?
	/// The Square-generated ID of the payment request in an `invoice`.
	public let uid: String?

	/// Represents a payment request for an [invoice](#type-Invoice). Invoices can specify a maximum of 13 payment requests, with up to 12 `INSTALLMENT` request types.  For more information,  see [Payment requests](/docs/invoices-api/overview#payment-requests).
	/// - Parameters:
	///   - automatic_payment_source: The payment method for an automatic payment.  The default value is `NONE`. See [InvoiceAutomaticPaymentSource](#type-invoiceautomaticpaymentsource) for possible values
	///   - card_id: The ID of the card on file to charge for the payment request. To get the customer’s card on file, use the `customer_id` of the invoice recipient to call `RetrieveCustomer` in the Customers API. Then, get the ID of the target card from the `cards` field in the response.
	///   - computed_amount_money: The amount of the payment request, computed using the order amount and information from the various payment request fields (`request_type`,  `fixed_amount_requested_money`, and `percentage_requested`).
	///   - due_date: The due date (in the invoice location's time zone) for the payment request, in `YYYY-MM-DD` format.  After this date, the invoice becomes overdue. This field is required to create a payment request.
	///   - fixed_amount_requested_money: If the payment request specifies `DEPOSIT` or `INSTALLMENT` as the  `request_type`,  this indicates the request amount. You cannot specify this when `request_type` is `BALANCE` or when the  payment request includes the `percentage_requested` field.
	///   - percentage_requested: Specifies the amount for the payment request in percentage:  - When the payment `request_type` is `DEPOSIT`, it is the percentage of the order total amount. - When the payment `request_type` is `INSTALLMENT`, it is the percentage of the order total less  the deposit, if requested. The sum of the `percentage_requested` in all installment  payment requests must be equal to 100.  You cannot specify this when the payment `request_type` is `BALANCE` or when the  payment request specifies the `fixed_amount_requested_money` field.
	///   - reminders: A list of one or more reminders to send for the payment request.
	///   - request_method: Indicates how Square processes the payment request. DEPRECATED at version 2021-01-21. Replaced by the `Invoice.delivery_method` and `InvoicePaymentRequest.automatic_payment_source` fields.  One of the following is required when creating an invoice: - (Recommended) The `delivery_method` field of the invoice. To configure an automatic payment, the `automatic_payment_source` field of the payment request is also required. - This `request_method` field. Note that `invoice` objects returned in responses do not include `request_method`. See [InvoiceRequestMethod](#type-invoicerequestmethod) for possible values
	///   - request_type: Identifies the payment request type. This type defines how the payment request amount is determined. This field is required to create a payment request. See [InvoiceRequestType](#type-invoicerequesttype) for possible values
	///   - rounding_adjustment_included_money: If the most recent payment was a cash payment  in a currency that rounds cash payments (such as, `CAD` or `AUD`) and the payment  is rounded from `computed_amount_money` in the payment request, then this  field specifies the rounding adjustment applied. This amount  might be negative.
	///   - tipping_enabled: If set to true, the Square-hosted invoice page (the `public_url` field of the invoice)  provides a place for the customer to pay a tip.   This field is allowed only on the final payment request   and the payment `request_type` must be `BALANCE` or `INSTALLMENT`.
	///   - total_completed_amount_money: The amount of money already paid for the specific payment request.  This amount might include a rounding adjustment if the most recent invoice payment  was in cash in a currency that rounds cash payments (such as, `CAD` or `AUD`).
	///   - uid: The Square-generated ID of the payment request in an `invoice`.
	public init(automatic_payment_source: InvoiceAutomaticPaymentSource? = nil, card_id: String? = nil, computed_amount_money: Money? = nil, due_date: String? = nil, fixed_amount_requested_money: Money? = nil, percentage_requested: String? = nil, reminders: [InvoicePaymentReminder]? = nil, request_method: InvoiceRequestMethod? = nil, request_type: InvoiceRequestType? = nil, rounding_adjustment_included_money: Money? = nil, tipping_enabled: Bool? = nil, total_completed_amount_money: Money? = nil, uid: String? = nil) {
		self.automatic_payment_source = automatic_payment_source
		self.card_id = card_id
		self.computed_amount_money = computed_amount_money
		self.due_date = due_date
		self.fixed_amount_requested_money = fixed_amount_requested_money
		self.percentage_requested = percentage_requested
		self.reminders = reminders
		self.request_method = request_method
		self.request_type = request_type
		self.rounding_adjustment_included_money = rounding_adjustment_included_money
		self.tipping_enabled = tipping_enabled
		self.total_completed_amount_money = total_completed_amount_money
		self.uid = uid
	}
}

/// Describes query criteria for searching invoices.
public struct InvoiceQuery: Codable {
	/// Query filters to apply in  searching invoices.  For more information, see [Retrieve invoices](https://developer.squareup.com/docs/docs/invoices-api/overview#retrieve-invoices).
	public var filter: InvoiceFilter
	/// Describes the sort order for the search result.
	public var sort: InvoiceSort?

	/// Describes query criteria for searching invoices.
	/// - Parameters:
	///   - filter: Query filters to apply in  searching invoices.  For more information, see [Retrieve invoices](https://developer.squareup.com/docs/docs/invoices-api/overview#retrieve-invoices).
	///   - sort: Describes the sort order for the search result.
	public init(filter: InvoiceFilter, sort: InvoiceSort? = nil) {
		self.filter = filter
		self.sort = sort
	}
}

/// Provides customer data that Square uses to deliver an invoice.
public struct InvoiceRecipient: Codable {
	/// The recipient's physical address.
	public let address: Address?
	/// The name of the recipient's company.
	public let company_name: String?
	/// The ID of the customer. This is the customer profile ID that  you provide when creating a draft invoice.
	public var customer_id: String?
	/// The recipient's email address.
	public let email_address: String?
	/// The recipient's family (that is, last) name.
	public let family_name: String?
	/// The recipient's given (that is, first) name.
	public let given_name: String?
	/// The recipient's phone number.
	public let phone_number: String?

	/// Provides customer data that Square uses to deliver an invoice.
	/// - Parameters:
	///   - address: The recipient's physical address.
	///   - company_name: The name of the recipient's company.
	///   - customer_id: The ID of the customer. This is the customer profile ID that  you provide when creating a draft invoice.
	///   - email_address: The recipient's email address.
	///   - family_name: The recipient's family (that is, last) name.
	///   - given_name: The recipient's given (that is, first) name.
	///   - phone_number: The recipient's phone number.
	public init(address: Address? = nil, company_name: String? = nil, customer_id: String? = nil, email_address: String? = nil, family_name: String? = nil, given_name: String? = nil, phone_number: String? = nil) {
		self.address = address
		self.company_name = company_name
		self.customer_id = customer_id
		self.email_address = email_address
		self.family_name = family_name
		self.given_name = given_name
		self.phone_number = phone_number
	}
}

/// Specifies the action for Square to take for processing the invoice. For example,  email the invoice, charge a customer's card on file, or do nothing. DEPRECATED at version 2021-01-21. The corresponding `request_method` field is replaced by the `Invoice.delivery_method` and `InvoicePaymentRequest.automatic_payment_source` fields.
public enum InvoiceRequestMethod: String, Codable {
	/// Directs Square to email the invoice to the customer after the invoice is published  (either immediately or at the `scheduled_at` time, if specified in the `invoice`.
	case EMAIL
	/// Directs Square to charge the card on file on the `due_date` specified in the payment request,  after the invoice is published.
	case CHARGE_CARD_ON_FILE
	/// Directs Square to take no specific action on the invoice. In this case, the seller  (or the application developer) follows up with the customer for payment. For example,  a seller might collect a payment in the Seller Dashboard or use the Point of Sale (POS) application.  The seller might also share the URL of the Square-hosted invoice page (`public_url`) with the customer requesting payment.
	case SHARE_MANUALLY
	/// Directs Square to charge the bank account on file on the `due_date` specified in the payment request, after the invoice is published.  This payment method applies only to recurring invoices that sellers create in the Seller Dashboard or other Square first-party application. The bank account is provided by the customer during the payment flow. You  cannot set `CHARGE_BANK_ON_FILE` as a payment source using the Invoices API.
	case CHARGE_BANK_ON_FILE
}

/// Indicates the type of the payment request. An invoice supports the following payment request combinations: - 1 balance - 1 deposit with 1 balance - 2 - 12 installments - 1 deposit with 2 - 12 installments  For more information,  see [Payment requests](https://developer.squareup.com/docs/docs/invoices-api/overview#payment-requests).
public enum InvoiceRequestType: String, Codable {
	/// Identifies that the payment request is for the balance amount, after accounting for any  other payment requests in the invoice:   - If the invoice specifies only a balance payment request, it refers to the  total amount identified by the associated order.  - If the invoice also specifies a deposit request, the balance payment request refers to  the remaining amount. - `INSTALLMENT` and `BALANCE` are not allowed together.
	case BALANCE
	/// Identifies that the payment request is for a deposit. You have the option of specifying  an exact amount or a percentage of the total order amount. If you request a deposit,  it must be due before any other payment requests.
	case DEPOSIT
	/// Identifies that the payment request is for an installment. An invoice can request payments in installments.  Along with installments, you can request an optional deposit. All these payment requests must add to the total order amount.
	case INSTALLMENT
}

/// Identifies the  sort field and sort order.
public struct InvoiceSort: Codable {
	/// The field to sort on. See [InvoiceSortField](#type-invoicesortfield) for possible values
	public var field: InvoiceSortField
	/// The order to use for sorting the results. See [SortOrder](#type-sortorder) for possible values
	public var order: SortOrder?

	/// Identifies the  sort field and sort order.
	/// - Parameters:
	///   - field: The field to sort on. See [InvoiceSortField](#type-invoicesortfield) for possible values
	///   - order: The order to use for sorting the results. See [SortOrder](#type-sortorder) for possible values
	public init(field: InvoiceSortField, order: SortOrder? = nil) {
		self.field = field
		self.order = order
	}
}

/// Field to use for sorting.
public enum InvoiceSortField: String, Codable {
	/// The field works as follows:  - If the invoice is a draft, it uses the invoice `created_at` date. - If the invoice is scheduled for publication, it uses the `scheduled_at` date. - If the invoice is published, it uses the invoice publication date.
	case INVOICE_SORT_DATE
}

/// Indicates the status of an invoice.
public enum InvoiceStatus: String, Codable {
	/// The invoice is a draft. You must publish a draft invoice before Square can process it. A draft invoice has no `public_url`, so it is not available to customers.
	case DRAFT
	/// The invoice is published but not yet paid.
	case UNPAID
	/// The invoice is scheduled to be processed. On the scheduled date, Square sends the invoice, initiates an automatic payment, or takes no action, depending on the delivery method and payment request settings. Square also sets the invoice status to the appropriate state: `UNPAID`, `PAID`, `PARTIALLY_PAID`, or `PAYMENT_PENDING`.
	case SCHEDULED
	/// A partial payment is received for the invoice.
	case PARTIALLY_PAID
	/// The customer paid the invoice in full.
	case PAID
	/// The invoice is paid (or partially paid) and some but not all the amount paid is refunded.
	case PARTIALLY_REFUNDED
	/// The full amount that the customer paid for the invoice is refunded.
	case REFUNDED
	/// The invoice is canceled. Square no longer requests payments from the customer. The `public_url` page remains and is accessible, but it displays the invoice as cancelled and does not accept payment.
	case CANCELED
	/// Square canceled the invoice due to suspicious activity.
	case FAILED
	/// A payment on the invoice was initiated but has not yet been processed.  When in this state, invoices cannot be updated and other payments cannot be initiated.
	case PAYMENT_PENDING
}

/// Price and inventory alerting overrides for a `CatalogItemVariation` at a specific `Location`.
public struct ItemVariationLocationOverrides: Codable {
	/// If the inventory quantity for the variation is less than or equal to this value and `inventory_alert_type` is `LOW_QUANTITY`, the variation displays an alert in the merchant dashboard.  This value is always an integer.
	public var inventory_alert_threshold: Int?
	/// Indicates whether the `CatalogItemVariation` displays an alert when its inventory quantity is less than or equal to its `inventory_alert_threshold`. See [InventoryAlertType](#type-inventoryalerttype) for possible values
	public var inventory_alert_type: InventoryAlertType?
	/// The ID of the `Location`.
	public var location_id: String?
	/// The price of the `CatalogItemVariation` at the given `Location`, or blank for variable pricing.
	public var price_money: Money?
	/// The pricing type (fixed or variable) for the `CatalogItemVariation` at the given `Location`. See [CatalogPricingType](#type-catalogpricingtype) for possible values
	public var pricing_type: CatalogPricingType?
	/// If `true`, inventory tracking is active for the `CatalogItemVariation` at this `Location`.
	public var track_inventory: Bool?

	/// Price and inventory alerting overrides for a `CatalogItemVariation` at a specific `Location`.
	/// - Parameters:
	///   - inventory_alert_threshold: If the inventory quantity for the variation is less than or equal to this value and `inventory_alert_type` is `LOW_QUANTITY`, the variation displays an alert in the merchant dashboard.  This value is always an integer.
	///   - inventory_alert_type: Indicates whether the `CatalogItemVariation` displays an alert when its inventory quantity is less than or equal to its `inventory_alert_threshold`. See [InventoryAlertType](#type-inventoryalerttype) for possible values
	///   - location_id: The ID of the `Location`.
	///   - price_money: The price of the `CatalogItemVariation` at the given `Location`, or blank for variable pricing.
	///   - pricing_type: The pricing type (fixed or variable) for the `CatalogItemVariation` at the given `Location`. See [CatalogPricingType](#type-catalogpricingtype) for possible values
	///   - track_inventory: If `true`, inventory tracking is active for the `CatalogItemVariation` at this `Location`.
	public init(inventory_alert_threshold: Int? = nil, inventory_alert_type: InventoryAlertType? = nil, location_id: String? = nil, price_money: Money? = nil, pricing_type: CatalogPricingType? = nil, track_inventory: Bool? = nil) {
		self.inventory_alert_threshold = inventory_alert_threshold
		self.inventory_alert_type = inventory_alert_type
		self.location_id = location_id
		self.price_money = price_money
		self.pricing_type = pricing_type
		self.track_inventory = track_inventory
	}
}

/// An object describing a job that a team member is assigned to.
public struct JobAssignment: Codable {
	/// The total pay amount for a 12 month period on the job. Set if the job `PayType` is `SALARY`.
	public var annual_rate: Money?
	/// The hourly pay rate of the job.
	public var hourly_rate: Money?
	/// The title of the job.
	public var job_title: String
	/// The current pay type for the job assignment used to calculate the pay amount in a pay period. See [JobAssignmentPayType](#type-jobassignmentpaytype) for possible values
	public var pay_type: JobAssignmentPayType
	/// The planned hours per week for the job. Set if the job `PayType` is `SALARY`.
	public var weekly_hours: Int?

	/// An object describing a job that a team member is assigned to.
	/// - Parameters:
	///   - annual_rate: The total pay amount for a 12 month period on the job. Set if the job `PayType` is `SALARY`.
	///   - hourly_rate: The hourly pay rate of the job.
	///   - job_title: The title of the job.
	///   - pay_type: The current pay type for the job assignment used to calculate the pay amount in a pay period. See [JobAssignmentPayType](#type-jobassignmentpaytype) for possible values
	///   - weekly_hours: The planned hours per week for the job. Set if the job `PayType` is `SALARY`.
	public init(job_title: String, pay_type: JobAssignmentPayType, annual_rate: Money? = nil, hourly_rate: Money? = nil, weekly_hours: Int? = nil) {
		self.job_title = job_title
		self.pay_type = pay_type
		self.annual_rate = annual_rate
		self.hourly_rate = hourly_rate
		self.weekly_hours = weekly_hours
	}
}

/// Enumerates the possible pay types that a job can be assigned.
public enum JobAssignmentPayType: String, Codable {
	/// The job does not have a defined pay type.
	case NONE
	/// The job pays on an hourly basis.
	case HOURLY
	/// The job pays an annual salary.
	case SALARY
}

/// Request object for fetching all `BankAccount` objects linked to a account.
public struct ListBankAccountsRequest: Codable {
	/// The pagination cursor returned by a previous call to this endpoint. Use it in the next `ListBankAccounts` request to retrieve the next set  of results.  See the [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination) guide for more information.
	public var cursor: String?
	/// Upper limit on the number of bank accounts to return in the response.  Currently, 1000 is the largest supported limit. You can specify a limit  of up to 1000 bank accounts. This is also the default limit.
	public var limit: Int?
	/// Location ID. You can specify this optional filter  to retrieve only the linked bank accounts belonging to a specific location.
	public var location_id: String?

	/// Request object for fetching all `BankAccount` objects linked to a account.
	/// - Parameters:
	///   - cursor: The pagination cursor returned by a previous call to this endpoint. Use it in the next `ListBankAccounts` request to retrieve the next set  of results.  See the [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination) guide for more information.
	///   - limit: Upper limit on the number of bank accounts to return in the response.  Currently, 1000 is the largest supported limit. You can specify a limit  of up to 1000 bank accounts. This is also the default limit.
	///   - location_id: Location ID. You can specify this optional filter  to retrieve only the linked bank accounts belonging to a specific location.
	public init(cursor: String? = nil, limit: Int? = nil, location_id: String? = nil) {
		self.cursor = cursor
		self.limit = limit
		self.location_id = location_id
	}
}

/// Response object returned by ListBankAccounts.
public struct ListBankAccountsResponse: Codable {
	/// List of BankAccounts associated with this account.
	public var bank_accounts: [BankAccount]?
	/// When a response is truncated, it includes a cursor that you can  use in a subsequent request to fetch next set of bank accounts. If empty, this is the final response.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	public var cursor: String?
	/// Information on errors encountered during the request.
	public var errors: [SquareError]?

	/// Response object returned by ListBankAccounts.
	/// - Parameters:
	///   - bank_accounts: List of BankAccounts associated with this account.
	///   - cursor: When a response is truncated, it includes a cursor that you can  use in a subsequent request to fetch next set of bank accounts. If empty, this is the final response.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	///   - errors: Information on errors encountered during the request.
	public init(bank_accounts: [BankAccount]? = nil, cursor: String? = nil, errors: [SquareError]? = nil) {
		self.bank_accounts = bank_accounts
		self.cursor = cursor
		self.errors = errors
	}
}

/// A request for a filtered set of `BreakType` objects
public struct ListBreakTypesRequest: Codable {
	/// Pointer to the next page of Break Type results to fetch.
	public var cursor: String?
	/// Maximum number of Break Types to return per page. Can range between 1 and 200. The default is the maximum at 200.
	public var limit: Int?
	/// Filter Break Types returned to only those that are associated with the specified location.
	public var location_id: String?

	/// A request for a filtered set of `BreakType` objects
	/// - Parameters:
	///   - cursor: Pointer to the next page of Break Type results to fetch.
	///   - limit: Maximum number of Break Types to return per page. Can range between 1 and 200. The default is the maximum at 200.
	///   - location_id: Filter Break Types returned to only those that are associated with the specified location.
	public init(cursor: String? = nil, limit: Int? = nil, location_id: String? = nil) {
		self.cursor = cursor
		self.limit = limit
		self.location_id = location_id
	}
}

/// The response to a request for a set of `BreakTypes`. Contains the requested `BreakType` objects. May contain a set of `Error` objects if the request resulted in errors.
public struct ListBreakTypesResponse: Codable {
	///  A page of `BreakType` results.
	public var break_types: [BreakType]?
	/// Value supplied in the subsequent request to fetch the next next page of Break Type results.
	public var cursor: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// The response to a request for a set of `BreakTypes`. Contains the requested `BreakType` objects. May contain a set of `Error` objects if the request resulted in errors.
	/// - Parameters:
	///   - break_types:  A page of `BreakType` results.
	///   - cursor: Value supplied in the subsequent request to fetch the next next page of Break Type results.
	///   - errors: Any errors that occurred during the request.
	public init(break_types: [BreakType]? = nil, cursor: String? = nil, errors: [SquareError]? = nil) {
		self.break_types = break_types
		self.cursor = cursor
		self.errors = errors
	}
}

public struct ListCashDrawerShiftEventsRequest: Codable {
	/// Opaque cursor for fetching the next page of results.
	public var cursor: String?
	/// Number of resources to be returned in a page of results (200 by default, 1000 max).
	public var limit: Int?
	/// The ID of the location to list cash drawer shifts for.
	public var location_id: String

	public init(location_id: String, cursor: String? = nil, limit: Int? = nil) {
		self.location_id = location_id
		self.cursor = cursor
		self.limit = limit
	}
}

public struct ListCashDrawerShiftEventsResponse: Codable {
	/// Opaque cursor for fetching the next page. Cursor is not present in the last page of results.
	public var cursor: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// All of the events (payments, refunds, etc.) for a cash drawer during the shift.
	public var events: [CashDrawerShiftEvent]?

	public init(cursor: String? = nil, errors: [SquareError]? = nil, events: [CashDrawerShiftEvent]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.events = events
	}
}

public struct ListCashDrawerShiftsRequest: Codable {
	/// The inclusive start time of the query on opened_at, in ISO 8601 format.
	public var begin_time: String?
	/// Opaque cursor for fetching the next page of results.
	public var cursor: String?
	/// The exclusive end date of the query on opened_at, in ISO 8601 format.
	public var end_time: String?
	/// Number of cash drawer shift events in a page of results (200 by default, 1000 max).
	public var limit: Int?
	/// The ID of the location to query for a list of cash drawer shifts.
	public var location_id: String
	/// The order in which cash drawer shifts are listed in the response, based on their opened_at field. Default value: ASC See [SortOrder](#type-sortorder) for possible values
	public var sort_order: SortOrder?

	public init(location_id: String, begin_time: String? = nil, cursor: String? = nil, end_time: String? = nil, limit: Int? = nil, sort_order: SortOrder? = nil) {
		self.location_id = location_id
		self.begin_time = begin_time
		self.cursor = cursor
		self.end_time = end_time
		self.limit = limit
		self.sort_order = sort_order
	}
}

public struct ListCashDrawerShiftsResponse: Codable {
	/// Opaque cursor for fetching the next page of results. Cursor is not present in the last page of results.
	public var cursor: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// A collection of CashDrawerShiftSummary objects for shifts that match the query.
	public var items: [CashDrawerShiftSummary]?

	public init(cursor: String? = nil, errors: [SquareError]? = nil, items: [CashDrawerShiftSummary]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.items = items
	}
}

public struct ListCatalogRequest: Codable {
	/// The specific version of the catalog objects to be included in the response.  This allows you to retrieve historical versions of objects. The specified version value is matched against the `CatalogObject`s' `version` attribute.
	public var catalog_version: Int?
	/// The pagination cursor returned in the previous response. Leave unset for an initial request. See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
	public var cursor: String?
	/// An optional case-insensitive, comma-separated list of object types to retrieve, for example `ITEM,ITEM_VARIATION,CATEGORY,IMAGE`.  The legal values are taken from the CatalogObjectType enum: `ITEM`, `ITEM_VARIATION`, `CATEGORY`, `DISCOUNT`, `TAX`, `MODIFIER`, `MODIFIER_LIST`, or `IMAGE`.
	public var types: String?

	public init(catalog_version: Int? = nil, cursor: String? = nil, types: String? = nil) {
		self.catalog_version = catalog_version
		self.cursor = cursor
		self.types = types
	}
}

public struct ListCatalogResponse: Codable {
	/// The pagination cursor to be used in a subsequent request. If unset, this is the final response. See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
	public var cursor: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The CatalogObjects returned.
	public var objects: [CatalogObject]?

	public init(cursor: String? = nil, errors: [SquareError]? = nil, objects: [CatalogObject]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.objects = objects
	}
}

/// Defines the query parameters that can be provided in a request to the [ListCustomerGroups](#endpoint-listcustomergroups) endpoint.
public struct ListCustomerGroupsRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query.  See the [Pagination guide](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
	public var cursor: String?

	/// Defines the query parameters that can be provided in a request to the [ListCustomerGroups](#endpoint-listcustomergroups) endpoint.
	/// - Parameters:
	///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query.  See the [Pagination guide](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
	public init(cursor: String? = nil) {
		self.cursor = cursor
	}
}

/// Defines the fields that are included in the response body of a request to the [ListCustomerGroups](#endpoint-listcustomergroups) endpoint.  One of `errors` or `groups` is present in a given response (never both).
public struct ListCustomerGroupsResponse: Codable {
	/// A pagination cursor to retrieve the next set of results for your original query to the endpoint. This value is present only if the request succeeded and additional results are available.  See the [Pagination guide](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
	public var cursor: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// A list of customer groups belonging to the current merchant.
	public var groups: [CustomerGroup]?

	/// Defines the fields that are included in the response body of a request to the [ListCustomerGroups](#endpoint-listcustomergroups) endpoint.  One of `errors` or `groups` is present in a given response (never both).
	/// - Parameters:
	///   - cursor: A pagination cursor to retrieve the next set of results for your original query to the endpoint. This value is present only if the request succeeded and additional results are available.  See the [Pagination guide](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
	///   - errors: Any errors that occurred during the request.
	///   - groups: A list of customer groups belonging to the current merchant.
	public init(cursor: String? = nil, errors: [SquareError]? = nil, groups: [CustomerGroup]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.groups = groups
	}
}

/// Defines the valid parameters for requests to __ListCustomerSegments__.
public struct ListCustomerSegmentsRequest: Codable {
	/// A pagination cursor returned by previous calls to __ListCustomerSegments__. Used to retrieve the next set of query results.  See the [Pagination guide](https://developer.squareup.com/docs/docs/working-with-apis/pagination) for more information.
	public var cursor: String?

	/// Defines the valid parameters for requests to __ListCustomerSegments__.
	/// - Parameters:
	///   - cursor: A pagination cursor returned by previous calls to __ListCustomerSegments__. Used to retrieve the next set of query results.  See the [Pagination guide](https://developer.squareup.com/docs/docs/working-with-apis/pagination) for more information.
	public init(cursor: String? = nil) {
		self.cursor = cursor
	}
}

/// Defines the fields included in the response body for requests to __ListCustomerSegments__.  One of `errors` or `segments` is present in a given response (never both).
public struct ListCustomerSegmentsResponse: Codable {
	/// A pagination cursor to be used in subsequent calls to __ListCustomerSegments__ to retrieve the next set of query results. Only present only if the request succeeded and additional results are available.  See the [Pagination guide](https://developer.squareup.com/docs/docs/working-with-apis/pagination) for more information.
	public var cursor: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The list of customer segments belonging to the associated Square account.
	public var segments: [CustomerSegment]?

	/// Defines the fields included in the response body for requests to __ListCustomerSegments__.  One of `errors` or `segments` is present in a given response (never both).
	/// - Parameters:
	///   - cursor: A pagination cursor to be used in subsequent calls to __ListCustomerSegments__ to retrieve the next set of query results. Only present only if the request succeeded and additional results are available.  See the [Pagination guide](https://developer.squareup.com/docs/docs/working-with-apis/pagination) for more information.
	///   - errors: Any errors that occurred during the request.
	///   - segments: The list of customer segments belonging to the associated Square account.
	public init(cursor: String? = nil, errors: [SquareError]? = nil, segments: [CustomerSegment]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.segments = segments
	}
}

/// Defines the query parameters that can be provided in a request to the ListCustomers endpoint.
public struct ListCustomersRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query.  See the [Pagination guide](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
	public var cursor: String?
	/// Indicates how Customers should be sorted.  Default: `DEFAULT`. See [CustomerSortField](#type-customersortfield) for possible values
	public var sort_field: CustomerSortField?
	/// Indicates whether Customers should be sorted in ascending (`ASC`) or descending (`DESC`) order.  Default: `ASC`. See [SortOrder](#type-sortorder) for possible values
	public var sort_order: SortOrder?

	/// Defines the query parameters that can be provided in a request to the ListCustomers endpoint.
	/// - Parameters:
	///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query.  See the [Pagination guide](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
	///   - sort_field: Indicates how Customers should be sorted.  Default: `DEFAULT`. See [CustomerSortField](#type-customersortfield) for possible values
	///   - sort_order: Indicates whether Customers should be sorted in ascending (`ASC`) or descending (`DESC`) order.  Default: `ASC`. See [SortOrder](#type-sortorder) for possible values
	public init(cursor: String? = nil, sort_field: CustomerSortField? = nil, sort_order: SortOrder? = nil) {
		self.cursor = cursor
		self.sort_field = sort_field
		self.sort_order = sort_order
	}
}

/// Defines the fields that are included in the response body of a request to the ListCustomers endpoint.  One of `errors` or `customers` is present in a given response (never both).
public struct ListCustomersResponse: Codable {
	/// A pagination cursor to retrieve the next set of results for the original query. Only present if the request succeeded and additional results are available.  See the [Pagination guide](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
	public var cursor: String?
	/// An array of `Customer` objects that match the provided query.
	public var customers: [Customer]?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// Defines the fields that are included in the response body of a request to the ListCustomers endpoint.  One of `errors` or `customers` is present in a given response (never both).
	/// - Parameters:
	///   - cursor: A pagination cursor to retrieve the next set of results for the original query. Only present if the request succeeded and additional results are available.  See the [Pagination guide](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
	///   - customers: An array of `Customer` objects that match the provided query.
	///   - errors: Any errors that occurred during the request.
	public init(cursor: String? = nil, customers: [Customer]? = nil, errors: [SquareError]? = nil) {
		self.cursor = cursor
		self.customers = customers
		self.errors = errors
	}
}

public struct ListDeviceCodesRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query.  See [Paginating results](#paginatingresults) for more information.
	public var cursor: String?
	/// If specified, only returns DeviceCodes of the specified location. Returns DeviceCodes of all locations if empty.
	public var location_id: String?
	/// If specified, only returns DeviceCodes targeting the specified product type. Returns DeviceCodes of all product types if empty. See [ProductType](#type-producttype) for possible values
	public var product_type: ProductType?
	/// If specified, returns DeviceCodes with the specified statuses. Returns DeviceCodes of status `PAIRED` and `UNPAIRED` if empty. See [DeviceCodeStatus](#type-devicecodestatus) for possible values
	public var status: DeviceCodeStatus?

	public init(cursor: String? = nil, location_id: String? = nil, product_type: ProductType? = nil, status: DeviceCodeStatus? = nil) {
		self.cursor = cursor
		self.location_id = location_id
		self.product_type = product_type
		self.status = status
	}
}

public struct ListDeviceCodesResponse: Codable {
	/// A pagination cursor to retrieve the next set of results for your original query to the endpoint. This value is present only if the request succeeded and additional results are available.  See [Paginating results](#paginatingresults) for more information.
	public var cursor: String?
	/// The queried DeviceCode.
	public var device_codes: [DeviceCode]?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(cursor: String? = nil, device_codes: [DeviceCode]? = nil, errors: [SquareError]? = nil) {
		self.cursor = cursor
		self.device_codes = device_codes
		self.errors = errors
	}
}

/// Defines the parameters for a `ListDisputeEvidence` request.
public struct ListDisputeEvidenceRequest: Codable {

	/// Defines the parameters for a `ListDisputeEvidence` request.
	public init() {
	}
}

/// Defines the fields in a `ListDisputeEvidence` response.
public struct ListDisputeEvidenceResponse: Codable {
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The list of evidence previously uploaded to the specified dispute.
	public var evidence: [DisputeEvidence]?

	/// Defines the fields in a `ListDisputeEvidence` response.
	/// - Parameters:
	///   - errors: Information about errors encountered during the request.
	///   - evidence: The list of evidence previously uploaded to the specified dispute.
	public init(errors: [SquareError]? = nil, evidence: [DisputeEvidence]? = nil) {
		self.errors = errors
		self.evidence = evidence
	}
}

/// Defines the request parameters for the `ListDisputes` endpoint.
public struct ListDisputesRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query. For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
	public var cursor: String?
	/// The ID of the location for which to return a list of disputes. If not specified, the endpoint returns all open disputes (the dispute status is not `INQUIRY_CLOSED`, `WON`, or `LOST`) associated with all locations.
	public var location_id: String?
	/// The dispute states to filter the result. If not specified, the endpoint returns all open disputes (the dispute status is not `INQUIRY_CLOSED`, `WON`, or `LOST`). See [DisputeState](#type-disputestate) for possible values
	public var states: DisputeState?

	/// Defines the request parameters for the `ListDisputes` endpoint.
	/// - Parameters:
	///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query. For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
	///   - location_id: The ID of the location for which to return a list of disputes. If not specified, the endpoint returns all open disputes (the dispute status is not `INQUIRY_CLOSED`, `WON`, or `LOST`) associated with all locations.
	///   - states: The dispute states to filter the result. If not specified, the endpoint returns all open disputes (the dispute status is not `INQUIRY_CLOSED`, `WON`, or `LOST`). See [DisputeState](#type-disputestate) for possible values
	public init(cursor: String? = nil, location_id: String? = nil, states: DisputeState? = nil) {
		self.cursor = cursor
		self.location_id = location_id
		self.states = states
	}
}

/// Defines fields in a `ListDisputes` response.
public struct ListDisputesResponse: Codable {
	/// The pagination cursor to be used in a subsequent request. If unset, this is the final response. For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
	public var cursor: String?
	/// The list of disputes.
	public var disputes: [Dispute]?
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?

	/// Defines fields in a `ListDisputes` response.
	/// - Parameters:
	///   - cursor: The pagination cursor to be used in a subsequent request. If unset, this is the final response. For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
	///   - disputes: The list of disputes.
	///   - errors: Information about errors encountered during the request.
	public init(cursor: String? = nil, disputes: [Dispute]? = nil, errors: [SquareError]? = nil) {
		self.cursor = cursor
		self.disputes = disputes
		self.errors = errors
	}
}

/// A request for a set of `EmployeeWage` objects
public struct ListEmployeeWagesRequest: Codable {
	/// Pointer to the next page of Employee Wage results to fetch.
	public var cursor: String?
	/// Filter wages returned to only those that are associated with the specified employee.
	public var employee_id: String?
	/// Maximum number of Employee Wages to return per page. Can range between 1 and 200. The default is the maximum at 200.
	public var limit: Int?

	/// A request for a set of `EmployeeWage` objects
	/// - Parameters:
	///   - cursor: Pointer to the next page of Employee Wage results to fetch.
	///   - employee_id: Filter wages returned to only those that are associated with the specified employee.
	///   - limit: Maximum number of Employee Wages to return per page. Can range between 1 and 200. The default is the maximum at 200.
	public init(cursor: String? = nil, employee_id: String? = nil, limit: Int? = nil) {
		self.cursor = cursor
		self.employee_id = employee_id
		self.limit = limit
	}
}

/// The response to a request for a set of `EmployeeWage` objects. Contains  a set of `EmployeeWage`.
public struct ListEmployeeWagesResponse: Codable {
	/// Value supplied in the subsequent request to fetch the next next page of Employee Wage results.
	public var cursor: String?
	/// A page of Employee Wage results.
	public var employee_wages: [EmployeeWage]?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// The response to a request for a set of `EmployeeWage` objects. Contains  a set of `EmployeeWage`.
	/// - Parameters:
	///   - cursor: Value supplied in the subsequent request to fetch the next next page of Employee Wage results.
	///   - employee_wages: A page of Employee Wage results.
	///   - errors: Any errors that occurred during the request.
	public init(cursor: String? = nil, employee_wages: [EmployeeWage]? = nil, errors: [SquareError]? = nil) {
		self.cursor = cursor
		self.employee_wages = employee_wages
		self.errors = errors
	}
}

public struct ListEmployeesRequest: Codable {
	/// The token required to retrieve the specified page of results.
	public var cursor: String?
	/// The number of employees to be returned on each page.
	public var limit: Int?
	public var location_id: String?
	/// Specifies the EmployeeStatus to filter the employee by. See [EmployeeStatus](#type-employeestatus) for possible values
	public var status: EmployeeStatus?

	public init(cursor: String? = nil, limit: Int? = nil, location_id: String? = nil, status: EmployeeStatus? = nil) {
		self.cursor = cursor
		self.limit = limit
		self.location_id = location_id
		self.status = status
	}
}

public struct ListEmployeesResponse: Codable {
	/// The token to be used to retrieve the next page of results.
	public var cursor: String?
	public var employees: [Employee]?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(cursor: String? = nil, employees: [Employee]? = nil, errors: [SquareError]? = nil) {
		self.cursor = cursor
		self.employees = employees
		self.errors = errors
	}
}

/// Describes a `ListInvoice` request.
public struct ListInvoicesRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint.  Provide this cursor to retrieve the next set of results for your original query.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	public var cursor: String?
	/// The maximum number of invoices to return (200 is the maximum `limit`).  If not provided, the server  uses a default limit of 100 invoices.
	public var limit: Int?
	/// The ID of the location for which to list invoices.
	public var location_id: String

	/// Describes a `ListInvoice` request.
	/// - Parameters:
	///   - cursor: A pagination cursor returned by a previous call to this endpoint.  Provide this cursor to retrieve the next set of results for your original query.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	///   - limit: The maximum number of invoices to return (200 is the maximum `limit`).  If not provided, the server  uses a default limit of 100 invoices.
	///   - location_id: The ID of the location for which to list invoices.
	public init(location_id: String, cursor: String? = nil, limit: Int? = nil) {
		self.location_id = location_id
		self.cursor = cursor
		self.limit = limit
	}
}

/// Describes a `ListInvoice` response.
public struct ListInvoicesResponse: Codable {
	/// When a response is truncated, it includes a cursor that you can use in a  subsequent request to fetch the next set of invoices. If empty, this is the final  response.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	public var cursor: String?
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The invoices retrieved.
	public var invoices: [Invoice]?

	/// Describes a `ListInvoice` response.
	/// - Parameters:
	///   - cursor: When a response is truncated, it includes a cursor that you can use in a  subsequent request to fetch the next set of invoices. If empty, this is the final  response.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	///   - errors: Information about errors encountered during the request.
	///   - invoices: The invoices retrieved.
	public init(cursor: String? = nil, errors: [SquareError]? = nil, invoices: [Invoice]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.invoices = invoices
	}
}

/// Defines the fields that are included in requests to the __ListLocations__ endpoint.
public struct ListLocationsRequest: Codable {

	/// Defines the fields that are included in requests to the __ListLocations__ endpoint.
	public init() {
	}
}

/// Defines the fields that are included in the response body of a request to the __ListLocations__ endpoint.  One of `errors` or `locations` is present in a given response (never both).
public struct ListLocationsResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The business locations.
	public var locations: [Location]?

	/// Defines the fields that are included in the response body of a request to the __ListLocations__ endpoint.  One of `errors` or `locations` is present in a given response (never both).
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - locations: The business locations.
	public init(errors: [SquareError]? = nil, locations: [Location]? = nil) {
		self.errors = errors
		self.locations = locations
	}
}

/// A request to list `LoyaltyProgram`.
public struct ListLoyaltyProgramsRequest: Codable {

	/// A request to list `LoyaltyProgram`.
	public init() {
	}
}

/// A response that contains all loyalty programs.
public struct ListLoyaltyProgramsResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// A list of `LoyaltyProgram` for the merchant.
	public var programs: [LoyaltyProgram]?

	/// A response that contains all loyalty programs.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - programs: A list of `LoyaltyProgram` for the merchant.
	public init(errors: [SquareError]? = nil, programs: [LoyaltyProgram]? = nil) {
		self.errors = errors
		self.programs = programs
	}
}

/// Request object for the [ListMerchant](#endpoint-listmerchant) endpoint.
public struct ListMerchantsRequest: Codable {
	/// The cursor generated by the previous response.
	public var cursor: Int?

	/// Request object for the [ListMerchant](#endpoint-listmerchant) endpoint.
	/// - Parameters:
	///   - cursor: The cursor generated by the previous response.
	public init(cursor: Int? = nil) {
		self.cursor = cursor
	}
}

/// The response object returned by the [ListMerchant](#endpoint-listmerchant) endpoint.
public struct ListMerchantsResponse: Codable {
	/// If the  response is truncated, the cursor to use in next  request to fetch next set of objects.
	public var cursor: Int?
	/// Information on errors encountered during the request.
	public var errors: [SquareError]?
	/// The requested `Merchant` entities.
	public var merchant: [Merchant]?

	/// The response object returned by the [ListMerchant](#endpoint-listmerchant) endpoint.
	/// - Parameters:
	///   - cursor: If the  response is truncated, the cursor to use in next  request to fetch next set of objects.
	///   - errors: Information on errors encountered during the request.
	///   - merchant: The requested `Merchant` entities.
	public init(cursor: Int? = nil, errors: [SquareError]? = nil, merchant: [Merchant]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.merchant = merchant
	}
}

/// Retrieves a list of refunds for the account making the request.  The maximum results per page is 100.
public struct ListPaymentRefundsRequest: Codable {
	/// The timestamp for the beginning of the requested reporting period, in RFC 3339 format.  Default: The current time minus one year.
	public var begin_time: Timestamp?
	/// A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query.  For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
	public var cursor: String?
	/// The timestamp for the end of the requested reporting period, in RFC 3339 format.  Default: The current time.
	public var end_time: Timestamp?
	/// The maximum number of results to be returned in a single page.  It is possible to receive fewer results than the specified limit on a given page.  If the supplied value is greater than 100, no more than 100 results are returned.  Default: 100
	public var limit: Int?
	/// Limit results to the location supplied. By default, results are returned for all locations associated with the seller.
	public var location_id: String?
	/// The order in which results are listed: - `ASC` - Oldest to newest. - `DESC` - Newest to oldest (default).
	public var sort_order: String?
	/// If provided, only refunds with the given source type are returned. - `CARD` - List refunds only for payments where `CARD` was specified as the payment source.  Default: If omitted, refunds are returned regardless of the source type.
	public var source_type: String?
	/// If provided, only refunds with the given status are returned. For a list of refund status values, see `PaymentRefund`.  Default: If omitted, refunds are returned regardless of their status.
	public var status: String?

	/// Retrieves a list of refunds for the account making the request.  The maximum results per page is 100.
	/// - Parameters:
	///   - begin_time: The timestamp for the beginning of the requested reporting period, in RFC 3339 format.  Default: The current time minus one year.
	///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query.  For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
	///   - end_time: The timestamp for the end of the requested reporting period, in RFC 3339 format.  Default: The current time.
	///   - limit: The maximum number of results to be returned in a single page.  It is possible to receive fewer results than the specified limit on a given page.  If the supplied value is greater than 100, no more than 100 results are returned.  Default: 100
	///   - location_id: Limit results to the location supplied. By default, results are returned for all locations associated with the seller.
	///   - sort_order: The order in which results are listed: - `ASC` - Oldest to newest. - `DESC` - Newest to oldest (default).
	///   - source_type: If provided, only refunds with the given source type are returned. - `CARD` - List refunds only for payments where `CARD` was specified as the payment source.  Default: If omitted, refunds are returned regardless of the source type.
	///   - status: If provided, only refunds with the given status are returned. For a list of refund status values, see `PaymentRefund`.  Default: If omitted, refunds are returned regardless of their status.
	public init(begin_time: Timestamp? = nil, cursor: String? = nil, end_time: Timestamp? = nil, limit: Int? = nil, location_id: String? = nil, sort_order: String? = nil, source_type: String? = nil, status: String? = nil) {
		self.begin_time = begin_time
		self.cursor = cursor
		self.end_time = end_time
		self.limit = limit
		self.location_id = location_id
		self.sort_order = sort_order
		self.source_type = source_type
		self.status = status
	}
}

/// Defines the fields that are included in the response body of a request to the [ListPaymentRefunds](#endpoint-refunds-listpaymentrefunds) endpoint.  Either `errors` or `refunds` is present in a given response (never both).
public struct ListPaymentRefundsResponse: Codable {
	/// The pagination cursor to be used in a subsequent request. If empty, this is the final response.  For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
	public var cursor: String?
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The list of requested refunds.
	public var refunds: [PaymentRefund]?

	/// Defines the fields that are included in the response body of a request to the [ListPaymentRefunds](#endpoint-refunds-listpaymentrefunds) endpoint.  Either `errors` or `refunds` is present in a given response (never both).
	/// - Parameters:
	///   - cursor: The pagination cursor to be used in a subsequent request. If empty, this is the final response.  For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
	///   - errors: Information about errors encountered during the request.
	///   - refunds: The list of requested refunds.
	public init(cursor: String? = nil, errors: [SquareError]? = nil, refunds: [PaymentRefund]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.refunds = refunds
	}
}

/// Retrieves a list of payments taken by the account making the request.  The maximum results per page is 100.
public struct ListPaymentsRequest: Codable {
	/// The timestamp for the beginning of the reporting period, in RFC 3339 format. Inclusive. Default: The current time minus one year.
	public var begin_time: Timestamp?
	/// The brand of the payment card (for example, VISA).
	public var card_brand: String?
	/// A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query.  For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
	public var cursor: String?
	/// The timestamp for the end of the reporting period, in RFC 3339 format.  Default: The current time.
	public var end_time: Timestamp?
	/// The last four digits of a payment card.
	public var last_4: String?
	/// The maximum number of results to be returned in a single page. It is possible to receive fewer results than the specified limit on a given page.  The default value of 100 is also the maximum allowed value. If the provided value is  greater than 100, it is ignored and the default value is used instead.  Default: `100`
	public var limit: Int?
	/// Limit results to the location supplied. By default, results are returned for the default (main) location associated with the seller.
	public var location_id: String?
	/// The order in which results are listed: - `ASC` - Oldest to newest. - `DESC` - Newest to oldest (default).
	public var sort_order: String?
	/// The exact amount in the `total_money` for a payment.
	public var total: Int?

	/// Retrieves a list of payments taken by the account making the request.  The maximum results per page is 100.
	/// - Parameters:
	///   - begin_time: The timestamp for the beginning of the reporting period, in RFC 3339 format. Inclusive. Default: The current time minus one year.
	///   - card_brand: The brand of the payment card (for example, VISA).
	///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query.  For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
	///   - end_time: The timestamp for the end of the reporting period, in RFC 3339 format.  Default: The current time.
	///   - last_4: The last four digits of a payment card.
	///   - limit: The maximum number of results to be returned in a single page. It is possible to receive fewer results than the specified limit on a given page.  The default value of 100 is also the maximum allowed value. If the provided value is  greater than 100, it is ignored and the default value is used instead.  Default: `100`
	///   - location_id: Limit results to the location supplied. By default, results are returned for the default (main) location associated with the seller.
	///   - sort_order: The order in which results are listed: - `ASC` - Oldest to newest. - `DESC` - Newest to oldest (default).
	///   - total: The exact amount in the `total_money` for a payment.
	public init(begin_time: Timestamp? = nil, card_brand: String? = nil, cursor: String? = nil, end_time: Timestamp? = nil, last_4: String? = nil, limit: Int? = nil, location_id: String? = nil, sort_order: String? = nil, total: Int? = nil) {
		self.begin_time = begin_time
		self.card_brand = card_brand
		self.cursor = cursor
		self.end_time = end_time
		self.last_4 = last_4
		self.limit = limit
		self.location_id = location_id
		self.sort_order = sort_order
		self.total = total
	}
}

/// Defines the fields that are included in the response body of a request to the [ListPayments](#endpoint-payments-listpayments) endpoint.
public struct ListPaymentsResponse: Codable {
	/// The pagination cursor to be used in a subsequent request. If empty, this is the final response.  For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
	public var cursor: String?
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The requested list of payments.
	public var payments: [Payment]?

	/// Defines the fields that are included in the response body of a request to the [ListPayments](#endpoint-payments-listpayments) endpoint.
	/// - Parameters:
	///   - cursor: The pagination cursor to be used in a subsequent request. If empty, this is the final response.  For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
	///   - errors: Information about errors encountered during the request.
	///   - payments: The requested list of payments.
	public init(cursor: String? = nil, errors: [SquareError]? = nil, payments: [Payment]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.payments = payments
	}
}

/// Defines the query parameters that can be included in a request to the [ListRefunds](#endpoint-listrefunds) endpoint.  Deprecated - recommend using [SearchOrders](#endpoint-orders-searchorders)
public struct ListRefundsRequest: Codable {
	/// The beginning of the requested reporting period, in RFC 3339 format.  See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.  Default value: The current time minus one year.
	public var begin_time: Timestamp?
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query.  See [Paginating results](#paginatingresults) for more information.
	public var cursor: String?
	/// The end of the requested reporting period, in RFC 3339 format.  See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.  Default value: The current time.
	public var end_time: Timestamp?
	/// The order in which results are listed in the response (`ASC` for oldest first, `DESC` for newest first).  Default value: `DESC` See [SortOrder](#type-sortorder) for possible values
	public var sort_order: SortOrder?

	/// Defines the query parameters that can be included in a request to the [ListRefunds](#endpoint-listrefunds) endpoint.  Deprecated - recommend using [SearchOrders](#endpoint-orders-searchorders)
	/// - Parameters:
	///   - begin_time: The beginning of the requested reporting period, in RFC 3339 format.  See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.  Default value: The current time minus one year.
	///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query.  See [Paginating results](#paginatingresults) for more information.
	///   - end_time: The end of the requested reporting period, in RFC 3339 format.  See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.  Default value: The current time.
	///   - sort_order: The order in which results are listed in the response (`ASC` for oldest first, `DESC` for newest first).  Default value: `DESC` See [SortOrder](#type-sortorder) for possible values
	public init(begin_time: Timestamp? = nil, cursor: String? = nil, end_time: Timestamp? = nil, sort_order: SortOrder? = nil) {
		self.begin_time = begin_time
		self.cursor = cursor
		self.end_time = end_time
		self.sort_order = sort_order
	}
}

/// Defines the fields that are included in the response body of a request to the [ListRefunds](#endpoint-listrefunds) endpoint.  One of `errors` or `refunds` is present in a given response (never both).
public struct ListRefundsResponse: Codable {
	/// A pagination cursor for retrieving the next set of results, if any remain. Provide this value as the `cursor` parameter in a subsequent request to this endpoint.  See [Paginating results](#paginatingresults) for more information.
	public var cursor: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// An array of refunds that match your query.
	public var refunds: [Refund]?

	/// Defines the fields that are included in the response body of a request to the [ListRefunds](#endpoint-listrefunds) endpoint.  One of `errors` or `refunds` is present in a given response (never both).
	/// - Parameters:
	///   - cursor: A pagination cursor for retrieving the next set of results, if any remain. Provide this value as the `cursor` parameter in a subsequent request to this endpoint.  See [Paginating results](#paginatingresults) for more information.
	///   - errors: Any errors that occurred during the request.
	///   - refunds: An array of refunds that match your query.
	public init(cursor: String? = nil, errors: [SquareError]? = nil, refunds: [Refund]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.refunds = refunds
	}
}

/// Defines parameters in a  [ListSubscriptionEvents](#endpoint-subscriptions-listsubscriptionevents) endpoint request.
public struct ListSubscriptionEventsRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	public var cursor: String?
	/// The upper limit on the number of subscription events to return  in the response.   Default: `200`
	public var limit: Int?

	/// Defines parameters in a  [ListSubscriptionEvents](#endpoint-subscriptions-listsubscriptionevents) endpoint request.
	/// - Parameters:
	///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	///   - limit: The upper limit on the number of subscription events to return  in the response.   Default: `200`
	public init(cursor: String? = nil, limit: Int? = nil) {
		self.cursor = cursor
		self.limit = limit
	}
}

/// Defines the fields that are included in the response from the [ListSubscriptionEvents](#endpoint-subscriptions-listsubscriptionevents) endpoint.
public struct ListSubscriptionEventsResponse: Codable {
	/// When a response is truncated, it includes a cursor that you can  use in a subsequent request to fetch the next set of events.  If empty, this is the final response.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	public var cursor: String?
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The `SubscriptionEvents` retrieved.
	public var subscription_events: [SubscriptionEvent]?

	/// Defines the fields that are included in the response from the [ListSubscriptionEvents](#endpoint-subscriptions-listsubscriptionevents) endpoint.
	/// - Parameters:
	///   - cursor: When a response is truncated, it includes a cursor that you can  use in a subsequent request to fetch the next set of events.  If empty, this is the final response.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	///   - errors: Information about errors encountered during the request.
	///   - subscription_events: The `SubscriptionEvents` retrieved.
	public init(cursor: String? = nil, errors: [SquareError]? = nil, subscription_events: [SubscriptionEvent]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.subscription_events = subscription_events
	}
}

public struct ListTeamMemberBookingProfilesRequest: Codable {
	/// Indicates whether to include only bookable team members in the returned result (`true`) or not (`false`).
	public var bookable_only: Bool?
	/// The cursor for paginating through the results.
	public var cursor: String?
	/// The maximum number of results to return.
	public var limit: Int?
	/// Indicates whether to include only team members enabled at the given location in the returned result.
	public var location_id: String?

	public init(bookable_only: Bool? = nil, cursor: String? = nil, limit: Int? = nil, location_id: String? = nil) {
		self.bookable_only = bookable_only
		self.cursor = cursor
		self.limit = limit
		self.location_id = location_id
	}
}

public struct ListTeamMemberBookingProfilesResponse: Codable {
	/// The cursor for paginating through the results.
	public var cursor: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The list of team member booking profiles.
	public var team_member_booking_profiles: [TeamMemberBookingProfile]?

	public init(cursor: String? = nil, errors: [SquareError]? = nil, team_member_booking_profiles: [TeamMemberBookingProfile]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.team_member_booking_profiles = team_member_booking_profiles
	}
}

/// A request for a set of `TeamMemberWage` objects
public struct ListTeamMemberWagesRequest: Codable {
	/// Pointer to the next page of Employee Wage results to fetch.
	public var cursor: String?
	/// Maximum number of Team Member Wages to return per page. Can range between 1 and 200. The default is the maximum at 200.
	public var limit: Int?
	/// Filter wages returned to only those that are associated with the specified team member.
	public var team_member_id: String?

	/// A request for a set of `TeamMemberWage` objects
	/// - Parameters:
	///   - cursor: Pointer to the next page of Employee Wage results to fetch.
	///   - limit: Maximum number of Team Member Wages to return per page. Can range between 1 and 200. The default is the maximum at 200.
	///   - team_member_id: Filter wages returned to only those that are associated with the specified team member.
	public init(cursor: String? = nil, limit: Int? = nil, team_member_id: String? = nil) {
		self.cursor = cursor
		self.limit = limit
		self.team_member_id = team_member_id
	}
}

/// The response to a request for a set of `TeamMemberWage` objects. Contains a set of `TeamMemberWage`.
public struct ListTeamMemberWagesResponse: Codable {
	/// Value supplied in the subsequent request to fetch the next next page of Team Member Wage results.
	public var cursor: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// A page of Team Member Wage results.
	public var team_member_wages: [TeamMemberWage]?

	/// The response to a request for a set of `TeamMemberWage` objects. Contains a set of `TeamMemberWage`.
	/// - Parameters:
	///   - cursor: Value supplied in the subsequent request to fetch the next next page of Team Member Wage results.
	///   - errors: Any errors that occurred during the request.
	///   - team_member_wages: A page of Team Member Wage results.
	public init(cursor: String? = nil, errors: [SquareError]? = nil, team_member_wages: [TeamMemberWage]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.team_member_wages = team_member_wages
	}
}

/// Defines the query parameters that can be included in a request to the [ListTransactions](#endpoint-listtransactions) endpoint.  Deprecated - recommend using [SearchOrders](#endpoint-orders-searchorders)
public struct ListTransactionsRequest: Codable {
	/// The beginning of the requested reporting period, in RFC 3339 format.  See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.  Default value: The current time minus one year.
	public var begin_time: Timestamp?
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query.  See [Paginating results](#paginatingresults) for more information.
	public var cursor: String?
	/// The end of the requested reporting period, in RFC 3339 format.  See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.  Default value: The current time.
	public var end_time: Timestamp?
	/// The order in which results are listed in the response (`ASC` for oldest first, `DESC` for newest first).  Default value: `DESC` See [SortOrder](#type-sortorder) for possible values
	public var sort_order: SortOrder?

	/// Defines the query parameters that can be included in a request to the [ListTransactions](#endpoint-listtransactions) endpoint.  Deprecated - recommend using [SearchOrders](#endpoint-orders-searchorders)
	/// - Parameters:
	///   - begin_time: The beginning of the requested reporting period, in RFC 3339 format.  See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.  Default value: The current time minus one year.
	///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query.  See [Paginating results](#paginatingresults) for more information.
	///   - end_time: The end of the requested reporting period, in RFC 3339 format.  See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.  Default value: The current time.
	///   - sort_order: The order in which results are listed in the response (`ASC` for oldest first, `DESC` for newest first).  Default value: `DESC` See [SortOrder](#type-sortorder) for possible values
	public init(begin_time: Timestamp? = nil, cursor: String? = nil, end_time: Timestamp? = nil, sort_order: SortOrder? = nil) {
		self.begin_time = begin_time
		self.cursor = cursor
		self.end_time = end_time
		self.sort_order = sort_order
	}
}

/// Defines the fields that are included in the response body of a request to the [ListTransactions](#endpoint-listtransactions) endpoint.  One of `errors` or `transactions` is present in a given response (never both).
public struct ListTransactionsResponse: Codable {
	/// A pagination cursor for retrieving the next set of results, if any remain. Provide this value as the `cursor` parameter in a subsequent request to this endpoint.  See [Paginating results](#paginatingresults) for more information.
	public var cursor: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// An array of transactions that match your query.
	public var transactions: [Transaction]?

	/// Defines the fields that are included in the response body of a request to the [ListTransactions](#endpoint-listtransactions) endpoint.  One of `errors` or `transactions` is present in a given response (never both).
	/// - Parameters:
	///   - cursor: A pagination cursor for retrieving the next set of results, if any remain. Provide this value as the `cursor` parameter in a subsequent request to this endpoint.  See [Paginating results](#paginatingresults) for more information.
	///   - errors: Any errors that occurred during the request.
	///   - transactions: An array of transactions that match your query.
	public init(cursor: String? = nil, errors: [SquareError]? = nil, transactions: [Transaction]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.transactions = transactions
	}
}

/// A request for a set of `WorkweekConfig` objects
public struct ListWorkweekConfigsRequest: Codable {
	/// Pointer to the next page of Workweek Config results to fetch.
	public var cursor: String?
	/// Maximum number of Workweek Configs to return per page.
	public var limit: Int?

	/// A request for a set of `WorkweekConfig` objects
	/// - Parameters:
	///   - cursor: Pointer to the next page of Workweek Config results to fetch.
	///   - limit: Maximum number of Workweek Configs to return per page.
	public init(cursor: String? = nil, limit: Int? = nil) {
		self.cursor = cursor
		self.limit = limit
	}
}

/// The response to a request for a set of `WorkweekConfig` objects. Contains the requested `WorkweekConfig` objects. May contain a set of `Error` objects if the request resulted in errors.
public struct ListWorkweekConfigsResponse: Codable {
	/// Value supplied in the subsequent request to fetch the next page of Employee Wage results.
	public var cursor: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// A page of Employee Wage results.
	public var workweek_configs: [WorkweekConfig]?

	/// The response to a request for a set of `WorkweekConfig` objects. Contains the requested `WorkweekConfig` objects. May contain a set of `Error` objects if the request resulted in errors.
	/// - Parameters:
	///   - cursor: Value supplied in the subsequent request to fetch the next page of Employee Wage results.
	///   - errors: Any errors that occurred during the request.
	///   - workweek_configs: A page of Employee Wage results.
	public init(cursor: String? = nil, errors: [SquareError]? = nil, workweek_configs: [WorkweekConfig]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.workweek_configs = workweek_configs
	}
}

public struct Location: Codable {
	/// The physical address of the location.
	public var address: Address?
	/// The email of the location. This email is visible to the customers of the location. For example, the email appears on customer receipts.
	public var business_email: String?
	///  Represents the hours of operation for the location.
	public var business_hours: BusinessHours?
	/// The business name of the location This is the name visible to the customers of the location. For example, this name appears on customer receipts.
	public var business_name: String?
	/// The Square features that are enabled for the location. See `LocationCapability` for possible values. See [LocationCapability](#type-locationcapability) for possible values
	public let capabilities: LocationCapability?
	/// The physical coordinates (latitude and longitude) of the location.
	public var coordinates: Coordinates?
	/// The country of the location, in ISO 3166-1-alpha-2 format.  See `Country` for possible values. See [Country](#type-country) for possible values
	public let country: Country?
	/// The time when the location was created, in RFC 3339 format.
	public let created_at: Timestamp?
	/// The currency used for all transactions at this location, in ISO 4217 format. See `Currency` for possible values. See [Currency](#type-currency) for possible values
	public let currency: Currency?
	/// The description of the location.
	public var description: String?
	/// The Facebook profile URL of the location. The URL should begin with 'facebook.com/'.
	public var facebook_url: String?
	/// The URL of a full-format logo image for the location. The Seller must choose this logo in the Seller dashboard (Receipts section) for the logo to appear on transactions (such as receipts, invoices) that Square generates on behalf of the Seller. This image can have an aspect ratio of 2:1 or greater and is recommended to be at least 1280x648 pixels.
	public let full_format_logo_url: String?
	/// The Square-issued ID of the location.
	public let id: String?
	/// The Instagram username of the location without the '&#64;' symbol.
	public var instagram_username: String?
	/// The language associated with the location, in [BCP 47 format](https://tools.ietf.org/html/bcp47#appendix-A).
	public var language_code: String?
	/// The URL of the logo image for the location. The Seller must choose this logo in the Seller dashboard (Receipts section) for the logo to appear on transactions (such as receipts, invoices) that Square generates on behalf of the Seller. This image should have an aspect ratio close to 1:1 and is recommended to be at least 200x200 pixels.
	public let logo_url: String?
	/// The merchant category code (MCC) of the location, as standardized by ISO 18245. The MCC describes the kind of goods or services sold at the location.
	public var mcc: String?
	/// The ID of the merchant that owns the location.
	public let merchant_id: String?
	/// The name of the location. This information appears in the dashboard as the nickname. A location name must be unique within a seller account.
	public var name: String?
	/// The phone number of the location in human readable format.
	public var phone_number: String?
	/// The URL of the Point of Sale background image for the location.
	public let pos_background_url: String?
	/// The status of the location, either active or inactive. See [LocationStatus](#type-locationstatus) for possible values
	public var status: LocationStatus?
	/// The [IANA Timezone](https://www.iana.org/time-zones) identifier for the timezone of the location.
	public var timezone: String?
	/// The Twitter username of the location without the '&#64;' symbol.
	public var twitter_username: String?
	/// The type of the location, either physical or mobile. See [LocationType](#type-locationtype) for possible values
	public var type: LocationType?
	/// The website URL of the location.
	public var website_url: String?

	public init(address: Address? = nil, business_email: String? = nil, business_hours: BusinessHours? = nil, business_name: String? = nil, capabilities: LocationCapability? = nil, coordinates: Coordinates? = nil, country: Country? = nil, created_at: Timestamp? = nil, currency: Currency? = nil, description: String? = nil, facebook_url: String? = nil, full_format_logo_url: String? = nil, id: String? = nil, instagram_username: String? = nil, language_code: String? = nil, logo_url: String? = nil, mcc: String? = nil, merchant_id: String? = nil, name: String? = nil, phone_number: String? = nil, pos_background_url: String? = nil, status: LocationStatus? = nil, timezone: String? = nil, twitter_username: String? = nil, type: LocationType? = nil, website_url: String? = nil) {
		self.address = address
		self.business_email = business_email
		self.business_hours = business_hours
		self.business_name = business_name
		self.capabilities = capabilities
		self.coordinates = coordinates
		self.country = country
		self.created_at = created_at
		self.currency = currency
		self.description = description
		self.facebook_url = facebook_url
		self.full_format_logo_url = full_format_logo_url
		self.id = id
		self.instagram_username = instagram_username
		self.language_code = language_code
		self.logo_url = logo_url
		self.mcc = mcc
		self.merchant_id = merchant_id
		self.name = name
		self.phone_number = phone_number
		self.pos_background_url = pos_background_url
		self.status = status
		self.timezone = timezone
		self.twitter_username = twitter_username
		self.type = type
		self.website_url = website_url
	}
}

/// The capabilities a location may have.
public enum LocationCapability: String, Codable {
	/// The permission to process credit card transactions with Square.  The location can process credit cards if this value is present in the `capabilities` array of the `Location`.
	case CREDIT_CARD_PROCESSING
}

/// The status of the location, whether a location is active or inactive.
public enum LocationStatus: String, Codable {
	/// A location that is active for business.
	case ACTIVE
	/// A location that is not active for business. Inactive locations just provide historical information, so typically clients limit interaction with or hide these locations.
	case INACTIVE
}

/// A location's physical or mobile type.
public enum LocationType: String, Codable {
	/// A place of business with a physical location.
	case PHYSICAL
	/// A place of business that is mobile, such as a food truck or online store.
	case MOBILE
}

/// Describes a loyalty account. For more information, see  [Loyalty Overview](/docs/loyalty/overview).
public struct LoyaltyAccount: Codable {
	/// The available point balance in the loyalty account.    Your application should be able to handle loyalty accounts that have a negative point balance (`balance` is less than 0). This might occur if a seller makes a manual adjustment or as a result of a refund or exchange.
	public let balance: Int?
	/// The timestamp when the loyalty account was created, in RFC 3339 format.
	public let created_at: Timestamp?
	/// The Square-assigned ID of the `customer` that is associated with the account.
	public var customer_id: String?
	/// The timestamp when enrollment occurred, in RFC 3339 format.
	public let enrolled_at: Timestamp?
	/// The Square-assigned ID of the loyalty account.
	public let id: String?
	/// The total points accrued during the lifetime of the account.
	public let lifetime_points: Int?
	/// The list of mappings that the account is associated with.  Currently, a buyer can only be mapped to a loyalty account using  a phone number. Therefore, the list can only have one mapping.
	public var mappings: [LoyaltyAccountMapping]
	/// The Square-assigned ID of the `loyalty program` to which the account belongs.
	public var program_id: String
	/// The timestamp when the loyalty account was last updated, in RFC 3339 format.
	public let updated_at: Timestamp?

	/// Describes a loyalty account. For more information, see  [Loyalty Overview](/docs/loyalty/overview).
	/// - Parameters:
	///   - balance: The available point balance in the loyalty account.    Your application should be able to handle loyalty accounts that have a negative point balance (`balance` is less than 0). This might occur if a seller makes a manual adjustment or as a result of a refund or exchange.
	///   - created_at: The timestamp when the loyalty account was created, in RFC 3339 format.
	///   - customer_id: The Square-assigned ID of the `customer` that is associated with the account.
	///   - enrolled_at: The timestamp when enrollment occurred, in RFC 3339 format.
	///   - id: The Square-assigned ID of the loyalty account.
	///   - lifetime_points: The total points accrued during the lifetime of the account.
	///   - mappings: The list of mappings that the account is associated with.  Currently, a buyer can only be mapped to a loyalty account using  a phone number. Therefore, the list can only have one mapping.
	///   - program_id: The Square-assigned ID of the `loyalty program` to which the account belongs.
	///   - updated_at: The timestamp when the loyalty account was last updated, in RFC 3339 format.
	public init(mappings: [LoyaltyAccountMapping], program_id: String, balance: Int? = nil, created_at: Timestamp? = nil, customer_id: String? = nil, enrolled_at: Timestamp? = nil, id: String? = nil, lifetime_points: Int? = nil, updated_at: Timestamp? = nil) {
		self.mappings = mappings
		self.program_id = program_id
		self.balance = balance
		self.created_at = created_at
		self.customer_id = customer_id
		self.enrolled_at = enrolled_at
		self.id = id
		self.lifetime_points = lifetime_points
		self.updated_at = updated_at
	}
}

/// Associates a loyalty account with the buyer's phone number. For more information, see  [Loyalty Overview](/docs/loyalty/overview).
public struct LoyaltyAccountMapping: Codable {
	/// The timestamp when the mapping was created, in RFC 3339 format.
	public let created_at: Timestamp?
	/// The Square-assigned ID of the mapping.
	public let id: String?
	/// The type of mapping. See [LoyaltyAccountMappingType](#type-loyaltyaccountmappingtype) for possible values
	public var type: LoyaltyAccountMappingType
	/// The phone number, in E.164 format. For example, "+14155551111".
	public var value: String

	/// Associates a loyalty account with the buyer's phone number. For more information, see  [Loyalty Overview](/docs/loyalty/overview).
	/// - Parameters:
	///   - created_at: The timestamp when the mapping was created, in RFC 3339 format.
	///   - id: The Square-assigned ID of the mapping.
	///   - type: The type of mapping. See [LoyaltyAccountMappingType](#type-loyaltyaccountmappingtype) for possible values
	///   - value: The phone number, in E.164 format. For example, "+14155551111".
	public init(type: LoyaltyAccountMappingType, value: String, created_at: Timestamp? = nil, id: String? = nil) {
		self.type = type
		self.value = value
		self.created_at = created_at
		self.id = id
	}
}

/// The type of mapping.
public enum LoyaltyAccountMappingType: String, Codable {
	/// The loyalty account is mapped by phone.
	case PHONE
}

/// Provides information about a loyalty event.  For more information, see [Loyalty events](/docs/loyalty-api/overview/#loyalty-events).
public struct LoyaltyEvent: Codable {
	/// Provides metadata when the event `type` is `ACCUMULATE_POINTS`.
	public let accumulate_points: LoyaltyEventAccumulatePoints?
	/// Provides metadata when the event `type` is `ADJUST_POINTS`.
	public let adjust_points: LoyaltyEventAdjustPoints?
	/// Provides metadata when the event `type` is `CREATE_REWARD`.
	public let create_reward: LoyaltyEventCreateReward?
	/// The timestamp when the event was created, in RFC 3339 format.
	public let created_at: Timestamp
	/// Provides metadata when the event `type` is `DELETE_REWARD`.
	public let delete_reward: LoyaltyEventDeleteReward?
	/// Provides metadata when the event `type` is `EXPIRE_POINTS`.
	public let expire_points: LoyaltyEventExpirePoints?
	/// The Square-assigned ID of the loyalty event.
	public let id: String
	/// The ID of the `location` where the event occurred.
	public let location_id: String?
	/// The ID of the `loyalty account` in which the event occurred.
	public let loyalty_account_id: String
	/// Provides metadata when the event `type` is `OTHER`.
	public let other_event: LoyaltyEventOther?
	/// Provides metadata when the event `type` is `REDEEM_REWARD`.
	public let redeem_reward: LoyaltyEventRedeemReward?
	/// Defines whether the event was generated by the Square Point of Sale. See [LoyaltyEventSource](#type-loyaltyeventsource) for possible values
	public let source: LoyaltyEventSource
	/// The type of the loyalty event. See [LoyaltyEventType](#type-loyaltyeventtype) for possible values
	public let type: LoyaltyEventType

	// no init-- this struct is read-only
}

/// Provides metadata when the event `type` is `ACCUMULATE_POINTS`.
public struct LoyaltyEventAccumulatePoints: Codable {
	/// The ID of the `loyalty program`.
	public let loyalty_program_id: String?
	/// The ID of the `order` for which the buyer accumulated the points. This field is returned only if the Orders API is used to process orders.
	public var order_id: String?
	/// The number of points accumulated by the event.
	public var points: Int?

	/// Provides metadata when the event `type` is `ACCUMULATE_POINTS`.
	/// - Parameters:
	///   - loyalty_program_id: The ID of the `loyalty program`.
	///   - order_id: The ID of the `order` for which the buyer accumulated the points. This field is returned only if the Orders API is used to process orders.
	///   - points: The number of points accumulated by the event.
	public init(loyalty_program_id: String? = nil, order_id: String? = nil, points: Int? = nil) {
		self.loyalty_program_id = loyalty_program_id
		self.order_id = order_id
		self.points = points
	}
}

/// Provides metadata when the event `type` is `ADJUST_POINTS`.
public struct LoyaltyEventAdjustPoints: Codable {
	/// The Square-assigned ID of the `loyalty program`.
	public let loyalty_program_id: String?
	/// The number of points added or removed.
	public var points: Int
	/// The reason for the adjustment of points.
	public var reason: String?

	/// Provides metadata when the event `type` is `ADJUST_POINTS`.
	/// - Parameters:
	///   - loyalty_program_id: The Square-assigned ID of the `loyalty program`.
	///   - points: The number of points added or removed.
	///   - reason: The reason for the adjustment of points.
	public init(points: Int, loyalty_program_id: String? = nil, reason: String? = nil) {
		self.points = points
		self.loyalty_program_id = loyalty_program_id
		self.reason = reason
	}
}

/// Provides metadata when the event `type` is `CREATE_REWARD`.
public struct LoyaltyEventCreateReward: Codable {
	/// The ID of the `loyalty program`.
	public let loyalty_program_id: String
	/// The loyalty points used to create the reward.
	public let points: Int
	/// The Square-assigned ID of the created `loyalty reward`. This field is returned only if the event source is `LOYALTY_API`.
	public let reward_id: String?

	// no init-- this struct is read-only
}

/// Filter events by date time range.
public struct LoyaltyEventDateTimeFilter: Codable {
	/// The `created_at` date time range used to filter the result.
	public var created_at: TimeRange

	/// Filter events by date time range.
	/// - Parameters:
	///   - created_at: The `created_at` date time range used to filter the result.
	public init(created_at: TimeRange) {
		self.created_at = created_at
	}
}

/// Provides metadata when the event `type` is `DELETE_REWARD`.
public struct LoyaltyEventDeleteReward: Codable {
	/// The ID of the `loyalty program`.
	public let loyalty_program_id: String
	/// The number of points returned to the loyalty account.
	public let points: Int
	/// The ID of the deleted `loyalty reward`. This field is returned only if the event source is `LOYALTY_API`.
	public let reward_id: String?

	// no init-- this struct is read-only
}

/// Provides metadata when the event `type` is `EXPIRE_POINTS`.
public struct LoyaltyEventExpirePoints: Codable {
	/// The Square-assigned ID of the `loyalty program`.
	public let loyalty_program_id: String
	/// The number of points expired.
	public var points: Int

	// no init-- this struct is read-only
}

/// The filtering criteria. If the request specifies multiple filters,  the endpoint uses a logical AND to evaluate them.
public struct LoyaltyEventFilter: Codable {
	/// Filter events by date time range.  For each range, the start time is inclusive and the end time  is exclusive.
	public var date_time_filter: LoyaltyEventDateTimeFilter?
	/// Filter events by location.
	public var location_filter: LoyaltyEventLocationFilter?
	/// Filter events by loyalty account.
	public var loyalty_account_filter: LoyaltyEventLoyaltyAccountFilter?
	/// Filter events by the order associated with the event.
	public var order_filter: LoyaltyEventOrderFilter?
	/// Filter events by event type.
	public var type_filter: LoyaltyEventTypeFilter?

	/// The filtering criteria. If the request specifies multiple filters,  the endpoint uses a logical AND to evaluate them.
	/// - Parameters:
	///   - date_time_filter: Filter events by date time range.  For each range, the start time is inclusive and the end time  is exclusive.
	///   - location_filter: Filter events by location.
	///   - loyalty_account_filter: Filter events by loyalty account.
	///   - order_filter: Filter events by the order associated with the event.
	///   - type_filter: Filter events by event type.
	public init(date_time_filter: LoyaltyEventDateTimeFilter? = nil, location_filter: LoyaltyEventLocationFilter? = nil, loyalty_account_filter: LoyaltyEventLoyaltyAccountFilter? = nil, order_filter: LoyaltyEventOrderFilter? = nil, type_filter: LoyaltyEventTypeFilter? = nil) {
		self.date_time_filter = date_time_filter
		self.location_filter = location_filter
		self.loyalty_account_filter = loyalty_account_filter
		self.order_filter = order_filter
		self.type_filter = type_filter
	}
}

/// Filter events by location.
public struct LoyaltyEventLocationFilter: Codable {
	/// The `location` IDs for loyalty events to query. If multiple values are specified, the endpoint uses  a logical OR to combine them.
	public var location_ids: [String]

	/// Filter events by location.
	/// - Parameters:
	///   - location_ids: The `location` IDs for loyalty events to query. If multiple values are specified, the endpoint uses  a logical OR to combine them.
	public init(location_ids: [String]) {
		self.location_ids = location_ids
	}
}

/// Filter events by loyalty account.
public struct LoyaltyEventLoyaltyAccountFilter: Codable {
	/// The ID of the `loyalty account` associated with loyalty events.
	public var loyalty_account_id: String

	/// Filter events by loyalty account.
	/// - Parameters:
	///   - loyalty_account_id: The ID of the `loyalty account` associated with loyalty events.
	public init(loyalty_account_id: String) {
		self.loyalty_account_id = loyalty_account_id
	}
}

/// Filter events by the order associated with the event.
public struct LoyaltyEventOrderFilter: Codable {
	/// The ID of the `order` associated with the event.
	public var order_id: String

	/// Filter events by the order associated with the event.
	/// - Parameters:
	///   - order_id: The ID of the `order` associated with the event.
	public init(order_id: String) {
		self.order_id = order_id
	}
}

/// Provides metadata when the event `type` is `OTHER`.
public struct LoyaltyEventOther: Codable {
	/// The Square-assigned ID of the `loyalty program`.
	public let loyalty_program_id: String
	/// The number of points added or removed.
	public var points: Int

	// no init-- this struct is read-only
}

/// Represents a query used to search for loyalty events.
public struct LoyaltyEventQuery: Codable {
	/// The query filter criteria.
	public var filter: LoyaltyEventFilter?

	/// Represents a query used to search for loyalty events.
	/// - Parameters:
	///   - filter: The query filter criteria.
	public init(filter: LoyaltyEventFilter? = nil) {
		self.filter = filter
	}
}

/// Provides metadata when the event `type` is `REDEEM_REWARD`.
public struct LoyaltyEventRedeemReward: Codable {
	/// The ID of the `loyalty program`.
	public let loyalty_program_id: String
	/// The ID of the `order` that redeemed the reward. This field is returned only if the Orders API is used to process orders.
	public let order_id: String?
	/// The ID of the redeemed `loyalty reward`. This field is returned only if the event source is `LOYALTY_API`.
	public let reward_id: String?

	// no init-- this struct is read-only
}

/// Defines whether the event was generated by the Square Point of Sale.
public enum LoyaltyEventSource: String, Codable {
	/// The event is generated by the Square Point of Sale (POS).
	case SQUARE
	/// The event is generated by something other than the Square Point of Sale that used the Loyalty API.
	case LOYALTY_API
}

/// The type of the loyalty event.
public enum LoyaltyEventType: String, Codable {
	/// Points are added to a loyalty account for a purchase.
	case ACCUMULATE_POINTS
	/// A loyalty reward is created. For more information, see   [Loyalty rewards](https://developer.squareup.com/docs/loyalty-api/overview/#loyalty-overview-loyalty-rewards).
	case CREATE_REWARD
	/// A loyalty reward is redeemed.
	case REDEEM_REWARD
	/// A loyalty reward is deleted.
	case DELETE_REWARD
	/// Loyalty points are manually adjusted.
	case ADJUST_POINTS
	/// Loyalty points are expired according to the  expiration policy of the loyalty program.
	case EXPIRE_POINTS
	/// Some other loyalty event occurred.
	case OTHER
}

/// Filter events by event type.
public struct LoyaltyEventTypeFilter: Codable {
	/// The loyalty event types used to filter the result. If multiple values are specified, the endpoint uses a  logical OR to combine them. See [LoyaltyEventType](#type-loyaltyeventtype) for possible values
	public var types: LoyaltyEventType

	/// Filter events by event type.
	/// - Parameters:
	///   - types: The loyalty event types used to filter the result. If multiple values are specified, the endpoint uses a  logical OR to combine them. See [LoyaltyEventType](#type-loyaltyeventtype) for possible values
	public init(types: LoyaltyEventType) {
		self.types = types
	}
}

public struct LoyaltyProgram: Codable {
	/// Defines how buyers can earn loyalty points.
	public let accrual_rules: [LoyaltyProgramAccrualRule]
	/// The timestamp when the program was created, in RFC 3339 format.
	public let created_at: Timestamp
	/// If present, details for how points expire.
	public let expiration_policy: LoyaltyProgramExpirationPolicy?
	/// The Square-assigned ID of the loyalty program. Updates to  the loyalty program do not modify the identifier.
	public let id: String
	/// The `locations` at which the program is active.
	public let location_ids: [String]
	/// The list of rewards for buyers, sorted by ascending points.
	public let reward_tiers: [LoyaltyProgramRewardTier]
	/// Whether the program is currently active. See [LoyaltyProgramStatus](#type-loyaltyprogramstatus) for possible values
	public let status: LoyaltyProgramStatus
	/// A cosmetic name for the “points” currency.
	public let terminology: LoyaltyProgramTerminology
	/// The timestamp when the reward was last updated, in RFC 3339 format.
	public let updated_at: Timestamp

	// no init-- this struct is read-only
}

/// Defines an accrual rule, which is how buyers can earn points.
public struct LoyaltyProgramAccrualRule: Codable {
	/// The type of the accrual rule that defines how buyers can earn points. See [LoyaltyProgramAccrualRuleType](#type-loyaltyprogramaccrualruletype) for possible values
	public let accrual_type: LoyaltyProgramAccrualRuleType
	/// The ID of the `catalog object` to purchase to earn the number of points defined by the rule. This is either an item variation or a category, depending on the type. This is defined on `ITEM_VARIATION` rules and `CATEGORY` rules.
	public let catalog_object_id: String?
	/// The number of points that  buyers earn based on the `accrual_type`.
	public let points: Int?
	/// When the accrual rule is spend-based (`accrual_type` is `SPEND`), this field indicates the amount that a buyer must spend  to earn the points. For example, suppose the accrual rule is "earn 1 point for every $10 you spend".  Then, buyer earns a point for every $10 they spend. If  buyer spends $105, the buyer earns 10 points.
	public let spend_amount_money: Money?
	/// When the accrual rule is visit-based (`accrual_type` is `VISIT`), this field indicates the minimum purchase required during the visit to  quality for the reward.
	public let visit_minimum_amount_money: Money?

	// no init-- this struct is read-only
}

/// The type of the accrual rule that defines how buyers can earn points.
public enum LoyaltyProgramAccrualRuleType: String, Codable {
	/// A visit-based accrual rule. A buyer earns points for each visit.  You can specify the minimum purchase required.
	case VISIT
	/// A spend-based accrual rule. A buyer earns points based on the amount  spent.
	case SPEND
	/// An accrual rule based on an item variation. For example, accrue  points for purchasing a coffee.
	case ITEM_VARIATION
	/// An accrual rule based on an item category. For example, accrue points  for purchasing any item in the "hot drink" category: coffee, tea, or hot cocoa.
	case CATEGORY
}

/// Describes when the loyalty program expires.
public struct LoyaltyProgramExpirationPolicy: Codable {
	/// The duration of time before points expire, in RFC 3339 format.
	public let expiration_duration: Timestamp

	// no init-- this struct is read-only
}

/// Provides details about the reward tier discount. DEPRECATED at version 2020-12-16. Discount details are now defined using a catalog pricing rule and other catalog objects. For more information, see [Get discount details for the reward](/docs/loyalty-api/overview#get-discount-details).
public struct LoyaltyProgramRewardDefinition: Codable {
	/// The list of catalog objects to which this reward can be applied. They are either all item-variation ids or category ids, depending on the `type` field. DEPRECATED at version 2020-12-16. You can find this information in the `product_set_data.product_ids_any` field of the `PRODUCT_SET` catalog object referenced by the pricing rule.
	public let catalog_object_ids: [String]?
	/// The type of discount the reward tier offers. DEPRECATED at version 2020-12-16. You can find this information in the `discount_data.discount_type` field of the `DISCOUNT` catalog object referenced by the pricing rule. See [LoyaltyProgramRewardDefinitionType](#type-loyaltyprogramrewarddefinitiontype) for possible values
	public let discount_type: LoyaltyProgramRewardDefinitionType
	/// The amount of the discount. Present if `discount_type` is `FIXED_AMOUNT`. For example, $5 off. DEPRECATED at version 2020-12-16. You can find this information in the `discount_data.amount_money` field of the  `DISCOUNT` catalog object referenced by the pricing rule.
	public let fixed_discount_money: Money?
	/// When `discount_type` is `FIXED_PERCENTAGE`, the maximum discount amount that can be applied. DEPRECATED at version 2020-12-16. You can find this information in the `discount_data.maximum_amount_money` field of the `DISCOUNT` catalog object referenced by the the pricing rule.
	public let max_discount_money: Money?
	/// The fixed percentage of the discount. Present if `discount_type` is `FIXED_PERCENTAGE`. For example, a 7.25% off discount will be represented as "7.25". DEPRECATED at version 2020-12-16. You can find this information in the `discount_data.percentage` field of the `DISCOUNT` catalog object referenced by the pricing rule.
	public let percentage_discount: String?
	/// Indicates the scope of the reward tier. DEPRECATED at version 2020-12-16. You can find this information in the `discount_target_scope` field of the `PRICING_RULE` catalog object and the `product_set_data` field of the `PRODUCT_SET` catalog object referenced by the pricing rule. For `ORDER` scopes, the target scope is `WHOLE_PURCHASE` and `all_products` is true. For `ITEM_VARIATION` and `CATEGORY` scopes, the target scope is `LINE_ITEM` and `product_ids_any` is a list of catalog object IDs of the given type. See [LoyaltyProgramRewardDefinitionScope](#type-loyaltyprogramrewarddefinitionscope) for possible values
	public let scope: LoyaltyProgramRewardDefinitionScope

	// no init-- this struct is read-only
}

/// Indicates the scope of the reward tier. DEPRECATED at version 2020-12-16. Discount details are now defined using a catalog pricing rule and other catalog objects. For more information, see [Get discount details for the reward](https://developer.squareup.com/docs/docs/loyalty-api/overview#get-discount-details).
public enum LoyaltyProgramRewardDefinitionScope: String, Codable {
	/// The discount applies to the entire order.
	case ORDER
	/// The discount applies only to specific item variations.
	case ITEM_VARIATION
	/// The discount applies only to items in the given categories.
	case CATEGORY
}

/// The type of discount the reward tier offers. DEPRECATED at version 2020-12-16. Discount details are now defined using a catalog pricing rule and other catalog objects. For more information, see [Get discount details for the reward](https://developer.squareup.com/docs/docs/loyalty-api/overview#get-discount-details).
public enum LoyaltyProgramRewardDefinitionType: String, Codable {
	/// The fixed amount discounted.
	case FIXED_AMOUNT
	/// The fixed percentage discounted.
	case FIXED_PERCENTAGE
}

/// Describes a loyalty program reward tier.
public struct LoyaltyProgramRewardTier: Codable {
	/// The timestamp when the reward tier was created, in RFC 3339 format.
	public let created_at: Timestamp
	/// Provides details about the reward tier definition. DEPRECATED at version 2020-12-16. Replaced by the `pricing_rule_reference` field.
	public let definition: LoyaltyProgramRewardDefinition
	/// The Square-assigned ID of the reward tier.
	public let id: String
	/// The name of the reward tier.
	public let name: String
	/// The points exchanged for the reward tier.
	public let points: Int
	/// A reference to the specific version of a `PRICING_RULE` catalog object that contains information about the reward tier discount.  Use `object_id` and `catalog_version` with the `RetrieveCatalogObject` endpoint to get discount details. Make sure to set `include_related_objects` to true in the request to retrieve all catalog objects that define the discount. For more information, see [Get discount details for the reward](https://developer.squareup.com/docs/docs/loyalty-api/overview#get-discount-details).
	public let pricing_rule_reference: CatalogObjectReference?

	// no init-- this struct is read-only
}

/// Indicates whether the program is currently active.
public enum LoyaltyProgramStatus: String, Codable {
	/// The loyalty program does not have an active subscription.  Loyalty API requests fail.
	case INACTIVE
	/// The program is fully functional. The program has an active subscription.
	case ACTIVE
}

public struct LoyaltyProgramTerminology: Codable {
	/// A singular unit for a point (for example, 1 point is called 1 star).
	public let one: String
	/// A plural unit for point (for example, 10 points is called 10 stars).
	public let other: String

	// no init-- this struct is read-only
}

public struct LoyaltyReward: Codable {
	/// The timestamp when the reward was created, in RFC 3339 format.
	public let created_at: Timestamp?
	/// The Square-assigned ID of the loyalty reward.
	public let id: String?
	/// The Square-assigned ID of the `loyalty account` to which the reward belongs.
	public var loyalty_account_id: String
	/// The Square-assigned ID of the `order` to which the reward is attached.
	public var order_id: String?
	/// The number of loyalty points used for the reward.
	public let points: Int?
	/// The timestamp when the reward was redeemed, in RFC 3339 format.
	public let redeemed_at: Timestamp?
	/// The Square-assigned ID of the `reward tier` used to create the reward.
	public var reward_tier_id: String
	/// The status of a loyalty reward. See [LoyaltyRewardStatus](#type-loyaltyrewardstatus) for possible values
	public let status: LoyaltyRewardStatus?
	/// The timestamp when the reward was last updated, in RFC 3339 format.
	public let updated_at: Timestamp?

	public init(loyalty_account_id: String, reward_tier_id: String, created_at: Timestamp? = nil, id: String? = nil, order_id: String? = nil, points: Int? = nil, redeemed_at: Timestamp? = nil, status: LoyaltyRewardStatus? = nil, updated_at: Timestamp? = nil) {
		self.loyalty_account_id = loyalty_account_id
		self.reward_tier_id = reward_tier_id
		self.created_at = created_at
		self.id = id
		self.order_id = order_id
		self.points = points
		self.redeemed_at = redeemed_at
		self.status = status
		self.updated_at = updated_at
	}
}

/// The status of the loyalty reward.
public enum LoyaltyRewardStatus: String, Codable {
	/// The reward is issued.
	case ISSUED
	/// The reward is redeemed.
	case REDEEMED
	/// The reward is deleted.
	case DELETED
}

/// Represents a unit of measurement to use with a quantity, such as ounces or inches. Exactly one of the following fields are required: `custom_unit`, `area_unit`, `length_unit`, `volume_unit`, and `weight_unit`.
public struct MeasurementUnit: Codable {
	/// Represents a standard area unit. See [MeasurementUnitArea](#type-measurementunitarea) for possible values
	public var area_unit: MeasurementUnitArea?
	/// A custom unit of measurement defined by the seller using the Point of Sale app or ad-hoc as an order line item.
	public var custom_unit: MeasurementUnitCustom?
	/// Reserved for API integrations that lack the ability to specify a real measurement unit See [MeasurementUnitGeneric](#type-measurementunitgeneric) for possible values
	public var generic_unit: MeasurementUnitGeneric?
	/// Represents a standard length unit. See [MeasurementUnitLength](#type-measurementunitlength) for possible values
	public var length_unit: MeasurementUnitLength?
	/// Represents a standard unit of time. See [MeasurementUnitTime](#type-measurementunittime) for possible values
	public var time_unit: MeasurementUnitTime?
	/// Represents the type of the measurement unit. See [MeasurementUnitUnitType](#type-measurementunitunittype) for possible values
	public var type: MeasurementUnitUnitType?
	/// Represents a standard volume unit. See [MeasurementUnitVolume](#type-measurementunitvolume) for possible values
	public var volume_unit: MeasurementUnitVolume?
	/// Represents a standard unit of weight or mass. See [MeasurementUnitWeight](#type-measurementunitweight) for possible values
	public var weight_unit: MeasurementUnitWeight?

	/// Represents a unit of measurement to use with a quantity, such as ounces or inches. Exactly one of the following fields are required: `custom_unit`, `area_unit`, `length_unit`, `volume_unit`, and `weight_unit`.
	/// - Parameters:
	///   - area_unit: Represents a standard area unit. See [MeasurementUnitArea](#type-measurementunitarea) for possible values
	///   - custom_unit: A custom unit of measurement defined by the seller using the Point of Sale app or ad-hoc as an order line item.
	///   - generic_unit: Reserved for API integrations that lack the ability to specify a real measurement unit See [MeasurementUnitGeneric](#type-measurementunitgeneric) for possible values
	///   - length_unit: Represents a standard length unit. See [MeasurementUnitLength](#type-measurementunitlength) for possible values
	///   - time_unit: Represents a standard unit of time. See [MeasurementUnitTime](#type-measurementunittime) for possible values
	///   - type: Represents the type of the measurement unit. See [MeasurementUnitUnitType](#type-measurementunitunittype) for possible values
	///   - volume_unit: Represents a standard volume unit. See [MeasurementUnitVolume](#type-measurementunitvolume) for possible values
	///   - weight_unit: Represents a standard unit of weight or mass. See [MeasurementUnitWeight](#type-measurementunitweight) for possible values
	public init(area_unit: MeasurementUnitArea? = nil, custom_unit: MeasurementUnitCustom? = nil, generic_unit: MeasurementUnitGeneric? = nil, length_unit: MeasurementUnitLength? = nil, time_unit: MeasurementUnitTime? = nil, type: MeasurementUnitUnitType? = nil, volume_unit: MeasurementUnitVolume? = nil, weight_unit: MeasurementUnitWeight? = nil) {
		self.area_unit = area_unit
		self.custom_unit = custom_unit
		self.generic_unit = generic_unit
		self.length_unit = length_unit
		self.time_unit = time_unit
		self.type = type
		self.volume_unit = volume_unit
		self.weight_unit = weight_unit
	}
}

/// Unit of area used to measure a quantity.
public enum MeasurementUnitArea: String, Codable {
	/// The area is measured in acres.
	case IMPERIAL_ACRE
	/// The area is measured in square inches.
	case IMPERIAL_SQUARE_INCH
	/// The area is measured in square feet.
	case IMPERIAL_SQUARE_FOOT
	/// The area is measured in square yards.
	case IMPERIAL_SQUARE_YARD
	/// The area is measured in square miles.
	case IMPERIAL_SQUARE_MILE
	/// The area is measured in square centimeters.
	case METRIC_SQUARE_CENTIMETER
	/// The area is measured in square meters.
	case METRIC_SQUARE_METER
	/// The area is measured in square kilometers.
	case METRIC_SQUARE_KILOMETER
}

/// The information needed to define a custom unit, provided by the seller.
public struct MeasurementUnitCustom: Codable {
	/// The abbreviation of the custom unit, such as "bsh" (bushel). This appears in the cart for the Point of Sale app, and in reports.
	public var abbreviation: String
	/// The name of the custom unit, for example "bushel".
	public var name: String

	/// The information needed to define a custom unit, provided by the seller.
	/// - Parameters:
	///   - abbreviation: The abbreviation of the custom unit, such as "bsh" (bushel). This appears in the cart for the Point of Sale app, and in reports.
	///   - name: The name of the custom unit, for example "bushel".
	public init(abbreviation: String, name: String) {
		self.abbreviation = abbreviation
		self.name = name
	}
}

/// 
public enum MeasurementUnitGeneric: String, Codable {
	/// The generic unit.
	case UNIT
}

/// The unit of length used to measure a quantity.
public enum MeasurementUnitLength: String, Codable {
	/// The length is measured in inches.
	case IMPERIAL_INCH
	/// The length is measured in feet.
	case IMPERIAL_FOOT
	/// The length is measured in yards.
	case IMPERIAL_YARD
	/// The length is measured in miles.
	case IMPERIAL_MILE
	/// The length is measured in millimeters.
	case METRIC_MILLIMETER
	/// The length is measured in centimeters.
	case METRIC_CENTIMETER
	/// The length is measured in meters.
	case METRIC_METER
	/// The length is measured in kilometers.
	case METRIC_KILOMETER
}

/// Unit of time used to measure a quantity (a duration).
public enum MeasurementUnitTime: String, Codable {
	/// The time is measured in milliseconds.
	case GENERIC_MILLISECOND
	/// The time is measured in seconds.
	case GENERIC_SECOND
	/// The time is measured in minutes.
	case GENERIC_MINUTE
	/// The time is measured in hours.
	case GENERIC_HOUR
	/// The time is measured in days.
	case GENERIC_DAY
}

/// Describes the type of this unit and indicates which field contains the unit information. This is an ‘open’ enum.
public enum MeasurementUnitUnitType: String, Codable {
	/// The unit details are contained in the custom_unit field.
	case TYPE_CUSTOM
	/// The unit details are contained in the area_unit field.
	case TYPE_AREA
	/// The unit details are contained in the length_unit field.
	case TYPE_LENGTH
	/// The unit details are contained in the volume_unit field.
	case TYPE_VOLUME
	/// The unit details are contained in the weight_unit field.
	case TYPE_WEIGHT
	/// The unit details are contained in the generic_unit field.
	case TYPE_GENERIC
}

/// The unit of volume used to measure a quantity.
public enum MeasurementUnitVolume: String, Codable {
	/// The volume is measured in ounces.
	case GENERIC_FLUID_OUNCE
	/// The volume is measured in shots.
	case GENERIC_SHOT
	/// The volume is measured in cups.
	case GENERIC_CUP
	/// The volume is measured in pints.
	case GENERIC_PINT
	/// The volume is measured in quarts.
	case GENERIC_QUART
	/// The volume is measured in gallons.
	case GENERIC_GALLON
	/// The volume is measured in cubic inches.
	case IMPERIAL_CUBIC_INCH
	/// The volume is measured in cubic feet.
	case IMPERIAL_CUBIC_FOOT
	/// The volume is measured in cubic yards.
	case IMPERIAL_CUBIC_YARD
	/// The volume is measured in metric milliliters.
	case METRIC_MILLILITER
	/// The volume is measured in metric liters.
	case METRIC_LITER
}

/// Unit of weight used to measure a quantity.
public enum MeasurementUnitWeight: String, Codable {
	/// The weight is measured in ounces.
	case IMPERIAL_WEIGHT_OUNCE
	/// The weight is measured in pounds.
	case IMPERIAL_POUND
	/// The weight is measured in stones.
	case IMPERIAL_STONE
	/// The weight is measured in milligrams.
	case METRIC_MILLIGRAM
	/// The weight is measured in grams.
	case METRIC_GRAM
	/// The weight is measured in kilograms.
	case METRIC_KILOGRAM
}

/// Represents a Square seller.
public struct Merchant: Codable {
	/// The business name of the merchant.
	public var business_name: String?
	/// The country code associated with the merchant account, in ISO 3166 format. See [Country](#type-country) for possible values
	public var country: Country
	/// The currency associated with the merchant account, in ISO 4217 format. See [Currency](#type-currency) for possible values
	public var currency: Currency?
	/// The Square-issued ID of the merchant.
	public var id: String?
	/// The language code associated with the merchant account, in BCP 47 format.
	public var language_code: String?
	/// The ID of the main `Location` for this merchant.
	public var main_location_id: String?
	/// The merchant status, active or inactive. See [MerchantStatus](#type-merchantstatus) for possible values
	public var status: MerchantStatus?

	/// Represents a Square seller.
	/// - Parameters:
	///   - business_name: The business name of the merchant.
	///   - country: The country code associated with the merchant account, in ISO 3166 format. See [Country](#type-country) for possible values
	///   - currency: The currency associated with the merchant account, in ISO 4217 format. See [Currency](#type-currency) for possible values
	///   - id: The Square-issued ID of the merchant.
	///   - language_code: The language code associated with the merchant account, in BCP 47 format.
	///   - main_location_id: The ID of the main `Location` for this merchant.
	///   - status: The merchant status, active or inactive. See [MerchantStatus](#type-merchantstatus) for possible values
	public init(country: Country, business_name: String? = nil, currency: Currency? = nil, id: String? = nil, language_code: String? = nil, main_location_id: String? = nil, status: MerchantStatus? = nil) {
		self.country = country
		self.business_name = business_name
		self.currency = currency
		self.id = id
		self.language_code = language_code
		self.main_location_id = main_location_id
		self.status = status
	}
}

/// 
public enum MerchantStatus: String, Codable {
	/// A fully operational merchant account. The merchant can interact with Square products and APIs.
	case ACTIVE
	/// A functionally limited merchant account. The merchant can only have limited interaction via Square APIs. The merchant cannot access the seller dashboard.
	case INACTIVE
}

/// Represents an amount of money. `Money` fields can be signed or unsigned. Fields that do not explicitly define whether they are signed or unsigned are considered unsigned and can only hold positive amounts. For signed fields, the sign of the value indicates the purpose of the money transfer. See [Working with Monetary Amounts](/build-basics/working-with-monetary-amounts) for more information.
public struct Money: Codable {
	/// The amount of money, in the smallest denomination of the currency indicated by `currency`. For example, when `currency` is `USD`, `amount` is in cents. Monetary amounts can be positive or negative. See the specific field description to determine the meaning of the sign in a particular case.
	public var amount: Int?
	/// The type of currency, in __ISO 4217 format__. For example, the currency code for US dollars is `USD`.  See `Currency` for possible values. See [Currency](#type-currency) for possible values
	public var currency: Currency?

	/// Represents an amount of money. `Money` fields can be signed or unsigned. Fields that do not explicitly define whether they are signed or unsigned are considered unsigned and can only hold positive amounts. For signed fields, the sign of the value indicates the purpose of the money transfer. See [Working with Monetary Amounts](/build-basics/working-with-monetary-amounts) for more information.
	/// - Parameters:
	///   - amount: The amount of money, in the smallest denomination of the currency indicated by `currency`. For example, when `currency` is `USD`, `amount` is in cents. Monetary amounts can be positive or negative. See the specific field description to determine the meaning of the sign in a particular case.
	///   - currency: The type of currency, in __ISO 4217 format__. For example, the currency code for US dollars is `USD`.  See `Currency` for possible values. See [Currency](#type-currency) for possible values
	public init(amount: Int? = nil, currency: Currency? = nil) {
		self.amount = amount
		self.currency = currency
	}
}

public struct ObtainTokenRequest: Codable {
	/// The Square-issued ID of your application, available from the [application dashboard](https://connect.squareup.com/apps).
	public var client_id: String
	/// The Square-issued application secret for your application, available from the [application dashboard](https://connect.squareup.com/apps).
	public var client_secret: String
	/// The authorization code to exchange. This is required if `grant_type` is set to `authorization_code`, to indicate that the application wants to exchange an authorization code for an OAuth access token.
	public var code: String?
	/// Specifies the method to request an OAuth access token. Valid values are: `authorization_code`, `refresh_token`, and `migration_token`
	public var grant_type: String
	/// Legacy OAuth access token obtained using a Connect API version prior to 2019-03-13. This parameter is required if `grant_type` is set to `migration_token` to indicate that the application wants to get a replacement OAuth access token. The response also returns a refresh token. For more information, see [Migrate to Using Refresh Tokens](https://developer.squareup.com/docs/authz/oauth/migration).
	public var migration_token: String?
	/// The redirect URL assigned in the [application dashboard](https://connect.squareup.com/apps).
	public var redirect_uri: String?
	/// A valid refresh token for generating a new OAuth access token. A valid refresh token is required if `grant_type` is set to `refresh_token` , to indicate the application wants a replacement for an expired OAuth access token.
	public var refresh_token: String?
	/// __OPTIONAL__  A JSON list of strings representing the permissions the application is requesting. For example: "`["MERCHANT_PROFILE_READ","PAYMENTS_READ","BANK_ACCOUNTS_READ"]`" The access token returned in the response is granted the permissions that comprise the intersection between the requested list of permissions, and those that belong to the provided refresh token.
	public var scopes: [String]?
	/// __OPTIONAL__  A boolean indicating a request for a short-lived access token. The short-lived access token returned in the response will expire in 24 hours.
	public var short_lived: Bool?

	public init(client_id: String, client_secret: String, grant_type: String, code: String? = nil, migration_token: String? = nil, redirect_uri: String? = nil, refresh_token: String? = nil, scopes: [String]? = nil, short_lived: Bool? = nil) {
		self.client_id = client_id
		self.client_secret = client_secret
		self.grant_type = grant_type
		self.code = code
		self.migration_token = migration_token
		self.redirect_uri = redirect_uri
		self.refresh_token = refresh_token
		self.scopes = scopes
		self.short_lived = short_lived
	}
}

public struct ObtainTokenResponse: Codable {
	/// A valid OAuth access token. OAuth access tokens are 64 bytes long. Provide the access token in a header with every request to Connect API endpoints. See [OAuth API: Walkthrough](https://developer.squareup.com/docs/oauth-api/walkthrough) for more information.
	public var access_token: String?
	/// The date when access_token expires, in [ISO 8601](http://www.iso.org/iso/home/standards/iso8601.htm) format.
	public var expires_at: String?
	/// Then OpenID token belonging to this this person. Only present if the OPENID scope is included in the authorize request.
	public var id_token: String?
	/// The ID of the authorizing merchant's business.
	public var merchant_id: String?
	/// __LEGACY FIELD__. The ID of the subscription plan the merchant signed up for. Only present if the merchant signed up for a subscription during authorization.
	public var plan_id: String?
	/// A refresh token. OAuth refresh tokens are 64 bytes long. For more information, see [OAuth access token management](https://developer.squareup.com/docs/authz/oauth/how-it-works#oauth-access-token-management).
	public var refresh_token: String?
	/// A boolean indicating the access token is a short-lived access token. The short-lived access token returned in the response will expire in 24 hours.
	public var short_lived: Bool?
	/// __LEGACY FIELD__. The ID of a subscription plan the merchant signed up for. Only present if the merchant signed up for a subscription during authorization.
	public var subscription_id: String?
	/// This value is always _bearer_.
	public var token_type: String?

	public init(access_token: String? = nil, expires_at: String? = nil, id_token: String? = nil, merchant_id: String? = nil, plan_id: String? = nil, refresh_token: String? = nil, short_lived: Bool? = nil, subscription_id: String? = nil, token_type: String? = nil) {
		self.access_token = access_token
		self.expires_at = expires_at
		self.id_token = id_token
		self.merchant_id = merchant_id
		self.plan_id = plan_id
		self.refresh_token = refresh_token
		self.short_lived = short_lived
		self.subscription_id = subscription_id
		self.token_type = token_type
	}
}

public struct OnboardAppointmentsRequest: Codable {

	public init() {
	}
}

public struct OnboardAppointmentsResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(errors: [SquareError]? = nil) {
		self.errors = errors
	}
}

/// Contains all information related to a single order to process with Square, including line items that specify the products to purchase. Order objects also include information on any associated tenders, refunds, and returns.  All Connect V2 Transactions have all been converted to Orders including all associated itemization data.
public struct Order: Codable {
	/// Timestamp for when the order reached a terminal [state](#property-state). In RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z".
	public let closed_at: Timestamp?
	/// Timestamp for when the order was created. In RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z".
	public let created_at: Timestamp?
	/// The `Customer` ID of the customer associated with the order.
	public var customer_id: String?
	/// The list of all discounts associated with the order.  Discounts can be scoped to either `ORDER` or `LINE_ITEM`. For discounts scoped to `LINE_ITEM`, an `OrderLineItemAppliedDiscount` must be added to each line item that the discount applies to. For discounts with `ORDER` scope, the server will generate an `OrderLineItemAppliedDiscount` for every line item.  __IMPORTANT__: If `LINE_ITEM` scope is set on any discounts in this field, usage of the deprecated `line_items.discounts` field will result in an error. Please use `line_items.applied_discounts` instead.
	public var discounts: [OrderLineItemDiscount]?
	/// Details on order fulfillment.  Orders can only be created with at most one fulfillment. However, orders returned by the API may contain multiple fulfillments.
	public var fulfillments: [OrderFulfillment]?
	/// The order's unique ID.
	public let id: String?
	/// The line items included in the order.
	public var line_items: [OrderLineItem]?
	/// The ID of the merchant location this order is associated with.
	public var location_id: String
	/// Application-defined data attached to this order. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (personally identifiable information, card details, etc.).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries may also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a max length of 255 characters.  An application may have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  See [Metadata](https://developer.squareup.com/docs/build-basics/metadata) for more information.
	public var metadata: String?
	/// Net money amounts (sale money - return money).
	public let net_amounts: OrderMoneyAmounts?
	/// Pricing options for an order. The options affect how the order's price is calculated. They can be used, for example, to apply automatic price adjustments that are based on pre-configured [pricing rules](https://developer.squareup.com/docs/reference/square/objects/CatalogPricingRule).
	public var pricing_options: OrderPricingOptions?
	/// A client specified identifier to associate an entity in another system with this order.
	public var reference_id: String?
	/// The Refunds that are part of this Order.
	public let refunds: [Refund]?
	/// Rollup of returned money amounts.
	public let return_amounts: OrderMoneyAmounts?
	/// Collection of items from sale Orders being returned in this one. Normally part of an Itemized Return or Exchange.  There will be exactly one `Return` object per sale Order being referenced.
	public let returns: [OrderReturn]?
	/// A set-like list of rewards that have been added to the order.
	public let rewards: [OrderReward]?
	/// A positive or negative rounding adjustment to the total of the order, commonly used to apply Cash Rounding when the minimum unit of account is smaller than the lowest physical denomination of currency.
	public let rounding_adjustment: OrderRoundingAdjustment?
	/// A list of service charges applied to the order.
	public var service_charges: [OrderServiceCharge]?
	/// The origination details of the order.
	public var source: OrderSource?
	/// The current state of the order. `OPEN`,`COMPLETED`,`CANCELED` See [OrderState](#type-orderstate) for possible values
	public var state: OrderState?
	/// The list of all taxes associated with the order.  Taxes can be scoped to either `ORDER` or `LINE_ITEM`. For taxes with `LINE_ITEM` scope, an `OrderLineItemAppliedTax` must be added to each line item that the tax applies to. For taxes with `ORDER` scope, the server will generate an `OrderLineItemAppliedTax` for every line item.  On reads, each tax in the list will include the total amount of that tax applied to the order.  __IMPORTANT__: If `LINE_ITEM` scope is set on any taxes in this field, usage of the deprecated `line_items.taxes` field will result in an error. Please use `line_items.applied_taxes` instead.
	public var taxes: [OrderLineItemTax]?
	/// The Tenders which were used to pay for the Order.
	public let tenders: [Tender]?
	/// The total discount amount of money to collect for the order.
	public let total_discount_money: Money?
	/// The total amount of money to collect for the order.
	public let total_money: Money?
	/// The total amount of money collected in service charges for the order.  Note: `total_service_charge_money` is the sum of `applied_money` fields for each individual service charge. Therefore, `total_service_charge_money` will only include inclusive tax amounts, not additive tax amounts.
	public let total_service_charge_money: Money?
	/// The total tax amount of money to collect for the order.
	public let total_tax_money: Money?
	/// The total tip amount of money to collect for the order.
	public let total_tip_money: Money?
	/// Timestamp for when the order was last updated. In RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z".
	public let updated_at: Timestamp?
	/// Version number which is incremented each time an update is committed to the order. Orders that were not created through the API will not include a version and thus cannot be updated.  [Read more about working with versions](https://developer.squareup.com/docs/orders-api/manage-orders#update-orders).
	public var version: Int?

	/// Contains all information related to a single order to process with Square, including line items that specify the products to purchase. Order objects also include information on any associated tenders, refunds, and returns.  All Connect V2 Transactions have all been converted to Orders including all associated itemization data.
	/// - Parameters:
	///   - closed_at: Timestamp for when the order reached a terminal [state](#property-state). In RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z".
	///   - created_at: Timestamp for when the order was created. In RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z".
	///   - customer_id: The `Customer` ID of the customer associated with the order.
	///   - discounts: The list of all discounts associated with the order.  Discounts can be scoped to either `ORDER` or `LINE_ITEM`. For discounts scoped to `LINE_ITEM`, an `OrderLineItemAppliedDiscount` must be added to each line item that the discount applies to. For discounts with `ORDER` scope, the server will generate an `OrderLineItemAppliedDiscount` for every line item.  __IMPORTANT__: If `LINE_ITEM` scope is set on any discounts in this field, usage of the deprecated `line_items.discounts` field will result in an error. Please use `line_items.applied_discounts` instead.
	///   - fulfillments: Details on order fulfillment.  Orders can only be created with at most one fulfillment. However, orders returned by the API may contain multiple fulfillments.
	///   - id: The order's unique ID.
	///   - line_items: The line items included in the order.
	///   - location_id: The ID of the merchant location this order is associated with.
	///   - metadata: Application-defined data attached to this order. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (personally identifiable information, card details, etc.).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries may also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a max length of 255 characters.  An application may have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  See [Metadata](https://developer.squareup.com/docs/build-basics/metadata) for more information.
	///   - net_amounts: Net money amounts (sale money - return money).
	///   - pricing_options: Pricing options for an order. The options affect how the order's price is calculated. They can be used, for example, to apply automatic price adjustments that are based on pre-configured [pricing rules](https://developer.squareup.com/docs/reference/square/objects/CatalogPricingRule).
	///   - reference_id: A client specified identifier to associate an entity in another system with this order.
	///   - refunds: The Refunds that are part of this Order.
	///   - return_amounts: Rollup of returned money amounts.
	///   - returns: Collection of items from sale Orders being returned in this one. Normally part of an Itemized Return or Exchange.  There will be exactly one `Return` object per sale Order being referenced.
	///   - rewards: A set-like list of rewards that have been added to the order.
	///   - rounding_adjustment: A positive or negative rounding adjustment to the total of the order, commonly used to apply Cash Rounding when the minimum unit of account is smaller than the lowest physical denomination of currency.
	///   - service_charges: A list of service charges applied to the order.
	///   - source: The origination details of the order.
	///   - state: The current state of the order. `OPEN`,`COMPLETED`,`CANCELED` See [OrderState](#type-orderstate) for possible values
	///   - taxes: The list of all taxes associated with the order.  Taxes can be scoped to either `ORDER` or `LINE_ITEM`. For taxes with `LINE_ITEM` scope, an `OrderLineItemAppliedTax` must be added to each line item that the tax applies to. For taxes with `ORDER` scope, the server will generate an `OrderLineItemAppliedTax` for every line item.  On reads, each tax in the list will include the total amount of that tax applied to the order.  __IMPORTANT__: If `LINE_ITEM` scope is set on any taxes in this field, usage of the deprecated `line_items.taxes` field will result in an error. Please use `line_items.applied_taxes` instead.
	///   - tenders: The Tenders which were used to pay for the Order.
	///   - total_discount_money: The total discount amount of money to collect for the order.
	///   - total_money: The total amount of money to collect for the order.
	///   - total_service_charge_money: The total amount of money collected in service charges for the order.  Note: `total_service_charge_money` is the sum of `applied_money` fields for each individual service charge. Therefore, `total_service_charge_money` will only include inclusive tax amounts, not additive tax amounts.
	///   - total_tax_money: The total tax amount of money to collect for the order.
	///   - total_tip_money: The total tip amount of money to collect for the order.
	///   - updated_at: Timestamp for when the order was last updated. In RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z".
	///   - version: Version number which is incremented each time an update is committed to the order. Orders that were not created through the API will not include a version and thus cannot be updated.  [Read more about working with versions](https://developer.squareup.com/docs/orders-api/manage-orders#update-orders).
	public init(location_id: String, closed_at: Timestamp? = nil, created_at: Timestamp? = nil, customer_id: String? = nil, discounts: [OrderLineItemDiscount]? = nil, fulfillments: [OrderFulfillment]? = nil, id: String? = nil, line_items: [OrderLineItem]? = nil, metadata: String? = nil, net_amounts: OrderMoneyAmounts? = nil, pricing_options: OrderPricingOptions? = nil, reference_id: String? = nil, refunds: [Refund]? = nil, return_amounts: OrderMoneyAmounts? = nil, returns: [OrderReturn]? = nil, rewards: [OrderReward]? = nil, rounding_adjustment: OrderRoundingAdjustment? = nil, service_charges: [OrderServiceCharge]? = nil, source: OrderSource? = nil, state: OrderState? = nil, taxes: [OrderLineItemTax]? = nil, tenders: [Tender]? = nil, total_discount_money: Money? = nil, total_money: Money? = nil, total_service_charge_money: Money? = nil, total_tax_money: Money? = nil, total_tip_money: Money? = nil, updated_at: Timestamp? = nil, version: Int? = nil) {
		self.location_id = location_id
		self.closed_at = closed_at
		self.created_at = created_at
		self.customer_id = customer_id
		self.discounts = discounts
		self.fulfillments = fulfillments
		self.id = id
		self.line_items = line_items
		self.metadata = metadata
		self.net_amounts = net_amounts
		self.pricing_options = pricing_options
		self.reference_id = reference_id
		self.refunds = refunds
		self.return_amounts = return_amounts
		self.returns = returns
		self.rewards = rewards
		self.rounding_adjustment = rounding_adjustment
		self.service_charges = service_charges
		self.source = source
		self.state = state
		self.taxes = taxes
		self.tenders = tenders
		self.total_discount_money = total_discount_money
		self.total_money = total_money
		self.total_service_charge_money = total_service_charge_money
		self.total_tax_money = total_tax_money
		self.total_tip_money = total_tip_money
		self.updated_at = updated_at
		self.version = version
	}
}

public struct OrderCreated: Codable {
	/// Timestamp for when the order was created in RFC 3339 format.
	public let created_at: Timestamp?
	/// The ID of the merchant location this order is associated with.
	public var location_id: String?
	/// The order's unique ID.
	public var order_id: String?
	/// The state of the order. See [OrderState](#type-orderstate) for possible values
	public var state: OrderState?
	/// Version number which is incremented each time an update is committed to the order. Orders that were not created through the API will not include a version and thus cannot be updated.  [Read more about working with versions](https://developer.squareup.com/docs/docs/orders-api/manage-orders#update-orders)
	public var version: Int?

	public init(created_at: Timestamp? = nil, location_id: String? = nil, order_id: String? = nil, state: OrderState? = nil, version: Int? = nil) {
		self.created_at = created_at
		self.location_id = location_id
		self.order_id = order_id
		self.state = state
		self.version = version
	}
}

public struct OrderCreatedObject: Codable {
	/// Information about the created order.
	public var order_created: OrderCreated?

	public init(order_created: OrderCreated? = nil) {
		self.order_created = order_created
	}
}

/// A lightweight description of an [Order](#type-order) that is returned when `returned_entries` is true on a [SearchOrderRequest](#type-searchorderrequest)
public struct OrderEntry: Codable {
	/// The location id the Order belongs to.
	public var location_id: String?
	/// The id of the Order
	public var order_id: String?
	/// Version number which is incremented each time an update is committed to the order. Orders that were not created through the API will not include a version and thus cannot be updated.  [Read more about working with versions](https://developer.squareup.com/docs/orders-api/manage-orders#update-orders).
	public let version: Int?

	/// A lightweight description of an [Order](#type-order) that is returned when `returned_entries` is true on a [SearchOrderRequest](#type-searchorderrequest)
	/// - Parameters:
	///   - location_id: The location id the Order belongs to.
	///   - order_id: The id of the Order
	///   - version: Version number which is incremented each time an update is committed to the order. Orders that were not created through the API will not include a version and thus cannot be updated.  [Read more about working with versions](https://developer.squareup.com/docs/orders-api/manage-orders#update-orders).
	public init(location_id: String? = nil, order_id: String? = nil, version: Int? = nil) {
		self.location_id = location_id
		self.order_id = order_id
		self.version = version
	}
}

/// Contains details on how to fulfill this order.
public struct OrderFulfillment: Codable {
	/// Application-defined data attached to this fulfillment. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (personally identifiable information, card details, etc.).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries may also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a max length of 255 characters.  An application may have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  See [Metadata](https://developer.squareup.com/docs/build-basics/metadata) for more information.
	public var metadata: String?
	/// Contains details for a pickup fulfillment. Required when fulfillment type is `PICKUP`.
	public var pickup_details: OrderFulfillmentPickupDetails?
	/// Contains details for a shipment fulfillment. Required when fulfillment type is `SHIPMENT`.  A shipment fulfillment's relationship to fulfillment `state`: `PROPOSED`: A shipment is requested. `RESERVED`: Fulfillment accepted. Shipment processing. `PREPARED`: Shipment packaged. Shipping label created. `COMPLETED`: Package has been shipped. `CANCELED`: Shipment has been canceled. `FAILED`: Shipment has failed.
	public var shipment_details: OrderFulfillmentShipmentDetails?
	/// The state of the fulfillment. See [OrderFulfillmentState](#type-orderfulfillmentstate) for possible values
	public var state: OrderFulfillmentState?
	/// The type of the fulfillment. See [OrderFulfillmentType](#type-orderfulfillmenttype) for possible values
	public var type: OrderFulfillmentType?
	/// Unique ID that identifies the fulfillment only within this order.
	public var uid: String?

	/// Contains details on how to fulfill this order.
	/// - Parameters:
	///   - metadata: Application-defined data attached to this fulfillment. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (personally identifiable information, card details, etc.).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries may also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a max length of 255 characters.  An application may have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  See [Metadata](https://developer.squareup.com/docs/build-basics/metadata) for more information.
	///   - pickup_details: Contains details for a pickup fulfillment. Required when fulfillment type is `PICKUP`.
	///   - shipment_details: Contains details for a shipment fulfillment. Required when fulfillment type is `SHIPMENT`.  A shipment fulfillment's relationship to fulfillment `state`: `PROPOSED`: A shipment is requested. `RESERVED`: Fulfillment accepted. Shipment processing. `PREPARED`: Shipment packaged. Shipping label created. `COMPLETED`: Package has been shipped. `CANCELED`: Shipment has been canceled. `FAILED`: Shipment has failed.
	///   - state: The state of the fulfillment. See [OrderFulfillmentState](#type-orderfulfillmentstate) for possible values
	///   - type: The type of the fulfillment. See [OrderFulfillmentType](#type-orderfulfillmenttype) for possible values
	///   - uid: Unique ID that identifies the fulfillment only within this order.
	public init(metadata: String? = nil, pickup_details: OrderFulfillmentPickupDetails? = nil, shipment_details: OrderFulfillmentShipmentDetails? = nil, state: OrderFulfillmentState? = nil, type: OrderFulfillmentType? = nil, uid: String? = nil) {
		self.metadata = metadata
		self.pickup_details = pickup_details
		self.shipment_details = shipment_details
		self.state = state
		self.type = type
		self.uid = uid
	}
}

/// Contains details necessary to fulfill a pickup order.
public struct OrderFulfillmentPickupDetails: Codable {
	/// The [timestamp](#workingwithdates) indicating when the fulfillment was accepted. In RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	public let accepted_at: Timestamp?
	/// The duration of time after which an open and accepted pickup fulfillment will automatically move to the `COMPLETED` state. Must be in RFC3339 duration format e.g., "P1W3D".  If not set, this pickup fulfillment will remain accepted until it is canceled or completed.
	public var auto_complete_duration: Timestamp?
	/// A description of why the pickup was canceled. Max length: 100 characters.
	public var cancel_reason: String?
	/// The [timestamp](#workingwithdates) in RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z", indicating when the fulfillment was canceled.
	public let canceled_at: Timestamp?
	/// Specific details for curbside pickup. Can only be populated if `is_curbside_pickup` is true.
	public var curbside_pickup_details: OrderFulfillmentPickupDetailsCurbsidePickupDetails?
	/// The [timestamp](#workingwithdates) indicating when the fulfillment expired. In RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	public let expired_at: Timestamp?
	/// The [timestamp](#workingwithdates) indicating when this fulfillment will expire if it is not accepted. Must be in RFC 3339 format e.g., "2016-09-04T23:59:33.123Z". Expiration time can only be set up to 7 days in the future. If `expires_at` is not set, this pickup fulfillment will be automatically accepted when placed.
	public var expires_at: Timestamp?
	/// If true, indicates this pickup order is for curbside pickup, not in-store pickup.
	public var is_curbside_pickup: Bool?
	/// A note meant to provide additional instructions about the pickup fulfillment displayed in the Square Point of Sale and set by the API.
	public var note: String?
	/// The [timestamp](#workingwithdates) indicating when the fulfillment was picked up by the recipient. In RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	public let picked_up_at: Timestamp?
	/// The [timestamp](#workingwithdates) that represents the start of the pickup window. Must be in RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z". For fulfillments with the schedule type `ASAP`, this is automatically set to the current time plus the expected duration to prepare the fulfillment.
	public var pickup_at: Timestamp?
	/// The window of time in which the order should be picked up after the `pickup_at` timestamp. Must be in RFC3339 duration format, e.g., "P1W3D". Can be used as an informational guideline for merchants.
	public var pickup_window_duration: Timestamp?
	/// The [timestamp](#workingwithdates) indicating when the fulfillment was placed. Must be in RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	public let placed_at: Timestamp?
	/// The duration of time it takes to prepare this fulfillment. Must be in RFC3339 duration format, e.g., "P1W3D".
	public var prep_time_duration: Timestamp?
	/// The [timestamp](#workingwithdates) indicating when the fulfillment is marked as ready for pickup. In RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	public let ready_at: Timestamp?
	/// Information on the person meant to pick up this fulfillment from a physical location.
	public var recipient: OrderFulfillmentRecipient?
	/// The [timestamp](#workingwithdates) indicating when the fulfillment was rejected. In RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	public let rejected_at: Timestamp?
	/// The schedule type of the pickup fulfillment. Defaults to `SCHEDULED`. See [OrderFulfillmentPickupDetailsScheduleType](#type-orderfulfillmentpickupdetailsscheduletype) for possible values
	public var schedule_type: OrderFulfillmentPickupDetailsScheduleType?

	/// Contains details necessary to fulfill a pickup order.
	/// - Parameters:
	///   - accepted_at: The [timestamp](#workingwithdates) indicating when the fulfillment was accepted. In RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	///   - auto_complete_duration: The duration of time after which an open and accepted pickup fulfillment will automatically move to the `COMPLETED` state. Must be in RFC3339 duration format e.g., "P1W3D".  If not set, this pickup fulfillment will remain accepted until it is canceled or completed.
	///   - cancel_reason: A description of why the pickup was canceled. Max length: 100 characters.
	///   - canceled_at: The [timestamp](#workingwithdates) in RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z", indicating when the fulfillment was canceled.
	///   - curbside_pickup_details: Specific details for curbside pickup. Can only be populated if `is_curbside_pickup` is true.
	///   - expired_at: The [timestamp](#workingwithdates) indicating when the fulfillment expired. In RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	///   - expires_at: The [timestamp](#workingwithdates) indicating when this fulfillment will expire if it is not accepted. Must be in RFC 3339 format e.g., "2016-09-04T23:59:33.123Z". Expiration time can only be set up to 7 days in the future. If `expires_at` is not set, this pickup fulfillment will be automatically accepted when placed.
	///   - is_curbside_pickup: If true, indicates this pickup order is for curbside pickup, not in-store pickup.
	///   - note: A note meant to provide additional instructions about the pickup fulfillment displayed in the Square Point of Sale and set by the API.
	///   - picked_up_at: The [timestamp](#workingwithdates) indicating when the fulfillment was picked up by the recipient. In RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	///   - pickup_at: The [timestamp](#workingwithdates) that represents the start of the pickup window. Must be in RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z". For fulfillments with the schedule type `ASAP`, this is automatically set to the current time plus the expected duration to prepare the fulfillment.
	///   - pickup_window_duration: The window of time in which the order should be picked up after the `pickup_at` timestamp. Must be in RFC3339 duration format, e.g., "P1W3D". Can be used as an informational guideline for merchants.
	///   - placed_at: The [timestamp](#workingwithdates) indicating when the fulfillment was placed. Must be in RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	///   - prep_time_duration: The duration of time it takes to prepare this fulfillment. Must be in RFC3339 duration format, e.g., "P1W3D".
	///   - ready_at: The [timestamp](#workingwithdates) indicating when the fulfillment is marked as ready for pickup. In RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	///   - recipient: Information on the person meant to pick up this fulfillment from a physical location.
	///   - rejected_at: The [timestamp](#workingwithdates) indicating when the fulfillment was rejected. In RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	///   - schedule_type: The schedule type of the pickup fulfillment. Defaults to `SCHEDULED`. See [OrderFulfillmentPickupDetailsScheduleType](#type-orderfulfillmentpickupdetailsscheduletype) for possible values
	public init(accepted_at: Timestamp? = nil, auto_complete_duration: Timestamp? = nil, cancel_reason: String? = nil, canceled_at: Timestamp? = nil, curbside_pickup_details: OrderFulfillmentPickupDetailsCurbsidePickupDetails? = nil, expired_at: Timestamp? = nil, expires_at: Timestamp? = nil, is_curbside_pickup: Bool? = nil, note: String? = nil, picked_up_at: Timestamp? = nil, pickup_at: Timestamp? = nil, pickup_window_duration: Timestamp? = nil, placed_at: Timestamp? = nil, prep_time_duration: Timestamp? = nil, ready_at: Timestamp? = nil, recipient: OrderFulfillmentRecipient? = nil, rejected_at: Timestamp? = nil, schedule_type: OrderFulfillmentPickupDetailsScheduleType? = nil) {
		self.accepted_at = accepted_at
		self.auto_complete_duration = auto_complete_duration
		self.cancel_reason = cancel_reason
		self.canceled_at = canceled_at
		self.curbside_pickup_details = curbside_pickup_details
		self.expired_at = expired_at
		self.expires_at = expires_at
		self.is_curbside_pickup = is_curbside_pickup
		self.note = note
		self.picked_up_at = picked_up_at
		self.pickup_at = pickup_at
		self.pickup_window_duration = pickup_window_duration
		self.placed_at = placed_at
		self.prep_time_duration = prep_time_duration
		self.ready_at = ready_at
		self.recipient = recipient
		self.rejected_at = rejected_at
		self.schedule_type = schedule_type
	}
}

/// Specific details for curbside pickup.
public struct OrderFulfillmentPickupDetailsCurbsidePickupDetails: Codable {
	/// The [timestamp](#workingwithdates) in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z", indicating when the buyer arrived and is waiting for pickup.
	public var buyer_arrived_at: Timestamp?
	/// Specific details for curbside pickup, such as parking number, vehicle model, etc.
	public var curbside_details: String?

	/// Specific details for curbside pickup.
	/// - Parameters:
	///   - buyer_arrived_at: The [timestamp](#workingwithdates) in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z", indicating when the buyer arrived and is waiting for pickup.
	///   - curbside_details: Specific details for curbside pickup, such as parking number, vehicle model, etc.
	public init(buyer_arrived_at: Timestamp? = nil, curbside_details: String? = nil) {
		self.buyer_arrived_at = buyer_arrived_at
		self.curbside_details = curbside_details
	}
}

/// The schedule type of the pickup fulfillment.
public enum OrderFulfillmentPickupDetailsScheduleType: String, Codable {
	/// Indicates the fulfillment will be picked up at a scheduled pickup time.
	case SCHEDULED
	/// Indicates the fulfillment will be picked up as soon as possible and should be prepared immediately.
	case ASAP
}

/// Contains information on the recipient of a fulfillment.
public struct OrderFulfillmentRecipient: Codable {
	/// The address of the fulfillment recipient.  If provided, overrides the value pulled from the customer profile indicated by `customer_id`.
	public var address: Address?
	/// The Customer ID of the customer associated with the fulfillment.  If `customer_id` is provided, the fulfillment recipient's `display_name`, `email_address`, and `phone_number` are automatically populated from the targeted customer profile. If these fields are set in the request, the request values will override the information from the customer profile. If the targeted customer profile does not contain the necessary information and these fields are left unset, the request will result in an error.
	public var customer_id: String?
	/// The display name of the fulfillment recipient.  If provided, overrides the value pulled from the customer profile indicated by `customer_id`.
	public var display_name: String?
	/// The email address of the fulfillment recipient.  If provided, overrides the value pulled from the customer profile indicated by `customer_id`.
	public var email_address: String?
	/// The phone number of the fulfillment recipient.  If provided, overrides the value pulled from the customer profile indicated by `customer_id`.
	public var phone_number: String?

	/// Contains information on the recipient of a fulfillment.
	/// - Parameters:
	///   - address: The address of the fulfillment recipient.  If provided, overrides the value pulled from the customer profile indicated by `customer_id`.
	///   - customer_id: The Customer ID of the customer associated with the fulfillment.  If `customer_id` is provided, the fulfillment recipient's `display_name`, `email_address`, and `phone_number` are automatically populated from the targeted customer profile. If these fields are set in the request, the request values will override the information from the customer profile. If the targeted customer profile does not contain the necessary information and these fields are left unset, the request will result in an error.
	///   - display_name: The display name of the fulfillment recipient.  If provided, overrides the value pulled from the customer profile indicated by `customer_id`.
	///   - email_address: The email address of the fulfillment recipient.  If provided, overrides the value pulled from the customer profile indicated by `customer_id`.
	///   - phone_number: The phone number of the fulfillment recipient.  If provided, overrides the value pulled from the customer profile indicated by `customer_id`.
	public init(address: Address? = nil, customer_id: String? = nil, display_name: String? = nil, email_address: String? = nil, phone_number: String? = nil) {
		self.address = address
		self.customer_id = customer_id
		self.display_name = display_name
		self.email_address = email_address
		self.phone_number = phone_number
	}
}

/// Contains details necessary to fulfill a shipment order.
public struct OrderFulfillmentShipmentDetails: Codable {
	/// A description of why the shipment was canceled.
	public var cancel_reason: String?
	/// The [timestamp](#workingwithdates) indicating the shipment was canceled. Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	public var canceled_at: Timestamp?
	/// The shipping carrier being used to ship this fulfillment e.g. UPS, FedEx, USPS, etc.
	public var carrier: String?
	/// The [timestamp](#workingwithdates) indicating when the shipment is expected to be delivered to the shipping carrier. Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	public var expected_shipped_at: Timestamp?
	/// The [timestamp](#workingwithdates) indicating when the shipment failed to be completed. Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	public let failed_at: Timestamp?
	/// A description of why the shipment failed to be completed.
	public var failure_reason: String?
	/// The [timestamp](#workingwithdates) indicating when this fulfillment was moved to the `RESERVED` state. Indicates that preparation of this shipment has begun. Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	public let in_progress_at: Timestamp?
	/// The [timestamp](#workingwithdates) indicating when this fulfillment was moved to the `PREPARED` state. Indicates that the fulfillment is packaged. Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	public let packaged_at: Timestamp?
	/// The [timestamp](#workingwithdates) indicating when the shipment was requested. Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	public let placed_at: Timestamp?
	/// Information on the person meant to receive this shipment fulfillment.
	public var recipient: OrderFulfillmentRecipient?
	/// The [timestamp](#workingwithdates) indicating when this fulfillment was moved to the `COMPLETED`state. Indicates that the fulfillment has been given to the shipping carrier. Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	public let shipped_at: Timestamp?
	/// A note with additional information for the shipping carrier.
	public var shipping_note: String?
	/// A description of the type of shipping product purchased from the carrier. e.g. First Class, Priority, Express
	public var shipping_type: String?
	/// The reference number provided by the carrier to track the shipment's progress.
	public var tracking_number: String?
	/// A link to the tracking webpage on the carrier's website.
	public var tracking_url: String?

	/// Contains details necessary to fulfill a shipment order.
	/// - Parameters:
	///   - cancel_reason: A description of why the shipment was canceled.
	///   - canceled_at: The [timestamp](#workingwithdates) indicating the shipment was canceled. Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	///   - carrier: The shipping carrier being used to ship this fulfillment e.g. UPS, FedEx, USPS, etc.
	///   - expected_shipped_at: The [timestamp](#workingwithdates) indicating when the shipment is expected to be delivered to the shipping carrier. Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	///   - failed_at: The [timestamp](#workingwithdates) indicating when the shipment failed to be completed. Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	///   - failure_reason: A description of why the shipment failed to be completed.
	///   - in_progress_at: The [timestamp](#workingwithdates) indicating when this fulfillment was moved to the `RESERVED` state. Indicates that preparation of this shipment has begun. Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	///   - packaged_at: The [timestamp](#workingwithdates) indicating when this fulfillment was moved to the `PREPARED` state. Indicates that the fulfillment is packaged. Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	///   - placed_at: The [timestamp](#workingwithdates) indicating when the shipment was requested. Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	///   - recipient: Information on the person meant to receive this shipment fulfillment.
	///   - shipped_at: The [timestamp](#workingwithdates) indicating when this fulfillment was moved to the `COMPLETED`state. Indicates that the fulfillment has been given to the shipping carrier. Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	///   - shipping_note: A note with additional information for the shipping carrier.
	///   - shipping_type: A description of the type of shipping product purchased from the carrier. e.g. First Class, Priority, Express
	///   - tracking_number: The reference number provided by the carrier to track the shipment's progress.
	///   - tracking_url: A link to the tracking webpage on the carrier's website.
	public init(cancel_reason: String? = nil, canceled_at: Timestamp? = nil, carrier: String? = nil, expected_shipped_at: Timestamp? = nil, failed_at: Timestamp? = nil, failure_reason: String? = nil, in_progress_at: Timestamp? = nil, packaged_at: Timestamp? = nil, placed_at: Timestamp? = nil, recipient: OrderFulfillmentRecipient? = nil, shipped_at: Timestamp? = nil, shipping_note: String? = nil, shipping_type: String? = nil, tracking_number: String? = nil, tracking_url: String? = nil) {
		self.cancel_reason = cancel_reason
		self.canceled_at = canceled_at
		self.carrier = carrier
		self.expected_shipped_at = expected_shipped_at
		self.failed_at = failed_at
		self.failure_reason = failure_reason
		self.in_progress_at = in_progress_at
		self.packaged_at = packaged_at
		self.placed_at = placed_at
		self.recipient = recipient
		self.shipped_at = shipped_at
		self.shipping_note = shipping_note
		self.shipping_type = shipping_type
		self.tracking_number = tracking_number
		self.tracking_url = tracking_url
	}
}

/// The current state of this fulfillment.
public enum OrderFulfillmentState: String, Codable {
	/// Indicates the fulfillment has been proposed.
	case PROPOSED
	/// Indicates the fulfillment has been reserved.
	case RESERVED
	/// Indicates the fulfillment has been prepared.
	case PREPARED
	/// Indicates the fulfillment was successfully completed.
	case COMPLETED
	/// Indicates the fulfillment was canceled.
	case CANCELED
	/// Indicates the fulfillment failed to be completed but was not explicitly canceled.
	case FAILED
}

/// The type of fulfillment.
public enum OrderFulfillmentType: String, Codable {
	/// A fulfillment to be picked up from a physical `location` by a recipient.
	case PICKUP
	/// A fulfillment to be shipped by a shipping carrier.
	case SHIPMENT
}

public struct OrderFulfillmentUpdated: Codable {
	/// Timestamp for when the order was created in RFC 3339 format.
	public let created_at: Timestamp?
	/// The fulfillments that were updated with this version change.
	public var fulfillment_update: [OrderFulfillmentUpdatedUpdate]?
	/// The ID of the merchant location this order is associated with.
	public var location_id: String?
	/// The order's unique ID.
	public var order_id: String?
	/// The state of the order. See [OrderState](#type-orderstate) for possible values
	public var state: OrderState?
	/// Timestamp for when the order was last updated in RFC 3339 format.
	public let updated_at: Timestamp?
	/// Version number which is incremented each time an update is committed to the order. Orders that were not created through the API will not include a version and thus cannot be updated.  [Read more about working with versions](https://developer.squareup.com/docs/docs/orders-api/manage-orders#update-orders)
	public var version: Int?

	public init(created_at: Timestamp? = nil, fulfillment_update: [OrderFulfillmentUpdatedUpdate]? = nil, location_id: String? = nil, order_id: String? = nil, state: OrderState? = nil, updated_at: Timestamp? = nil, version: Int? = nil) {
		self.created_at = created_at
		self.fulfillment_update = fulfillment_update
		self.location_id = location_id
		self.order_id = order_id
		self.state = state
		self.updated_at = updated_at
		self.version = version
	}
}

public struct OrderFulfillmentUpdatedObject: Codable {
	/// Information about the updated order fulfillment.
	public var order_fulfillment_updated: OrderFulfillmentUpdated?

	public init(order_fulfillment_updated: OrderFulfillmentUpdated? = nil) {
		self.order_fulfillment_updated = order_fulfillment_updated
	}
}

/// Information about fulfillment updates.
public struct OrderFulfillmentUpdatedUpdate: Codable {
	/// Unique ID that identifies the fulfillment only within this order.
	public var fulfillment_uid: String?
	/// The state of the fulfillment after the change. May be equal to old_state if a non-state field was changed on the fulfillment (e.g. tracking number). See [OrderFulfillmentState](#type-orderfulfillmentstate) for possible values
	public var new_state: OrderFulfillmentState?
	/// The state of the fulfillment before the change. Will not be populated if the fulfillment is created with this new Order version. See [OrderFulfillmentState](#type-orderfulfillmentstate) for possible values
	public var old_state: OrderFulfillmentState?

	/// Information about fulfillment updates.
	/// - Parameters:
	///   - fulfillment_uid: Unique ID that identifies the fulfillment only within this order.
	///   - new_state: The state of the fulfillment after the change. May be equal to old_state if a non-state field was changed on the fulfillment (e.g. tracking number). See [OrderFulfillmentState](#type-orderfulfillmentstate) for possible values
	///   - old_state: The state of the fulfillment before the change. Will not be populated if the fulfillment is created with this new Order version. See [OrderFulfillmentState](#type-orderfulfillmentstate) for possible values
	public init(fulfillment_uid: String? = nil, new_state: OrderFulfillmentState? = nil, old_state: OrderFulfillmentState? = nil) {
		self.fulfillment_uid = fulfillment_uid
		self.new_state = new_state
		self.old_state = old_state
	}
}

/// Represents a line item in an order. Each line item describes a different product to purchase, with its own quantity and price details.
public struct OrderLineItem: Codable {
	/// The list of references to discounts applied to this line item. Each `OrderLineItemAppliedDiscount` has a `discount_uid` that references the `uid` of a top-level `OrderLineItemDiscounts` applied to the line item. On reads, the amount applied is populated.  An `OrderLineItemAppliedDiscount` will be automatically created on every line item for all `ORDER` scoped discounts that are added to the order. `OrderLineItemAppliedDiscount` records for `LINE_ITEM` scoped discounts must be added in requests for the discount to apply to any line items.  To change the amount of a discount, modify the referenced top-level discount.
	public var applied_discounts: [OrderLineItemAppliedDiscount]?
	/// The list of references to taxes applied to this line item. Each `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level `OrderLineItemTax` applied to the line item. On reads, the amount applied is populated.  An `OrderLineItemAppliedTax` will be automatically created on every line item for all `ORDER` scoped taxes added to the order. `OrderLineItemAppliedTax` records for `LINE_ITEM` scoped taxes must be added in requests for the tax to apply to any line items.  To change the amount of a tax, modify the referenced top-level tax.
	public var applied_taxes: [OrderLineItemAppliedTax]?
	/// The base price for a single unit of the line item.
	public var base_price_money: Money?
	/// The `CatalogItemVariation` id applied to this line item.
	public var catalog_object_id: String?
	/// The amount of money made in gross sales for this line item. Calculated as the sum of the variation's total price and each modifier's total price.
	public let gross_sales_money: Money?
	/// Application-defined data attached to this line item. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (personally identifiable information, card details, etc.).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries may also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a max length of 255 characters.  An application may have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  See [Metadata](https://developer.squareup.com/docs/build-basics/metadata) for more information.
	public var metadata: String?
	/// The `CatalogModifier`s applied to this line item.
	public var modifiers: [OrderLineItemModifier]?
	/// The name of the line item.
	public var name: String?
	/// The note of the line item.
	public var note: String?
	/// Describes pricing adjustments that are blocked from manual and automatic application to a line item. For more information, see [Apply Taxes and Discounts](https://developer.squareup.com/docs/docs/orders-api/apply-taxes-and-discounts).
	public var pricing_blocklists: OrderLineItemPricingBlocklists?
	/// The quantity purchased, formatted as a decimal number. For example: `"3"`.  Line items with a quantity of `"0"` will be automatically removed upon paying for or otherwise completing the order.  Line items with a `quantity_unit` can have non-integer quantities. For example: `"1.70000"`.
	public var quantity: String
	/// The unit and precision that this line item's quantity is measured in.
	public var quantity_unit: OrderQuantityUnit?
	/// The total discount amount of money to collect for the line item.
	public let total_discount_money: Money?
	/// The total amount of money to collect for this line item.
	public let total_money: Money?
	/// The total tax amount of money to collect for the line item.
	public let total_tax_money: Money?
	/// Unique ID that identifies the line item only within this order.
	public var uid: String?
	/// The name of the variation applied to this line item.
	public var variation_name: String?
	/// The total price of all item variations sold in this line item. Calculated as `base_price_money` multiplied by `quantity`. Does not include modifiers.
	public let variation_total_price_money: Money?

	/// Represents a line item in an order. Each line item describes a different product to purchase, with its own quantity and price details.
	/// - Parameters:
	///   - applied_discounts: The list of references to discounts applied to this line item. Each `OrderLineItemAppliedDiscount` has a `discount_uid` that references the `uid` of a top-level `OrderLineItemDiscounts` applied to the line item. On reads, the amount applied is populated.  An `OrderLineItemAppliedDiscount` will be automatically created on every line item for all `ORDER` scoped discounts that are added to the order. `OrderLineItemAppliedDiscount` records for `LINE_ITEM` scoped discounts must be added in requests for the discount to apply to any line items.  To change the amount of a discount, modify the referenced top-level discount.
	///   - applied_taxes: The list of references to taxes applied to this line item. Each `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level `OrderLineItemTax` applied to the line item. On reads, the amount applied is populated.  An `OrderLineItemAppliedTax` will be automatically created on every line item for all `ORDER` scoped taxes added to the order. `OrderLineItemAppliedTax` records for `LINE_ITEM` scoped taxes must be added in requests for the tax to apply to any line items.  To change the amount of a tax, modify the referenced top-level tax.
	///   - base_price_money: The base price for a single unit of the line item.
	///   - catalog_object_id: The `CatalogItemVariation` id applied to this line item.
	///   - gross_sales_money: The amount of money made in gross sales for this line item. Calculated as the sum of the variation's total price and each modifier's total price.
	///   - metadata: Application-defined data attached to this line item. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (personally identifiable information, card details, etc.).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries may also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a max length of 255 characters.  An application may have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  See [Metadata](https://developer.squareup.com/docs/build-basics/metadata) for more information.
	///   - modifiers: The `CatalogModifier`s applied to this line item.
	///   - name: The name of the line item.
	///   - note: The note of the line item.
	///   - pricing_blocklists: Describes pricing adjustments that are blocked from manual and automatic application to a line item. For more information, see [Apply Taxes and Discounts](https://developer.squareup.com/docs/docs/orders-api/apply-taxes-and-discounts).
	///   - quantity: The quantity purchased, formatted as a decimal number. For example: `"3"`.  Line items with a quantity of `"0"` will be automatically removed upon paying for or otherwise completing the order.  Line items with a `quantity_unit` can have non-integer quantities. For example: `"1.70000"`.
	///   - quantity_unit: The unit and precision that this line item's quantity is measured in.
	///   - total_discount_money: The total discount amount of money to collect for the line item.
	///   - total_money: The total amount of money to collect for this line item.
	///   - total_tax_money: The total tax amount of money to collect for the line item.
	///   - uid: Unique ID that identifies the line item only within this order.
	///   - variation_name: The name of the variation applied to this line item.
	///   - variation_total_price_money: The total price of all item variations sold in this line item. Calculated as `base_price_money` multiplied by `quantity`. Does not include modifiers.
	public init(quantity: String, applied_discounts: [OrderLineItemAppliedDiscount]? = nil, applied_taxes: [OrderLineItemAppliedTax]? = nil, base_price_money: Money? = nil, catalog_object_id: String? = nil, gross_sales_money: Money? = nil, metadata: String? = nil, modifiers: [OrderLineItemModifier]? = nil, name: String? = nil, note: String? = nil, pricing_blocklists: OrderLineItemPricingBlocklists? = nil, quantity_unit: OrderQuantityUnit? = nil, total_discount_money: Money? = nil, total_money: Money? = nil, total_tax_money: Money? = nil, uid: String? = nil, variation_name: String? = nil, variation_total_price_money: Money? = nil) {
		self.quantity = quantity
		self.applied_discounts = applied_discounts
		self.applied_taxes = applied_taxes
		self.base_price_money = base_price_money
		self.catalog_object_id = catalog_object_id
		self.gross_sales_money = gross_sales_money
		self.metadata = metadata
		self.modifiers = modifiers
		self.name = name
		self.note = note
		self.pricing_blocklists = pricing_blocklists
		self.quantity_unit = quantity_unit
		self.total_discount_money = total_discount_money
		self.total_money = total_money
		self.total_tax_money = total_tax_money
		self.uid = uid
		self.variation_name = variation_name
		self.variation_total_price_money = variation_total_price_money
	}
}

/// Represents an applied portion of a discount to a line item in an order.  Order scoped discounts will automatically have applied discounts present for each line item. Line item scoped discounts must have applied discounts added manually for any applicable line items. The corresponding applied money will automatically be computed based on participating line items.
public struct OrderLineItemAppliedDiscount: Codable {
	/// The amount of money applied by the discount to the line item.
	public let applied_money: Money?
	/// The `uid` of the discount the applied discount represents. Must reference a discount present in the `order.discounts` field.  This field is immutable. To change which discounts apply to a line item, you must delete the discount and re-add it as a new `OrderLineItemAppliedDiscount`.
	public var discount_uid: String
	/// Unique ID that identifies the applied discount only within this order.
	public var uid: String?

	/// Represents an applied portion of a discount to a line item in an order.  Order scoped discounts will automatically have applied discounts present for each line item. Line item scoped discounts must have applied discounts added manually for any applicable line items. The corresponding applied money will automatically be computed based on participating line items.
	/// - Parameters:
	///   - applied_money: The amount of money applied by the discount to the line item.
	///   - discount_uid: The `uid` of the discount the applied discount represents. Must reference a discount present in the `order.discounts` field.  This field is immutable. To change which discounts apply to a line item, you must delete the discount and re-add it as a new `OrderLineItemAppliedDiscount`.
	///   - uid: Unique ID that identifies the applied discount only within this order.
	public init(discount_uid: String, applied_money: Money? = nil, uid: String? = nil) {
		self.discount_uid = discount_uid
		self.applied_money = applied_money
		self.uid = uid
	}
}

/// Represents an applied portion of a tax to a line item in an order.  Order-scoped taxes automatically include the applied taxes in each line item. Line item taxes must be referenced from any applicable line items. The corresponding applied money is automatically computed, based on the set of participating line items.
public struct OrderLineItemAppliedTax: Codable {
	/// The amount of money applied by the tax to the line item.
	public let applied_money: Money?
	/// The `uid` of the tax for which this applied tax represents.  Must reference a tax present in the `order.taxes` field.  This field is immutable. To change which taxes apply to a line item, delete and add new `OrderLineItemAppliedTax`s.
	public var tax_uid: String
	/// Unique ID that identifies the applied tax only within this order.
	public var uid: String?

	/// Represents an applied portion of a tax to a line item in an order.  Order-scoped taxes automatically include the applied taxes in each line item. Line item taxes must be referenced from any applicable line items. The corresponding applied money is automatically computed, based on the set of participating line items.
	/// - Parameters:
	///   - applied_money: The amount of money applied by the tax to the line item.
	///   - tax_uid: The `uid` of the tax for which this applied tax represents.  Must reference a tax present in the `order.taxes` field.  This field is immutable. To change which taxes apply to a line item, delete and add new `OrderLineItemAppliedTax`s.
	///   - uid: Unique ID that identifies the applied tax only within this order.
	public init(tax_uid: String, applied_money: Money? = nil, uid: String? = nil) {
		self.tax_uid = tax_uid
		self.applied_money = applied_money
		self.uid = uid
	}
}

/// Represents a discount that applies to one or more line items in an order.  Fixed-amount, order-scoped discounts are distributed across all non-zero line item totals. The amount distributed to each line item is relative to the amount contributed by the item to the order subtotal.
public struct OrderLineItemDiscount: Codable {
	/// The total declared monetary amount of the discount.  `amount_money` is not set for percentage-based discounts.
	public var amount_money: Money?
	/// The amount of discount actually applied to the line item.  Represents the amount of money applied as a line item-scoped discount. When an amount-based discount is scoped to the entire order, the value of `applied_money` is different from `amount_money` because the total amount of the discount is distributed across all line items.
	public var applied_money: Money?
	/// The catalog object id referencing `CatalogDiscount`.
	public var catalog_object_id: String?
	/// Application-defined data attached to this discount. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (personally identifiable information, card details, etc.).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries may also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a max length of 255 characters.  An application may have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  See [Metadata](https://developer.squareup.com/docs/build-basics/metadata) for more information.
	public var metadata: String?
	/// The discount's name.
	public var name: String?
	/// The percentage of the discount, as a string representation of a decimal number. A value of `7.25` corresponds to a percentage of 7.25%.  `percentage` is not set for amount-based discounts.
	public var percentage: String?
	/// The object identifier of a `pricing rule` to be applied automatically to this discount. The specification and application of the discounts, to which a `pricing_rule_id` is assigned, are completely controlled by the corresponding pricing rule.
	public let pricing_rule_id: String?
	/// The reward identifiers corresponding to this discount. The application and specification of discounts that have `reward_ids` are completely controlled by the backing criteria corresponding to the reward tiers of the rewards that are added to the order through the Loyalty API. To manually unapply discounts that are the result of added rewards, the rewards must be removed from the order through the Loyalty API.
	public let reward_ids: [String]?
	/// Indicates the level at which the discount applies. For `ORDER` scoped discounts, Square generates references in `applied_discounts` on all order line items that do not have them. For `LINE_ITEM` scoped discounts, the discount only applies to line items with a discount reference in their `applied_discounts` field.  This field is immutable. To change the scope of a discount you must delete the discount and re-add it as a new discount. See [OrderLineItemDiscountScope](#type-orderlineitemdiscountscope) for possible values
	public var scope: OrderLineItemDiscountScope?
	/// The type of the discount.  Discounts that don't reference a catalog object ID must have a type of `FIXED_PERCENTAGE` or `FIXED_AMOUNT`. See [OrderLineItemDiscountType](#type-orderlineitemdiscounttype) for possible values
	public var type: OrderLineItemDiscountType?
	/// Unique ID that identifies the discount only within this order.
	public var uid: String?

	/// Represents a discount that applies to one or more line items in an order.  Fixed-amount, order-scoped discounts are distributed across all non-zero line item totals. The amount distributed to each line item is relative to the amount contributed by the item to the order subtotal.
	/// - Parameters:
	///   - amount_money: The total declared monetary amount of the discount.  `amount_money` is not set for percentage-based discounts.
	///   - applied_money: The amount of discount actually applied to the line item.  Represents the amount of money applied as a line item-scoped discount. When an amount-based discount is scoped to the entire order, the value of `applied_money` is different from `amount_money` because the total amount of the discount is distributed across all line items.
	///   - catalog_object_id: The catalog object id referencing `CatalogDiscount`.
	///   - metadata: Application-defined data attached to this discount. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (personally identifiable information, card details, etc.).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries may also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a max length of 255 characters.  An application may have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  See [Metadata](https://developer.squareup.com/docs/build-basics/metadata) for more information.
	///   - name: The discount's name.
	///   - percentage: The percentage of the discount, as a string representation of a decimal number. A value of `7.25` corresponds to a percentage of 7.25%.  `percentage` is not set for amount-based discounts.
	///   - pricing_rule_id: The object identifier of a `pricing rule` to be applied automatically to this discount. The specification and application of the discounts, to which a `pricing_rule_id` is assigned, are completely controlled by the corresponding pricing rule.
	///   - reward_ids: The reward identifiers corresponding to this discount. The application and specification of discounts that have `reward_ids` are completely controlled by the backing criteria corresponding to the reward tiers of the rewards that are added to the order through the Loyalty API. To manually unapply discounts that are the result of added rewards, the rewards must be removed from the order through the Loyalty API.
	///   - scope: Indicates the level at which the discount applies. For `ORDER` scoped discounts, Square generates references in `applied_discounts` on all order line items that do not have them. For `LINE_ITEM` scoped discounts, the discount only applies to line items with a discount reference in their `applied_discounts` field.  This field is immutable. To change the scope of a discount you must delete the discount and re-add it as a new discount. See [OrderLineItemDiscountScope](#type-orderlineitemdiscountscope) for possible values
	///   - type: The type of the discount.  Discounts that don't reference a catalog object ID must have a type of `FIXED_PERCENTAGE` or `FIXED_AMOUNT`. See [OrderLineItemDiscountType](#type-orderlineitemdiscounttype) for possible values
	///   - uid: Unique ID that identifies the discount only within this order.
	public init(amount_money: Money? = nil, applied_money: Money? = nil, catalog_object_id: String? = nil, metadata: String? = nil, name: String? = nil, percentage: String? = nil, pricing_rule_id: String? = nil, reward_ids: [String]? = nil, scope: OrderLineItemDiscountScope? = nil, type: OrderLineItemDiscountType? = nil, uid: String? = nil) {
		self.amount_money = amount_money
		self.applied_money = applied_money
		self.catalog_object_id = catalog_object_id
		self.metadata = metadata
		self.name = name
		self.percentage = percentage
		self.pricing_rule_id = pricing_rule_id
		self.reward_ids = reward_ids
		self.scope = scope
		self.type = type
		self.uid = uid
	}
}

/// Indicates whether this is a line item or order level discount.
public enum OrderLineItemDiscountScope: String, Codable {
	/// Used for reporting only. The original transaction discount scope is currently not supported by the API.
	case OTHER_DISCOUNT_SCOPE
	/// The discount should be applied to only line items specified by `OrderLineItemAppliedDiscount` reference records.
	case LINE_ITEM
	/// The discount should be applied to the entire order.
	case ORDER
}

/// Indicates how the discount is applied to the associated line item or order.
public enum OrderLineItemDiscountType: String, Codable {
	/// Used for reporting only. The original transaction discount type is currently not supported by the API.
	case UNKNOWN_DISCOUNT
	/// Apply the discount as a fixed percentage (e.g., 5%) off the item price.
	case FIXED_PERCENTAGE
	/// Apply the discount as a fixed monetary value (e.g., $1.00) off the item price.
	case FIXED_AMOUNT
	/// Apply the discount as a variable percentage based on the item price.  The specific discount percentage of a `VARIABLE_PERCENTAGE` discount is assigned at the time of the purchase.
	case VARIABLE_PERCENTAGE
	/// Apply the discount as a variable amount based on the item price.  The specific discount amount of a `VARIABLE_AMOUNT` discount is assigned at the time of the purchase.
	case VARIABLE_AMOUNT
}

/// A [CatalogModifier](#type-catalogmodifier).
public struct OrderLineItemModifier: Codable {
	/// The base price for the modifier.  `base_price_money` is required for ad hoc modifiers. If both `catalog_object_id` and `base_price_money` are set, `base_price_money` will override the predefined `CatalogModifier` price.
	public var base_price_money: Money?
	/// The catalog object id referencing `CatalogModifier`.
	public var catalog_object_id: String?
	/// The name of the item modifier.
	public var name: String?
	/// The total price of the item modifier for its line item. This is the modifier's `base_price_money` multiplied by the line item's quantity.
	public let total_price_money: Money?
	/// Unique ID that identifies the modifier only within this order.
	public var uid: String?

	/// A [CatalogModifier](#type-catalogmodifier).
	/// - Parameters:
	///   - base_price_money: The base price for the modifier.  `base_price_money` is required for ad hoc modifiers. If both `catalog_object_id` and `base_price_money` are set, `base_price_money` will override the predefined `CatalogModifier` price.
	///   - catalog_object_id: The catalog object id referencing `CatalogModifier`.
	///   - name: The name of the item modifier.
	///   - total_price_money: The total price of the item modifier for its line item. This is the modifier's `base_price_money` multiplied by the line item's quantity.
	///   - uid: Unique ID that identifies the modifier only within this order.
	public init(base_price_money: Money? = nil, catalog_object_id: String? = nil, name: String? = nil, total_price_money: Money? = nil, uid: String? = nil) {
		self.base_price_money = base_price_money
		self.catalog_object_id = catalog_object_id
		self.name = name
		self.total_price_money = total_price_money
		self.uid = uid
	}
}

/// Describes pricing adjustments that are blocked from manual and  automatic application to a line item. For more information, see  [Apply Taxes and Discounts](/docs/orders-api/apply-taxes-and-discounts).
public struct OrderLineItemPricingBlocklists: Codable {
	/// A list of discounts blocked from applying to the line item.  Discounts can be blocked by the `discount_uid` (for ad-hoc discounts) or  the `discount_catalog_object_id` (for catalog discounts).
	public var blocked_discounts: [OrderLineItemPricingBlocklistsBlockedDiscount]?
	/// A list of taxes blocked from applying to the line item.  Taxes can be blocked by the `tax_uid` (for ad-hoc taxes) or  the `tax_catalog_object_id` (for catalog taxes).
	public var blocked_taxes: [OrderLineItemPricingBlocklistsBlockedTax]?

	/// Describes pricing adjustments that are blocked from manual and  automatic application to a line item. For more information, see  [Apply Taxes and Discounts](/docs/orders-api/apply-taxes-and-discounts).
	/// - Parameters:
	///   - blocked_discounts: A list of discounts blocked from applying to the line item.  Discounts can be blocked by the `discount_uid` (for ad-hoc discounts) or  the `discount_catalog_object_id` (for catalog discounts).
	///   - blocked_taxes: A list of taxes blocked from applying to the line item.  Taxes can be blocked by the `tax_uid` (for ad-hoc taxes) or  the `tax_catalog_object_id` (for catalog taxes).
	public init(blocked_discounts: [OrderLineItemPricingBlocklistsBlockedDiscount]? = nil, blocked_taxes: [OrderLineItemPricingBlocklistsBlockedTax]? = nil) {
		self.blocked_discounts = blocked_discounts
		self.blocked_taxes = blocked_taxes
	}
}

/// A discount to block from applying to a line item. The discount must be  identified by either `discount_uid` or `discount_catalog_object_id`, but not both.
public struct OrderLineItemPricingBlocklistsBlockedDiscount: Codable {
	/// The `catalog_object_id` of the discount that should be blocked.  Use this field to block catalog discounts. For ad-hoc discounts use the  `discount_uid` field.
	public var discount_catalog_object_id: String?
	/// The `uid` of the discount that should be blocked. Use this field to block  ad-hoc discounts. For catalog discounts use the `discount_catalog_object_id` field.
	public var discount_uid: String?
	/// Unique ID of the `BlockedDiscount` within the order.
	public var uid: String?

	/// A discount to block from applying to a line item. The discount must be  identified by either `discount_uid` or `discount_catalog_object_id`, but not both.
	/// - Parameters:
	///   - discount_catalog_object_id: The `catalog_object_id` of the discount that should be blocked.  Use this field to block catalog discounts. For ad-hoc discounts use the  `discount_uid` field.
	///   - discount_uid: The `uid` of the discount that should be blocked. Use this field to block  ad-hoc discounts. For catalog discounts use the `discount_catalog_object_id` field.
	///   - uid: Unique ID of the `BlockedDiscount` within the order.
	public init(discount_catalog_object_id: String? = nil, discount_uid: String? = nil, uid: String? = nil) {
		self.discount_catalog_object_id = discount_catalog_object_id
		self.discount_uid = discount_uid
		self.uid = uid
	}
}

/// A tax to block from applying to a line item. The tax must be  identified by either `tax_uid` or `tax_catalog_object_id`, but not both.
public struct OrderLineItemPricingBlocklistsBlockedTax: Codable {
	/// The `catalog_object_id` of the tax that should be blocked.  Use this field to block catalog taxes. For ad-hoc taxes use the  `tax_uid` field.
	public var tax_catalog_object_id: String?
	/// The `uid` of the tax that should be blocked. Use this field to block  ad-hoc taxes. For catalog taxes use the `tax_catalog_object_id` field.
	public var tax_uid: String?
	/// Unique ID of the `BlockedTax` within the order.
	public var uid: String?

	/// A tax to block from applying to a line item. The tax must be  identified by either `tax_uid` or `tax_catalog_object_id`, but not both.
	/// - Parameters:
	///   - tax_catalog_object_id: The `catalog_object_id` of the tax that should be blocked.  Use this field to block catalog taxes. For ad-hoc taxes use the  `tax_uid` field.
	///   - tax_uid: The `uid` of the tax that should be blocked. Use this field to block  ad-hoc taxes. For catalog taxes use the `tax_catalog_object_id` field.
	///   - uid: Unique ID of the `BlockedTax` within the order.
	public init(tax_catalog_object_id: String? = nil, tax_uid: String? = nil, uid: String? = nil) {
		self.tax_catalog_object_id = tax_catalog_object_id
		self.tax_uid = tax_uid
		self.uid = uid
	}
}

/// Represents a tax that applies to one or more line item in the order.  Fixed-amount, order-scoped taxes are distributed across all non-zero line item totals. The amount distributed to each line item is relative to the amount the item contributes to the order subtotal.
public struct OrderLineItemTax: Codable {
	/// The amount of the money applied by the tax in the order.
	public var applied_money: Money?
	/// Determines whether the tax was automatically applied to the order based on the catalog configuration. For an example, see  [Automatically Apply Taxes to an Order](https://developer.squareup.com/docs/docs/orders-api/apply-taxes-and-discounts/auto-apply-taxes).
	public let auto_applied: Bool?
	/// The catalog object id referencing `CatalogTax`.
	public var catalog_object_id: String?
	/// Application-defined data attached to this tax. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (personally identifiable information, card details, etc.).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries may also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a max length of 255 characters.  An application may have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  See [Metadata](https://developer.squareup.com/docs/build-basics/metadata) for more information.
	public var metadata: String?
	/// The tax's name.
	public var name: String?
	/// The percentage of the tax, as a string representation of a decimal number. For example, a value of `"7.25"` corresponds to a percentage of 7.25%.
	public var percentage: String?
	/// Indicates the level at which the tax applies. For `ORDER` scoped taxes, Square generates references in `applied_taxes` on all order line items that do not have them. For `LINE_ITEM` scoped taxes, the tax will only apply to line items with references in their `applied_taxes` field.  This field is immutable. To change the scope, you must delete the tax and re-add it as a new tax. See [OrderLineItemTaxScope](#type-orderlineitemtaxscope) for possible values
	public var scope: OrderLineItemTaxScope?
	/// Indicates the calculation method used to apply the tax. See [OrderLineItemTaxType](#type-orderlineitemtaxtype) for possible values
	public var type: OrderLineItemTaxType?
	/// Unique ID that identifies the tax only within this order.
	public var uid: String?

	/// Represents a tax that applies to one or more line item in the order.  Fixed-amount, order-scoped taxes are distributed across all non-zero line item totals. The amount distributed to each line item is relative to the amount the item contributes to the order subtotal.
	/// - Parameters:
	///   - applied_money: The amount of the money applied by the tax in the order.
	///   - auto_applied: Determines whether the tax was automatically applied to the order based on the catalog configuration. For an example, see  [Automatically Apply Taxes to an Order](https://developer.squareup.com/docs/docs/orders-api/apply-taxes-and-discounts/auto-apply-taxes).
	///   - catalog_object_id: The catalog object id referencing `CatalogTax`.
	///   - metadata: Application-defined data attached to this tax. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (personally identifiable information, card details, etc.).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries may also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a max length of 255 characters.  An application may have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  See [Metadata](https://developer.squareup.com/docs/build-basics/metadata) for more information.
	///   - name: The tax's name.
	///   - percentage: The percentage of the tax, as a string representation of a decimal number. For example, a value of `"7.25"` corresponds to a percentage of 7.25%.
	///   - scope: Indicates the level at which the tax applies. For `ORDER` scoped taxes, Square generates references in `applied_taxes` on all order line items that do not have them. For `LINE_ITEM` scoped taxes, the tax will only apply to line items with references in their `applied_taxes` field.  This field is immutable. To change the scope, you must delete the tax and re-add it as a new tax. See [OrderLineItemTaxScope](#type-orderlineitemtaxscope) for possible values
	///   - type: Indicates the calculation method used to apply the tax. See [OrderLineItemTaxType](#type-orderlineitemtaxtype) for possible values
	///   - uid: Unique ID that identifies the tax only within this order.
	public init(applied_money: Money? = nil, auto_applied: Bool? = nil, catalog_object_id: String? = nil, metadata: String? = nil, name: String? = nil, percentage: String? = nil, scope: OrderLineItemTaxScope? = nil, type: OrderLineItemTaxType? = nil, uid: String? = nil) {
		self.applied_money = applied_money
		self.auto_applied = auto_applied
		self.catalog_object_id = catalog_object_id
		self.metadata = metadata
		self.name = name
		self.percentage = percentage
		self.scope = scope
		self.type = type
		self.uid = uid
	}
}

/// Indicates whether this is a line item or order level tax.
public enum OrderLineItemTaxScope: String, Codable {
	/// Used for reporting only. The original transaction tax scope is currently not supported by the API.
	case OTHER_TAX_SCOPE
	/// The tax should be applied only to line items specified by the `OrderLineItemAppliedTax` reference records.
	case LINE_ITEM
	/// The tax should be applied to the entire order.
	case ORDER
}

/// Indicates how the tax is applied to the associated line item or order.
public enum OrderLineItemTaxType: String, Codable {
	/// Used for reporting only. The original transaction tax type is currently not supported by the API.
	case UNKNOWN_TAX
	/// The tax is an additive tax. The tax amount is added on top of the price. For example, an item with a cost of 1.00 USD and a 10% additive tax would have a total cost to the buyer of 1.10 USD.
	case ADDITIVE
	/// The tax is an inclusive tax. Inclusive taxes are already included in the line item price or order total. For example, an item with cost 1.00 USD with a 10% inclusive tax would have a pre-tax cost of 0.91 USD (91 cents) and a 0.09 (9 cents) tax for a total cost of 1.00 USD to the buyer.
	case INCLUSIVE
}

/// A collection of various money amounts.
public struct OrderMoneyAmounts: Codable {
	/// Money associated with discounts.
	public var discount_money: Money?
	/// Money associated with service charges.
	public var service_charge_money: Money?
	/// Money associated with taxes.
	public var tax_money: Money?
	/// Money associated with tips.
	public var tip_money: Money?
	/// Total money.
	public var total_money: Money?

	/// A collection of various money amounts.
	/// - Parameters:
	///   - discount_money: Money associated with discounts.
	///   - service_charge_money: Money associated with service charges.
	///   - tax_money: Money associated with taxes.
	///   - tip_money: Money associated with tips.
	///   - total_money: Total money.
	public init(discount_money: Money? = nil, service_charge_money: Money? = nil, tax_money: Money? = nil, tip_money: Money? = nil, total_money: Money? = nil) {
		self.discount_money = discount_money
		self.service_charge_money = service_charge_money
		self.tax_money = tax_money
		self.tip_money = tip_money
		self.total_money = total_money
	}
}

/// Pricing options for an order. The options affect how the order's price is calculated. They can be used, for example, to apply automatic price adjustments that are based on pre-configured [pricing rules](/reference/square/objects/CatalogPricingRule).
public struct OrderPricingOptions: Codable {
	/// The option to determine whether pricing rule-based discounts are automatically applied to an order.
	public var auto_apply_discounts: Bool?
	/// The option to determine whether rule-based taxes are automatically applied to an order when the criteria of the corresponding rules are met.
	public var auto_apply_taxes: Bool?

	/// Pricing options for an order. The options affect how the order's price is calculated. They can be used, for example, to apply automatic price adjustments that are based on pre-configured [pricing rules](/reference/square/objects/CatalogPricingRule).
	/// - Parameters:
	///   - auto_apply_discounts: The option to determine whether pricing rule-based discounts are automatically applied to an order.
	///   - auto_apply_taxes: The option to determine whether rule-based taxes are automatically applied to an order when the criteria of the corresponding rules are met.
	public init(auto_apply_discounts: Bool? = nil, auto_apply_taxes: Bool? = nil) {
		self.auto_apply_discounts = auto_apply_discounts
		self.auto_apply_taxes = auto_apply_taxes
	}
}

/// Contains the measurement unit for a quantity and a precision which specifies the number of digits after the decimal point for decimal quantities.
public struct OrderQuantityUnit: Codable {
	/// A `MeasurementUnit` that represents the unit of measure for the quantity.
	public var measurement_unit: MeasurementUnit?
	/// For non-integer quantities, represents the number of digits after the decimal point that are recorded for this quantity.  For example, a precision of 1 allows quantities like `"1.0"` and `"1.1"`, but not `"1.01"`.  Min: 0. Max: 5.
	public var precision: Int?

	/// Contains the measurement unit for a quantity and a precision which specifies the number of digits after the decimal point for decimal quantities.
	/// - Parameters:
	///   - measurement_unit: A `MeasurementUnit` that represents the unit of measure for the quantity.
	///   - precision: For non-integer quantities, represents the number of digits after the decimal point that are recorded for this quantity.  For example, a precision of 1 allows quantities like `"1.0"` and `"1.1"`, but not `"1.01"`.  Min: 0. Max: 5.
	public init(measurement_unit: MeasurementUnit? = nil, precision: Int? = nil) {
		self.measurement_unit = measurement_unit
		self.precision = precision
	}
}

/// The set of line items, service charges, taxes, discounts, tips, etc. being returned in an Order.
public struct OrderReturn: Codable {
	/// Aggregate monetary value being returned by this Return entry.
	public var return_amounts: OrderMoneyAmounts?
	/// Collection of references to discounts being returned for an order, including the total applied discount amount to be returned. The discounts must reference a top-level discount ID from the source order.
	public var return_discounts: [OrderReturnDiscount]?
	/// Collection of line items which are being returned.
	public var return_line_items: [OrderReturnLineItem]?
	/// Collection of service charges which are being returned.
	public let return_service_charges: [OrderReturnServiceCharge]?
	/// Collection of references to taxes being returned for an order, including the total applied tax amount to be returned. The taxes must reference a top-level tax ID from the source order.
	public var return_taxes: [OrderReturnTax]?
	/// A positive or negative rounding adjustment to the total value being returned. Commonly used to apply Cash Rounding when the minimum unit of account is smaller than the lowest physical denomination of currency.
	public var rounding_adjustment: OrderRoundingAdjustment?
	/// Order which contains the original sale of these returned line items. This will be unset for unlinked returns.
	public var source_order_id: String?
	/// Unique ID that identifies the return only within this order.
	public var uid: String?

	/// The set of line items, service charges, taxes, discounts, tips, etc. being returned in an Order.
	/// - Parameters:
	///   - return_amounts: Aggregate monetary value being returned by this Return entry.
	///   - return_discounts: Collection of references to discounts being returned for an order, including the total applied discount amount to be returned. The discounts must reference a top-level discount ID from the source order.
	///   - return_line_items: Collection of line items which are being returned.
	///   - return_service_charges: Collection of service charges which are being returned.
	///   - return_taxes: Collection of references to taxes being returned for an order, including the total applied tax amount to be returned. The taxes must reference a top-level tax ID from the source order.
	///   - rounding_adjustment: A positive or negative rounding adjustment to the total value being returned. Commonly used to apply Cash Rounding when the minimum unit of account is smaller than the lowest physical denomination of currency.
	///   - source_order_id: Order which contains the original sale of these returned line items. This will be unset for unlinked returns.
	///   - uid: Unique ID that identifies the return only within this order.
	public init(return_amounts: OrderMoneyAmounts? = nil, return_discounts: [OrderReturnDiscount]? = nil, return_line_items: [OrderReturnLineItem]? = nil, return_service_charges: [OrderReturnServiceCharge]? = nil, return_taxes: [OrderReturnTax]? = nil, rounding_adjustment: OrderRoundingAdjustment? = nil, source_order_id: String? = nil, uid: String? = nil) {
		self.return_amounts = return_amounts
		self.return_discounts = return_discounts
		self.return_line_items = return_line_items
		self.return_service_charges = return_service_charges
		self.return_taxes = return_taxes
		self.rounding_adjustment = rounding_adjustment
		self.source_order_id = source_order_id
		self.uid = uid
	}
}

/// Represents a discount being returned that applies to one or more return line items in an order.  Fixed-amount, order-scoped discounts are distributed across all non-zero return line item totals. The amount distributed to each return line item is relative to that item’s contribution to the order subtotal.
public struct OrderReturnDiscount: Codable {
	/// The total declared monetary amount of the discount.  `amount_money` is not set for percentage-based discounts.
	public var amount_money: Money?
	/// The amount of discount actually applied to this line item. When an amount-based discount is at order-level, this value is different from `amount_money` because the discount is distributed across the line items.
	public var applied_money: Money?
	/// The catalog object id referencing `CatalogDiscount`.
	public var catalog_object_id: String?
	/// The discount's name.
	public var name: String?
	/// The percentage of the tax, as a string representation of a decimal number. A value of `7.25` corresponds to a percentage of 7.25%.  `percentage` is not set for amount-based discounts.
	public var percentage: String?
	/// Indicates the level at which the `OrderReturnDiscount` applies. For `ORDER` scoped discounts, the server will generate references in `applied_discounts` on all `OrderReturnLineItem`s. For `LINE_ITEM` scoped discounts, the discount will only apply to `OrderReturnLineItem`s with references in their `applied_discounts` field. See [OrderLineItemDiscountScope](#type-orderlineitemdiscountscope) for possible values
	public var scope: OrderLineItemDiscountScope?
	/// `uid` of the Discount from the Order which contains the original application of this discount.
	public var source_discount_uid: String?
	/// The type of the discount. If it is created by API, it would be either `FIXED_PERCENTAGE` or `FIXED_AMOUNT`.  Discounts that don't reference a catalog object ID must have a type of `FIXED_PERCENTAGE` or `FIXED_AMOUNT`. See [OrderLineItemDiscountType](#type-orderlineitemdiscounttype) for possible values
	public var type: OrderLineItemDiscountType?
	/// Unique ID that identifies the return discount only within this order.
	public var uid: String?

	/// Represents a discount being returned that applies to one or more return line items in an order.  Fixed-amount, order-scoped discounts are distributed across all non-zero return line item totals. The amount distributed to each return line item is relative to that item’s contribution to the order subtotal.
	/// - Parameters:
	///   - amount_money: The total declared monetary amount of the discount.  `amount_money` is not set for percentage-based discounts.
	///   - applied_money: The amount of discount actually applied to this line item. When an amount-based discount is at order-level, this value is different from `amount_money` because the discount is distributed across the line items.
	///   - catalog_object_id: The catalog object id referencing `CatalogDiscount`.
	///   - name: The discount's name.
	///   - percentage: The percentage of the tax, as a string representation of a decimal number. A value of `7.25` corresponds to a percentage of 7.25%.  `percentage` is not set for amount-based discounts.
	///   - scope: Indicates the level at which the `OrderReturnDiscount` applies. For `ORDER` scoped discounts, the server will generate references in `applied_discounts` on all `OrderReturnLineItem`s. For `LINE_ITEM` scoped discounts, the discount will only apply to `OrderReturnLineItem`s with references in their `applied_discounts` field. See [OrderLineItemDiscountScope](#type-orderlineitemdiscountscope) for possible values
	///   - source_discount_uid: `uid` of the Discount from the Order which contains the original application of this discount.
	///   - type: The type of the discount. If it is created by API, it would be either `FIXED_PERCENTAGE` or `FIXED_AMOUNT`.  Discounts that don't reference a catalog object ID must have a type of `FIXED_PERCENTAGE` or `FIXED_AMOUNT`. See [OrderLineItemDiscountType](#type-orderlineitemdiscounttype) for possible values
	///   - uid: Unique ID that identifies the return discount only within this order.
	public init(amount_money: Money? = nil, applied_money: Money? = nil, catalog_object_id: String? = nil, name: String? = nil, percentage: String? = nil, scope: OrderLineItemDiscountScope? = nil, source_discount_uid: String? = nil, type: OrderLineItemDiscountType? = nil, uid: String? = nil) {
		self.amount_money = amount_money
		self.applied_money = applied_money
		self.catalog_object_id = catalog_object_id
		self.name = name
		self.percentage = percentage
		self.scope = scope
		self.source_discount_uid = source_discount_uid
		self.type = type
		self.uid = uid
	}
}

/// The line item being returned in an Order.
public struct OrderReturnLineItem: Codable {
	/// The list of references to `OrderReturnDiscount` entities applied to the returned line item. Each `OrderLineItemAppliedDiscount` has a `discount_uid` that references the `uid` of a top-level `OrderReturnDiscount` applied to the returned line item. On reads, the amount applied is populated.
	public var applied_discounts: [OrderLineItemAppliedDiscount]?
	/// The list of references to `OrderReturnTax` entities applied to the returned line item. Each `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level `OrderReturnTax` applied to the returned line item. On reads, the amount applied is populated.
	public var applied_taxes: [OrderLineItemAppliedTax]?
	/// The base price for a single unit of the line item.
	public var base_price_money: Money?
	/// The `CatalogItemVariation` id applied to this returned line item.
	public var catalog_object_id: String?
	/// The gross return amount of money calculated as (item base price + modifiers price) * quantity.
	public let gross_return_money: Money?
	/// The name of the line item.
	public var name: String?
	/// The note of the returned line item.
	public var note: String?
	/// The quantity returned, formatted as a decimal number. For example: `"3"`.  Line items with a `quantity_unit` can have non-integer quantities. For example: `"1.70000"`.
	public var quantity: String
	/// The unit and precision that this return line item's quantity is measured in.
	public var quantity_unit: OrderQuantityUnit?
	/// The `CatalogModifier`s applied to this line item.
	public var return_modifiers: [OrderReturnLineItemModifier]?
	/// `uid` of the LineItem in the original sale Order.
	public var source_line_item_uid: String?
	/// The total discount amount of money to return for the line item.
	public let total_discount_money: Money?
	/// The total amount of money to return for this line item.
	public let total_money: Money?
	/// The total tax amount of money to return for the line item.
	public let total_tax_money: Money?
	/// Unique identifier for this return line item entry.
	public var uid: String?
	/// The name of the variation applied to this returned line item.
	public var variation_name: String?
	/// The total price of all item variations returned in this line item. Calculated as `base_price_money` multiplied by `quantity`. Does not include modifiers.
	public let variation_total_price_money: Money?

	/// The line item being returned in an Order.
	/// - Parameters:
	///   - applied_discounts: The list of references to `OrderReturnDiscount` entities applied to the returned line item. Each `OrderLineItemAppliedDiscount` has a `discount_uid` that references the `uid` of a top-level `OrderReturnDiscount` applied to the returned line item. On reads, the amount applied is populated.
	///   - applied_taxes: The list of references to `OrderReturnTax` entities applied to the returned line item. Each `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level `OrderReturnTax` applied to the returned line item. On reads, the amount applied is populated.
	///   - base_price_money: The base price for a single unit of the line item.
	///   - catalog_object_id: The `CatalogItemVariation` id applied to this returned line item.
	///   - gross_return_money: The gross return amount of money calculated as (item base price + modifiers price) * quantity.
	///   - name: The name of the line item.
	///   - note: The note of the returned line item.
	///   - quantity: The quantity returned, formatted as a decimal number. For example: `"3"`.  Line items with a `quantity_unit` can have non-integer quantities. For example: `"1.70000"`.
	///   - quantity_unit: The unit and precision that this return line item's quantity is measured in.
	///   - return_modifiers: The `CatalogModifier`s applied to this line item.
	///   - source_line_item_uid: `uid` of the LineItem in the original sale Order.
	///   - total_discount_money: The total discount amount of money to return for the line item.
	///   - total_money: The total amount of money to return for this line item.
	///   - total_tax_money: The total tax amount of money to return for the line item.
	///   - uid: Unique identifier for this return line item entry.
	///   - variation_name: The name of the variation applied to this returned line item.
	///   - variation_total_price_money: The total price of all item variations returned in this line item. Calculated as `base_price_money` multiplied by `quantity`. Does not include modifiers.
	public init(quantity: String, applied_discounts: [OrderLineItemAppliedDiscount]? = nil, applied_taxes: [OrderLineItemAppliedTax]? = nil, base_price_money: Money? = nil, catalog_object_id: String? = nil, gross_return_money: Money? = nil, name: String? = nil, note: String? = nil, quantity_unit: OrderQuantityUnit? = nil, return_modifiers: [OrderReturnLineItemModifier]? = nil, source_line_item_uid: String? = nil, total_discount_money: Money? = nil, total_money: Money? = nil, total_tax_money: Money? = nil, uid: String? = nil, variation_name: String? = nil, variation_total_price_money: Money? = nil) {
		self.quantity = quantity
		self.applied_discounts = applied_discounts
		self.applied_taxes = applied_taxes
		self.base_price_money = base_price_money
		self.catalog_object_id = catalog_object_id
		self.gross_return_money = gross_return_money
		self.name = name
		self.note = note
		self.quantity_unit = quantity_unit
		self.return_modifiers = return_modifiers
		self.source_line_item_uid = source_line_item_uid
		self.total_discount_money = total_discount_money
		self.total_money = total_money
		self.total_tax_money = total_tax_money
		self.uid = uid
		self.variation_name = variation_name
		self.variation_total_price_money = variation_total_price_money
	}
}

/// A line item modifier being returned.
public struct OrderReturnLineItemModifier: Codable {
	/// The base price for the modifier.  `base_price_money` is required for ad hoc modifiers. If both `catalog_object_id` and `base_price_money` are set, `base_price_money` will override the predefined `CatalogModifier` price.
	public var base_price_money: Money?
	/// The catalog object id referencing `CatalogModifier`.
	public var catalog_object_id: String?
	/// The name of the item modifier.
	public var name: String?
	/// `uid` of the Modifier from the LineItem from the Order which contains the original sale of this line item modifier.
	public var source_modifier_uid: String?
	/// The total price of the item modifier for its line item. This is the modifier's `base_price_money` multiplied by the line item's quantity.
	public let total_price_money: Money?
	/// Unique ID that identifies the return modifier only within this order.
	public var uid: String?

	/// A line item modifier being returned.
	/// - Parameters:
	///   - base_price_money: The base price for the modifier.  `base_price_money` is required for ad hoc modifiers. If both `catalog_object_id` and `base_price_money` are set, `base_price_money` will override the predefined `CatalogModifier` price.
	///   - catalog_object_id: The catalog object id referencing `CatalogModifier`.
	///   - name: The name of the item modifier.
	///   - source_modifier_uid: `uid` of the Modifier from the LineItem from the Order which contains the original sale of this line item modifier.
	///   - total_price_money: The total price of the item modifier for its line item. This is the modifier's `base_price_money` multiplied by the line item's quantity.
	///   - uid: Unique ID that identifies the return modifier only within this order.
	public init(base_price_money: Money? = nil, catalog_object_id: String? = nil, name: String? = nil, source_modifier_uid: String? = nil, total_price_money: Money? = nil, uid: String? = nil) {
		self.base_price_money = base_price_money
		self.catalog_object_id = catalog_object_id
		self.name = name
		self.source_modifier_uid = source_modifier_uid
		self.total_price_money = total_price_money
		self.uid = uid
	}
}

/// Represents the service charge applied to the original order.
public struct OrderReturnServiceCharge: Codable {
	/// The amount of a non-percentage based service charge.  Exactly one of `percentage` or `amount_money` should be set.
	public var amount_money: Money?
	/// The amount of money applied to the order by the service charge, including any inclusive tax amounts, as calculated by Square.  - For fixed-amount service charges, `applied_money` is equal to `amount_money`. - For percentage-based service charges, `applied_money` is the money calculated using the percentage.
	public let applied_money: Money?
	/// The list of references to `OrderReturnTax` entities applied to the `OrderReturnServiceCharge`. Each `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level `OrderReturnTax` that is being applied to the `OrderReturnServiceCharge`. On reads, the amount applied is populated.
	public var applied_taxes: [OrderLineItemAppliedTax]?
	/// The calculation phase after which to apply the service charge. See [OrderServiceChargeCalculationPhase](#type-orderservicechargecalculationphase) for possible values
	public let calculation_phase: OrderServiceChargeCalculationPhase?
	/// The catalog object ID of the associated `CatalogServiceCharge`.
	public var catalog_object_id: String?
	/// The name of the service charge.
	public var name: String?
	/// The percentage of the service charge, as a string representation of a decimal number. For example, a value of `"7.25"` corresponds to a percentage of 7.25%.  Exactly one of `percentage` or `amount_money` should be set.
	public var percentage: String?
	/// `uid` of the Service Charge from the Order containing the original charge of the service charge. `source_service_charge_uid` is `null` for unlinked returns.
	public var source_service_charge_uid: String?
	/// Indicates whether the surcharge can be taxed. Service charges calculated in the `TOTAL_PHASE` cannot be marked as taxable.
	public var taxable: Bool?
	/// The total amount of money to collect for the service charge.  __NOTE__: if an inclusive tax is applied to the service charge, `total_money` does not equal `applied_money` plus `total_tax_money` since the inclusive tax amount will already be included in both `applied_money` and `total_tax_money`.
	public let total_money: Money?
	/// The total amount of tax money to collect for the service charge.
	public let total_tax_money: Money?
	/// Unique ID that identifies the return service charge only within this order.
	public var uid: String?

	/// Represents the service charge applied to the original order.
	/// - Parameters:
	///   - amount_money: The amount of a non-percentage based service charge.  Exactly one of `percentage` or `amount_money` should be set.
	///   - applied_money: The amount of money applied to the order by the service charge, including any inclusive tax amounts, as calculated by Square.  - For fixed-amount service charges, `applied_money` is equal to `amount_money`. - For percentage-based service charges, `applied_money` is the money calculated using the percentage.
	///   - applied_taxes: The list of references to `OrderReturnTax` entities applied to the `OrderReturnServiceCharge`. Each `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level `OrderReturnTax` that is being applied to the `OrderReturnServiceCharge`. On reads, the amount applied is populated.
	///   - calculation_phase: The calculation phase after which to apply the service charge. See [OrderServiceChargeCalculationPhase](#type-orderservicechargecalculationphase) for possible values
	///   - catalog_object_id: The catalog object ID of the associated `CatalogServiceCharge`.
	///   - name: The name of the service charge.
	///   - percentage: The percentage of the service charge, as a string representation of a decimal number. For example, a value of `"7.25"` corresponds to a percentage of 7.25%.  Exactly one of `percentage` or `amount_money` should be set.
	///   - source_service_charge_uid: `uid` of the Service Charge from the Order containing the original charge of the service charge. `source_service_charge_uid` is `null` for unlinked returns.
	///   - taxable: Indicates whether the surcharge can be taxed. Service charges calculated in the `TOTAL_PHASE` cannot be marked as taxable.
	///   - total_money: The total amount of money to collect for the service charge.  __NOTE__: if an inclusive tax is applied to the service charge, `total_money` does not equal `applied_money` plus `total_tax_money` since the inclusive tax amount will already be included in both `applied_money` and `total_tax_money`.
	///   - total_tax_money: The total amount of tax money to collect for the service charge.
	///   - uid: Unique ID that identifies the return service charge only within this order.
	public init(amount_money: Money? = nil, applied_money: Money? = nil, applied_taxes: [OrderLineItemAppliedTax]? = nil, calculation_phase: OrderServiceChargeCalculationPhase? = nil, catalog_object_id: String? = nil, name: String? = nil, percentage: String? = nil, source_service_charge_uid: String? = nil, taxable: Bool? = nil, total_money: Money? = nil, total_tax_money: Money? = nil, uid: String? = nil) {
		self.amount_money = amount_money
		self.applied_money = applied_money
		self.applied_taxes = applied_taxes
		self.calculation_phase = calculation_phase
		self.catalog_object_id = catalog_object_id
		self.name = name
		self.percentage = percentage
		self.source_service_charge_uid = source_service_charge_uid
		self.taxable = taxable
		self.total_money = total_money
		self.total_tax_money = total_tax_money
		self.uid = uid
	}
}

/// Represents a tax being returned that applies to one or more return line items in an order.  Fixed-amount, order-scoped taxes are distributed across all non-zero return line item totals. The amount distributed to each return line item is relative to that item’s contribution to the order subtotal.
public struct OrderReturnTax: Codable {
	/// The amount of the money applied by the tax in an order.
	public var applied_money: Money?
	/// The catalog object id referencing `CatalogTax`.
	public var catalog_object_id: String?
	/// The tax's name.
	public var name: String?
	/// The percentage of the tax, as a string representation of a decimal number. For example, a value of `"7.25"` corresponds to a percentage of 7.25%.
	public var percentage: String?
	/// Indicates the level at which the `OrderReturnTax` applies. For `ORDER` scoped taxes, Square generates references in `applied_taxes` on all `OrderReturnLineItem`s. For `LINE_ITEM` scoped taxes, the tax will only apply to `OrderReturnLineItem`s with references in their `applied_discounts` field. See [OrderLineItemTaxScope](#type-orderlineitemtaxscope) for possible values
	public var scope: OrderLineItemTaxScope?
	/// `uid` of the Tax from the Order which contains the original charge of this tax.
	public var source_tax_uid: String?
	/// Indicates the calculation method used to apply the tax. See [OrderLineItemTaxType](#type-orderlineitemtaxtype) for possible values
	public var type: OrderLineItemTaxType?
	/// Unique ID that identifies the return tax only within this order.
	public var uid: String?

	/// Represents a tax being returned that applies to one or more return line items in an order.  Fixed-amount, order-scoped taxes are distributed across all non-zero return line item totals. The amount distributed to each return line item is relative to that item’s contribution to the order subtotal.
	/// - Parameters:
	///   - applied_money: The amount of the money applied by the tax in an order.
	///   - catalog_object_id: The catalog object id referencing `CatalogTax`.
	///   - name: The tax's name.
	///   - percentage: The percentage of the tax, as a string representation of a decimal number. For example, a value of `"7.25"` corresponds to a percentage of 7.25%.
	///   - scope: Indicates the level at which the `OrderReturnTax` applies. For `ORDER` scoped taxes, Square generates references in `applied_taxes` on all `OrderReturnLineItem`s. For `LINE_ITEM` scoped taxes, the tax will only apply to `OrderReturnLineItem`s with references in their `applied_discounts` field. See [OrderLineItemTaxScope](#type-orderlineitemtaxscope) for possible values
	///   - source_tax_uid: `uid` of the Tax from the Order which contains the original charge of this tax.
	///   - type: Indicates the calculation method used to apply the tax. See [OrderLineItemTaxType](#type-orderlineitemtaxtype) for possible values
	///   - uid: Unique ID that identifies the return tax only within this order.
	public init(applied_money: Money? = nil, catalog_object_id: String? = nil, name: String? = nil, percentage: String? = nil, scope: OrderLineItemTaxScope? = nil, source_tax_uid: String? = nil, type: OrderLineItemTaxType? = nil, uid: String? = nil) {
		self.applied_money = applied_money
		self.catalog_object_id = catalog_object_id
		self.name = name
		self.percentage = percentage
		self.scope = scope
		self.source_tax_uid = source_tax_uid
		self.type = type
		self.uid = uid
	}
}

/// Represents a reward that may be applied to an order if the necessary reward tier criteria are met. Rewards are created through the Loyalty API.
public struct OrderReward: Codable {
	/// The identifier of the reward.
	public var id: String
	/// The identifier of the reward tier corresponding to this reward.
	public var reward_tier_id: String

	/// Represents a reward that may be applied to an order if the necessary reward tier criteria are met. Rewards are created through the Loyalty API.
	/// - Parameters:
	///   - id: The identifier of the reward.
	///   - reward_tier_id: The identifier of the reward tier corresponding to this reward.
	public init(id: String, reward_tier_id: String) {
		self.id = id
		self.reward_tier_id = reward_tier_id
	}
}

/// A rounding adjustment of the money being returned. Commonly used to apply Cash Rounding when the minimum unit of account is smaller than the lowest physical denomination of currency.
public struct OrderRoundingAdjustment: Codable {
	/// Actual rounding adjustment amount.
	public var amount_money: Money?
	/// The name of the rounding adjustment from the original sale Order.
	public var name: String?
	/// Unique ID that identifies the rounding adjustment only within this order.
	public var uid: String?

	/// A rounding adjustment of the money being returned. Commonly used to apply Cash Rounding when the minimum unit of account is smaller than the lowest physical denomination of currency.
	/// - Parameters:
	///   - amount_money: Actual rounding adjustment amount.
	///   - name: The name of the rounding adjustment from the original sale Order.
	///   - uid: Unique ID that identifies the rounding adjustment only within this order.
	public init(amount_money: Money? = nil, name: String? = nil, uid: String? = nil) {
		self.amount_money = amount_money
		self.name = name
		self.uid = uid
	}
}

/// Represents a service charge applied to an order.
public struct OrderServiceCharge: Codable {
	/// The amount of a non-percentage based service charge.  Exactly one of `percentage` or `amount_money` should be set.
	public var amount_money: Money?
	/// The amount of money applied to the order by the service charge, including any inclusive tax amounts, as calculated by Square.  - For fixed-amount service charges, `applied_money` is equal to `amount_money`. - For percentage-based service charges, `applied_money` is the money calculated using the percentage.
	public let applied_money: Money?
	/// The list of references to taxes applied to this service charge. Each `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level `OrderLineItemTax` that is being applied to this service charge. On reads, the amount applied is populated.  An `OrderLineItemAppliedTax` will be automatically created on every taxable service charge for all `ORDER` scoped taxes that are added to the order. `OrderLineItemAppliedTax` records for `LINE_ITEM` scoped taxes must be added in requests for the tax to apply to any taxable service charge.  Taxable service charges have the `taxable` field set to true and calculated in the `SUBTOTAL_PHASE`.  To change the amount of a tax, modify the referenced top-level tax.
	public var applied_taxes: [OrderLineItemAppliedTax]?
	/// The calculation phase at which to apply the service charge. See [OrderServiceChargeCalculationPhase](#type-orderservicechargecalculationphase) for possible values
	public var calculation_phase: OrderServiceChargeCalculationPhase?
	/// The catalog object ID referencing the service charge `CatalogObject`.
	public var catalog_object_id: String?
	/// Application-defined data attached to this service charge. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (personally identifiable information, card details, etc.).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries may also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a max length of 255 characters.  An application may have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  See [Metadata](https://developer.squareup.com/docs/build-basics/metadata) for more information.
	public var metadata: String?
	/// The name of the service charge.
	public var name: String?
	/// The service charge percentage as a string representation of a decimal number. For example, `"7.25"` indicates a service charge of 7.25%.  Exactly 1 of `percentage` or `amount_money` should be set.
	public var percentage: String?
	/// Indicates whether the service charge can be taxed. If set to `true`, order-level taxes automatically apply to the service charge. Note that service charges calculated in the `TOTAL_PHASE` cannot be marked as taxable.
	public var taxable: Bool?
	/// The total amount of money to collect for the service charge.  __Note__: if an inclusive tax is applied to the service charge, `total_money` __does not__ equal `applied_money` plus `total_tax_money` since the inclusive tax amount will already be included in both `applied_money` and `total_tax_money`.
	public let total_money: Money?
	/// The total amount of tax money to collect for the service charge.
	public let total_tax_money: Money?
	/// Unique ID that identifies the service charge only within this order.
	public var uid: String?

	/// Represents a service charge applied to an order.
	/// - Parameters:
	///   - amount_money: The amount of a non-percentage based service charge.  Exactly one of `percentage` or `amount_money` should be set.
	///   - applied_money: The amount of money applied to the order by the service charge, including any inclusive tax amounts, as calculated by Square.  - For fixed-amount service charges, `applied_money` is equal to `amount_money`. - For percentage-based service charges, `applied_money` is the money calculated using the percentage.
	///   - applied_taxes: The list of references to taxes applied to this service charge. Each `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level `OrderLineItemTax` that is being applied to this service charge. On reads, the amount applied is populated.  An `OrderLineItemAppliedTax` will be automatically created on every taxable service charge for all `ORDER` scoped taxes that are added to the order. `OrderLineItemAppliedTax` records for `LINE_ITEM` scoped taxes must be added in requests for the tax to apply to any taxable service charge.  Taxable service charges have the `taxable` field set to true and calculated in the `SUBTOTAL_PHASE`.  To change the amount of a tax, modify the referenced top-level tax.
	///   - calculation_phase: The calculation phase at which to apply the service charge. See [OrderServiceChargeCalculationPhase](#type-orderservicechargecalculationphase) for possible values
	///   - catalog_object_id: The catalog object ID referencing the service charge `CatalogObject`.
	///   - metadata: Application-defined data attached to this service charge. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (personally identifiable information, card details, etc.).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries may also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a max length of 255 characters.  An application may have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  See [Metadata](https://developer.squareup.com/docs/build-basics/metadata) for more information.
	///   - name: The name of the service charge.
	///   - percentage: The service charge percentage as a string representation of a decimal number. For example, `"7.25"` indicates a service charge of 7.25%.  Exactly 1 of `percentage` or `amount_money` should be set.
	///   - taxable: Indicates whether the service charge can be taxed. If set to `true`, order-level taxes automatically apply to the service charge. Note that service charges calculated in the `TOTAL_PHASE` cannot be marked as taxable.
	///   - total_money: The total amount of money to collect for the service charge.  __Note__: if an inclusive tax is applied to the service charge, `total_money` __does not__ equal `applied_money` plus `total_tax_money` since the inclusive tax amount will already be included in both `applied_money` and `total_tax_money`.
	///   - total_tax_money: The total amount of tax money to collect for the service charge.
	///   - uid: Unique ID that identifies the service charge only within this order.
	public init(amount_money: Money? = nil, applied_money: Money? = nil, applied_taxes: [OrderLineItemAppliedTax]? = nil, calculation_phase: OrderServiceChargeCalculationPhase? = nil, catalog_object_id: String? = nil, metadata: String? = nil, name: String? = nil, percentage: String? = nil, taxable: Bool? = nil, total_money: Money? = nil, total_tax_money: Money? = nil, uid: String? = nil) {
		self.amount_money = amount_money
		self.applied_money = applied_money
		self.applied_taxes = applied_taxes
		self.calculation_phase = calculation_phase
		self.catalog_object_id = catalog_object_id
		self.metadata = metadata
		self.name = name
		self.percentage = percentage
		self.taxable = taxable
		self.total_money = total_money
		self.total_tax_money = total_tax_money
		self.uid = uid
	}
}

/// Represents a phase in the process of calculating order totals. Service charges are applied __after__ the indicated phase.  [Read more about how order totals are calculated.](https://developer.squareup.com/docs/docs/orders-api/how-it-works#how-totals-are-calculated)
public enum OrderServiceChargeCalculationPhase: String, Codable {
	/// The service charge will be applied after discounts, but before taxes.
	case SUBTOTAL_PHASE
	/// The service charge will be applied after all discounts and taxes are applied.
	case TOTAL_PHASE
}

/// Represents the origination details of an order.
public struct OrderSource: Codable {
	/// The name used to identify the place (physical or digital) that an order originates. If unset, the name defaults to the name of the application that created the order.
	public var name: String?

	/// Represents the origination details of an order.
	/// - Parameters:
	///   - name: The name used to identify the place (physical or digital) that an order originates. If unset, the name defaults to the name of the application that created the order.
	public init(name: String? = nil) {
		self.name = name
	}
}

/// The state of the order.
public enum OrderState: String, Codable {
	/// Indicates the order is open. Open orders may be updated.
	case OPEN
	/// Indicates the order is completed. Completed orders are fully paid. This is a terminal state.
	case COMPLETED
	/// Indicates the order is canceled. Canceled orders are not paid. This is a terminal state.
	case CANCELED
}

public struct OrderUpdated: Codable {
	/// Timestamp for when the order was created in RFC 3339 format.
	public let created_at: Timestamp?
	/// The ID of the merchant location this order is associated with.
	public var location_id: String?
	/// The order's unique ID.
	public var order_id: String?
	/// The state of the order. See [OrderState](#type-orderstate) for possible values
	public var state: OrderState?
	/// Timestamp for when the order was last updated in RFC 3339 format.
	public let updated_at: Timestamp?
	/// Version number which is incremented each time an update is committed to the order. Orders that were not created through the API will not include a version and thus cannot be updated.  [Read more about working with versions](https://developer.squareup.com/docs/docs/orders-api/manage-orders#update-orders)
	public var version: Int?

	public init(created_at: Timestamp? = nil, location_id: String? = nil, order_id: String? = nil, state: OrderState? = nil, updated_at: Timestamp? = nil, version: Int? = nil) {
		self.created_at = created_at
		self.location_id = location_id
		self.order_id = order_id
		self.state = state
		self.updated_at = updated_at
		self.version = version
	}
}

public struct OrderUpdatedObject: Codable {
	/// Information about the updated order.
	public var order_updated: OrderUpdated?

	public init(order_updated: OrderUpdated? = nil) {
		self.order_updated = order_updated
	}
}

/// Defines the fields that are included in requests to the [PayOrder](#endpoint-payorder) endpoint.
public struct PayOrderRequest: Codable {
	/// A value you specify that uniquely identifies this request among requests you've sent. If you're unsure whether a particular payment request was completed successfully, you can reattempt it with the same idempotency key without worrying about duplicate payments.  See [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency) for more information.
	public var idempotency_key: String
	/// The version of the order being paid. If not supplied, the latest version will be paid.
	public var order_version: Int?
	/// The IDs of the `payments` to collect. The payment total must match the order total.
	public var payment_ids: [String]?

	/// Defines the fields that are included in requests to the [PayOrder](#endpoint-payorder) endpoint.
	/// - Parameters:
	///   - idempotency_key: A value you specify that uniquely identifies this request among requests you've sent. If you're unsure whether a particular payment request was completed successfully, you can reattempt it with the same idempotency key without worrying about duplicate payments.  See [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency) for more information.
	///   - order_version: The version of the order being paid. If not supplied, the latest version will be paid.
	///   - payment_ids: The IDs of the `payments` to collect. The payment total must match the order total.
	public init(idempotency_key: String, order_version: Int? = nil, payment_ids: [String]? = nil) {
		self.idempotency_key = idempotency_key
		self.order_version = order_version
		self.payment_ids = payment_ids
	}
}

/// Defines the fields that are included in the response body of a request to the [PayOrder](#endpoint-payorder) endpoint.
public struct PayOrderResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The paid, updated `order`.
	public var order: Order?

	/// Defines the fields that are included in the response body of a request to the [PayOrder](#endpoint-payorder) endpoint.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - order: The paid, updated `order`.
	public init(errors: [SquareError]? = nil, order: Order? = nil) {
		self.errors = errors
		self.order = order
	}
}

/// Represents a payment processed by the Square API.
public struct Payment: Codable {
	/// The amount processed for this payment, not including `tip_money`.  The amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
	public var amount_money: Money?
	/// The amount the developer is taking as a fee for facilitating the payment on behalf of the seller. This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Take Payments and Collect Fees](https://developer.squareup.com/docs/payments-api/take-payments-and-collect-fees).  The amount cannot be more than 90% of the `total_money` value.
	public var app_fee_money: Money?
	/// The buyer's billing address.
	public let billing_address: Address?
	/// The buyer's email address.
	public let buyer_email_address: String?
	/// Non-confidential details about the source. The details are only populated if the `source_type` is `CARD`.
	public let card_details: CardPaymentDetails?
	/// The timestamp of when the payment was created, in RFC 3339 format.
	public let created_at: Timestamp?
	/// The `Customer` ID of the customer associated with the payment.
	public let customer_id: String?
	/// The action to be applied to the payment when the `delay_duration` has elapsed. This field is read-only.  Current values include `CANCEL`.
	public let delay_action: String?
	/// The duration of time after the payment's creation when Square automatically applies the `delay_action` to the payment. This automatic `delay_action` applies only to payments that do not reach a terminal state (COMPLETED, CANCELED, or FAILED) before the `delay_duration` time period.  This field is specified as a time duration, in RFC 3339 format.  Notes: This feature is only supported for card payments.  Default:  - Card-present payments: "PT36H" (36 hours) from the creation time. - Card-not-present payments: "P7D" (7 days) from the creation time.
	public let delay_duration: Timestamp?
	/// The read-only timestamp of when the `delay_action` is automatically applied, in RFC 3339 format.  Note that this field is calculated by summing the payment's `delay_duration` and `created_at` fields. The `created_at` field is generated by Square and might not exactly match the time on your local machine.
	public let delayed_until: Timestamp?
	/// An optional ID of the employee associated with taking the payment.
	public let employee_id: String?
	/// A unique ID for the payment.
	public let id: String?
	/// The ID of the location associated with the payment.
	public let location_id: String?
	/// An optional note to include when creating a payment.
	public let note: String?
	/// The ID of the order associated with the payment.
	public let order_id: String?
	/// The processing fees and fee adjustments assessed by Square for this payment.
	public let processing_fee: [ProcessingFee]?
	/// The payment's receipt number. The field is missing if a payment is canceled.
	public let receipt_number: String?
	/// The URL for the payment's receipt. The field is only populated for COMPLETED payments.
	public let receipt_url: String?
	/// An optional ID that associates the payment with an entity in another system.
	public let reference_id: String?
	/// A list of `refund_id`s identifying refunds for the payment.
	public let refund_ids: [String]?
	/// The total amount of the payment refunded to date.   This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents).
	public let refunded_money: Money?
	/// Provides information about the risk associated with the payment, as determined by Square. This field is present for payments to sellers that have opted in to receive risk evaluations.
	public let risk_evaluation: RiskEvaluation?
	/// The buyer's shipping address.
	public let shipping_address: Address?
	/// The source type for this payment.  Current values include `CARD`.
	public let source_type: String?
	/// Additional payment information that gets added to the customer's card statement as part of the statement description.  Note that the `statement_description_identifier` might get truncated on the statement description to fit the required information including the Square identifier (SQ *) and the name of the seller taking the payment.
	public let statement_description_identifier: String?
	/// Indicates whether the payment is APPROVED, COMPLETED, CANCELED, or FAILED.
	public let status: String?
	/// The amount designated as a tip.   This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
	public var tip_money: Money?
	/// The total amount for the payment, including `amount_money` and `tip_money`. This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
	public let total_money: Money?
	/// The timestamp of when the payment was last updated, in RFC 3339 format.
	public let updated_at: Timestamp?

	/// Represents a payment processed by the Square API.
	/// - Parameters:
	///   - amount_money: The amount processed for this payment, not including `tip_money`.  The amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
	///   - app_fee_money: The amount the developer is taking as a fee for facilitating the payment on behalf of the seller. This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Take Payments and Collect Fees](https://developer.squareup.com/docs/payments-api/take-payments-and-collect-fees).  The amount cannot be more than 90% of the `total_money` value.
	///   - billing_address: The buyer's billing address.
	///   - buyer_email_address: The buyer's email address.
	///   - card_details: Non-confidential details about the source. The details are only populated if the `source_type` is `CARD`.
	///   - created_at: The timestamp of when the payment was created, in RFC 3339 format.
	///   - customer_id: The `Customer` ID of the customer associated with the payment.
	///   - delay_action: The action to be applied to the payment when the `delay_duration` has elapsed. This field is read-only.  Current values include `CANCEL`.
	///   - delay_duration: The duration of time after the payment's creation when Square automatically applies the `delay_action` to the payment. This automatic `delay_action` applies only to payments that do not reach a terminal state (COMPLETED, CANCELED, or FAILED) before the `delay_duration` time period.  This field is specified as a time duration, in RFC 3339 format.  Notes: This feature is only supported for card payments.  Default:  - Card-present payments: "PT36H" (36 hours) from the creation time. - Card-not-present payments: "P7D" (7 days) from the creation time.
	///   - delayed_until: The read-only timestamp of when the `delay_action` is automatically applied, in RFC 3339 format.  Note that this field is calculated by summing the payment's `delay_duration` and `created_at` fields. The `created_at` field is generated by Square and might not exactly match the time on your local machine.
	///   - employee_id: An optional ID of the employee associated with taking the payment.
	///   - id: A unique ID for the payment.
	///   - location_id: The ID of the location associated with the payment.
	///   - note: An optional note to include when creating a payment.
	///   - order_id: The ID of the order associated with the payment.
	///   - processing_fee: The processing fees and fee adjustments assessed by Square for this payment.
	///   - receipt_number: The payment's receipt number. The field is missing if a payment is canceled.
	///   - receipt_url: The URL for the payment's receipt. The field is only populated for COMPLETED payments.
	///   - reference_id: An optional ID that associates the payment with an entity in another system.
	///   - refund_ids: A list of `refund_id`s identifying refunds for the payment.
	///   - refunded_money: The total amount of the payment refunded to date.   This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents).
	///   - risk_evaluation: Provides information about the risk associated with the payment, as determined by Square. This field is present for payments to sellers that have opted in to receive risk evaluations.
	///   - shipping_address: The buyer's shipping address.
	///   - source_type: The source type for this payment.  Current values include `CARD`.
	///   - statement_description_identifier: Additional payment information that gets added to the customer's card statement as part of the statement description.  Note that the `statement_description_identifier` might get truncated on the statement description to fit the required information including the Square identifier (SQ *) and the name of the seller taking the payment.
	///   - status: Indicates whether the payment is APPROVED, COMPLETED, CANCELED, or FAILED.
	///   - tip_money: The amount designated as a tip.   This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
	///   - total_money: The total amount for the payment, including `amount_money` and `tip_money`. This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
	///   - updated_at: The timestamp of when the payment was last updated, in RFC 3339 format.
	public init(amount_money: Money? = nil, app_fee_money: Money? = nil, billing_address: Address? = nil, buyer_email_address: String? = nil, card_details: CardPaymentDetails? = nil, created_at: Timestamp? = nil, customer_id: String? = nil, delay_action: String? = nil, delay_duration: Timestamp? = nil, delayed_until: Timestamp? = nil, employee_id: String? = nil, id: String? = nil, location_id: String? = nil, note: String? = nil, order_id: String? = nil, processing_fee: [ProcessingFee]? = nil, receipt_number: String? = nil, receipt_url: String? = nil, reference_id: String? = nil, refund_ids: [String]? = nil, refunded_money: Money? = nil, risk_evaluation: RiskEvaluation? = nil, shipping_address: Address? = nil, source_type: String? = nil, statement_description_identifier: String? = nil, status: String? = nil, tip_money: Money? = nil, total_money: Money? = nil, updated_at: Timestamp? = nil) {
		self.amount_money = amount_money
		self.app_fee_money = app_fee_money
		self.billing_address = billing_address
		self.buyer_email_address = buyer_email_address
		self.card_details = card_details
		self.created_at = created_at
		self.customer_id = customer_id
		self.delay_action = delay_action
		self.delay_duration = delay_duration
		self.delayed_until = delayed_until
		self.employee_id = employee_id
		self.id = id
		self.location_id = location_id
		self.note = note
		self.order_id = order_id
		self.processing_fee = processing_fee
		self.receipt_number = receipt_number
		self.receipt_url = receipt_url
		self.reference_id = reference_id
		self.refund_ids = refund_ids
		self.refunded_money = refunded_money
		self.risk_evaluation = risk_evaluation
		self.shipping_address = shipping_address
		self.source_type = source_type
		self.statement_description_identifier = statement_description_identifier
		self.status = status
		self.tip_money = tip_money
		self.total_money = total_money
		self.updated_at = updated_at
	}
}

public struct PaymentOptions: Codable {
	/// Indicates whether the Payment objects created from this `TerminalCheckout` will automatically be `COMPLETED` or left in an `APPROVED` state for later modification.
	public var autocomplete: Bool?

	public init(autocomplete: Bool? = nil) {
		self.autocomplete = autocomplete
	}
}

/// Represents a refund of a payment made using Square. Contains information about the original payment and the amount of money refunded.
public struct PaymentRefund: Codable {
	/// The amount of money refunded. This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents).
	public var amount_money: Money
	/// The amount of money the application developer contributed to help cover the refunded amount. This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
	public var app_fee_money: Money?
	/// The timestamp of when the refund was created, in RFC 3339 format.
	public let created_at: Timestamp?
	/// The unique ID for this refund, generated by Square.
	public var id: String
	/// The location ID associated with the payment this refund is attached to.
	public var location_id: String?
	/// The ID of the order associated with the refund.
	public var order_id: String?
	/// The ID of the payment associated with this refund.
	public var payment_id: String?
	/// Processing fees and fee adjustments assessed by Square for this refund.
	public var processing_fee: [ProcessingFee]?
	/// The reason for the refund.
	public var reason: String?
	/// The refund's status: - `PENDING` - Awaiting approval. - `COMPLETED` - Successfully completed. - `REJECTED` - The refund was rejected. - `FAILED` - An error occurred.
	public var status: String?
	/// The timestamp of when the refund was last updated, in RFC 3339 format.
	public let updated_at: Timestamp?

	/// Represents a refund of a payment made using Square. Contains information about the original payment and the amount of money refunded.
	/// - Parameters:
	///   - amount_money: The amount of money refunded. This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents).
	///   - app_fee_money: The amount of money the application developer contributed to help cover the refunded amount. This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
	///   - created_at: The timestamp of when the refund was created, in RFC 3339 format.
	///   - id: The unique ID for this refund, generated by Square.
	///   - location_id: The location ID associated with the payment this refund is attached to.
	///   - order_id: The ID of the order associated with the refund.
	///   - payment_id: The ID of the payment associated with this refund.
	///   - processing_fee: Processing fees and fee adjustments assessed by Square for this refund.
	///   - reason: The reason for the refund.
	///   - status: The refund's status: - `PENDING` - Awaiting approval. - `COMPLETED` - Successfully completed. - `REJECTED` - The refund was rejected. - `FAILED` - An error occurred.
	///   - updated_at: The timestamp of when the refund was last updated, in RFC 3339 format.
	public init(amount_money: Money, id: String, app_fee_money: Money? = nil, created_at: Timestamp? = nil, location_id: String? = nil, order_id: String? = nil, payment_id: String? = nil, processing_fee: [ProcessingFee]? = nil, reason: String? = nil, status: String? = nil, updated_at: Timestamp? = nil) {
		self.amount_money = amount_money
		self.id = id
		self.app_fee_money = app_fee_money
		self.created_at = created_at
		self.location_id = location_id
		self.order_id = order_id
		self.payment_id = payment_id
		self.processing_fee = processing_fee
		self.reason = reason
		self.status = status
		self.updated_at = updated_at
	}
}

/// Represents the Square processing fee.
public struct ProcessingFee: Codable {
	/// The fee amount, which might be negative, that is assessed or adjusted by Square.  Positive values represent funds being assessed, while negative values represent funds being returned.
	public var amount_money: Money?
	/// The timestamp of when the fee takes effect, in RFC 3339 format.
	public var effective_at: Timestamp?
	/// The type of fee assessed or adjusted. The fee type can be `INITIAL` or `ADJUSTMENT`.
	public var type: String?

	/// Represents the Square processing fee.
	/// - Parameters:
	///   - amount_money: The fee amount, which might be negative, that is assessed or adjusted by Square.  Positive values represent funds being assessed, while negative values represent funds being returned.
	///   - effective_at: The timestamp of when the fee takes effect, in RFC 3339 format.
	///   - type: The type of fee assessed or adjusted. The fee type can be `INITIAL` or `ADJUSTMENT`.
	public init(amount_money: Money? = nil, effective_at: Timestamp? = nil, type: String? = nil) {
		self.amount_money = amount_money
		self.effective_at = effective_at
		self.type = type
	}
}

/// Indicates the Square product used to generate an inventory change.
public enum Product: String, Codable {
	/// Square Point of Sale application.
	case SQUARE_POS
	/// Square Connect APIs (Transactions API, Checkout API).
	case EXTERNAL_API
	/// A Square subscription (various products).
	case BILLING
	/// Square Appointments.
	case APPOINTMENTS
	/// Square Invoices.
	case INVOICES
	/// Square Online Store.
	case ONLINE_STORE
	/// Square Payroll.
	case PAYROLL
	/// Square Dashboard
	case DASHBOARD
	/// Item Library Import
	case ITEM_LIBRARY_IMPORT
	/// A Square product that does not match any other value.
	case OTHER
}

/// 
public enum ProductType: String, Codable {
	case TERMINAL_API
}

/// Describes a `PublishInvoice` request.
public struct PublishInvoiceRequest: Codable {
	/// A unique string that identifies the `PublishInvoice` request. If you do not  provide `idempotency_key` (or provide an empty string as the value), the endpoint  treats each request as independent.  For more information, see [Idempotency](https://developer.squareup.com/docs/docs/working-with-apis/idempotency).
	public var idempotency_key: String?
	/// The version of the `Invoice` to publish. This must match the current version of the invoice, otherwise the request is rejected.
	public var version: Int

	/// Describes a `PublishInvoice` request.
	/// - Parameters:
	///   - idempotency_key: A unique string that identifies the `PublishInvoice` request. If you do not  provide `idempotency_key` (or provide an empty string as the value), the endpoint  treats each request as independent.  For more information, see [Idempotency](https://developer.squareup.com/docs/docs/working-with-apis/idempotency).
	///   - version: The version of the `Invoice` to publish. This must match the current version of the invoice, otherwise the request is rejected.
	public init(version: Int, idempotency_key: String? = nil) {
		self.version = version
		self.idempotency_key = idempotency_key
	}
}

/// Describes a `PublishInvoice` response.
public struct PublishInvoiceResponse: Codable {
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The published invoice.
	public var invoice: Invoice?

	/// Describes a `PublishInvoice` response.
	/// - Parameters:
	///   - errors: Information about errors encountered during the request.
	///   - invoice: The published invoice.
	public init(errors: [SquareError]? = nil, invoice: Invoice? = nil) {
		self.errors = errors
		self.invoice = invoice
	}
}

/// The range of a number value between the specified lower and upper bounds.
public struct Range: Codable {
	/// The upper bound of the number range.
	public var max: String?
	/// The lower bound of the number range.
	public var min: String?

	/// The range of a number value between the specified lower and upper bounds.
	/// - Parameters:
	///   - max: The upper bound of the number range.
	///   - min: The lower bound of the number range.
	public init(max: String? = nil, min: String? = nil) {
		self.max = max
		self.min = min
	}
}

/// A request to redeem a loyalty reward.
public struct RedeemLoyaltyRewardRequest: Codable {
	/// A unique string that identifies this `RedeemLoyaltyReward` request.  Keys can be any valid string, but must be unique for every request.
	public var idempotency_key: String
	/// The ID of the `location` where the reward is redeemed.
	public var location_id: String

	/// A request to redeem a loyalty reward.
	/// - Parameters:
	///   - idempotency_key: A unique string that identifies this `RedeemLoyaltyReward` request.  Keys can be any valid string, but must be unique for every request.
	///   - location_id: The ID of the `location` where the reward is redeemed.
	public init(idempotency_key: String, location_id: String) {
		self.idempotency_key = idempotency_key
		self.location_id = location_id
	}
}

/// A response that includes the `LoyaltyEvent` published for redeeming the reward.
public struct RedeemLoyaltyRewardResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The `LoyaltyEvent` for redeeming the reward.
	public var event: LoyaltyEvent?

	/// A response that includes the `LoyaltyEvent` published for redeeming the reward.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - event: The `LoyaltyEvent` for redeeming the reward.
	public init(errors: [SquareError]? = nil, event: LoyaltyEvent? = nil) {
		self.errors = errors
		self.event = event
	}
}

/// Represents a refund processed for a Square transaction.
public struct Refund: Codable {
	/// Additional recipients (other than the merchant) receiving a portion of this refund. For example, fees assessed on a refund of a purchase by a third party integration.
	public var additional_recipients: [AdditionalRecipient]?
	/// The amount of money refunded to the buyer.
	public var amount_money: Money
	/// The timestamp for when the refund was created, in RFC 3339 format.
	public let created_at: Timestamp?
	/// The refund's unique ID.
	public var id: String
	/// The ID of the refund's associated location.
	public var location_id: String
	/// The amount of Square processing fee money refunded to the *merchant*.
	public var processing_fee_money: Money?
	/// The reason for the refund being issued.
	public var reason: String
	/// The current status of the refund (`PENDING`, `APPROVED`, `REJECTED`, or `FAILED`). See [RefundStatus](#type-refundstatus) for possible values
	public var status: RefundStatus
	/// The ID of the refunded tender.
	public var tender_id: String
	/// The ID of the transaction that the refunded tender is part of.
	public var transaction_id: String

	/// Represents a refund processed for a Square transaction.
	/// - Parameters:
	///   - additional_recipients: Additional recipients (other than the merchant) receiving a portion of this refund. For example, fees assessed on a refund of a purchase by a third party integration.
	///   - amount_money: The amount of money refunded to the buyer.
	///   - created_at: The timestamp for when the refund was created, in RFC 3339 format.
	///   - id: The refund's unique ID.
	///   - location_id: The ID of the refund's associated location.
	///   - processing_fee_money: The amount of Square processing fee money refunded to the *merchant*.
	///   - reason: The reason for the refund being issued.
	///   - status: The current status of the refund (`PENDING`, `APPROVED`, `REJECTED`, or `FAILED`). See [RefundStatus](#type-refundstatus) for possible values
	///   - tender_id: The ID of the refunded tender.
	///   - transaction_id: The ID of the transaction that the refunded tender is part of.
	public init(amount_money: Money, id: String, location_id: String, reason: String, status: RefundStatus, tender_id: String, transaction_id: String, additional_recipients: [AdditionalRecipient]? = nil, created_at: Timestamp? = nil, processing_fee_money: Money? = nil) {
		self.amount_money = amount_money
		self.id = id
		self.location_id = location_id
		self.reason = reason
		self.status = status
		self.tender_id = tender_id
		self.transaction_id = transaction_id
		self.additional_recipients = additional_recipients
		self.created_at = created_at
		self.processing_fee_money = processing_fee_money
	}
}

/// Refunds a payment.
public struct RefundPaymentRequest: Codable {
	/// The amount of money to refund.  This amount cannot be more than the `total_money` value of the payment minus the total amount of all previously completed refunds for this payment.  This amount must be specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).  The currency code must match the currency associated with the business that is charging the card.
	public var amount_money: Money
	/// The amount of money the developer contributes to help cover the refunded amount. This amount is specified in the smallest denomination of the applicable currency (for example,  US dollar amounts are specified in cents).  The value cannot be more than the `amount_money`.  You can specify this parameter in a refund request only if the same parameter was also included  when taking the payment. This is part of the application fee scenario the API supports. For more  information, see [Take Payments and Collect Fees](https://developer.squareup.com/docs/payments-api/take-payments-and-collect-fees).
	public var app_fee_money: Money?
	///  A unique string that identifies this `RefundPayment` request. The key can be any valid string but must be unique for every `RefundPayment` request.  For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
	public var idempotency_key: String
	/// The unique ID of the payment being refunded.
	public var payment_id: String
	/// A description of the reason for the refund.
	public var reason: String?

	/// Refunds a payment.
	/// - Parameters:
	///   - amount_money: The amount of money to refund.  This amount cannot be more than the `total_money` value of the payment minus the total amount of all previously completed refunds for this payment.  This amount must be specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).  The currency code must match the currency associated with the business that is charging the card.
	///   - app_fee_money: The amount of money the developer contributes to help cover the refunded amount. This amount is specified in the smallest denomination of the applicable currency (for example,  US dollar amounts are specified in cents).  The value cannot be more than the `amount_money`.  You can specify this parameter in a refund request only if the same parameter was also included  when taking the payment. This is part of the application fee scenario the API supports. For more  information, see [Take Payments and Collect Fees](https://developer.squareup.com/docs/payments-api/take-payments-and-collect-fees).
	///   - idempotency_key:  A unique string that identifies this `RefundPayment` request. The key can be any valid string but must be unique for every `RefundPayment` request.  For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
	///   - payment_id: The unique ID of the payment being refunded.
	///   - reason: A description of the reason for the refund.
	public init(amount_money: Money, idempotency_key: String, payment_id: String, app_fee_money: Money? = nil, reason: String? = nil) {
		self.amount_money = amount_money
		self.idempotency_key = idempotency_key
		self.payment_id = payment_id
		self.app_fee_money = app_fee_money
		self.reason = reason
	}
}

/// Defines the fields that are included in the response body of a request to the [RefundPayment](#endpoint-refunds-refundpayment) endpoint.  Note: If there are errors processing the request, the refund field might not be present or it might be present in a FAILED state.
public struct RefundPaymentResponse: Codable {
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The successfully created `PaymentRefund`.
	public var refund: PaymentRefund?

	/// Defines the fields that are included in the response body of a request to the [RefundPayment](#endpoint-refunds-refundpayment) endpoint.  Note: If there are errors processing the request, the refund field might not be present or it might be present in a FAILED state.
	/// - Parameters:
	///   - errors: Information about errors encountered during the request.
	///   - refund: The successfully created `PaymentRefund`.
	public init(errors: [SquareError]? = nil, refund: PaymentRefund? = nil) {
		self.errors = errors
		self.refund = refund
	}
}

/// Indicates a refund's current status.
public enum RefundStatus: String, Codable {
	/// The refund is pending.
	case PENDING
	/// The refund has been approved by Square.
	case APPROVED
	/// The refund has been rejected by Square.
	case REJECTED
	/// The refund failed.
	case FAILED
}

/// Defines the parameters that can be included in the body of a request to the [RegisterDomain](#endpoint-registerdomain) endpoint.
public struct RegisterDomainRequest: Codable {
	/// A domain name as described in RFC-1034 that will be registered with ApplePay
	public var domain_name: String

	/// Defines the parameters that can be included in the body of a request to the [RegisterDomain](#endpoint-registerdomain) endpoint.
	/// - Parameters:
	///   - domain_name: A domain name as described in RFC-1034 that will be registered with ApplePay
	public init(domain_name: String) {
		self.domain_name = domain_name
	}
}

/// Defines the fields that are included in the response body of a request to the [RegisterDomain](#endpoint-registerdomain) endpoint.  Either `errors` or `status` will be present in a given response (never both).
public struct RegisterDomainResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// Status of the domain registration.  See `RegisterDomainResponseStatus` for possible values. See [RegisterDomainResponseStatus](#type-registerdomainresponsestatus) for possible values
	public var status: RegisterDomainResponseStatus?

	/// Defines the fields that are included in the response body of a request to the [RegisterDomain](#endpoint-registerdomain) endpoint.  Either `errors` or `status` will be present in a given response (never both).
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - status: Status of the domain registration.  See `RegisterDomainResponseStatus` for possible values. See [RegisterDomainResponseStatus](#type-registerdomainresponsestatus) for possible values
	public init(errors: [SquareError]? = nil, status: RegisterDomainResponseStatus? = nil) {
		self.errors = errors
		self.status = status
	}
}

/// The status of domain registration.
public enum RegisterDomainResponseStatus: String, Codable {
	/// The domain is added, but not verified.
	case PENDING
	/// The domain is added and verified. It can be used to accept Apple Pay transactions.
	case VERIFIED
}

/// Defines the parameters for a `RemoveDisputeEvidence` request.
public struct RemoveDisputeEvidenceRequest: Codable {

	/// Defines the parameters for a `RemoveDisputeEvidence` request.
	public init() {
	}
}

/// Defines the fields in a `RemoveDisputeEvidence` response.
public struct RemoveDisputeEvidenceResponse: Codable {
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?

	/// Defines the fields in a `RemoveDisputeEvidence` response.
	/// - Parameters:
	///   - errors: Information about errors encountered during the request.
	public init(errors: [SquareError]? = nil) {
		self.errors = errors
	}
}

/// Defines the fields that are included in the request body of a request to the [RemoveGroupFromCustomer](#endpoint-removegroupfromcustomer) endpoint.
public struct RemoveGroupFromCustomerRequest: Codable {

	/// Defines the fields that are included in the request body of a request to the [RemoveGroupFromCustomer](#endpoint-removegroupfromcustomer) endpoint.
	public init() {
	}
}

/// Defines the fields that are included in the response body of a request to the [RemoveGroupFromCustomer](#endpoint-removegroupfromcustomer) endpoint.
public struct RemoveGroupFromCustomerResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// Defines the fields that are included in the response body of a request to the [RemoveGroupFromCustomer](#endpoint-removegroupfromcustomer) endpoint.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	public init(errors: [SquareError]? = nil) {
		self.errors = errors
	}
}

public struct RenewTokenRequest: Codable {
	/// The token you want to renew.
	public var access_token: String?

	public init(access_token: String? = nil) {
		self.access_token = access_token
	}
}

public struct RenewTokenResponse: Codable {
	/// The renewed access token. This value might be different from the `access_token` you provided in your request. You provide this token in a header with every request to Connect API endpoints. See [Request and response headers](https://developer.squareup.com/docs/api/connect/v2/#requestandresponseheaders) for the format of this header.
	public var access_token: String?
	/// The date when access_token expires, in [ISO 8601](http://www.iso.org/iso/home/standards/iso8601.htm) format.
	public var expires_at: String?
	/// The ID of the authorizing merchant's business.
	public var merchant_id: String?
	/// __LEGACY FIELD__. The ID of the subscription plan the merchant signed up for. Only present if the merchant signed up for a subscription during authorization.
	public var plan_id: String?
	/// __LEGACY FIELD__. The ID of the merchant subscription associated with the authorization. Only present if the merchant signed up for a subscription during authorization..
	public var subscription_id: String?
	/// This value is always _bearer_.
	public var token_type: String?

	public init(access_token: String? = nil, expires_at: String? = nil, merchant_id: String? = nil, plan_id: String? = nil, subscription_id: String? = nil, token_type: String? = nil) {
		self.access_token = access_token
		self.expires_at = expires_at
		self.merchant_id = merchant_id
		self.plan_id = plan_id
		self.subscription_id = subscription_id
		self.token_type = token_type
	}
}

public struct RetrieveBookingRequest: Codable {

	public init() {
	}
}

public struct RetrieveBookingResponse: Codable {
	/// The booking that was requested.
	public var booking: Booking?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(booking: Booking? = nil, errors: [SquareError]? = nil) {
		self.booking = booking
		self.errors = errors
	}
}

public struct RetrieveBusinessBookingProfileRequest: Codable {

	public init() {
	}
}

public struct RetrieveBusinessBookingProfileResponse: Codable {
	/// The seller's booking profile.
	public var business_booking_profile: BusinessBookingProfile?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(business_booking_profile: BusinessBookingProfile? = nil, errors: [SquareError]? = nil) {
		self.business_booking_profile = business_booking_profile
		self.errors = errors
	}
}

public struct RetrieveCashDrawerShiftRequest: Codable {
	/// The ID of the location to retrieve cash drawer shifts from.
	public var location_id: String

	public init(location_id: String) {
		self.location_id = location_id
	}
}

public struct RetrieveCashDrawerShiftResponse: Codable {
	/// The cash drawer shift queried for.
	public var cash_drawer_shift: CashDrawerShift?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(cash_drawer_shift: CashDrawerShift? = nil, errors: [SquareError]? = nil) {
		self.cash_drawer_shift = cash_drawer_shift
		self.errors = errors
	}
}

public struct RetrieveCatalogObjectRequest: Codable {
	/// Requests objects as of a specific version of the catalog. This allows you to retrieve historical versions of objects. The value to retrieve a specific version of an object can be found in the version field of `CatalogObject`s.
	public var catalog_version: Int?
	/// If `true`, the response will include additional objects that are related to the requested object, as follows:  If the `object` field of the response contains a `CatalogItem`, its associated `CatalogCategory`, `CatalogTax`, `CatalogImage` and `CatalogModifierList` objects will be returned in the `related_objects` field of the response. If the `object` field of the response contains a `CatalogItemVariation`, its parent `CatalogItem` will be returned in the `related_objects` field of the response.  Default value: `false`
	public var include_related_objects: Bool?

	public init(catalog_version: Int? = nil, include_related_objects: Bool? = nil) {
		self.catalog_version = catalog_version
		self.include_related_objects = include_related_objects
	}
}

public struct RetrieveCatalogObjectResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The `CatalogObject`s returned.
	public var object: CatalogObject?
	/// A list of `CatalogObject`s referenced by the object in the `object` field.
	public var related_objects: [CatalogObject]?

	public init(errors: [SquareError]? = nil, object: CatalogObject? = nil, related_objects: [CatalogObject]? = nil) {
		self.errors = errors
		self.object = object
		self.related_objects = related_objects
	}
}

/// Defines the fields that can be provided in a request to the [RetrieveCustomerGroup](#endpoint-retrievecustomergroup) endpoint.
public struct RetrieveCustomerGroupRequest: Codable {

	/// Defines the fields that can be provided in a request to the [RetrieveCustomerGroup](#endpoint-retrievecustomergroup) endpoint.
	public init() {
	}
}

/// Defines the fields that are included in the response body of a request to the [RetrieveCustomerGroup](#endpoint-retrievecustomergroup) endpoint.  One of `errors` or `group` is present in a given response (never both).
public struct RetrieveCustomerGroupResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The retrieved customer group.
	public var group: CustomerGroup?

	/// Defines the fields that are included in the response body of a request to the [RetrieveCustomerGroup](#endpoint-retrievecustomergroup) endpoint.  One of `errors` or `group` is present in a given response (never both).
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - group: The retrieved customer group.
	public init(errors: [SquareError]? = nil, group: CustomerGroup? = nil) {
		self.errors = errors
		self.group = group
	}
}

/// Defines the fields that are included in requests to the RetrieveCustomer endpoint.
public struct RetrieveCustomerRequest: Codable {

	/// Defines the fields that are included in requests to the RetrieveCustomer endpoint.
	public init() {
	}
}

/// Defines the fields that are included in the response body of a request to the RetrieveCustomer endpoint.  One of `errors` or `customer` is present in a given response (never both).
public struct RetrieveCustomerResponse: Codable {
	/// The requested customer.
	public var customer: Customer?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// Defines the fields that are included in the response body of a request to the RetrieveCustomer endpoint.  One of `errors` or `customer` is present in a given response (never both).
	/// - Parameters:
	///   - customer: The requested customer.
	///   - errors: Any errors that occurred during the request.
	public init(customer: Customer? = nil, errors: [SquareError]? = nil) {
		self.customer = customer
		self.errors = errors
	}
}

/// Defines the valid parameters for requests to __RetrieveCustomerSegmentRequest__.
public struct RetrieveCustomerSegmentRequest: Codable {

	/// Defines the valid parameters for requests to __RetrieveCustomerSegmentRequest__.
	public init() {
	}
}

/// Defines the fields included in the response body for requests to __RetrieveCustomerSegment__.  One of `errors` or `segment` is present in a given response (never both).
public struct RetrieveCustomerSegmentResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The retrieved customer segment.
	public var segment: CustomerSegment?

	/// Defines the fields included in the response body for requests to __RetrieveCustomerSegment__.  One of `errors` or `segment` is present in a given response (never both).
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - segment: The retrieved customer segment.
	public init(errors: [SquareError]? = nil, segment: CustomerSegment? = nil) {
		self.errors = errors
		self.segment = segment
	}
}

/// Defines the parameters for a `RetrieveDisputeEvidence` request.
public struct RetrieveDisputeEvidenceRequest: Codable {

	/// Defines the parameters for a `RetrieveDisputeEvidence` request.
	public init() {
	}
}

/// Defines the fields in a `RetrieveDisputeEvidence` response.
public struct RetrieveDisputeEvidenceResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// Metadata about the dispute evidence file.
	public var evidence: DisputeEvidence?

	/// Defines the fields in a `RetrieveDisputeEvidence` response.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - evidence: Metadata about the dispute evidence file.
	public init(errors: [SquareError]? = nil, evidence: DisputeEvidence? = nil) {
		self.errors = errors
		self.evidence = evidence
	}
}

/// Defines the request parameters for the `RetrieveDispute` endpoint.
public struct RetrieveDisputeRequest: Codable {

	/// Defines the request parameters for the `RetrieveDispute` endpoint.
	public init() {
	}
}

/// Defines fields in a `RetrieveDispute` response.
public struct RetrieveDisputeResponse: Codable {
	/// Details about the requested `Dispute`.
	public var dispute: Dispute?
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?

	/// Defines fields in a `RetrieveDispute` response.
	/// - Parameters:
	///   - dispute: Details about the requested `Dispute`.
	///   - errors: Information about errors encountered during the request.
	public init(dispute: Dispute? = nil, errors: [SquareError]? = nil) {
		self.dispute = dispute
		self.errors = errors
	}
}

public struct RetrieveEmployeeRequest: Codable {

	public init() {
	}
}

public struct RetrieveEmployeeResponse: Codable {
	public var employee: Employee?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(employee: Employee? = nil, errors: [SquareError]? = nil) {
		self.employee = employee
		self.errors = errors
	}
}

public struct RetrieveInventoryAdjustmentRequest: Codable {

	public init() {
	}
}

public struct RetrieveInventoryAdjustmentResponse: Codable {
	/// The requested `InventoryAdjustment`.
	public var adjustment: InventoryAdjustment?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(adjustment: InventoryAdjustment? = nil, errors: [SquareError]? = nil) {
		self.adjustment = adjustment
		self.errors = errors
	}
}

public struct RetrieveInventoryChangesRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query.  See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
	public var cursor: String?
	/// The `Location` IDs to look up as a comma-separated list. An empty list queries all locations.
	public var location_ids: String?

	public init(cursor: String? = nil, location_ids: String? = nil) {
		self.cursor = cursor
		self.location_ids = location_ids
	}
}

public struct RetrieveInventoryChangesResponse: Codable {
	/// The set of inventory changes for the requested object and locations.
	public var changes: [InventoryChange]?
	/// The pagination cursor to be used in a subsequent request. If unset, this is the final response.  See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
	public var cursor: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(changes: [InventoryChange]? = nil, cursor: String? = nil, errors: [SquareError]? = nil) {
		self.changes = changes
		self.cursor = cursor
		self.errors = errors
	}
}

public struct RetrieveInventoryCountRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query.  See the [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination) guide for more information.
	public var cursor: String?
	/// The `Location` IDs to look up as a comma-separated list. An empty list queries all locations.
	public var location_ids: String?

	public init(cursor: String? = nil, location_ids: String? = nil) {
		self.cursor = cursor
		self.location_ids = location_ids
	}
}

public struct RetrieveInventoryCountResponse: Codable {
	/// The current calculated inventory counts for the requested object and locations.
	public var counts: [InventoryCount]?
	/// The pagination cursor to be used in a subsequent request. If unset, this is the final response.  See the [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination) guide for more information.
	public var cursor: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(counts: [InventoryCount]? = nil, cursor: String? = nil, errors: [SquareError]? = nil) {
		self.counts = counts
		self.cursor = cursor
		self.errors = errors
	}
}

public struct RetrieveInventoryPhysicalCountRequest: Codable {

	public init() {
	}
}

public struct RetrieveInventoryPhysicalCountResponse: Codable {
	/// The requested `InventoryPhysicalCount`.
	public var count: InventoryPhysicalCount?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(count: InventoryPhysicalCount? = nil, errors: [SquareError]? = nil) {
		self.count = count
		self.errors = errors
	}
}

/// Defines the fields that are included in the request body for the __RetrieveLocation__ endpoint.
public struct RetrieveLocationRequest: Codable {

	/// Defines the fields that are included in the request body for the __RetrieveLocation__ endpoint.
	public init() {
	}
}

/// Defines the fields that the [RetrieveLocation](#endpoint-retrievelocation) endpoint returns in a response.
public struct RetrieveLocationResponse: Codable {
	/// Information on errors encountered during the request.
	public var errors: [SquareError]?
	/// The requested location.
	public var location: Location?

	/// Defines the fields that the [RetrieveLocation](#endpoint-retrievelocation) endpoint returns in a response.
	/// - Parameters:
	///   - errors: Information on errors encountered during the request.
	///   - location: The requested location.
	public init(errors: [SquareError]? = nil, location: Location? = nil) {
		self.errors = errors
		self.location = location
	}
}

/// A request to retrieve a loyalty account.
public struct RetrieveLoyaltyAccountRequest: Codable {

	/// A request to retrieve a loyalty account.
	public init() {
	}
}

/// A response that includes the loyalty account.
public struct RetrieveLoyaltyAccountResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The loyalty account.
	public var loyalty_account: LoyaltyAccount?

	/// A response that includes the loyalty account.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - loyalty_account: The loyalty account.
	public init(errors: [SquareError]? = nil, loyalty_account: LoyaltyAccount? = nil) {
		self.errors = errors
		self.loyalty_account = loyalty_account
	}
}

/// A request to retrieve a loyalty reward.
public struct RetrieveLoyaltyRewardRequest: Codable {

	/// A request to retrieve a loyalty reward.
	public init() {
	}
}

/// A response that includes the loyalty reward.
public struct RetrieveLoyaltyRewardResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The loyalty reward retrieved.
	public var reward: LoyaltyReward?

	/// A response that includes the loyalty reward.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - reward: The loyalty reward retrieved.
	public init(errors: [SquareError]? = nil, reward: LoyaltyReward? = nil) {
		self.errors = errors
		self.reward = reward
	}
}

/// Request object for the [RetrieveMerchant](#endpoint-retrievemerchant) endpoint.
public struct RetrieveMerchantRequest: Codable {

	/// Request object for the [RetrieveMerchant](#endpoint-retrievemerchant) endpoint.
	public init() {
	}
}

/// The response object returned by the [RetrieveMerchant](#endpoint-retrieveMerchant) endpoint.
public struct RetrieveMerchantResponse: Codable {
	/// Information on errors encountered during the request.
	public var errors: [SquareError]?
	/// The requested `Merchant` object.
	public var merchant: Merchant?

	/// The response object returned by the [RetrieveMerchant](#endpoint-retrieveMerchant) endpoint.
	/// - Parameters:
	///   - errors: Information on errors encountered during the request.
	///   - merchant: The requested `Merchant` object.
	public init(errors: [SquareError]? = nil, merchant: Merchant? = nil) {
		self.errors = errors
		self.merchant = merchant
	}
}

public struct RetrieveObsMigrationProfileRequest: Codable {

	public init() {
	}
}

public struct RetrieveObsMigrationProfileResponse: Codable {
	/// The text of the label of the CTA button beneath the banner.
	public var banner_cta_text: String?
	/// The URL to link to when the CTA button is clicked.
	public var banner_cta_url: String?
	/// Indicates whether the seller has enabled the COVID banner (`true`) or not (`false`).
	public var banner_enabled: Bool?
	/// The text appearing on the COVID banner.
	public var banner_text: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(banner_cta_text: String? = nil, banner_cta_url: String? = nil, banner_enabled: Bool? = nil, banner_text: String? = nil, errors: [SquareError]? = nil) {
		self.banner_cta_text = banner_cta_text
		self.banner_cta_url = banner_cta_url
		self.banner_enabled = banner_enabled
		self.banner_text = banner_text
		self.errors = errors
	}
}

public struct RetrieveOrderRequest: Codable {

	public init() {
	}
}

public struct RetrieveOrderResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The requested order.
	public var order: Order?

	public init(errors: [SquareError]? = nil, order: Order? = nil) {
		self.errors = errors
		self.order = order
	}
}

/// Defines parameters in a  [RetrieveSubscription](#endpoint-subscriptions-retrievesubscription) endpoint request.
public struct RetrieveSubscriptionRequest: Codable {

	/// Defines parameters in a  [RetrieveSubscription](#endpoint-subscriptions-retrievesubscription) endpoint request.
	public init() {
	}
}

/// Defines the fields that are included in the response from the [RetrieveSubscription](#endpoint-subscriptions-retrievesubscription) endpoint.
public struct RetrieveSubscriptionResponse: Codable {
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The subscription retrieved.
	public var subscription: Subscription?

	/// Defines the fields that are included in the response from the [RetrieveSubscription](#endpoint-subscriptions-retrievesubscription) endpoint.
	/// - Parameters:
	///   - errors: Information about errors encountered during the request.
	///   - subscription: The subscription retrieved.
	public init(errors: [SquareError]? = nil, subscription: Subscription? = nil) {
		self.errors = errors
		self.subscription = subscription
	}
}

public struct RetrieveTeamMemberBookingProfileRequest: Codable {

	public init() {
	}
}

public struct RetrieveTeamMemberBookingProfileResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The returned team member booking profile.
	public var team_member_booking_profile: TeamMemberBookingProfile?

	public init(errors: [SquareError]? = nil, team_member_booking_profile: TeamMemberBookingProfile? = nil) {
		self.errors = errors
		self.team_member_booking_profile = team_member_booking_profile
	}
}

/// Represents a retrieve request for a `TeamMember` object.
public struct RetrieveTeamMemberRequest: Codable {

	/// Represents a retrieve request for a `TeamMember` object.
	public init() {
	}
}

/// Represents a response from a retrieve request, containing a `TeamMember` object or error messages.
public struct RetrieveTeamMemberResponse: Codable {
	/// The errors that occurred during the request.
	public var errors: [SquareError]?
	/// The successfully retrieved `TeamMember` object.
	public var team_member: TeamMember?

	/// Represents a response from a retrieve request, containing a `TeamMember` object or error messages.
	/// - Parameters:
	///   - errors: The errors that occurred during the request.
	///   - team_member: The successfully retrieved `TeamMember` object.
	public init(errors: [SquareError]? = nil, team_member: TeamMember? = nil) {
		self.errors = errors
		self.team_member = team_member
	}
}

public struct RetrieveTransactionRequest: Codable {

	public init() {
	}
}

/// Defines the fields that are included in the response body of a request to the [RetrieveTransaction](#endpont-retrievetransaction) endpoint.  One of `errors` or `transaction` is present in a given response (never both).
public struct RetrieveTransactionResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The requested transaction.
	public var transaction: Transaction?

	/// Defines the fields that are included in the response body of a request to the [RetrieveTransaction](#endpont-retrievetransaction) endpoint.  One of `errors` or `transaction` is present in a given response (never both).
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - transaction: The requested transaction.
	public init(errors: [SquareError]? = nil, transaction: Transaction? = nil) {
		self.errors = errors
		self.transaction = transaction
	}
}

/// Represents a retrieve request for the wage setting of a team member
public struct RetrieveWageSettingRequest: Codable {

	/// Represents a retrieve request for the wage setting of a team member
	public init() {
	}
}

/// Represents a response from a retrieve request, containing the specified `WageSetting` object or error messages.
public struct RetrieveWageSettingResponse: Codable {
	/// The errors that occurred during the request.
	public var errors: [SquareError]?
	/// The successfully retrieved `WageSetting` object.
	public var wage_setting: WageSetting?

	/// Represents a response from a retrieve request, containing the specified `WageSetting` object or error messages.
	/// - Parameters:
	///   - errors: The errors that occurred during the request.
	///   - wage_setting: The successfully retrieved `WageSetting` object.
	public init(errors: [SquareError]? = nil, wage_setting: WageSetting? = nil) {
		self.errors = errors
		self.wage_setting = wage_setting
	}
}

public struct RevokeTokenRequest: Codable {
	/// The access token of the merchant whose token you want to revoke. Do not provide a value for merchant_id if you provide this parameter.
	public var access_token: String?
	/// The Square issued ID for your application, available from the [application dashboard](https://connect.squareup.com/apps).
	public var client_id: String?
	/// The ID of the merchant whose token you want to revoke. Do not provide a value for access_token if you provide this parameter.
	public var merchant_id: String?
	/// If `true`, terminate the given single access token, but do not terminate the entire authorization. Default: `false`
	public var revoke_only_access_token: Bool?

	public init(access_token: String? = nil, client_id: String? = nil, merchant_id: String? = nil, revoke_only_access_token: Bool? = nil) {
		self.access_token = access_token
		self.client_id = client_id
		self.merchant_id = merchant_id
		self.revoke_only_access_token = revoke_only_access_token
	}
}

public struct RevokeTokenResponse: Codable {
	/// If the request is successful, this is true.
	public var success: Bool?

	public init(success: Bool? = nil) {
		self.success = success
	}
}

/// Represents fraud risk information for the associated payment.  When you take a payment through Square's Payments API (using the `CreatePayment` endpoint), Square evaluates it and assigns a risk level to the payment. Sellers can use this information to determine the course of action (for example, provide the goods/services or refund the payment).
public struct RiskEvaluation: Codable {
	/// The timestamp when payment risk was evaluated, in RFC 3339 format.
	public let created_at: Timestamp?
	/// The risk level associated with the payment See [RiskEvaluationRiskLevel](#type-riskevaluationrisklevel) for possible values
	public var risk_level: RiskEvaluationRiskLevel?

	/// Represents fraud risk information for the associated payment.  When you take a payment through Square's Payments API (using the `CreatePayment` endpoint), Square evaluates it and assigns a risk level to the payment. Sellers can use this information to determine the course of action (for example, provide the goods/services or refund the payment).
	/// - Parameters:
	///   - created_at: The timestamp when payment risk was evaluated, in RFC 3339 format.
	///   - risk_level: The risk level associated with the payment See [RiskEvaluationRiskLevel](#type-riskevaluationrisklevel) for possible values
	public init(created_at: Timestamp? = nil, risk_level: RiskEvaluationRiskLevel? = nil) {
		self.created_at = created_at
		self.risk_level = risk_level
	}
}

/// 
public enum RiskEvaluationRiskLevel: String, Codable {
	/// Indicates Square is still evaluating the payment.
	case PENDING
	/// Indicates payment risk is within the normal range.
	case NORMAL
	/// Indicates elevated risk level associated with the payment.
	case MODERATE
	/// Indicates significantly elevated risk level with the payment.
	case HIGH
}

/// A query filter to search for availabilities by.
public struct SearchAvailabilityFilter: Codable {
	/// The query expression to search for availabilities for an existing booking by matching the specified `booking_id` value. This is commonly used to reschedule an appointment. If this expression is specified, the `location_id` and `segment_filters` expressions are not allowed.
	public var booking_id: String?
	/// The query expression to search for availabilities matching the specified seller location IDs. This query expression is not applicable when `booking_id` is present.
	public var location_id: String?
	/// The list of segment filters to apply. A query with `n` segment filters returns availabilities with `n` segments per availability. It is not applicable when `booking_id` is present.
	public var segment_filters: [SegmentFilter]?
	/// The query expression to search for availabilities matching the specified range of starting times. The range must be at least 24 hours and at most 31 days in length.
	public var start_at_range: TimeRange

	/// A query filter to search for availabilities by.
	/// - Parameters:
	///   - booking_id: The query expression to search for availabilities for an existing booking by matching the specified `booking_id` value. This is commonly used to reschedule an appointment. If this expression is specified, the `location_id` and `segment_filters` expressions are not allowed.
	///   - location_id: The query expression to search for availabilities matching the specified seller location IDs. This query expression is not applicable when `booking_id` is present.
	///   - segment_filters: The list of segment filters to apply. A query with `n` segment filters returns availabilities with `n` segments per availability. It is not applicable when `booking_id` is present.
	///   - start_at_range: The query expression to search for availabilities matching the specified range of starting times. The range must be at least 24 hours and at most 31 days in length.
	public init(start_at_range: TimeRange, booking_id: String? = nil, location_id: String? = nil, segment_filters: [SegmentFilter]? = nil) {
		self.start_at_range = start_at_range
		self.booking_id = booking_id
		self.location_id = location_id
		self.segment_filters = segment_filters
	}
}

/// Query conditions to search for availabilities of bookings.
public struct SearchAvailabilityQuery: Codable {
	/// The query filter to search for availabilities of existing bookings.
	public var filter: SearchAvailabilityFilter

	/// Query conditions to search for availabilities of bookings.
	/// - Parameters:
	///   - filter: The query filter to search for availabilities of existing bookings.
	public init(filter: SearchAvailabilityFilter) {
		self.filter = filter
	}
}

public struct SearchAvailabilityRequest: Codable {
	/// Query conditions used to filter results.
	public var query: SearchAvailabilityQuery

	public init(query: SearchAvailabilityQuery) {
		self.query = query
	}
}

public struct SearchAvailabilityResponse: Codable {
	/// List of slots available for booking.
	public var availabilities: [Availability]?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(availabilities: [Availability]? = nil, errors: [SquareError]? = nil) {
		self.availabilities = availabilities
		self.errors = errors
	}
}

/// Defines the request body for the [SearchCatalogItems](#endpoint-Catalog-SearchCatalogItems) endpoint.
public struct SearchCatalogItemsRequest: Codable {
	/// The category id query expression to return items containing the specified category IDs.
	public var category_ids: [String]?
	/// The pagination token, returned in the previous response, used to fetch the next batch of pending results.
	public var cursor: String?
	/// The customer-attribute filter to return items or item variations matching the specified custom attribute expressions. A maximum number of 10 custom attribute expressions are supported in a single call to the `SearchCatalogItems` endpoint.
	public var custom_attribute_filters: [CustomAttributeFilter]?
	/// The enabled-location query expression to return items and item variations having specified enabled locations.
	public var enabled_location_ids: [String]?
	/// The maximum number of results to return per page. The default value is 100.
	public var limit: Int?
	/// The product types query expression to return items or item variations having the specified product types. See [CatalogItemProductType](#type-catalogitemproducttype) for possible values
	public var product_types: CatalogItemProductType?
	/// The order to sort the results by item names. The default sort order is ascending (`ASC`). See [SortOrder](#type-sortorder) for possible values
	public var sort_order: SortOrder?
	/// The stock-level query expression to return item variations with the specified stock levels. See [SearchCatalogItemsRequestStockLevel](#type-searchcatalogitemsrequeststocklevel) for possible values
	public var stock_levels: SearchCatalogItemsRequestStockLevel?
	/// The text filter expression to return items or item variations containing specified text in the `name`, `description`, or `abbreviation` attribute value of an item, or in the `name`, `sku`, or `upc` attribute value of an item variation.
	public var text_filter: String?

	/// Defines the request body for the [SearchCatalogItems](#endpoint-Catalog-SearchCatalogItems) endpoint.
	/// - Parameters:
	///   - category_ids: The category id query expression to return items containing the specified category IDs.
	///   - cursor: The pagination token, returned in the previous response, used to fetch the next batch of pending results.
	///   - custom_attribute_filters: The customer-attribute filter to return items or item variations matching the specified custom attribute expressions. A maximum number of 10 custom attribute expressions are supported in a single call to the `SearchCatalogItems` endpoint.
	///   - enabled_location_ids: The enabled-location query expression to return items and item variations having specified enabled locations.
	///   - limit: The maximum number of results to return per page. The default value is 100.
	///   - product_types: The product types query expression to return items or item variations having the specified product types. See [CatalogItemProductType](#type-catalogitemproducttype) for possible values
	///   - sort_order: The order to sort the results by item names. The default sort order is ascending (`ASC`). See [SortOrder](#type-sortorder) for possible values
	///   - stock_levels: The stock-level query expression to return item variations with the specified stock levels. See [SearchCatalogItemsRequestStockLevel](#type-searchcatalogitemsrequeststocklevel) for possible values
	///   - text_filter: The text filter expression to return items or item variations containing specified text in the `name`, `description`, or `abbreviation` attribute value of an item, or in the `name`, `sku`, or `upc` attribute value of an item variation.
	public init(category_ids: [String]? = nil, cursor: String? = nil, custom_attribute_filters: [CustomAttributeFilter]? = nil, enabled_location_ids: [String]? = nil, limit: Int? = nil, product_types: CatalogItemProductType? = nil, sort_order: SortOrder? = nil, stock_levels: SearchCatalogItemsRequestStockLevel? = nil, text_filter: String? = nil) {
		self.category_ids = category_ids
		self.cursor = cursor
		self.custom_attribute_filters = custom_attribute_filters
		self.enabled_location_ids = enabled_location_ids
		self.limit = limit
		self.product_types = product_types
		self.sort_order = sort_order
		self.stock_levels = stock_levels
		self.text_filter = text_filter
	}
}

/// Defines supported stock levels of the item inventory.
public enum SearchCatalogItemsRequestStockLevel: String, Codable {
	/// The item inventory is empty.
	case OUT
	/// The item inventory is low.
	case LOW
}

/// Defines the response body returned from the [SearchCatalogItems](#endpoint-Catalog-SearchCatalogItems) endpoint.
public struct SearchCatalogItemsResponse: Codable {
	/// Pagination token used in the next request to return more of the search result.
	public var cursor: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// Returned items matching the specified query expressions.
	public var items: [CatalogObject]?
	/// Ids of returned item variations matching the specified query expression.
	public var matched_variation_ids: [String]?

	/// Defines the response body returned from the [SearchCatalogItems](#endpoint-Catalog-SearchCatalogItems) endpoint.
	/// - Parameters:
	///   - cursor: Pagination token used in the next request to return more of the search result.
	///   - errors: Any errors that occurred during the request.
	///   - items: Returned items matching the specified query expressions.
	///   - matched_variation_ids: Ids of returned item variations matching the specified query expression.
	public init(cursor: String? = nil, errors: [SquareError]? = nil, items: [CatalogObject]? = nil, matched_variation_ids: [String]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.items = items
		self.matched_variation_ids = matched_variation_ids
	}
}

public struct SearchCatalogObjectsRequest: Codable {
	/// Return objects modified after this [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates), in RFC 3339 format, e.g., `2016-09-04T23:59:33.123Z`. The timestamp is exclusive - objects with a timestamp equal to `begin_time` will not be included in the response.
	public var begin_time: Timestamp?
	/// The pagination cursor returned in the previous response. Leave unset for an initial request. See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
	public var cursor: String?
	/// If `true`, deleted objects will be included in the results. Deleted objects will have their `is_deleted` field set to `true`.
	public var include_deleted_objects: Bool?
	/// If `true`, the response will include additional objects that are related to the requested object, as follows:  If a CatalogItem is returned in the object field of the response, its associated CatalogCategory, CatalogTax objects, CatalogImage objects and CatalogModifierList objects will be included in the `related_objects` field of the response.  If a CatalogItemVariation is returned in the object field of the response, its parent CatalogItem will be included in the `related_objects` field of the response.
	public var include_related_objects: Bool?
	/// A limit on the number of results to be returned in a single page. The limit is advisory - the implementation may return more or fewer results. If the supplied limit is negative, zero, or is higher than the maximum limit of 1,000, it will be ignored.
	public var limit: Int?
	/// The desired set of object types to appear in the search results. See [CatalogObjectType](#type-catalogobjecttype) for possible values
	public var object_types: CatalogObjectType?
	/// A query to be used to filter or sort the results. If no query is specified, the entire catalog will be returned.
	public var query: CatalogQuery?

	public init(begin_time: Timestamp? = nil, cursor: String? = nil, include_deleted_objects: Bool? = nil, include_related_objects: Bool? = nil, limit: Int? = nil, object_types: CatalogObjectType? = nil, query: CatalogQuery? = nil) {
		self.begin_time = begin_time
		self.cursor = cursor
		self.include_deleted_objects = include_deleted_objects
		self.include_related_objects = include_related_objects
		self.limit = limit
		self.object_types = object_types
		self.query = query
	}
}

public struct SearchCatalogObjectsResponse: Codable {
	/// The pagination cursor to be used in a subsequent request. If unset, this is the final response. See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
	public var cursor: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// When the associated product catalog was last updated. Will match the value for `end_time` or `cursor` if either field is included in the `SearchCatalog` request.
	public var latest_time: String?
	/// The CatalogObjects returned.
	public var objects: [CatalogObject]?
	/// A list of CatalogObjects referenced by the objects in the `objects` field.
	public var related_objects: [CatalogObject]?

	public init(cursor: String? = nil, errors: [SquareError]? = nil, latest_time: String? = nil, objects: [CatalogObject]? = nil, related_objects: [CatalogObject]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.latest_time = latest_time
		self.objects = objects
		self.related_objects = related_objects
	}
}

/// Defines the fields included in the request body for the SearchCustomers endpoint.
public struct SearchCustomersRequest: Codable {
	/// Include the pagination cursor in subsequent calls to this endpoint to retrieve the next set of results associated with the original query.  See the [Pagination guide](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
	public var cursor: String?
	/// A limit on the number of results to be returned in a single page. The limit is advisory - the implementation may return more or fewer results. If the supplied limit is negative, zero, or is higher than the maximum limit of 100, it will be ignored.
	public var limit: Int?
	/// Query customers based on the given conditions and sort order. Calling SearchCustomers without an explicit query parameter will return all customers ordered alphabetically based on `given_name` and `family_name`.
	public var query: CustomerQuery?

	/// Defines the fields included in the request body for the SearchCustomers endpoint.
	/// - Parameters:
	///   - cursor: Include the pagination cursor in subsequent calls to this endpoint to retrieve the next set of results associated with the original query.  See the [Pagination guide](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
	///   - limit: A limit on the number of results to be returned in a single page. The limit is advisory - the implementation may return more or fewer results. If the supplied limit is negative, zero, or is higher than the maximum limit of 100, it will be ignored.
	///   - query: Query customers based on the given conditions and sort order. Calling SearchCustomers without an explicit query parameter will return all customers ordered alphabetically based on `given_name` and `family_name`.
	public init(cursor: String? = nil, limit: Int? = nil, query: CustomerQuery? = nil) {
		self.cursor = cursor
		self.limit = limit
		self.query = query
	}
}

/// Defines the fields that are included in the response body of a request to the SearchCustomers endpoint.  One of `errors` or `customers` is present in a given response (never both).
public struct SearchCustomersResponse: Codable {
	/// A pagination cursor that can be used during subsequent calls to SearchCustomers to retrieve the next set of results associated with the original query. Pagination cursors are only present when a request succeeds and additional results are available.  See the [Pagination guide](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
	public var cursor: String?
	/// An array of `Customer` objects that match a query.
	public var customers: [Customer]?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// Defines the fields that are included in the response body of a request to the SearchCustomers endpoint.  One of `errors` or `customers` is present in a given response (never both).
	/// - Parameters:
	///   - cursor: A pagination cursor that can be used during subsequent calls to SearchCustomers to retrieve the next set of results associated with the original query. Pagination cursors are only present when a request succeeds and additional results are available.  See the [Pagination guide](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
	///   - customers: An array of `Customer` objects that match a query.
	///   - errors: Any errors that occurred during the request.
	public init(cursor: String? = nil, customers: [Customer]? = nil, errors: [SquareError]? = nil) {
		self.cursor = cursor
		self.customers = customers
		self.errors = errors
	}
}

/// Describes a `SearchInvoices` request.
public struct SearchInvoicesRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint.  Provide this cursor to retrieve the next set of results for your original query.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	public var cursor: String?
	/// The maximum number of invoices to return (200 is the maximum `limit`).  If not provided, the server  uses a default limit of 100 invoices.
	public var limit: Int?
	/// Describes the query criteria for searching invoices.
	public var query: InvoiceQuery

	/// Describes a `SearchInvoices` request.
	/// - Parameters:
	///   - cursor: A pagination cursor returned by a previous call to this endpoint.  Provide this cursor to retrieve the next set of results for your original query.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	///   - limit: The maximum number of invoices to return (200 is the maximum `limit`).  If not provided, the server  uses a default limit of 100 invoices.
	///   - query: Describes the query criteria for searching invoices.
	public init(query: InvoiceQuery, cursor: String? = nil, limit: Int? = nil) {
		self.query = query
		self.cursor = cursor
		self.limit = limit
	}
}

/// Describes a `SearchInvoices` response.
public struct SearchInvoicesResponse: Codable {
	/// When a response is truncated, it includes a cursor that you can use in a  subsequent request to fetch the next set of invoices. If empty, this is the final  response.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	public var cursor: String?
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The list of invoices returned by the search.
	public var invoices: [Invoice]?

	/// Describes a `SearchInvoices` response.
	/// - Parameters:
	///   - cursor: When a response is truncated, it includes a cursor that you can use in a  subsequent request to fetch the next set of invoices. If empty, this is the final  response.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	///   - errors: Information about errors encountered during the request.
	///   - invoices: The list of invoices returned by the search.
	public init(cursor: String? = nil, errors: [SquareError]? = nil, invoices: [Invoice]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.invoices = invoices
	}
}

/// A request to search for loyalty accounts.
public struct SearchLoyaltyAccountsRequest: Codable {
	/// A pagination cursor returned by a previous call to  this endpoint. Provide this to retrieve the next set of  results for the original query.  For more information,  see [Pagination](https://developer.squareup.com/docs/docs/basics/api101/pagination).
	public var cursor: String?
	/// The maximum number of results to include in the response.
	public var limit: Int?
	/// The search criteria for the request.
	public var query: SearchLoyaltyAccountsRequestLoyaltyAccountQuery?

	/// A request to search for loyalty accounts.
	/// - Parameters:
	///   - cursor: A pagination cursor returned by a previous call to  this endpoint. Provide this to retrieve the next set of  results for the original query.  For more information,  see [Pagination](https://developer.squareup.com/docs/docs/basics/api101/pagination).
	///   - limit: The maximum number of results to include in the response.
	///   - query: The search criteria for the request.
	public init(cursor: String? = nil, limit: Int? = nil, query: SearchLoyaltyAccountsRequestLoyaltyAccountQuery? = nil) {
		self.cursor = cursor
		self.limit = limit
		self.query = query
	}
}

/// The search criteria for the loyalty accounts.
public struct SearchLoyaltyAccountsRequestLoyaltyAccountQuery: Codable {
	/// The set of customer IDs to use in the loyalty account search.    This cannot be combined with `mappings`.    Max: 30 customer IDs
	public var customer_ids: [String]?
	/// The set of mappings to use in the loyalty account search.    This cannot be combined with `customer_ids`.    Max: 30 mappings
	public var mappings: [LoyaltyAccountMapping]?

	/// The search criteria for the loyalty accounts.
	/// - Parameters:
	///   - customer_ids: The set of customer IDs to use in the loyalty account search.    This cannot be combined with `mappings`.    Max: 30 customer IDs
	///   - mappings: The set of mappings to use in the loyalty account search.    This cannot be combined with `customer_ids`.    Max: 30 mappings
	public init(customer_ids: [String]? = nil, mappings: [LoyaltyAccountMapping]? = nil) {
		self.customer_ids = customer_ids
		self.mappings = mappings
	}
}

/// A response that includes loyalty accounts that satisfy the search criteria.
public struct SearchLoyaltyAccountsResponse: Codable {
	/// The pagination cursor to use in a subsequent  request. If empty, this is the final response. For more information,  see [Pagination](https://developer.squareup.com/docs/docs/basics/api101/pagination).
	public var cursor: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The loyalty accounts that met the search criteria,   in order of creation date.
	public var loyalty_accounts: [LoyaltyAccount]?

	/// A response that includes loyalty accounts that satisfy the search criteria.
	/// - Parameters:
	///   - cursor: The pagination cursor to use in a subsequent  request. If empty, this is the final response. For more information,  see [Pagination](https://developer.squareup.com/docs/docs/basics/api101/pagination).
	///   - errors: Any errors that occurred during the request.
	///   - loyalty_accounts: The loyalty accounts that met the search criteria,   in order of creation date.
	public init(cursor: String? = nil, errors: [SquareError]? = nil, loyalty_accounts: [LoyaltyAccount]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.loyalty_accounts = loyalty_accounts
	}
}

/// A request to search for loyalty events.
public struct SearchLoyaltyEventsRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query. For more information, see [Pagination](https://developer.squareup.com/docs/docs/basics/api101/pagination).
	public var cursor: String?
	/// The maximum number of results to include in the response.  The last page might contain fewer events.  The default is 30 events.
	public var limit: Int?
	/// A set of one or more predefined query filters to apply when  searching for loyalty events. The endpoint performs a logical AND to  evaluate multiple filters and performs a logical OR on arrays   that specifies multiple field values.
	public var query: LoyaltyEventQuery?

	/// A request to search for loyalty events.
	/// - Parameters:
	///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query. For more information, see [Pagination](https://developer.squareup.com/docs/docs/basics/api101/pagination).
	///   - limit: The maximum number of results to include in the response.  The last page might contain fewer events.  The default is 30 events.
	///   - query: A set of one or more predefined query filters to apply when  searching for loyalty events. The endpoint performs a logical AND to  evaluate multiple filters and performs a logical OR on arrays   that specifies multiple field values.
	public init(cursor: String? = nil, limit: Int? = nil, query: LoyaltyEventQuery? = nil) {
		self.cursor = cursor
		self.limit = limit
		self.query = query
	}
}

/// A response that contains loyalty events that satisfy the search  criteria, in order by the `created_at` date.
public struct SearchLoyaltyEventsResponse: Codable {
	/// The pagination cursor to be used in a subsequent  request. If empty, this is the final response.  For more information,  see [Pagination](https://developer.squareup.com/docs/docs/basics/api101/pagination).
	public var cursor: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The loyalty events that satisfy the search criteria.
	public var events: [LoyaltyEvent]?

	/// A response that contains loyalty events that satisfy the search  criteria, in order by the `created_at` date.
	/// - Parameters:
	///   - cursor: The pagination cursor to be used in a subsequent  request. If empty, this is the final response.  For more information,  see [Pagination](https://developer.squareup.com/docs/docs/basics/api101/pagination).
	///   - errors: Any errors that occurred during the request.
	///   - events: The loyalty events that satisfy the search criteria.
	public init(cursor: String? = nil, errors: [SquareError]? = nil, events: [LoyaltyEvent]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.events = events
	}
}

/// A request to search for loyalty rewards.
public struct SearchLoyaltyRewardsRequest: Codable {
	/// A pagination cursor returned by a previous call to  this endpoint. Provide this to retrieve the next set of  results for the original query. For more information,  see [Pagination](https://developer.squareup.com/docs/docs/basics/api101/pagination).
	public var cursor: String?
	/// The maximum number of results to return in the response.
	public var limit: Int?
	/// The search criteria for the request.  If empty, the endpoint retrieves all loyalty rewards in the loyalty program.
	public var query: SearchLoyaltyRewardsRequestLoyaltyRewardQuery?

	/// A request to search for loyalty rewards.
	/// - Parameters:
	///   - cursor: A pagination cursor returned by a previous call to  this endpoint. Provide this to retrieve the next set of  results for the original query. For more information,  see [Pagination](https://developer.squareup.com/docs/docs/basics/api101/pagination).
	///   - limit: The maximum number of results to return in the response.
	///   - query: The search criteria for the request.  If empty, the endpoint retrieves all loyalty rewards in the loyalty program.
	public init(cursor: String? = nil, limit: Int? = nil, query: SearchLoyaltyRewardsRequestLoyaltyRewardQuery? = nil) {
		self.cursor = cursor
		self.limit = limit
		self.query = query
	}
}

/// The set of search requirements.
public struct SearchLoyaltyRewardsRequestLoyaltyRewardQuery: Codable {
	/// The ID of the `loyalty account` to which the loyalty reward belongs.
	public var loyalty_account_id: String
	/// The status of the loyalty reward. See [LoyaltyRewardStatus](#type-loyaltyrewardstatus) for possible values
	public var status: LoyaltyRewardStatus?

	/// The set of search requirements.
	/// - Parameters:
	///   - loyalty_account_id: The ID of the `loyalty account` to which the loyalty reward belongs.
	///   - status: The status of the loyalty reward. See [LoyaltyRewardStatus](#type-loyaltyrewardstatus) for possible values
	public init(loyalty_account_id: String, status: LoyaltyRewardStatus? = nil) {
		self.loyalty_account_id = loyalty_account_id
		self.status = status
	}
}

/// A response that includes the loyalty rewards satisfying the search criteria.
public struct SearchLoyaltyRewardsResponse: Codable {
	/// The pagination cursor to be used in a subsequent  request. If empty, this is the final response.
	public var cursor: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The loyalty rewards that satisfy the search criteria. These are returned in descending order by `updated_at`.
	public var rewards: [LoyaltyReward]?

	/// A response that includes the loyalty rewards satisfying the search criteria.
	/// - Parameters:
	///   - cursor: The pagination cursor to be used in a subsequent  request. If empty, this is the final response.
	///   - errors: Any errors that occurred during the request.
	///   - rewards: The loyalty rewards that satisfy the search criteria. These are returned in descending order by `updated_at`.
	public init(cursor: String? = nil, errors: [SquareError]? = nil, rewards: [LoyaltyReward]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.rewards = rewards
	}
}

/// Filter based on Order `customer_id` and any Tender `customer_id` associated with the Order. Does not filter based on the [FulfillmentRecipient](#type-orderfulfillmentrecipient) `customer_id`.
public struct SearchOrdersCustomerFilter: Codable {
	/// List of customer IDs to filter by.  Max: 10 customer IDs.
	public var customer_ids: [String]?

	/// Filter based on Order `customer_id` and any Tender `customer_id` associated with the Order. Does not filter based on the [FulfillmentRecipient](#type-orderfulfillmentrecipient) `customer_id`.
	/// - Parameters:
	///   - customer_ids: List of customer IDs to filter by.  Max: 10 customer IDs.
	public init(customer_ids: [String]? = nil) {
		self.customer_ids = customer_ids
	}
}

/// Filter for `Order` objects based on whether their `CREATED_AT`, `CLOSED_AT` or `UPDATED_AT` timestamps fall within a specified time range. You can specify the time range and which timestamp to filter for. You can filter for only one time range at a time.  For each time range, the start time and end time are inclusive. If the end time is absent, it defaults to the time of the first request for the cursor.  __Important:__ If you use the DateTimeFilter in a SearchOrders query, you must also set the `sort_field` in [OrdersSort](#type-searchorderordersort) to the same field you filter for. For example, if you set the `CLOSED_AT` field in DateTimeFilter, you must also set the `sort_field` in SearchOrdersSort to `CLOSED_AT`. Otherwise, SearchOrders will throw an error. [Learn more about filtering orders by time range](/orders-api/manage-orders#important-note-on-filtering-orders-by-time-range).
public struct SearchOrdersDateTimeFilter: Codable {
	/// Time range for filtering on the `closed_at` timestamp. If you use this value, you must also set the `sort_field` in the OrdersSearchSort object to `CLOSED_AT`.
	public var closed_at: TimeRange?
	/// Time range for filtering on the `created_at` timestamp. If you use this value, you must also set the `sort_field` in the OrdersSearchSort object to `CREATED_AT`.
	public var created_at: TimeRange?
	/// Time range for filtering on the `updated_at` timestamp. If you use this value, you must also set the `sort_field` in the OrdersSearchSort object to `UPDATED_AT`.
	public var updated_at: TimeRange?

	/// Filter for `Order` objects based on whether their `CREATED_AT`, `CLOSED_AT` or `UPDATED_AT` timestamps fall within a specified time range. You can specify the time range and which timestamp to filter for. You can filter for only one time range at a time.  For each time range, the start time and end time are inclusive. If the end time is absent, it defaults to the time of the first request for the cursor.  __Important:__ If you use the DateTimeFilter in a SearchOrders query, you must also set the `sort_field` in [OrdersSort](#type-searchorderordersort) to the same field you filter for. For example, if you set the `CLOSED_AT` field in DateTimeFilter, you must also set the `sort_field` in SearchOrdersSort to `CLOSED_AT`. Otherwise, SearchOrders will throw an error. [Learn more about filtering orders by time range](/orders-api/manage-orders#important-note-on-filtering-orders-by-time-range).
	/// - Parameters:
	///   - closed_at: Time range for filtering on the `closed_at` timestamp. If you use this value, you must also set the `sort_field` in the OrdersSearchSort object to `CLOSED_AT`.
	///   - created_at: Time range for filtering on the `created_at` timestamp. If you use this value, you must also set the `sort_field` in the OrdersSearchSort object to `CREATED_AT`.
	///   - updated_at: Time range for filtering on the `updated_at` timestamp. If you use this value, you must also set the `sort_field` in the OrdersSearchSort object to `UPDATED_AT`.
	public init(closed_at: TimeRange? = nil, created_at: TimeRange? = nil, updated_at: TimeRange? = nil) {
		self.closed_at = closed_at
		self.created_at = created_at
		self.updated_at = updated_at
	}
}

/// Filtering criteria to use for a SearchOrders request. Multiple filters will be ANDed together.
public struct SearchOrdersFilter: Codable {
	/// Filter by customers associated with the order.
	public var customer_filter: SearchOrdersCustomerFilter?
	/// Filter for results within a time range.  __Important:__ If you filter for orders by time range, you must set SearchOrdersSort to sort by the same field. [Learn more about filtering orders by time range](https://developer.squareup.com/docs/orders-api/manage-orders#important-note-on-filtering-orders-by-time-range)
	public var date_time_filter: SearchOrdersDateTimeFilter?
	/// Filter by fulfillment type or state.
	public var fulfillment_filter: SearchOrdersFulfillmentFilter?
	/// Filter by source of order.
	public var source_filter: SearchOrdersSourceFilter?
	/// Filter by ``OrderState``.
	public var state_filter: SearchOrdersStateFilter?

	/// Filtering criteria to use for a SearchOrders request. Multiple filters will be ANDed together.
	/// - Parameters:
	///   - customer_filter: Filter by customers associated with the order.
	///   - date_time_filter: Filter for results within a time range.  __Important:__ If you filter for orders by time range, you must set SearchOrdersSort to sort by the same field. [Learn more about filtering orders by time range](https://developer.squareup.com/docs/orders-api/manage-orders#important-note-on-filtering-orders-by-time-range)
	///   - fulfillment_filter: Filter by fulfillment type or state.
	///   - source_filter: Filter by source of order.
	///   - state_filter: Filter by ``OrderState``.
	public init(customer_filter: SearchOrdersCustomerFilter? = nil, date_time_filter: SearchOrdersDateTimeFilter? = nil, fulfillment_filter: SearchOrdersFulfillmentFilter? = nil, source_filter: SearchOrdersSourceFilter? = nil, state_filter: SearchOrdersStateFilter? = nil) {
		self.customer_filter = customer_filter
		self.date_time_filter = date_time_filter
		self.fulfillment_filter = fulfillment_filter
		self.source_filter = source_filter
		self.state_filter = state_filter
	}
}

/// Filter based on [Order Fulfillment](#type-orderfulfillment) information.
public struct SearchOrdersFulfillmentFilter: Codable {
	/// List of `fulfillment states` to filter for. Will return orders if any of its fulfillments match any of the fulfillment states listed in this field. See [OrderFulfillmentState](#type-orderfulfillmentstate) for possible values
	public var fulfillment_states: OrderFulfillmentState?
	/// List of `fulfillment types` to filter for. Will return orders if any of its fulfillments match any of the fulfillment types listed in this field. See [OrderFulfillmentType](#type-orderfulfillmenttype) for possible values
	public var fulfillment_types: OrderFulfillmentType?

	/// Filter based on [Order Fulfillment](#type-orderfulfillment) information.
	/// - Parameters:
	///   - fulfillment_states: List of `fulfillment states` to filter for. Will return orders if any of its fulfillments match any of the fulfillment states listed in this field. See [OrderFulfillmentState](#type-orderfulfillmentstate) for possible values
	///   - fulfillment_types: List of `fulfillment types` to filter for. Will return orders if any of its fulfillments match any of the fulfillment types listed in this field. See [OrderFulfillmentType](#type-orderfulfillmenttype) for possible values
	public init(fulfillment_states: OrderFulfillmentState? = nil, fulfillment_types: OrderFulfillmentType? = nil) {
		self.fulfillment_states = fulfillment_states
		self.fulfillment_types = fulfillment_types
	}
}

/// Contains query criteria for the search.
public struct SearchOrdersQuery: Codable {
	/// Criteria to filter results by.
	public var filter: SearchOrdersFilter?
	/// Criteria to sort results by.
	public var sort: SearchOrdersSort?

	/// Contains query criteria for the search.
	/// - Parameters:
	///   - filter: Criteria to filter results by.
	///   - sort: Criteria to sort results by.
	public init(filter: SearchOrdersFilter? = nil, sort: SearchOrdersSort? = nil) {
		self.filter = filter
		self.sort = sort
	}
}

/// The request does not have any required fields. When given no query criteria, SearchOrders will return all results for all of the merchant’s locations. When fetching additional pages using a `cursor`, the `query` must be equal to the `query` used to fetch the first page of results.
public struct SearchOrdersRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query. See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
	public var cursor: String?
	/// Maximum number of results to be returned in a single page. It is possible to receive fewer results than the specified limit on a given page.  Default: `500`
	public var limit: Int?
	/// The location IDs for the orders to query. All locations must belong to the same merchant.  Min: 1 location IDs.  Max: 10 location IDs.
	public var location_ids: [String]?
	/// Query conditions used to filter or sort the results. Note that when fetching additional pages using a cursor, the query must be equal to the query used to fetch the first page of results.
	public var query: SearchOrdersQuery?
	/// Boolean that controls the format of the search results. If `true`, SearchOrders will return ``OrderEntry`` objects. If `false`, SearchOrders will return complete Order objects.  Default: `false`.
	public var return_entries: Bool?

	/// The request does not have any required fields. When given no query criteria, SearchOrders will return all results for all of the merchant’s locations. When fetching additional pages using a `cursor`, the `query` must be equal to the `query` used to fetch the first page of results.
	/// - Parameters:
	///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query. See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
	///   - limit: Maximum number of results to be returned in a single page. It is possible to receive fewer results than the specified limit on a given page.  Default: `500`
	///   - location_ids: The location IDs for the orders to query. All locations must belong to the same merchant.  Min: 1 location IDs.  Max: 10 location IDs.
	///   - query: Query conditions used to filter or sort the results. Note that when fetching additional pages using a cursor, the query must be equal to the query used to fetch the first page of results.
	///   - return_entries: Boolean that controls the format of the search results. If `true`, SearchOrders will return ``OrderEntry`` objects. If `false`, SearchOrders will return complete Order objects.  Default: `false`.
	public init(cursor: String? = nil, limit: Int? = nil, location_ids: [String]? = nil, query: SearchOrdersQuery? = nil, return_entries: Bool? = nil) {
		self.cursor = cursor
		self.limit = limit
		self.location_ids = location_ids
		self.query = query
		self.return_entries = return_entries
	}
}

/// Only one of `order_entries` or `orders` fields will be set, depending on whether `return_entries` was set on the [SearchOrdersRequest](#type-searchorderrequest).
public struct SearchOrdersResponse: Codable {
	/// The pagination cursor to be used in a subsequent request. If unset, this is the final response. See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
	public var cursor: String?
	/// `Errors` encountered during the search.
	public var errors: [SquareError]?
	/// List of `OrderEntries` that fit the query conditions. Populated only if `return_entries` was set to `true` in the request.
	public var order_entries: [OrderEntry]?
	/// List of `Order` objects that match query conditions. Populated only if `return_entries` in the request is set to `false`.
	public var orders: [Order]?

	/// Only one of `order_entries` or `orders` fields will be set, depending on whether `return_entries` was set on the [SearchOrdersRequest](#type-searchorderrequest).
	/// - Parameters:
	///   - cursor: The pagination cursor to be used in a subsequent request. If unset, this is the final response. See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
	///   - errors: `Errors` encountered during the search.
	///   - order_entries: List of `OrderEntries` that fit the query conditions. Populated only if `return_entries` was set to `true` in the request.
	///   - orders: List of `Order` objects that match query conditions. Populated only if `return_entries` in the request is set to `false`.
	public init(cursor: String? = nil, errors: [SquareError]? = nil, order_entries: [OrderEntry]? = nil, orders: [Order]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.order_entries = order_entries
		self.orders = orders
	}
}

/// Sorting criteria for a SearchOrders request. Results can only be sorted by a timestamp field.
public struct SearchOrdersSort: Codable {
	/// The field to sort by.  __Important:__ When using a `DateTimeFilter`, `sort_field` must match the timestamp field that the DateTimeFilter uses to filter. For example, If you set your `sort_field` to `CLOSED_AT` and you use a DateTimeFilter, your DateTimeFilter must filter for orders by their `CLOSED_AT` date. If this field does not match the timestamp field in `DateTimeFilter`, SearchOrders will return an error.  Default: `CREATED_AT`. See [SearchOrdersSortField](#type-searchorderssortfield) for possible values
	public var sort_field: SearchOrdersSortField
	/// The chronological order in which results are returned. Defaults to `DESC`. See [SortOrder](#type-sortorder) for possible values
	public var sort_order: SortOrder?

	/// Sorting criteria for a SearchOrders request. Results can only be sorted by a timestamp field.
	/// - Parameters:
	///   - sort_field: The field to sort by.  __Important:__ When using a `DateTimeFilter`, `sort_field` must match the timestamp field that the DateTimeFilter uses to filter. For example, If you set your `sort_field` to `CLOSED_AT` and you use a DateTimeFilter, your DateTimeFilter must filter for orders by their `CLOSED_AT` date. If this field does not match the timestamp field in `DateTimeFilter`, SearchOrders will return an error.  Default: `CREATED_AT`. See [SearchOrdersSortField](#type-searchorderssortfield) for possible values
	///   - sort_order: The chronological order in which results are returned. Defaults to `DESC`. See [SortOrder](#type-sortorder) for possible values
	public init(sort_field: SearchOrdersSortField, sort_order: SortOrder? = nil) {
		self.sort_field = sort_field
		self.sort_order = sort_order
	}
}

/// Specifies which timestamp to use to sort SearchOrder results.
public enum SearchOrdersSortField: String, Codable {
	/// Time when the order was created in RFC-3339 format. If you are also filtering for a time range in this query, you must set the `CREATED_AT` field in your DateTimeFilter.
	case CREATED_AT
	/// Time when the order last updated in RFC-3339 format. If you are also filtering for a time range in this query, you must set the `UPDATED_AT` field in your DateTimeFilter.
	case UPDATED_AT
	/// Time when the order was closed in RFC-3339 format. If you use this value, you must also set a StateFilter with closed states. If you are also filtering for a time range in this query, you must set the `CLOSED_AT` field in your DateTimeFilter.
	case CLOSED_AT
}

/// Filter based on order `source` information.
public struct SearchOrdersSourceFilter: Codable {
	/// Filters by `Source` `name`. Will return any orders with with a `source.name` that matches any of the listed source names.  Max: 10 source names.
	public var source_names: [String]?

	/// Filter based on order `source` information.
	/// - Parameters:
	///   - source_names: Filters by `Source` `name`. Will return any orders with with a `source.name` that matches any of the listed source names.  Max: 10 source names.
	public init(source_names: [String]? = nil) {
		self.source_names = source_names
	}
}

/// Filter by current Order `state`.
public struct SearchOrdersStateFilter: Codable {
	/// States to filter for. See [OrderState](#type-orderstate) for possible values
	public var states: OrderState

	/// Filter by current Order `state`.
	/// - Parameters:
	///   - states: States to filter for. See [OrderState](#type-orderstate) for possible values
	public init(states: OrderState) {
		self.states = states
	}
}

/// A request for a filtered and sorted set of `Shift` objects.
public struct SearchShiftsRequest: Codable {
	/// opaque cursor for fetching the next page.
	public var cursor: String?
	/// number of resources in a page (200 by default).
	public var limit: Int?
	/// Query filters.
	public var query: ShiftQuery?

	/// A request for a filtered and sorted set of `Shift` objects.
	/// - Parameters:
	///   - cursor: opaque cursor for fetching the next page.
	///   - limit: number of resources in a page (200 by default).
	///   - query: Query filters.
	public init(cursor: String? = nil, limit: Int? = nil, query: ShiftQuery? = nil) {
		self.cursor = cursor
		self.limit = limit
		self.query = query
	}
}

/// The response to a request for `Shift` objects. Contains the requested `Shift` objects. May contain a set of `Error` objects if the request resulted in errors.
public struct SearchShiftsResponse: Codable {
	/// Opaque cursor for fetching the next page.
	public var cursor: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// Shifts
	public var shifts: [Shift]?

	/// The response to a request for `Shift` objects. Contains the requested `Shift` objects. May contain a set of `Error` objects if the request resulted in errors.
	/// - Parameters:
	///   - cursor: Opaque cursor for fetching the next page.
	///   - errors: Any errors that occurred during the request.
	///   - shifts: Shifts
	public init(cursor: String? = nil, errors: [SquareError]? = nil, shifts: [Shift]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.shifts = shifts
	}
}

/// Represents a set of SearchSubscriptionsQuery filters used to limit the set of Subscriptions returned by SearchSubscriptions.
public struct SearchSubscriptionsFilter: Codable {
	/// A filter to select subscriptions based on the customer.
	public var customer_ids: [String]?
	/// A filter to select subscriptions based the location.
	public var location_ids: [String]?

	/// Represents a set of SearchSubscriptionsQuery filters used to limit the set of Subscriptions returned by SearchSubscriptions.
	/// - Parameters:
	///   - customer_ids: A filter to select subscriptions based on the customer.
	///   - location_ids: A filter to select subscriptions based the location.
	public init(customer_ids: [String]? = nil, location_ids: [String]? = nil) {
		self.customer_ids = customer_ids
		self.location_ids = location_ids
	}
}

/// Represents a query (including filtering criteria) used to search for subscriptions.
public struct SearchSubscriptionsQuery: Codable {
	/// A list of filtering criteria.
	public var filter: SearchSubscriptionsFilter?

	/// Represents a query (including filtering criteria) used to search for subscriptions.
	/// - Parameters:
	///   - filter: A list of filtering criteria.
	public init(filter: SearchSubscriptionsFilter? = nil) {
		self.filter = filter
	}
}

/// Defines parameters in a [SearchSubscriptions](#endpoint-subscriptions-searchsubscriptions) endpoint  request.
public struct SearchSubscriptionsRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	public var cursor: String?
	/// The upper limit on the number of subscriptions to return  in the response.   Default: `200`
	public var limit: Int?
	/// Query subscriptions based on the given conditions and sort order. Calling SearchSubscriptions without an explicit query parameter will return all subscriptions.
	public var query: SearchSubscriptionsQuery?

	/// Defines parameters in a [SearchSubscriptions](#endpoint-subscriptions-searchsubscriptions) endpoint  request.
	/// - Parameters:
	///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	///   - limit: The upper limit on the number of subscriptions to return  in the response.   Default: `200`
	///   - query: Query subscriptions based on the given conditions and sort order. Calling SearchSubscriptions without an explicit query parameter will return all subscriptions.
	public init(cursor: String? = nil, limit: Int? = nil, query: SearchSubscriptionsQuery? = nil) {
		self.cursor = cursor
		self.limit = limit
		self.query = query
	}
}

/// Defines the fields that are included in the response from the [SearchSubscriptions](#endpoint-subscriptions-searchsubscriptions) endpoint.
public struct SearchSubscriptionsResponse: Codable {
	/// When a response is truncated, it includes a cursor that you can  use in a subsequent request to fetch the next set of subscriptions.  If empty, this is the final response.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	public var cursor: String?
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The search result.
	public var subscriptions: [Subscription]?

	/// Defines the fields that are included in the response from the [SearchSubscriptions](#endpoint-subscriptions-searchsubscriptions) endpoint.
	/// - Parameters:
	///   - cursor: When a response is truncated, it includes a cursor that you can  use in a subsequent request to fetch the next set of subscriptions.  If empty, this is the final response.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	///   - errors: Information about errors encountered during the request.
	///   - subscriptions: The search result.
	public init(cursor: String? = nil, errors: [SquareError]? = nil, subscriptions: [Subscription]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.subscriptions = subscriptions
	}
}

/// Represents a filter used in a search for `TeamMember` objects. `AND` logic is applied between the individual fields, and `OR` logic is applied within list-based fields. For example, setting this filter value, ``` filter = (locations_ids = ["A", "B"], status = ACTIVE) ``` returns only active team members assigned to either location "A" or "B".
public struct SearchTeamMembersFilter: Codable {
	/// When present, filter by team members assigned to the specified locations. When empty, include team members assigned to any location.
	public var location_ids: [String]?
	/// When present, filter by team members who match the given status. When empty, include team members of all statuses. See [TeamMemberStatus](#type-teammemberstatus) for possible values
	public var status: TeamMemberStatus?

	/// Represents a filter used in a search for `TeamMember` objects. `AND` logic is applied between the individual fields, and `OR` logic is applied within list-based fields. For example, setting this filter value, ``` filter = (locations_ids = ["A", "B"], status = ACTIVE) ``` returns only active team members assigned to either location "A" or "B".
	/// - Parameters:
	///   - location_ids: When present, filter by team members assigned to the specified locations. When empty, include team members assigned to any location.
	///   - status: When present, filter by team members who match the given status. When empty, include team members of all statuses. See [TeamMemberStatus](#type-teammemberstatus) for possible values
	public init(location_ids: [String]? = nil, status: TeamMemberStatus? = nil) {
		self.location_ids = location_ids
		self.status = status
	}
}

/// Represents the parameters in a search for `TeamMember` objects.
public struct SearchTeamMembersQuery: Codable {
	/// The options to filter by.
	public var filter: SearchTeamMembersFilter?

	/// Represents the parameters in a search for `TeamMember` objects.
	/// - Parameters:
	///   - filter: The options to filter by.
	public init(filter: SearchTeamMembersFilter? = nil) {
		self.filter = filter
	}
}

/// Represents a search request for a filtered list of `TeamMember` objects.
public struct SearchTeamMembersRequest: Codable {
	/// The opaque cursor for fetching the next page. Read about [pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination) with Square APIs for more information.
	public var cursor: String?
	/// The maximum number of `TeamMember` objects in a page (25 by default).
	public var limit: Int?
	/// The query parameters.
	public var query: SearchTeamMembersQuery?

	/// Represents a search request for a filtered list of `TeamMember` objects.
	/// - Parameters:
	///   - cursor: The opaque cursor for fetching the next page. Read about [pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination) with Square APIs for more information.
	///   - limit: The maximum number of `TeamMember` objects in a page (25 by default).
	///   - query: The query parameters.
	public init(cursor: String? = nil, limit: Int? = nil, query: SearchTeamMembersQuery? = nil) {
		self.cursor = cursor
		self.limit = limit
		self.query = query
	}
}

/// Represents a response from a search request, containing a filtered list of `TeamMember` objects.
public struct SearchTeamMembersResponse: Codable {
	/// The opaque cursor for fetching the next page. Read about [pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination) with Square APIs for more information.
	public var cursor: String?
	/// The errors that occurred during the request.
	public var errors: [SquareError]?
	/// The filtered list of `TeamMember` objects.
	public var team_members: [TeamMember]?

	/// Represents a response from a search request, containing a filtered list of `TeamMember` objects.
	/// - Parameters:
	///   - cursor: The opaque cursor for fetching the next page. Read about [pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination) with Square APIs for more information.
	///   - errors: The errors that occurred during the request.
	///   - team_members: The filtered list of `TeamMember` objects.
	public init(cursor: String? = nil, errors: [SquareError]? = nil, team_members: [TeamMember]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.team_members = team_members
	}
}

public struct SearchTerminalCheckoutsRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query. See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
	public var cursor: String?
	/// Limit the number of results returned for a single request.
	public var limit: Int?
	/// Queries terminal checkouts based on given conditions and sort order. Leaving this unset will return all checkouts with the default sort order.
	public var query: TerminalCheckoutQuery?

	public init(cursor: String? = nil, limit: Int? = nil, query: TerminalCheckoutQuery? = nil) {
		self.cursor = cursor
		self.limit = limit
		self.query = query
	}
}

public struct SearchTerminalCheckoutsResponse: Codable {
	/// The requested search result of `TerminalCheckout`s.
	public var checkouts: [TerminalCheckout]?
	/// The pagination cursor to be used in a subsequent request. If empty, this is the final response.  See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
	public var cursor: String?
	/// Information on errors encountered during the request.
	public var errors: [SquareError]?

	public init(checkouts: [TerminalCheckout]? = nil, cursor: String? = nil, errors: [SquareError]? = nil) {
		self.checkouts = checkouts
		self.cursor = cursor
		self.errors = errors
	}
}

public struct SearchTerminalRefundsRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query.
	public var cursor: String?
	/// Limit the number of results returned for a single request.
	public var limit: Int?
	/// Query the terminal refunds based on given conditions and sort order. Calling `SearchTerminalRefunds` without an explicitly query parameter will return all available refunds with the default sort order.
	public var query: TerminalRefundQuery?

	public init(cursor: String? = nil, limit: Int? = nil, query: TerminalRefundQuery? = nil) {
		self.cursor = cursor
		self.limit = limit
		self.query = query
	}
}

public struct SearchTerminalRefundsResponse: Codable {
	/// The pagination cursor to be used in a subsequent request. If empty, this is the final response.  See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
	public var cursor: String?
	/// Information on errors encountered during the request.
	public var errors: [SquareError]?
	/// The requested search result of `TerminalRefund`s.
	public var refunds: [TerminalRefund]?

	public init(cursor: String? = nil, errors: [SquareError]? = nil, refunds: [TerminalRefund]? = nil) {
		self.cursor = cursor
		self.errors = errors
		self.refunds = refunds
	}
}

/// A query filter to search for appointment segments by.
public struct SegmentFilter: Codable {
	/// The ID of the `CatalogItemVariation` representing the service booked in this segment.
	public var service_variation_id: String
	/// A query expression specifying which team members satisfy the condition. Supported expressions are - `ANY`: include team members whose IDs match any member of the specified list. - `NONE`: exclude team members whose IDs match members of the specified list.  The `ALL` expression is not supported in the Bookings API. When no expression is specified, any service-providing team member is eligible to fulfill the Booking.
	public var team_member_id_filter: FilterValue?

	/// A query filter to search for appointment segments by.
	/// - Parameters:
	///   - service_variation_id: The ID of the `CatalogItemVariation` representing the service booked in this segment.
	///   - team_member_id_filter: A query expression specifying which team members satisfy the condition. Supported expressions are - `ANY`: include team members whose IDs match any member of the specified list. - `NONE`: exclude team members whose IDs match members of the specified list.  The `ALL` expression is not supported in the Bookings API. When no expression is specified, any service-providing team member is eligible to fulfill the Booking.
	public init(service_variation_id: String, team_member_id_filter: FilterValue? = nil) {
		self.service_variation_id = service_variation_id
		self.team_member_id_filter = team_member_id_filter
	}
}

/// A record of the hourly rate, start, and end times for a single work shift for an employee. May include a record of the start and end times for breaks taken during the shift.
public struct Shift: Codable {
	/// A list of any paid or unpaid breaks that were taken during this shift.
	public var breaks: [Break]?
	/// A read-only timestamp in RFC 3339 format; presented in UTC.
	public let created_at: Timestamp?
	/// The ID of the employee this shift belongs to. DEPRECATED at version 2020-08-26. Use `team_member_id` instead
	public var employee_id: String?
	/// RFC 3339; shifted to timezone + offset. Precision up to the minute is respected; seconds are truncated.
	public var end_at: Timestamp?
	/// UUID for this object
	public var id: String?
	/// The ID of the location this shift occurred at. Should be based on where the employee clocked in.
	public var location_id: String?
	/// RFC 3339; shifted to location timezone + offset. Precision up to the minute is respected; seconds are truncated.
	public var start_at: Timestamp
	/// Describes working state of the current `Shift`. See [ShiftStatus](#type-shiftstatus) for possible values
	public var status: ShiftStatus?
	/// The ID of the team member this shift belongs to. Replaced `employee_id` at version "2020-08-26"
	public var team_member_id: String?
	/// Read-only convenience value that is calculated from the location based on `location_id`. Format: the IANA Timezone Database identifier for the location timezone.
	public var timezone: String?
	/// A read-only timestamp in RFC 3339 format; presented in UTC.
	public let updated_at: Timestamp?
	/// Used for resolving concurrency issues; request will fail if version provided does not match server version at time of request. If not provided, Square executes a blind write; potentially overwriting data from another write.
	public var version: Int?
	/// Job and pay related information. If wage is not set on create, will default to a wage of zero money. If title is not set on create, will default to the name of the role the employee is assigned to, if any.
	public var wage: ShiftWage?

	/// A record of the hourly rate, start, and end times for a single work shift for an employee. May include a record of the start and end times for breaks taken during the shift.
	/// - Parameters:
	///   - breaks: A list of any paid or unpaid breaks that were taken during this shift.
	///   - created_at: A read-only timestamp in RFC 3339 format; presented in UTC.
	///   - employee_id: The ID of the employee this shift belongs to. DEPRECATED at version 2020-08-26. Use `team_member_id` instead
	///   - end_at: RFC 3339; shifted to timezone + offset. Precision up to the minute is respected; seconds are truncated.
	///   - id: UUID for this object
	///   - location_id: The ID of the location this shift occurred at. Should be based on where the employee clocked in.
	///   - start_at: RFC 3339; shifted to location timezone + offset. Precision up to the minute is respected; seconds are truncated.
	///   - status: Describes working state of the current `Shift`. See [ShiftStatus](#type-shiftstatus) for possible values
	///   - team_member_id: The ID of the team member this shift belongs to. Replaced `employee_id` at version "2020-08-26"
	///   - timezone: Read-only convenience value that is calculated from the location based on `location_id`. Format: the IANA Timezone Database identifier for the location timezone.
	///   - updated_at: A read-only timestamp in RFC 3339 format; presented in UTC.
	///   - version: Used for resolving concurrency issues; request will fail if version provided does not match server version at time of request. If not provided, Square executes a blind write; potentially overwriting data from another write.
	///   - wage: Job and pay related information. If wage is not set on create, will default to a wage of zero money. If title is not set on create, will default to the name of the role the employee is assigned to, if any.
	public init(start_at: Timestamp, breaks: [Break]? = nil, created_at: Timestamp? = nil, employee_id: String? = nil, end_at: Timestamp? = nil, id: String? = nil, location_id: String? = nil, status: ShiftStatus? = nil, team_member_id: String? = nil, timezone: String? = nil, updated_at: Timestamp? = nil, version: Int? = nil, wage: ShiftWage? = nil) {
		self.start_at = start_at
		self.breaks = breaks
		self.created_at = created_at
		self.employee_id = employee_id
		self.end_at = end_at
		self.id = id
		self.location_id = location_id
		self.status = status
		self.team_member_id = team_member_id
		self.timezone = timezone
		self.updated_at = updated_at
		self.version = version
		self.wage = wage
	}
}

/// Defines a filter used in a search for `Shift` records. `AND` logic is used by Square's servers to apply each filter property specified.
public struct ShiftFilter: Codable {
	/// Fetch shifts for the specified employees. DEPRECATED at version 2020-08-26. Use `team_member_ids` instead
	public var employee_ids: [String]?
	/// Fetch the `Shift`s that end in the time range - Inclusive.
	public var end: TimeRange?
	/// Fetch shifts for the specified location.
	public var location_ids: [String]
	/// Fetch `Shift`s that start in the time range - Inclusive.
	public var start: TimeRange?
	/// Fetch a `Shift` instance by `Shift.status`. See [ShiftFilterStatus](#type-shiftfilterstatus) for possible values
	public var status: ShiftFilterStatus?
	/// Fetch shifts for the specified team members. Replaced `employee_ids` at version "2020-08-26"
	public var team_member_ids: [String]
	/// Fetch the `Shift`s based on workday date range.
	public var workday: ShiftWorkday?

	/// Defines a filter used in a search for `Shift` records. `AND` logic is used by Square's servers to apply each filter property specified.
	/// - Parameters:
	///   - employee_ids: Fetch shifts for the specified employees. DEPRECATED at version 2020-08-26. Use `team_member_ids` instead
	///   - end: Fetch the `Shift`s that end in the time range - Inclusive.
	///   - location_ids: Fetch shifts for the specified location.
	///   - start: Fetch `Shift`s that start in the time range - Inclusive.
	///   - status: Fetch a `Shift` instance by `Shift.status`. See [ShiftFilterStatus](#type-shiftfilterstatus) for possible values
	///   - team_member_ids: Fetch shifts for the specified team members. Replaced `employee_ids` at version "2020-08-26"
	///   - workday: Fetch the `Shift`s based on workday date range.
	public init(location_ids: [String], team_member_ids: [String], employee_ids: [String]? = nil, end: TimeRange? = nil, start: TimeRange? = nil, status: ShiftFilterStatus? = nil, workday: ShiftWorkday? = nil) {
		self.location_ids = location_ids
		self.team_member_ids = team_member_ids
		self.employee_ids = employee_ids
		self.end = end
		self.start = start
		self.status = status
		self.workday = workday
	}
}

/// Specifies the `status` of `Shift` records to be returned.
public enum ShiftFilterStatus: String, Codable {
	/// Shifts that have been started and not ended.
	case OPEN
	/// Shifts that have been started and ended.
	case CLOSED
}

/// The parameters of a `Shift` search query. Includes filter and sort options.
public struct ShiftQuery: Codable {
	/// Query filter options
	public var filter: ShiftFilter?
	/// Sort order details
	public var sort: ShiftSort?

	/// The parameters of a `Shift` search query. Includes filter and sort options.
	/// - Parameters:
	///   - filter: Query filter options
	///   - sort: Sort order details
	public init(filter: ShiftFilter? = nil, sort: ShiftSort? = nil) {
		self.filter = filter
		self.sort = sort
	}
}

/// Sets the sort order of search results.
public struct ShiftSort: Codable {
	/// The field to sort on. See [ShiftSortField](#type-shiftsortfield) for possible values
	public var field: ShiftSortField?
	/// The order in which results are returned. Defaults to DESC. See [SortOrder](#type-sortorder) for possible values
	public var order: SortOrder?

	/// Sets the sort order of search results.
	/// - Parameters:
	///   - field: The field to sort on. See [ShiftSortField](#type-shiftsortfield) for possible values
	///   - order: The order in which results are returned. Defaults to DESC. See [SortOrder](#type-sortorder) for possible values
	public init(field: ShiftSortField? = nil, order: SortOrder? = nil) {
		self.field = field
		self.order = order
	}
}

/// Enumerates the `Shift` fields to sort on.
public enum ShiftSortField: String, Codable {
	/// The start date/time of a `Shift`
	case START_AT
	/// The end date/time of a `Shift`
	case END_AT
	/// The date/time that a `Shift` is created
	case CREATED_AT
	/// The most recent date/time that a `Shift` is updated
	case UPDATED_AT
}

/// Enumerates the possible status of a `Shift`
public enum ShiftStatus: String, Codable {
	/// Employee started a work shift and the shift is not complete
	case OPEN
	/// Employee started and ended a work shift.
	case CLOSED
}

/// The hourly wage rate used to compensate an employee for this shift.
public struct ShiftWage: Codable {
	/// Can be a custom-set hourly wage or the calculated effective hourly wage based on annual wage and hours worked per week.
	public var hourly_rate: Money?
	/// The name of the job performed during this shift. Square labor-reporting UIs may group shifts together by title.
	public var title: String?

	/// The hourly wage rate used to compensate an employee for this shift.
	/// - Parameters:
	///   - hourly_rate: Can be a custom-set hourly wage or the calculated effective hourly wage based on annual wage and hours worked per week.
	///   - title: The name of the job performed during this shift. Square labor-reporting UIs may group shifts together by title.
	public init(hourly_rate: Money? = nil, title: String? = nil) {
		self.hourly_rate = hourly_rate
		self.title = title
	}
}

/// A `Shift` search query filter parameter that sets a range of days that a `Shift` must start or end in before passing the filter condition.
public struct ShiftWorkday: Codable {
	/// Dates for fetching the shifts
	public var date_range: DateRange?
	/// Location-specific timezones convert workdays to datetime filters. Every location included in the query must have a timezone, or this field must be provided as a fallback. Format: the IANA timezone database identifier for the relevant timezone.
	public var default_timezone: String?
	/// The strategy on which the dates are applied. See [ShiftWorkdayMatcher](#type-shiftworkdaymatcher) for possible values
	public var match_shifts_by: ShiftWorkdayMatcher?

	/// A `Shift` search query filter parameter that sets a range of days that a `Shift` must start or end in before passing the filter condition.
	/// - Parameters:
	///   - date_range: Dates for fetching the shifts
	///   - default_timezone: Location-specific timezones convert workdays to datetime filters. Every location included in the query must have a timezone, or this field must be provided as a fallback. Format: the IANA timezone database identifier for the relevant timezone.
	///   - match_shifts_by: The strategy on which the dates are applied. See [ShiftWorkdayMatcher](#type-shiftworkdaymatcher) for possible values
	public init(date_range: DateRange? = nil, default_timezone: String? = nil, match_shifts_by: ShiftWorkdayMatcher? = nil) {
		self.date_range = date_range
		self.default_timezone = default_timezone
		self.match_shifts_by = match_shifts_by
	}
}

/// Defines the logic used to apply a workday filter.
public enum ShiftWorkdayMatcher: String, Codable {
	/// All shifts that start on or after the specified workday
	case START_AT
	/// All shifts that end on or before the specified workday
	case END_AT
	/// All shifts that start between the start and end workdays (inclusive)
	case INTERSECTION
}

/// The order (e.g., chronological or alphabetical) in which results from a request are returned.
public enum SortOrder: String, Codable {
	/// The results are returned in descending (e.g., newest-first or Z-A) order.
	case DESC
	/// The results are returned in ascending (e.g., oldest-first or A-Z) order.
	case ASC
}

/// Provides information about the application used to generate a change.
public struct SourceApplication: Codable {
	/// Read-only Square ID assigned to the application. Only used for `Product` type `EXTERNAL_API`.
	public var application_id: String?
	/// Read-only display name assigned to the application (e.g. `"Custom Application"`, `"Square POS 4.74 for Android"`).
	public var name: String?
	/// Read-only `Product` type for the application. See [Product](#type-product) for possible values
	public var product: Product?

	/// Provides information about the application used to generate a change.
	/// - Parameters:
	///   - application_id: Read-only Square ID assigned to the application. Only used for `Product` type `EXTERNAL_API`.
	///   - name: Read-only display name assigned to the application (e.g. `"Custom Application"`, `"Square POS 4.74 for Android"`).
	///   - product: Read-only `Product` type for the application. See [Product](#type-product) for possible values
	public init(application_id: String? = nil, name: String? = nil, product: Product? = nil) {
		self.application_id = application_id
		self.name = name
		self.product = product
	}
}

/// Contains the name and abbreviation for standard measurement unit.
public struct StandardUnitDescription: Codable {
	/// UI display abbreviation for the measurement unit. For example, 'lb'.
	public var abbreviation: String?
	/// UI display name of the measurement unit. For example, 'Pound'.
	public var name: String?
	/// Identifies the measurement unit being described.
	public var unit: MeasurementUnit?

	/// Contains the name and abbreviation for standard measurement unit.
	/// - Parameters:
	///   - abbreviation: UI display abbreviation for the measurement unit. For example, 'lb'.
	///   - name: UI display name of the measurement unit. For example, 'Pound'.
	///   - unit: Identifies the measurement unit being described.
	public init(abbreviation: String? = nil, name: String? = nil, unit: MeasurementUnit? = nil) {
		self.abbreviation = abbreviation
		self.name = name
		self.unit = unit
	}
}

/// Group of standard measurement units.
public struct StandardUnitDescriptionGroup: Codable {
	/// IETF language tag.
	public var language_code: String?
	/// List of standard (non-custom) measurement units in this description group.
	public var standard_unit_descriptions: [StandardUnitDescription]?

	/// Group of standard measurement units.
	/// - Parameters:
	///   - language_code: IETF language tag.
	///   - standard_unit_descriptions: List of standard (non-custom) measurement units in this description group.
	public init(language_code: String? = nil, standard_unit_descriptions: [StandardUnitDescription]? = nil) {
		self.language_code = language_code
		self.standard_unit_descriptions = standard_unit_descriptions
	}
}

/// Defines the parameters for a `SubmitEvidence` request.
public struct SubmitEvidenceRequest: Codable {

	/// Defines the parameters for a `SubmitEvidence` request.
	public init() {
	}
}

/// Defines the fields in a `SubmitEvidence` response.
public struct SubmitEvidenceResponse: Codable {
	/// The `Dispute` for which evidence was submitted.
	public var dispute: Dispute?
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?

	/// Defines the fields in a `SubmitEvidence` response.
	/// - Parameters:
	///   - dispute: The `Dispute` for which evidence was submitted.
	///   - errors: Information about errors encountered during the request.
	public init(dispute: Dispute? = nil, errors: [SquareError]? = nil) {
		self.dispute = dispute
		self.errors = errors
	}
}

/// Represents a customer subscription to a subscription plan. For an overview of the `Subscription` type, see  [Subscription object](/docs/subscriptions-api/overview#subscription-object-overview).
public struct Subscription: Codable {
	/// The subscription cancellation date, in YYYY-MM-DD format (for example, 2013-01-15). On this date, the subscription status changes  to `CANCELED` and the subscription billing stops.  If you don't set this field, the subscription plan dictates if and  when subscription ends.   You cannot update this field, you can only clear it.
	public var canceled_date: String?
	/// The ID of the `customer](#type-customer) [card` that is charged for the subscription.
	public var card_id: String?
	/// The timestamp when the subscription was created, in RFC 3339 format.
	public let created_at: Timestamp?
	/// The ID of the associated `customer` profile.
	public let customer_id: String?
	/// The Square-assigned ID of the subscription.
	public let id: String?
	/// The IDs of the `invoices` created for the  subscription, listed in order when the invoices were created  (oldest invoices appear first).
	public let invoice_ids: [String]?
	/// The ID of the location associated with the subscription.
	public let location_id: String?
	/// The date up to which the customer is invoiced for the subscription, in YYYY-MM-DD format (for example, 2013-01-15).  After the invoice is paid for a given billing period, this date will be the last day of the billing period. For example, suppose for the month of May a customer gets an invoice (or charged the card) on May 1. For the monthly billing scenario, this date is then set to May 31.
	public let paid_until_date: String?
	/// The ID of the associated `subscription plan`.
	public let plan_id: String?
	/// A custom price to apply for the subscription. If specified,  it overrides the price configured by the subscription plan.
	public var price_override_money: Money?
	/// The start date of the subscription, in YYYY-MM-DD format (for example, 2013-01-15).
	public let start_date: String?
	/// The current status of the subscription. See [SubscriptionStatus](#type-subscriptionstatus) for possible values
	public let status: SubscriptionStatus?
	/// The tax amount applied when billing the subscription. The percentage is expressed in decimal form, using a `'.'` as the decimal separator and without a `'%'` sign. For example, a value of `7.5` corresponds to 7.5%.
	public var tax_percentage: String?
	/// Timezone that will be used in date calculations for the subscription. Defaults to the timezone of the location based on `location_id`. Format: the IANA Timezone Database identifier for the location timezone (for example, `America/Los_Angeles`).
	public let timezone: String?
	/// The version of the object. When updating an object, the version supplied must match the version in the database, otherwise the write will be rejected as conflicting.
	public var version: Int?

	/// Represents a customer subscription to a subscription plan. For an overview of the `Subscription` type, see  [Subscription object](/docs/subscriptions-api/overview#subscription-object-overview).
	/// - Parameters:
	///   - canceled_date: The subscription cancellation date, in YYYY-MM-DD format (for example, 2013-01-15). On this date, the subscription status changes  to `CANCELED` and the subscription billing stops.  If you don't set this field, the subscription plan dictates if and  when subscription ends.   You cannot update this field, you can only clear it.
	///   - card_id: The ID of the `customer](#type-customer) [card` that is charged for the subscription.
	///   - created_at: The timestamp when the subscription was created, in RFC 3339 format.
	///   - customer_id: The ID of the associated `customer` profile.
	///   - id: The Square-assigned ID of the subscription.
	///   - invoice_ids: The IDs of the `invoices` created for the  subscription, listed in order when the invoices were created  (oldest invoices appear first).
	///   - location_id: The ID of the location associated with the subscription.
	///   - paid_until_date: The date up to which the customer is invoiced for the subscription, in YYYY-MM-DD format (for example, 2013-01-15).  After the invoice is paid for a given billing period, this date will be the last day of the billing period. For example, suppose for the month of May a customer gets an invoice (or charged the card) on May 1. For the monthly billing scenario, this date is then set to May 31.
	///   - plan_id: The ID of the associated `subscription plan`.
	///   - price_override_money: A custom price to apply for the subscription. If specified,  it overrides the price configured by the subscription plan.
	///   - start_date: The start date of the subscription, in YYYY-MM-DD format (for example, 2013-01-15).
	///   - status: The current status of the subscription. See [SubscriptionStatus](#type-subscriptionstatus) for possible values
	///   - tax_percentage: The tax amount applied when billing the subscription. The percentage is expressed in decimal form, using a `'.'` as the decimal separator and without a `'%'` sign. For example, a value of `7.5` corresponds to 7.5%.
	///   - timezone: Timezone that will be used in date calculations for the subscription. Defaults to the timezone of the location based on `location_id`. Format: the IANA Timezone Database identifier for the location timezone (for example, `America/Los_Angeles`).
	///   - version: The version of the object. When updating an object, the version supplied must match the version in the database, otherwise the write will be rejected as conflicting.
	public init(canceled_date: String? = nil, card_id: String? = nil, created_at: Timestamp? = nil, customer_id: String? = nil, id: String? = nil, invoice_ids: [String]? = nil, location_id: String? = nil, paid_until_date: String? = nil, plan_id: String? = nil, price_override_money: Money? = nil, start_date: String? = nil, status: SubscriptionStatus? = nil, tax_percentage: String? = nil, timezone: String? = nil, version: Int? = nil) {
		self.canceled_date = canceled_date
		self.card_id = card_id
		self.created_at = created_at
		self.customer_id = customer_id
		self.id = id
		self.invoice_ids = invoice_ids
		self.location_id = location_id
		self.paid_until_date = paid_until_date
		self.plan_id = plan_id
		self.price_override_money = price_override_money
		self.start_date = start_date
		self.status = status
		self.tax_percentage = tax_percentage
		self.timezone = timezone
		self.version = version
	}
}

/// Determines the billing cadence of a `Subscription`
public enum SubscriptionCadence: String, Codable {
	/// Once per day
	case DAILY
	/// Once per week
	case WEEKLY
	/// Every two weeks
	case EVERY_TWO_WEEKS
	/// Once every 30 days
	case THIRTY_DAYS
	/// Once every 60 days
	case SIXTY_DAYS
	/// Once every 90 days
	case NINETY_DAYS
	/// Once per month
	case MONTHLY
	/// Once every two months
	case EVERY_TWO_MONTHS
	/// Once every three months
	case QUARTERLY
	/// Once every four months
	case EVERY_FOUR_MONTHS
	/// Once every six months
	case EVERY_SIX_MONTHS
	/// Once per year
	case ANNUAL
	/// Once every two years
	case EVERY_TWO_YEARS
}

/// Describes changes to subscription and billing states.
public struct SubscriptionEvent: Codable {
	/// The date, in YYYY-MM-DD format (for example, 2013-01-15), when the subscription event went into effect.
	public var effective_date: String
	/// The ID of the subscription event.
	public var id: String
	/// The ID of the subscription plan associated with the subscription.
	public var plan_id: String
	/// Type of the subscription event. See [SubscriptionEventSubscriptionEventType](#type-subscriptioneventsubscriptioneventtype) for possible values
	public var subscription_event_type: SubscriptionEventSubscriptionEventType

	/// Describes changes to subscription and billing states.
	/// - Parameters:
	///   - effective_date: The date, in YYYY-MM-DD format (for example, 2013-01-15), when the subscription event went into effect.
	///   - id: The ID of the subscription event.
	///   - plan_id: The ID of the subscription plan associated with the subscription.
	///   - subscription_event_type: Type of the subscription event. See [SubscriptionEventSubscriptionEventType](#type-subscriptioneventsubscriptioneventtype) for possible values
	public init(effective_date: String, id: String, plan_id: String, subscription_event_type: SubscriptionEventSubscriptionEventType) {
		self.effective_date = effective_date
		self.id = id
		self.plan_id = plan_id
		self.subscription_event_type = subscription_event_type
	}
}

/// The possible subscription event types.
public enum SubscriptionEventSubscriptionEventType: String, Codable {
	/// The subscription started.
	case START_SUBSCRIPTION
	/// The subscription plan changed.
	case PLAN_CHANGE
	/// The subscription stopped.
	case STOP_SUBSCRIPTION
}

/// Describes a phase in a subscription plan. For more information, see [Set Up and Manage a Subscription Plan](/docs/subscriptions-api/setup-plan).
public struct SubscriptionPhase: Codable {
	/// The billing cadence of the phase. For example, weekly or monthly. This field cannot be changed after a `SubscriptionPhase` is created. See [SubscriptionCadence](#type-subscriptioncadence) for possible values
	public var cadence: SubscriptionCadence
	/// The position this phase appears in the sequence of phases defined for the plan, indexed from 0. This field cannot be changed after a `SubscriptionPhase` is created.
	public var ordinal: Int?
	/// The number of `cadence`s the phase lasts. If not set, the phase never ends. Only the last phase can be indefinite. This field cannot be changed after a `SubscriptionPhase` is created.
	public var periods: Int?
	/// The amount to bill for each `cadence`.
	public var recurring_price_money: Money
	/// The Square-assigned ID of the subscription phase. This field cannot be changed after a `SubscriptionPhase` is created.
	public var uid: String?

	/// Describes a phase in a subscription plan. For more information, see [Set Up and Manage a Subscription Plan](/docs/subscriptions-api/setup-plan).
	/// - Parameters:
	///   - cadence: The billing cadence of the phase. For example, weekly or monthly. This field cannot be changed after a `SubscriptionPhase` is created. See [SubscriptionCadence](#type-subscriptioncadence) for possible values
	///   - ordinal: The position this phase appears in the sequence of phases defined for the plan, indexed from 0. This field cannot be changed after a `SubscriptionPhase` is created.
	///   - periods: The number of `cadence`s the phase lasts. If not set, the phase never ends. Only the last phase can be indefinite. This field cannot be changed after a `SubscriptionPhase` is created.
	///   - recurring_price_money: The amount to bill for each `cadence`.
	///   - uid: The Square-assigned ID of the subscription phase. This field cannot be changed after a `SubscriptionPhase` is created.
	public init(cadence: SubscriptionCadence, recurring_price_money: Money, ordinal: Int? = nil, periods: Int? = nil, uid: String? = nil) {
		self.cadence = cadence
		self.recurring_price_money = recurring_price_money
		self.ordinal = ordinal
		self.periods = periods
		self.uid = uid
	}
}

/// Possible subscription status values.
public enum SubscriptionStatus: String, Codable {
	/// The subscription starts in the future.
	case PENDING
	/// The subscription is active.
	case ACTIVE
	/// The subscription is canceled.
	case CANCELED
}

/// When to calculate the taxes due on a cart.
public enum TaxCalculationPhase: String, Codable {
	/// The fee is calculated based on the payment's subtotal.
	case TAX_SUBTOTAL_PHASE
	/// The fee is calculated based on the payment's total.
	case TAX_TOTAL_PHASE
}

/// Whether to the tax amount should be additional to or included in the CatalogItem price.
public enum TaxInclusionType: String, Codable {
	/// The tax is an additive tax. The tax amount is added on top of the CatalogItemVariation price. For example, a $1.00 item with a 10% additive tax would have a total cost to the buyer of $1.10.
	case ADDITIVE
	/// The tax is an inclusive tax. The tax amount is included in the CatalogItemVariation price. For example, a $1.00 item with a 10% inclusive tax would have a total cost to the buyer of $1.00, with $0.91 (91 cents) of that total being the cost of the item and $0.09 (9 cents) being tax.
	case INCLUSIVE
}

/// A record representing an individual team member for a business.
public struct TeamMember: Codable {
	/// Describes the team member's assigned locations.
	public var assigned_locations: TeamMemberAssignedLocations?
	/// The timestamp in RFC 3339 format describing when the team member was created. Ex: "2018-10-04T04:00:00-07:00" or "2019-02-05T12:00:00Z"
	public let created_at: Timestamp?
	/// The email address associated with the team member.
	public var email_address: String?
	/// The family (i.e., last) name associated with the team member.
	public var family_name: String?
	/// The given (i.e., first) name associated with the team member.
	public var given_name: String?
	/// The unique ID for the team member.
	public let id: String?
	/// Whether the team member is the owner of the Square account.
	public let is_owner: Bool?
	/// The team member's phone number in E.164 format. Examples: +14155552671 - the country code is 1 for US +551155256325 - the country code is 55 for BR
	public var phone_number: String?
	/// A second ID used to associate the team member with an entity in another system.
	public var reference_id: String?
	/// Describes the status of the team member. See [TeamMemberStatus](#type-teammemberstatus) for possible values
	public var status: TeamMemberStatus?
	/// The timestamp in RFC 3339 format describing when the team member was last updated. Ex: "2018-10-04T04:00:00-07:00" or "2019-02-05T12:00:00Z"
	public let updated_at: Timestamp?

	/// A record representing an individual team member for a business.
	/// - Parameters:
	///   - assigned_locations: Describes the team member's assigned locations.
	///   - created_at: The timestamp in RFC 3339 format describing when the team member was created. Ex: "2018-10-04T04:00:00-07:00" or "2019-02-05T12:00:00Z"
	///   - email_address: The email address associated with the team member.
	///   - family_name: The family (i.e., last) name associated with the team member.
	///   - given_name: The given (i.e., first) name associated with the team member.
	///   - id: The unique ID for the team member.
	///   - is_owner: Whether the team member is the owner of the Square account.
	///   - phone_number: The team member's phone number in E.164 format. Examples: +14155552671 - the country code is 1 for US +551155256325 - the country code is 55 for BR
	///   - reference_id: A second ID used to associate the team member with an entity in another system.
	///   - status: Describes the status of the team member. See [TeamMemberStatus](#type-teammemberstatus) for possible values
	///   - updated_at: The timestamp in RFC 3339 format describing when the team member was last updated. Ex: "2018-10-04T04:00:00-07:00" or "2019-02-05T12:00:00Z"
	public init(assigned_locations: TeamMemberAssignedLocations? = nil, created_at: Timestamp? = nil, email_address: String? = nil, family_name: String? = nil, given_name: String? = nil, id: String? = nil, is_owner: Bool? = nil, phone_number: String? = nil, reference_id: String? = nil, status: TeamMemberStatus? = nil, updated_at: Timestamp? = nil) {
		self.assigned_locations = assigned_locations
		self.created_at = created_at
		self.email_address = email_address
		self.family_name = family_name
		self.given_name = given_name
		self.id = id
		self.is_owner = is_owner
		self.phone_number = phone_number
		self.reference_id = reference_id
		self.status = status
		self.updated_at = updated_at
	}
}

/// An object that represents a team member's assignment to locations.
public struct TeamMemberAssignedLocations: Codable {
	/// The current assignment type of the team member. See [TeamMemberAssignedLocationsAssignmentType](#type-teammemberassignedlocationsassignmenttype) for possible values
	public var assignment_type: TeamMemberAssignedLocationsAssignmentType?
	/// The locations that the team member is assigned to.
	public var location_ids: [String]?

	/// An object that represents a team member's assignment to locations.
	/// - Parameters:
	///   - assignment_type: The current assignment type of the team member. See [TeamMemberAssignedLocationsAssignmentType](#type-teammemberassignedlocationsassignmenttype) for possible values
	///   - location_ids: The locations that the team member is assigned to.
	public init(assignment_type: TeamMemberAssignedLocationsAssignmentType? = nil, location_ids: [String]? = nil) {
		self.assignment_type = assignment_type
		self.location_ids = location_ids
	}
}

/// Enumerates the possible assignment types the team member can have
public enum TeamMemberAssignedLocationsAssignmentType: String, Codable {
	/// The team member is assigned to all curent and future locations - the location_ids field is empty if the team member has this assignment type.
	case ALL_CURRENT_AND_FUTURE_LOCATIONS
	/// The team member is assigned to an explicit subset of locations - the location_ids field is the list of locations that the team member is assigned to.
	case EXPLICIT_LOCATIONS
}

/// The booking profile of a seller's team member, including the team member's ID, display name, description and whether the team member can be booked as a service provider.
public struct TeamMemberBookingProfile: Codable {
	/// The description of the team member.
	public var description: String?
	/// The display name of the team member.
	public var display_name: String?
	/// Indicates whether the team member can be booked through the Bookings API or the seller's online booking channel or site (`true) or not (`false`).
	public var is_bookable: Bool?
	/// The URL of the team member's image for the bookings profile.
	public var profile_image_url: String?
	/// The ID of the `TeamMember` object for the team member associated with the booking profile.
	public var team_member_id: String?

	/// The booking profile of a seller's team member, including the team member's ID, display name, description and whether the team member can be booked as a service provider.
	/// - Parameters:
	///   - description: The description of the team member.
	///   - display_name: The display name of the team member.
	///   - is_bookable: Indicates whether the team member can be booked through the Bookings API or the seller's online booking channel or site (`true) or not (`false`).
	///   - profile_image_url: The URL of the team member's image for the bookings profile.
	///   - team_member_id: The ID of the `TeamMember` object for the team member associated with the booking profile.
	public init(description: String? = nil, display_name: String? = nil, is_bookable: Bool? = nil, profile_image_url: String? = nil, team_member_id: String? = nil) {
		self.description = description
		self.display_name = display_name
		self.is_bookable = is_bookable
		self.profile_image_url = profile_image_url
		self.team_member_id = team_member_id
	}
}

/// Enumerates the possible statuses the team member can have within a business.
public enum TeamMemberStatus: String, Codable {
	/// The team member can log in to Point of Sale and Dashboard.
	case ACTIVE
	/// The team member can no longer log in to Point of Sale or Dashboard, but their sales reports remain available.
	case INACTIVE
}

/// The hourly wage rate that a team member will earn on a `Shift` for doing the job specified by the `title` property of this object.
public struct TeamMemberWage: Codable {
	/// Can be a custom-set hourly wage or the calculated effective hourly wage based on annual wage and hours worked per week.
	public var hourly_rate: Money?
	/// UUID for this object.
	public var id: String?
	/// The `Team Member` that this wage is assigned to.
	public var team_member_id: String?
	/// The job title that this wage relates to.
	public var title: String?

	/// The hourly wage rate that a team member will earn on a `Shift` for doing the job specified by the `title` property of this object.
	/// - Parameters:
	///   - hourly_rate: Can be a custom-set hourly wage or the calculated effective hourly wage based on annual wage and hours worked per week.
	///   - id: UUID for this object.
	///   - team_member_id: The `Team Member` that this wage is assigned to.
	///   - title: The job title that this wage relates to.
	public init(hourly_rate: Money? = nil, id: String? = nil, team_member_id: String? = nil, title: String? = nil) {
		self.hourly_rate = hourly_rate
		self.id = id
		self.team_member_id = team_member_id
		self.title = title
	}
}

/// Represents a tender (i.e., a method of payment) used in a Square transaction.
public struct Tender: Codable {
	/// Additional recipients (other than the merchant) receiving a portion of this tender. For example, fees assessed on the purchase by a third party integration.
	public var additional_recipients: [AdditionalRecipient]?
	/// The total amount of the tender, including `tip_money`. If the tender has a `payment_id`, the `total_money` of the corresponding `Payment` will be equal to the `amount_money` of the tender.
	public var amount_money: Money?
	/// The details of the card tender.  This value is present only if the value of `type` is `CARD`.
	public var card_details: TenderCardDetails?
	/// The details of the cash tender.  This value is present only if the value of `type` is `CASH`.
	public var cash_details: TenderCashDetails?
	/// The timestamp for when the tender was created, in RFC 3339 format.
	public let created_at: Timestamp?
	/// If the tender is associated with a customer or represents a customer's card on file, this is the ID of the associated customer.
	public var customer_id: String?
	/// The tender's unique ID.
	public var id: String?
	/// The ID of the transaction's associated location.
	public var location_id: String?
	/// An optional note associated with the tender at the time of payment.
	public var note: String?
	/// The ID of the `Payment` that corresponds to this tender. This value is only present for payments created with the v2 Payments API.
	public var payment_id: String?
	/// The amount of any Square processing fees applied to the tender.  This field is not immediately populated when a new transaction is created. It is usually available after about ten seconds.
	public var processing_fee_money: Money?
	/// The tip's amount of the tender.
	public var tip_money: Money?
	/// The ID of the tender's associated transaction.
	public var transaction_id: String?
	/// The type of tender, such as `CARD` or `CASH`. See [TenderType](#type-tendertype) for possible values
	public var type: TenderType

	/// Represents a tender (i.e., a method of payment) used in a Square transaction.
	/// - Parameters:
	///   - additional_recipients: Additional recipients (other than the merchant) receiving a portion of this tender. For example, fees assessed on the purchase by a third party integration.
	///   - amount_money: The total amount of the tender, including `tip_money`. If the tender has a `payment_id`, the `total_money` of the corresponding `Payment` will be equal to the `amount_money` of the tender.
	///   - card_details: The details of the card tender.  This value is present only if the value of `type` is `CARD`.
	///   - cash_details: The details of the cash tender.  This value is present only if the value of `type` is `CASH`.
	///   - created_at: The timestamp for when the tender was created, in RFC 3339 format.
	///   - customer_id: If the tender is associated with a customer or represents a customer's card on file, this is the ID of the associated customer.
	///   - id: The tender's unique ID.
	///   - location_id: The ID of the transaction's associated location.
	///   - note: An optional note associated with the tender at the time of payment.
	///   - payment_id: The ID of the `Payment` that corresponds to this tender. This value is only present for payments created with the v2 Payments API.
	///   - processing_fee_money: The amount of any Square processing fees applied to the tender.  This field is not immediately populated when a new transaction is created. It is usually available after about ten seconds.
	///   - tip_money: The tip's amount of the tender.
	///   - transaction_id: The ID of the tender's associated transaction.
	///   - type: The type of tender, such as `CARD` or `CASH`. See [TenderType](#type-tendertype) for possible values
	public init(type: TenderType, additional_recipients: [AdditionalRecipient]? = nil, amount_money: Money? = nil, card_details: TenderCardDetails? = nil, cash_details: TenderCashDetails? = nil, created_at: Timestamp? = nil, customer_id: String? = nil, id: String? = nil, location_id: String? = nil, note: String? = nil, payment_id: String? = nil, processing_fee_money: Money? = nil, tip_money: Money? = nil, transaction_id: String? = nil) {
		self.type = type
		self.additional_recipients = additional_recipients
		self.amount_money = amount_money
		self.card_details = card_details
		self.cash_details = cash_details
		self.created_at = created_at
		self.customer_id = customer_id
		self.id = id
		self.location_id = location_id
		self.note = note
		self.payment_id = payment_id
		self.processing_fee_money = processing_fee_money
		self.tip_money = tip_money
		self.transaction_id = transaction_id
	}
}

/// Represents additional details of a tender with `type` `CARD` or `SQUARE_GIFT_CARD`
public struct TenderCardDetails: Codable {
	/// The credit card's non-confidential details.
	public var card: Card?
	/// The method used to enter the card's details for the transaction. See [TenderCardDetailsEntryMethod](#type-tendercarddetailsentrymethod) for possible values
	public var entry_method: TenderCardDetailsEntryMethod?
	/// The credit card payment's current state (such as `AUTHORIZED` or `CAPTURED`). See `TenderCardDetailsStatus` for possible values. See [TenderCardDetailsStatus](#type-tendercarddetailsstatus) for possible values
	public var status: TenderCardDetailsStatus?

	/// Represents additional details of a tender with `type` `CARD` or `SQUARE_GIFT_CARD`
	/// - Parameters:
	///   - card: The credit card's non-confidential details.
	///   - entry_method: The method used to enter the card's details for the transaction. See [TenderCardDetailsEntryMethod](#type-tendercarddetailsentrymethod) for possible values
	///   - status: The credit card payment's current state (such as `AUTHORIZED` or `CAPTURED`). See `TenderCardDetailsStatus` for possible values. See [TenderCardDetailsStatus](#type-tendercarddetailsstatus) for possible values
	public init(card: Card? = nil, entry_method: TenderCardDetailsEntryMethod? = nil, status: TenderCardDetailsStatus? = nil) {
		self.card = card
		self.entry_method = entry_method
		self.status = status
	}
}

/// Indicates the method used to enter the card's details.
public enum TenderCardDetailsEntryMethod: String, Codable {
	/// The card was swiped through a Square reader or Square stand.
	case SWIPED
	/// The card information was keyed manually into Square Point of Sale or a Square-hosted web form.
	case KEYED
	/// The card was processed via EMV with a Square reader.
	case EMV
	/// The buyer's card details were already on file with Square.
	case ON_FILE
	/// The card was processed via a contactless (i.e., NFC) transaction with a Square reader.
	case CONTACTLESS
}

/// Indicates the card transaction's current status.
public enum TenderCardDetailsStatus: String, Codable {
	/// The card transaction has been authorized but not yet captured.
	case AUTHORIZED
	/// The card transaction was authorized and subsequently captured (i.e., completed).
	case CAPTURED
	/// The card transaction was authorized and subsequently voided (i.e., canceled).
	case VOIDED
	/// The card transaction failed.
	case FAILED
}

/// Represents the details of a tender with `type` `CASH`.
public struct TenderCashDetails: Codable {
	/// The total amount of cash provided by the buyer, before change is given.
	public var buyer_tendered_money: Money?
	/// The amount of change returned to the buyer.
	public var change_back_money: Money?

	/// Represents the details of a tender with `type` `CASH`.
	/// - Parameters:
	///   - buyer_tendered_money: The total amount of cash provided by the buyer, before change is given.
	///   - change_back_money: The amount of change returned to the buyer.
	public init(buyer_tendered_money: Money? = nil, change_back_money: Money? = nil) {
		self.buyer_tendered_money = buyer_tendered_money
		self.change_back_money = change_back_money
	}
}

/// Indicates a tender's type.
public enum TenderType: String, Codable {
	/// A credit card.
	case CARD
	/// Cash.
	case CASH
	/// A credit card processed with a card processor other than Square.  This value applies only to merchants in countries where Square does not yet provide card processing.
	case THIRD_PARTY_CARD
	/// A Square gift card.
	case SQUARE_GIFT_CARD
	/// This tender represents the register being opened for a "no sale" event.
	case NO_SALE
	/// A payment from a digital wallet, e.g. Cash App.  Note: Some "digital wallets", including Google Pay and Apple Pay, facilitate card payments.  Those payments have the `CARD` type.
	case WALLET
	/// A form of tender that does not match any other value.
	case OTHER
}

public struct TerminalCheckout: Codable {
	/// The amount of money (including tax amount) that the Square Terminal device should try to collect.
	public var amount_money: Money
	/// Present if the status is `CANCELED`. See [ActionCancelReason](#type-actioncancelreason) for possible values
	public let cancel_reason: ActionCancelReason?
	/// The time when the `TerminalCheckout` was created as an RFC 3339 timestamp.
	public let created_at: Timestamp?
	/// The duration as an RFC 3339 duration, after which the checkout will be automatically canceled. TerminalCheckouts that are `PENDING` will be automatically `CANCELED` and have a cancellation reason of `TIMED_OUT`.  Default: 5 minutes from creation  Maximum: 5 minutes
	public var deadline_duration: Timestamp?
	/// Options to control the display and behavior of the Square Terminal device.
	public var device_options: DeviceCheckoutOptions
	/// A unique ID for this `TerminalCheckout`
	public let id: String?
	/// An optional note to associate with the checkout, as well any payments used to complete the checkout.
	public var note: String?
	/// A list of ids for payments created by this `TerminalCheckout`.
	public let payment_ids: [String]?
	/// An optional user-defined reference ID which can be used to associate this `TerminalCheckout` to another entity in an external system. For example, an order ID generated by a third-party shopping cart. Will also be associated with any payments used to complete the checkout.
	public var reference_id: String?
	/// The status of the `TerminalCheckout`. Options: `PENDING`, `IN_PROGRESS`, `CANCEL_REQUESTED`, `CANCELED`, `COMPLETED`
	public let status: String?
	/// The time when the `TerminalCheckout` was last updated as an RFC 3339 timestamp.
	public let updated_at: Timestamp?

	public init(amount_money: Money, device_options: DeviceCheckoutOptions, cancel_reason: ActionCancelReason? = nil, created_at: Timestamp? = nil, deadline_duration: Timestamp? = nil, id: String? = nil, note: String? = nil, payment_ids: [String]? = nil, reference_id: String? = nil, status: String? = nil, updated_at: Timestamp? = nil) {
		self.amount_money = amount_money
		self.device_options = device_options
		self.cancel_reason = cancel_reason
		self.created_at = created_at
		self.deadline_duration = deadline_duration
		self.id = id
		self.note = note
		self.payment_ids = payment_ids
		self.reference_id = reference_id
		self.status = status
		self.updated_at = updated_at
	}
}

public struct TerminalCheckoutQuery: Codable {
	/// Options for filtering returned `TerminalCheckout`s
	public var filter: TerminalCheckoutQueryFilter?
	/// Option for sorting returned `TerminalCheckout`s
	public var sort: TerminalCheckoutQuerySort?

	public init(filter: TerminalCheckoutQueryFilter? = nil, sort: TerminalCheckoutQuerySort? = nil) {
		self.filter = filter
		self.sort = sort
	}
}

public struct TerminalCheckoutQueryFilter: Codable {
	/// Time range for the beginning of the reporting period. Inclusive. Default: The current time minus one day.
	public var created_at: TimeRange?
	/// `TerminalCheckout`s associated with a specific device. If no device is specified then all `TerminalCheckout`s for the merchant will be displayed.
	public var device_id: String?
	/// Filtered results with the desired status of the `TerminalCheckout` Options: PENDING, IN_PROGRESS, CANCELED, COMPLETED
	public var status: String?

	public init(created_at: TimeRange? = nil, device_id: String? = nil, status: String? = nil) {
		self.created_at = created_at
		self.device_id = device_id
		self.status = status
	}
}

public struct TerminalCheckoutQuerySort: Codable {
	/// The order in which results are listed. - `ASC` - oldest to newest - `DESC` - newest to oldest (default).
	public var sort_order: String?

	public init(sort_order: String? = nil) {
		self.sort_order = sort_order
	}
}

public struct TerminalRefund: Codable {
	/// The amount of money, inclusive of `tax_money`, that the `TerminalRefund` should return. This value is limited to the amount taken in the original payment minus any completed or pending refunds.
	public var amount_money: Money
	/// Present if the status is `CANCELED`. See [ActionCancelReason](#type-actioncancelreason) for possible values
	public let cancel_reason: ActionCancelReason?
	/// The time when the `TerminalRefund` was created as an RFC 3339 timestamp.
	public let created_at: Timestamp?
	/// The duration as an RFC 3339 duration, after which the refund will be automatically canceled. TerminalRefunds that are `PENDING` will be automatically `CANCELED` and have a cancellation reason of `TIMED_OUT`  Default: 5 minutes from creation  Maximum: 5 minutes
	public var deadline_duration: Timestamp?
	/// The unique Id of the device intended for this `TerminalRefund`. The Id can be retrieved from /v2/devices api.
	public var device_id: String?
	/// A unique ID for this `TerminalRefund`
	public let id: String?
	/// The reference to the Square order id for the payment identified by the `payment_id`.
	public let order_id: String?
	/// Unique ID of the payment being refunded.
	public var payment_id: String
	/// A description of the reason for the refund. Note: maximum 192 characters
	public var reason: String?
	/// The reference to the payment refund created by completing this `TerminalRefund`.
	public let refund_id: String?
	/// The status of the `TerminalRefund`. Options: `PENDING`, `IN_PROGRESS`, `CANCELED`, `COMPLETED`
	public let status: String?
	/// The time when the `TerminalRefund` was last updated as an RFC 3339 timestamp.
	public let updated_at: Timestamp?

	public init(amount_money: Money, payment_id: String, cancel_reason: ActionCancelReason? = nil, created_at: Timestamp? = nil, deadline_duration: Timestamp? = nil, device_id: String? = nil, id: String? = nil, order_id: String? = nil, reason: String? = nil, refund_id: String? = nil, status: String? = nil, updated_at: Timestamp? = nil) {
		self.amount_money = amount_money
		self.payment_id = payment_id
		self.cancel_reason = cancel_reason
		self.created_at = created_at
		self.deadline_duration = deadline_duration
		self.device_id = device_id
		self.id = id
		self.order_id = order_id
		self.reason = reason
		self.refund_id = refund_id
		self.status = status
		self.updated_at = updated_at
	}
}

public struct TerminalRefundQuery: Codable {
	/// Filter for terminal refund query.
	public var filter: TerminalRefundQueryFilter?
	/// Sort order for terminal refund query.
	public var sort: TerminalRefundQuerySort?

	public init(filter: TerminalRefundQueryFilter? = nil, sort: TerminalRefundQuerySort? = nil) {
		self.filter = filter
		self.sort = sort
	}
}

public struct TerminalRefundQueryFilter: Codable {
	/// Timestamp for the beginning of the reporting period, in RFC 3339 format. Inclusive. Default: The current time minus one day.
	public var created_at: TimeRange?
	/// `TerminalRefund`s associated with a specific device. If no device is specified then all `TerminalRefund`s for the signed in account will be displayed.
	public var device_id: String?
	/// Filtered results with the desired status of the `TerminalRefund` Options: `PENDING`, `IN_PROGRESS`, `CANCEL_REQUESTED`, `CANCELED`, `COMPLETED`
	public var status: String?

	public init(created_at: TimeRange? = nil, device_id: String? = nil, status: String? = nil) {
		self.created_at = created_at
		self.device_id = device_id
		self.status = status
	}
}

public struct TerminalRefundQuerySort: Codable {
	/// The order in which results are listed. - `ASC` - oldest to newest - `DESC` - newest to oldest (default).
	public var sort_order: String?

	public init(sort_order: String? = nil) {
		self.sort_order = sort_order
	}
}

/// Represents a generic time range. The start and end values are represented in RFC 3339 format. Time ranges are customized to be inclusive or exclusive based on the needs of a particular endpoint. Refer to the relevant endpoint-specific documentation to determine how time ranges are handled.
public struct TimeRange: Codable {
	/// A datetime value in RFC 3339 format indicating when the time range ends.
	public var end_at: Timestamp?
	/// A datetime value in RFC 3339 format indicating when the time range starts.
	public var start_at: Timestamp?

	/// Represents a generic time range. The start and end values are represented in RFC 3339 format. Time ranges are customized to be inclusive or exclusive based on the needs of a particular endpoint. Refer to the relevant endpoint-specific documentation to determine how time ranges are handled.
	/// - Parameters:
	///   - end_at: A datetime value in RFC 3339 format indicating when the time range ends.
	///   - start_at: A datetime value in RFC 3339 format indicating when the time range starts.
	public init(end_at: Timestamp? = nil, start_at: Timestamp? = nil) {
		self.end_at = end_at
		self.start_at = start_at
	}
}

public struct TipSettings: Codable {
	/// Indicates whether tipping is enabled for this checkout. Defaults to false.
	public var allow_tipping: Bool?
	/// Indicates whether custom tip amounts are allowed during the checkout flow. Defaults to false.
	public var custom_tip_field: Bool?
	/// Indicates whether tip options should be presented on their own screen before presenting the signature screen during card payment. Defaults to false.
	public var separate_tip_screen: Bool?
	/// Enables the "Smart Tip Amounts" behavior. Exact tipping options depend on the region the Square seller is active in.  In the United States and Canada, tipping options will be presented in whole dollar amounts for payments under 10 USD/CAD respectively.  If set to true, the tip_percentages settings is ignored. Defaults to false.  To learn more about smart tipping, see [Accept Tips with the Square App](https://squareup.com/help/us/en/article/5069-accept-tips-with-the-square-app)
	public var smart_tipping: Bool?
	/// A list of tip percentages that should be presented during the checkout flow. Specified as up to 3 non-negative integers from 0 to 100 (inclusive). Defaults to [15, 20, 25]
	public var tip_percentages: [Int]?

	public init(allow_tipping: Bool? = nil, custom_tip_field: Bool? = nil, separate_tip_screen: Bool? = nil, smart_tipping: Bool? = nil, tip_percentages: [Int]? = nil) {
		self.allow_tipping = allow_tipping
		self.custom_tip_field = custom_tip_field
		self.separate_tip_screen = separate_tip_screen
		self.smart_tipping = smart_tipping
		self.tip_percentages = tip_percentages
	}
}

/// Represents a transaction processed with Square, either with the Connect API or with Square Point of Sale.  The `tenders` field of this object lists all methods of payment used to pay in the transaction.
public struct Transaction: Codable {
	/// If the transaction was created in the Square Point of Sale app, this value is the ID generated for the transaction by Square Point of Sale.  This ID has no relationship to the transaction's canonical `id`, which is generated by Square's backend servers. This value is generated for bookkeeping purposes, in case the transaction cannot immediately be completed (for example, if the transaction is processed in offline mode).  It is not currently possible with the Connect API to perform a transaction lookup by this value.
	public var client_id: String?
	/// The timestamp for when the transaction was created, in RFC 3339 format.
	public var created_at: Timestamp?
	/// The transaction's unique ID, issued by Square payments servers.
	public var id: String?
	/// The ID of the transaction's associated location.
	public var location_id: String?
	/// The order_id is an identifier for the order associated with this transaction, if any.
	public var order_id: String?
	/// The Square product that processed the transaction. See [TransactionProduct](#type-transactionproduct) for possible values
	public var product: TransactionProduct?
	/// If the transaction was created with the `Charge` endpoint, this value is the same as the value provided for the `reference_id` parameter in the request to that endpoint. Otherwise, it is not set.
	public var reference_id: String?
	/// Refunds that have been applied to any tender in the transaction.
	public var refunds: [Refund]?
	/// The shipping address provided in the request, if any.
	public var shipping_address: Address?
	/// The tenders used to pay in the transaction.
	public var tenders: [Tender]?

	/// Represents a transaction processed with Square, either with the Connect API or with Square Point of Sale.  The `tenders` field of this object lists all methods of payment used to pay in the transaction.
	/// - Parameters:
	///   - client_id: If the transaction was created in the Square Point of Sale app, this value is the ID generated for the transaction by Square Point of Sale.  This ID has no relationship to the transaction's canonical `id`, which is generated by Square's backend servers. This value is generated for bookkeeping purposes, in case the transaction cannot immediately be completed (for example, if the transaction is processed in offline mode).  It is not currently possible with the Connect API to perform a transaction lookup by this value.
	///   - created_at: The timestamp for when the transaction was created, in RFC 3339 format.
	///   - id: The transaction's unique ID, issued by Square payments servers.
	///   - location_id: The ID of the transaction's associated location.
	///   - order_id: The order_id is an identifier for the order associated with this transaction, if any.
	///   - product: The Square product that processed the transaction. See [TransactionProduct](#type-transactionproduct) for possible values
	///   - reference_id: If the transaction was created with the `Charge` endpoint, this value is the same as the value provided for the `reference_id` parameter in the request to that endpoint. Otherwise, it is not set.
	///   - refunds: Refunds that have been applied to any tender in the transaction.
	///   - shipping_address: The shipping address provided in the request, if any.
	///   - tenders: The tenders used to pay in the transaction.
	public init(client_id: String? = nil, created_at: Timestamp? = nil, id: String? = nil, location_id: String? = nil, order_id: String? = nil, product: TransactionProduct? = nil, reference_id: String? = nil, refunds: [Refund]? = nil, shipping_address: Address? = nil, tenders: [Tender]? = nil) {
		self.client_id = client_id
		self.created_at = created_at
		self.id = id
		self.location_id = location_id
		self.order_id = order_id
		self.product = product
		self.reference_id = reference_id
		self.refunds = refunds
		self.shipping_address = shipping_address
		self.tenders = tenders
	}
}

/// Indicates the Square product used to process a transaction.
public enum TransactionProduct: String, Codable {
	/// Square Point of Sale.
	case REGISTER
	/// The Square Connect API.
	case EXTERNAL_API
	/// A Square subscription for one of multiple products.
	case BILLING
	/// Square Appointments.
	case APPOINTMENTS
	/// Square Invoices.
	case INVOICES
	/// Square Online Store.
	case ONLINE_STORE
	/// Square Payroll.
	case PAYROLL
	/// A Square product that does not match any other value.
	case OTHER
}

/// The transaction type used in the disputed payment.
public enum TransactionType: String, Codable {
	case DEBIT
	case CREDIT
}

public struct UpdateBookingRequest: Codable {
	/// The booking to be updated. Individual attributes explicitly specified here override the corresponding values of the existing booking.
	public var booking: Booking
	/// A unique key to make this request an idempotent operation.
	public var idempotency_key: String?

	public init(booking: Booking, idempotency_key: String? = nil) {
		self.booking = booking
		self.idempotency_key = idempotency_key
	}
}

public struct UpdateBookingResponse: Codable {
	/// The booking that was updated.
	public var booking: Booking?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	public init(booking: Booking? = nil, errors: [SquareError]? = nil) {
		self.booking = booking
		self.errors = errors
	}
}

/// A request to update a `BreakType`
public struct UpdateBreakTypeRequest: Codable {
	/// The updated `BreakType`.
	public var break_type: BreakType

	/// A request to update a `BreakType`
	/// - Parameters:
	///   - break_type: The updated `BreakType`.
	public init(break_type: BreakType) {
		self.break_type = break_type
	}
}

/// A response to a request to update a `BreakType`. Contains the requested `BreakType` objects. May contain a set of `Error` objects if the request resulted in errors.
public struct UpdateBreakTypeResponse: Codable {
	/// The response object.
	public var break_type: BreakType?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// A response to a request to update a `BreakType`. Contains the requested `BreakType` objects. May contain a set of `Error` objects if the request resulted in errors.
	/// - Parameters:
	///   - break_type: The response object.
	///   - errors: Any errors that occurred during the request.
	public init(break_type: BreakType? = nil, errors: [SquareError]? = nil) {
		self.break_type = break_type
		self.errors = errors
	}
}

/// Defines the body parameters that can be provided in a request to the [UpdateCustomerGroup](#endpoint-updatecustomergroup) endpoint.
public struct UpdateCustomerGroupRequest: Codable {
	/// The `CustomerGroup` object including all the updates you want to make.
	public var group: CustomerGroup

	/// Defines the body parameters that can be provided in a request to the [UpdateCustomerGroup](#endpoint-updatecustomergroup) endpoint.
	/// - Parameters:
	///   - group: The `CustomerGroup` object including all the updates you want to make.
	public init(group: CustomerGroup) {
		self.group = group
	}
}

/// Defines the fields that are included in the response body of a request to the [UpdateCustomerGroup](#endpoint-updatecustomergroup) endpoint.  One of `errors` or `group` is present in a given response (never both).
public struct UpdateCustomerGroupResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The successfully updated customer group.
	public var group: CustomerGroup?

	/// Defines the fields that are included in the response body of a request to the [UpdateCustomerGroup](#endpoint-updatecustomergroup) endpoint.  One of `errors` or `group` is present in a given response (never both).
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - group: The successfully updated customer group.
	public init(errors: [SquareError]? = nil, group: CustomerGroup? = nil) {
		self.errors = errors
		self.group = group
	}
}

/// Defines the body parameters that can be provided in a request to the UpdateCustomer endpoint.
public struct UpdateCustomerRequest: Codable {
	/// The physical address associated with the customer profile.
	public var address: Address?
	/// The birthday associated with the customer profile, in RFC 3339 format. Year is optional, timezone and times are not allowed. For example: `0000-09-01T00:00:00-00:00` indicates a birthday on September 1st. `1998-09-01T00:00:00-00:00` indications a birthday on September 1st __1998__.
	public var birthday: Timestamp?
	/// A business name associated with the customer profile.
	public var company_name: String?
	/// The email address associated with the customer profile.
	public var email_address: String?
	/// The family (i.e., last) name associated with the customer profile.
	public var family_name: String?
	/// The given (i.e., first) name associated with the customer profile.
	public var given_name: String?
	/// A nickname for the customer profile.
	public var nickname: String?
	/// A custom note associated with the customer profile.
	public var note: String?
	/// The 11-digit phone number associated with the customer profile.
	public var phone_number: String?
	/// An optional, second ID used to associate the customer profile with an entity in another system.
	public var reference_id: String?

	/// Defines the body parameters that can be provided in a request to the UpdateCustomer endpoint.
	/// - Parameters:
	///   - address: The physical address associated with the customer profile.
	///   - birthday: The birthday associated with the customer profile, in RFC 3339 format. Year is optional, timezone and times are not allowed. For example: `0000-09-01T00:00:00-00:00` indicates a birthday on September 1st. `1998-09-01T00:00:00-00:00` indications a birthday on September 1st __1998__.
	///   - company_name: A business name associated with the customer profile.
	///   - email_address: The email address associated with the customer profile.
	///   - family_name: The family (i.e., last) name associated with the customer profile.
	///   - given_name: The given (i.e., first) name associated with the customer profile.
	///   - nickname: A nickname for the customer profile.
	///   - note: A custom note associated with the customer profile.
	///   - phone_number: The 11-digit phone number associated with the customer profile.
	///   - reference_id: An optional, second ID used to associate the customer profile with an entity in another system.
	public init(address: Address? = nil, birthday: Timestamp? = nil, company_name: String? = nil, email_address: String? = nil, family_name: String? = nil, given_name: String? = nil, nickname: String? = nil, note: String? = nil, phone_number: String? = nil, reference_id: String? = nil) {
		self.address = address
		self.birthday = birthday
		self.company_name = company_name
		self.email_address = email_address
		self.family_name = family_name
		self.given_name = given_name
		self.nickname = nickname
		self.note = note
		self.phone_number = phone_number
		self.reference_id = reference_id
	}
}

/// Defines the fields that are included in the response body of a request to the UpdateCustomer endpoint.  One of `errors` or `customer` is present in a given response (never both).
public struct UpdateCustomerResponse: Codable {
	/// The updated customer.
	public var customer: Customer?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// Defines the fields that are included in the response body of a request to the UpdateCustomer endpoint.  One of `errors` or `customer` is present in a given response (never both).
	/// - Parameters:
	///   - customer: The updated customer.
	///   - errors: Any errors that occurred during the request.
	public init(customer: Customer? = nil, errors: [SquareError]? = nil) {
		self.customer = customer
		self.errors = errors
	}
}

/// Describes a `UpdateInvoice` request.
public struct UpdateInvoiceRequest: Codable {
	/// The list of fields to clear. For examples, see [Update an invoice](https://developer.squareup.com/docs/docs/invoices-api/overview#update-an-invoice).
	public var fields_to_clear: [String]?
	/// A unique string that identifies the `UpdateInvoice` request. If you do not provide `idempotency_key` (or provide an empty string as the value), the endpoint treats each request as independent.  For more information, see [Idempotency](https://developer.squareup.com/docs/docs/working-with-apis/idempotency).
	public var idempotency_key: String?
	/// The invoice fields to update.  The current invoice version must be specified in the `version` field. For more information, see [Update an invoice](https://developer.squareup.com/docs/docs/invoices-api/overview#update-an-invoice).
	public var invoice: Invoice

	/// Describes a `UpdateInvoice` request.
	/// - Parameters:
	///   - fields_to_clear: The list of fields to clear. For examples, see [Update an invoice](https://developer.squareup.com/docs/docs/invoices-api/overview#update-an-invoice).
	///   - idempotency_key: A unique string that identifies the `UpdateInvoice` request. If you do not provide `idempotency_key` (or provide an empty string as the value), the endpoint treats each request as independent.  For more information, see [Idempotency](https://developer.squareup.com/docs/docs/working-with-apis/idempotency).
	///   - invoice: The invoice fields to update.  The current invoice version must be specified in the `version` field. For more information, see [Update an invoice](https://developer.squareup.com/docs/docs/invoices-api/overview#update-an-invoice).
	public init(invoice: Invoice, fields_to_clear: [String]? = nil, idempotency_key: String? = nil) {
		self.invoice = invoice
		self.fields_to_clear = fields_to_clear
		self.idempotency_key = idempotency_key
	}
}

/// Describes a `UpdateInvoice` response.
public struct UpdateInvoiceResponse: Codable {
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The updated invoice.
	public var invoice: Invoice?

	/// Describes a `UpdateInvoice` response.
	/// - Parameters:
	///   - errors: Information about errors encountered during the request.
	///   - invoice: The updated invoice.
	public init(errors: [SquareError]? = nil, invoice: Invoice? = nil) {
		self.errors = errors
		self.invoice = invoice
	}
}

public struct UpdateItemModifierListsRequest: Codable {
	/// The IDs of the catalog items associated with the CatalogModifierList objects being updated.
	public var item_ids: [String]
	/// The IDs of the CatalogModifierList objects to disable for the CatalogItem.
	public var modifier_lists_to_disable: [String]?
	/// The IDs of the CatalogModifierList objects to enable for the CatalogItem.
	public var modifier_lists_to_enable: [String]?

	public init(item_ids: [String], modifier_lists_to_disable: [String]? = nil, modifier_lists_to_enable: [String]? = nil) {
		self.item_ids = item_ids
		self.modifier_lists_to_disable = modifier_lists_to_disable
		self.modifier_lists_to_enable = modifier_lists_to_enable
	}
}

public struct UpdateItemModifierListsResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The database [timestamp](https://developer.squareup.com/docs/build-basics/working-with-date) of this update in RFC 3339 format, e.g., `2016-09-04T23:59:33.123Z`.
	public var updated_at: Timestamp?

	public init(errors: [SquareError]? = nil, updated_at: Timestamp? = nil) {
		self.errors = errors
		self.updated_at = updated_at
	}
}

public struct UpdateItemTaxesRequest: Codable {
	/// IDs for the CatalogItems associated with the CatalogTax objects being updated.
	public var item_ids: [String]
	/// IDs of the CatalogTax objects to disable.
	public var taxes_to_disable: [String]?
	/// IDs of the CatalogTax objects to enable.
	public var taxes_to_enable: [String]?

	public init(item_ids: [String], taxes_to_disable: [String]? = nil, taxes_to_enable: [String]? = nil) {
		self.item_ids = item_ids
		self.taxes_to_disable = taxes_to_disable
		self.taxes_to_enable = taxes_to_enable
	}
}

public struct UpdateItemTaxesResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The database [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) of this update in RFC 3339 format, e.g., `2016-09-04T23:59:33.123Z`.
	public var updated_at: Timestamp?

	public init(errors: [SquareError]? = nil, updated_at: Timestamp? = nil) {
		self.errors = errors
		self.updated_at = updated_at
	}
}

/// Request object for the [UpdateLocation](#endpoint-updatelocation) endpoint.
public struct UpdateLocationRequest: Codable {
	/// The `Location` object with only the fields to update.
	public var location: Location?

	/// Request object for the [UpdateLocation](#endpoint-updatelocation) endpoint.
	/// - Parameters:
	///   - location: The `Location` object with only the fields to update.
	public init(location: Location? = nil) {
		self.location = location
	}
}

/// Response object returned by the [UpdateLocation](#endpoint-updatelocation) endpoint.
public struct UpdateLocationResponse: Codable {
	/// Information on errors encountered during the request.
	public var errors: [SquareError]?
	/// The updated `Location`.
	public var location: Location?

	/// Response object returned by the [UpdateLocation](#endpoint-updatelocation) endpoint.
	/// - Parameters:
	///   - errors: Information on errors encountered during the request.
	///   - location: The updated `Location`.
	public init(errors: [SquareError]? = nil, location: Location? = nil) {
		self.errors = errors
		self.location = location
	}
}

/// Defines the fields that are included in requests to the [UpdateOrder](#endpoint-orders-updateorder) endpoint.
public struct UpdateOrderRequest: Codable {
	/// The [dot notation paths](https://developer.squareup.com/docs/orders-api/manage-orders#on-dot-notation) fields to clear. For example, `line_items[uid].note` [Read more about Deleting fields](https://developer.squareup.com/docs/orders-api/manage-orders#delete-fields).
	public var fields_to_clear: [String]?
	/// A value you specify that uniquely identifies this update request  If you're unsure whether a particular update was applied to an order successfully, you can reattempt it with the same idempotency key without worrying about creating duplicate updates to the order. The latest order version will be returned.  See [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency) for more information.
	public var idempotency_key: String?
	/// The [sparse order](https://developer.squareup.com/docs/orders-api/manage-orders#sparse-order-objects) containing only the fields to update and the version the update is being applied to.
	public var order: Order?

	/// Defines the fields that are included in requests to the [UpdateOrder](#endpoint-orders-updateorder) endpoint.
	/// - Parameters:
	///   - fields_to_clear: The [dot notation paths](https://developer.squareup.com/docs/orders-api/manage-orders#on-dot-notation) fields to clear. For example, `line_items[uid].note` [Read more about Deleting fields](https://developer.squareup.com/docs/orders-api/manage-orders#delete-fields).
	///   - idempotency_key: A value you specify that uniquely identifies this update request  If you're unsure whether a particular update was applied to an order successfully, you can reattempt it with the same idempotency key without worrying about creating duplicate updates to the order. The latest order version will be returned.  See [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency) for more information.
	///   - order: The [sparse order](https://developer.squareup.com/docs/orders-api/manage-orders#sparse-order-objects) containing only the fields to update and the version the update is being applied to.
	public init(fields_to_clear: [String]? = nil, idempotency_key: String? = nil, order: Order? = nil) {
		self.fields_to_clear = fields_to_clear
		self.idempotency_key = idempotency_key
		self.order = order
	}
}

/// Defines the fields that are included in the response body of a request to the [UpdateOrder](#endpoint-orders-updateorder) endpoint.
public struct UpdateOrderResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The updated Order.
	public var order: Order?

	/// Defines the fields that are included in the response body of a request to the [UpdateOrder](#endpoint-orders-updateorder) endpoint.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - order: The updated Order.
	public init(errors: [SquareError]? = nil, order: Order? = nil) {
		self.errors = errors
		self.order = order
	}
}

/// A request to update a `Shift` object.
public struct UpdateShiftRequest: Codable {
	/// The updated `Shift` object.
	public var shift: Shift

	/// A request to update a `Shift` object.
	/// - Parameters:
	///   - shift: The updated `Shift` object.
	public init(shift: Shift) {
		self.shift = shift
	}
}

/// The response to a request to update a `Shift`. Contains the updated `Shift` object. May contain a set of `Error` objects if the request resulted in errors.
public struct UpdateShiftResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The updated `Shift`.
	public var shift: Shift?

	/// The response to a request to update a `Shift`. Contains the updated `Shift` object. May contain a set of `Error` objects if the request resulted in errors.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - shift: The updated `Shift`.
	public init(errors: [SquareError]? = nil, shift: Shift? = nil) {
		self.errors = errors
		self.shift = shift
	}
}

/// Defines parameters in a [UpdateSubscription](#endpoint-subscriptions-updatesubscription) endpoint  request.
public struct UpdateSubscriptionRequest: Codable {
	/// The subscription object containing the current version, and fields to update. Unset fields will be left at their current server values, and JSON `null` values will be treated as a request to clear the relevant data.
	public var subscription: Subscription?

	/// Defines parameters in a [UpdateSubscription](#endpoint-subscriptions-updatesubscription) endpoint  request.
	/// - Parameters:
	///   - subscription: The subscription object containing the current version, and fields to update. Unset fields will be left at their current server values, and JSON `null` values will be treated as a request to clear the relevant data.
	public init(subscription: Subscription? = nil) {
		self.subscription = subscription
	}
}

/// Defines the fields that are included in the response from the [UpdateSubscription](#endpoint-subscriptions-updatesubscription) endpoint.
public struct UpdateSubscriptionResponse: Codable {
	/// Information about errors encountered during the request.
	public var errors: [SquareError]?
	/// The modified `Subscription` object.
	public var subscription: Subscription?

	/// Defines the fields that are included in the response from the [UpdateSubscription](#endpoint-subscriptions-updatesubscription) endpoint.
	/// - Parameters:
	///   - errors: Information about errors encountered during the request.
	///   - subscription: The modified `Subscription` object.
	public init(errors: [SquareError]? = nil, subscription: Subscription? = nil) {
		self.errors = errors
		self.subscription = subscription
	}
}

/// Represents an update request for a `TeamMember` object.
public struct UpdateTeamMemberRequest: Codable {
	/// The data which will be used to update the `TeamMember` object.
	public var team_member: TeamMember?

	/// Represents an update request for a `TeamMember` object.
	/// - Parameters:
	///   - team_member: The data which will be used to update the `TeamMember` object.
	public init(team_member: TeamMember? = nil) {
		self.team_member = team_member
	}
}

/// Represents a response from an update request, containing the updated `TeamMember` object or error messages.
public struct UpdateTeamMemberResponse: Codable {
	/// The errors that occurred during the request.
	public var errors: [SquareError]?
	/// The successfully updated `TeamMember` object.
	public var team_member: TeamMember?

	/// Represents a response from an update request, containing the updated `TeamMember` object or error messages.
	/// - Parameters:
	///   - errors: The errors that occurred during the request.
	///   - team_member: The successfully updated `TeamMember` object.
	public init(errors: [SquareError]? = nil, team_member: TeamMember? = nil) {
		self.errors = errors
		self.team_member = team_member
	}
}

/// Represents an update request for the `WageSetting` object describing a `TeamMember`.
public struct UpdateWageSettingRequest: Codable {
	/// The new `WageSetting` object that will completely replace the existing one.
	public var wage_setting: WageSetting

	/// Represents an update request for the `WageSetting` object describing a `TeamMember`.
	/// - Parameters:
	///   - wage_setting: The new `WageSetting` object that will completely replace the existing one.
	public init(wage_setting: WageSetting) {
		self.wage_setting = wage_setting
	}
}

/// Represents a response from an update request, containing the updated `WageSetting` object or error messages.
public struct UpdateWageSettingResponse: Codable {
	/// The errors that occurred during the request.
	public var errors: [SquareError]?
	/// The successfully updated `WageSetting` object.
	public var wage_setting: WageSetting?

	/// Represents a response from an update request, containing the updated `WageSetting` object or error messages.
	/// - Parameters:
	///   - errors: The errors that occurred during the request.
	///   - wage_setting: The successfully updated `WageSetting` object.
	public init(errors: [SquareError]? = nil, wage_setting: WageSetting? = nil) {
		self.errors = errors
		self.wage_setting = wage_setting
	}
}

/// A request to update a `WorkweekConfig` object
public struct UpdateWorkweekConfigRequest: Codable {
	/// The updated `WorkweekConfig` object.
	public var workweek_config: WorkweekConfig

	/// A request to update a `WorkweekConfig` object
	/// - Parameters:
	///   - workweek_config: The updated `WorkweekConfig` object.
	public init(workweek_config: WorkweekConfig) {
		self.workweek_config = workweek_config
	}
}

/// The response to a request to update a `WorkweekConfig` object. Contains the updated `WorkweekConfig` object. May contain a set of `Error` objects if the request resulted in errors.
public struct UpdateWorkweekConfigResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The response object.
	public var workweek_config: WorkweekConfig?

	/// The response to a request to update a `WorkweekConfig` object. Contains the updated `WorkweekConfig` object. May contain a set of `Error` objects if the request resulted in errors.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	///   - workweek_config: The response object.
	public init(errors: [SquareError]? = nil, workweek_config: WorkweekConfig? = nil) {
		self.errors = errors
		self.workweek_config = workweek_config
	}
}

public struct UpsertCatalogObjectRequest: Codable {
	/// A value you specify that uniquely identifies this request among all your requests. A common way to create a valid idempotency key is to use a Universally unique identifier (UUID).  If you're unsure whether a particular request was successful, you can reattempt it with the same idempotency key without worrying about creating duplicate objects.  See [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency) for more information.
	public var idempotency_key: String
	/// A CatalogObject to be created or updated.  - For updates, the object must be active (the `is_deleted` field is not `true`). - For creates, the object ID must start with `#`. The provided ID is replaced with a server-generated ID.
	public var object: CatalogObject

	public init(idempotency_key: String, object: CatalogObject) {
		self.idempotency_key = idempotency_key
		self.object = object
	}
}

public struct UpsertCatalogObjectResponse: Codable {
	/// The successfully created or updated CatalogObject.
	public var catalog_object: CatalogObject?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The mapping between client and server IDs for this upsert.
	public var id_mappings: [CatalogIdMapping]?

	public init(catalog_object: CatalogObject? = nil, errors: [SquareError]? = nil, id_mappings: [CatalogIdMapping]? = nil) {
		self.catalog_object = catalog_object
		self.errors = errors
		self.id_mappings = id_mappings
	}
}

public struct V1CreateEmployeeRoleRequest: Codable {
	/// An EmployeeRole object with a name and permissions, and an optional owner flag.
	public var employee_role: V1EmployeeRole?

	public init(employee_role: V1EmployeeRole? = nil) {
		self.employee_role = employee_role
	}
}

/// V1CreateRefundRequest
public struct V1CreateRefundRequest: Codable {
	/// The ID of the payment to refund. If you are creating a `PARTIAL` refund for a split tender payment, instead provide the id of the particular tender you want to refund.
	public var payment_id: String
	/// The reason for the refund.
	public var reason: String
	/// The amount of money to refund. Required only for PARTIAL refunds.
	public var refunded_money: V1Money?
	/// An optional key to ensure idempotence if you issue the same PARTIAL refund request more than once.
	public var request_idempotence_key: String?
	/// The type of refund (FULL or PARTIAL). See [V1CreateRefundRequestType](#type-v1createrefundrequesttype) for possible values
	public var type: V1CreateRefundRequestType

	/// V1CreateRefundRequest
	/// - Parameters:
	///   - payment_id: The ID of the payment to refund. If you are creating a `PARTIAL` refund for a split tender payment, instead provide the id of the particular tender you want to refund.
	///   - reason: The reason for the refund.
	///   - refunded_money: The amount of money to refund. Required only for PARTIAL refunds.
	///   - request_idempotence_key: An optional key to ensure idempotence if you issue the same PARTIAL refund request more than once.
	///   - type: The type of refund (FULL or PARTIAL). See [V1CreateRefundRequestType](#type-v1createrefundrequesttype) for possible values
	public init(payment_id: String, reason: String, type: V1CreateRefundRequestType, refunded_money: V1Money? = nil, request_idempotence_key: String? = nil) {
		self.payment_id = payment_id
		self.reason = reason
		self.type = type
		self.refunded_money = refunded_money
		self.request_idempotence_key = request_idempotence_key
	}
}

/// 
public enum V1CreateRefundRequestType: String, Codable {
	case FULL
	case PARTIAL
}

/// Represents one of a business's employees.
public struct V1Employee: Codable {
	/// The IDs of the locations the employee is allowed to clock in at.
	public var authorized_location_ids: [String]?
	/// The time when the employee entity was created, in ISO 8601 format.
	public var created_at: String?
	/// The employee's email address.
	public var email: String?
	/// An ID the merchant can set to associate the employee with an entity in another system.
	public var external_id: String?
	/// The employee's first name.
	public var first_name: String
	/// The employee's unique ID.
	public var id: String?
	/// The employee's last name.
	public var last_name: String
	/// The ids of the employee's associated roles. Currently, you can specify only one or zero roles per employee.
	public var role_ids: [String]?
	/// Whether the employee is ACTIVE or INACTIVE. Inactive employees cannot sign in to Square Register.Merchants update this field from the Square Dashboard. See [V1EmployeeStatus](#type-v1employeestatus) for possible values
	public var status: V1EmployeeStatus?
	/// The time when the employee entity was most recently updated, in ISO 8601 format.
	public var updated_at: String?

	/// Represents one of a business's employees.
	/// - Parameters:
	///   - authorized_location_ids: The IDs of the locations the employee is allowed to clock in at.
	///   - created_at: The time when the employee entity was created, in ISO 8601 format.
	///   - email: The employee's email address.
	///   - external_id: An ID the merchant can set to associate the employee with an entity in another system.
	///   - first_name: The employee's first name.
	///   - id: The employee's unique ID.
	///   - last_name: The employee's last name.
	///   - role_ids: The ids of the employee's associated roles. Currently, you can specify only one or zero roles per employee.
	///   - status: Whether the employee is ACTIVE or INACTIVE. Inactive employees cannot sign in to Square Register.Merchants update this field from the Square Dashboard. See [V1EmployeeStatus](#type-v1employeestatus) for possible values
	///   - updated_at: The time when the employee entity was most recently updated, in ISO 8601 format.
	public init(first_name: String, last_name: String, authorized_location_ids: [String]? = nil, created_at: String? = nil, email: String? = nil, external_id: String? = nil, id: String? = nil, role_ids: [String]? = nil, status: V1EmployeeStatus? = nil, updated_at: String? = nil) {
		self.first_name = first_name
		self.last_name = last_name
		self.authorized_location_ids = authorized_location_ids
		self.created_at = created_at
		self.email = email
		self.external_id = external_id
		self.id = id
		self.role_ids = role_ids
		self.status = status
		self.updated_at = updated_at
	}
}

/// V1EmployeeRole
public struct V1EmployeeRole: Codable {
	/// The time when the employee entity was created, in ISO 8601 format. Is set by Square when the Role is created.
	public var created_at: String?
	/// The role's unique ID, Can only be set by Square.
	public var id: String?
	/// If true, employees with this role have all permissions, regardless of the values indicated in permissions.
	public var is_owner: Bool?
	/// The role's merchant-defined name.
	public var name: String
	/// The role's permissions. See [V1EmployeeRolePermissions](#type-v1employeerolepermissions) for possible values
	public var permissions: V1EmployeeRolePermissions
	/// The time when the employee entity was most recently updated, in ISO 8601 format. Is set by Square when the Role updated.
	public var updated_at: String?

	/// V1EmployeeRole
	/// - Parameters:
	///   - created_at: The time when the employee entity was created, in ISO 8601 format. Is set by Square when the Role is created.
	///   - id: The role's unique ID, Can only be set by Square.
	///   - is_owner: If true, employees with this role have all permissions, regardless of the values indicated in permissions.
	///   - name: The role's merchant-defined name.
	///   - permissions: The role's permissions. See [V1EmployeeRolePermissions](#type-v1employeerolepermissions) for possible values
	///   - updated_at: The time when the employee entity was most recently updated, in ISO 8601 format. Is set by Square when the Role updated.
	public init(name: String, permissions: V1EmployeeRolePermissions, created_at: String? = nil, id: String? = nil, is_owner: Bool? = nil, updated_at: String? = nil) {
		self.name = name
		self.permissions = permissions
		self.created_at = created_at
		self.id = id
		self.is_owner = is_owner
		self.updated_at = updated_at
	}
}

/// 
public enum V1EmployeeRolePermissions: String, Codable {
	case REGISTER_ACCESS_SALES_HISTORY
	case REGISTER_APPLY_RESTRICTED_DISCOUNTS
	case REGISTER_CHANGE_SETTINGS
	case REGISTER_EDIT_ITEM
	case REGISTER_ISSUE_REFUNDS
	case REGISTER_OPEN_CASH_DRAWER_OUTSIDE_SALE
	case REGISTER_VIEW_SUMMARY_REPORTS
}

/// 
public enum V1EmployeeStatus: String, Codable {
	case ACTIVE
	case INACTIVE
}

public struct V1ListEmployeeRolesRequest: Codable {
	/// A pagination cursor to retrieve the next set of results for your original query to the endpoint.
	public var batch_token: String?
	/// The maximum integer number of employee entities to return in a single response. Default 100, maximum 200.
	public var limit: Int?
	/// The order in which employees are listed in the response, based on their created_at field.Default value: ASC See [SortOrder](#type-sortorder) for possible values
	public var order: SortOrder?

	public init(batch_token: String? = nil, limit: Int? = nil, order: SortOrder? = nil) {
		self.batch_token = batch_token
		self.limit = limit
		self.order = order
	}
}

public struct V1ListEmployeeRolesResponse: Codable {
	public var items: [V1EmployeeRole]?

	public init(items: [V1EmployeeRole]? = nil) {
		self.items = items
	}
}

public struct V1ListEmployeesRequest: Codable {
	/// A pagination cursor to retrieve the next set of results for your original query to the endpoint.
	public var batch_token: String?
	/// If filtering results by their created_at field, the beginning of the requested reporting period, in ISO 8601 format.
	public var begin_created_at: String?
	/// If filtering results by their updated_at field, the beginning of the requested reporting period, in ISO 8601 format
	public var begin_updated_at: String?
	/// If filtering results by their created_at field, the end of the requested reporting period, in ISO 8601 format.
	public var end_created_at: String?
	/// If filtering results by there updated_at field, the end of the requested reporting period, in ISO 8601 format.
	public var end_updated_at: String?
	/// If provided, the endpoint returns only employee entities with the specified external_id.
	public var external_id: String?
	/// The maximum integer number of employee entities to return in a single response. Default 100, maximum 200.
	public var limit: Int?
	/// The order in which employees are listed in the response, based on their created_at field.      Default value: ASC See [SortOrder](#type-sortorder) for possible values
	public var order: SortOrder?
	/// If provided, the endpoint returns only employee entities with the specified status (ACTIVE or INACTIVE). See [V1ListEmployeesRequestStatus](#type-v1listemployeesrequeststatus) for possible values
	public var status: V1ListEmployeesRequestStatus?

	public init(batch_token: String? = nil, begin_created_at: String? = nil, begin_updated_at: String? = nil, end_created_at: String? = nil, end_updated_at: String? = nil, external_id: String? = nil, limit: Int? = nil, order: SortOrder? = nil, status: V1ListEmployeesRequestStatus? = nil) {
		self.batch_token = batch_token
		self.begin_created_at = begin_created_at
		self.begin_updated_at = begin_updated_at
		self.end_created_at = end_created_at
		self.end_updated_at = end_updated_at
		self.external_id = external_id
		self.limit = limit
		self.order = order
		self.status = status
	}
}

/// 
public enum V1ListEmployeesRequestStatus: String, Codable {
	case ACTIVE
	case INACTIVE
}

public struct V1ListEmployeesResponse: Codable {
	public var items: [V1Employee]?

	public init(items: [V1Employee]? = nil) {
		self.items = items
	}
}

public struct V1ListOrdersRequest: Codable {
	/// A pagination cursor to retrieve the next set of results for your original query to the endpoint.
	public var batch_token: String?
	/// The maximum number of payments to return in a single response. This value cannot exceed 200.
	public var limit: Int?
	/// The order in which payments are listed in the response. See [SortOrder](#type-sortorder) for possible values
	public var order: SortOrder?

	public init(batch_token: String? = nil, limit: Int? = nil, order: SortOrder? = nil) {
		self.batch_token = batch_token
		self.limit = limit
		self.order = order
	}
}

public struct V1ListOrdersResponse: Codable {
	public var items: [V1Order]?

	public init(items: [V1Order]? = nil) {
		self.items = items
	}
}

public struct V1ListPaymentsRequest: Codable {
	/// A pagination cursor to retrieve the next set of results for your original query to the endpoint.
	public var batch_token: String?
	/// The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year.
	public var begin_time: String?
	/// The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time.
	public var end_time: String?
	/// Indicates whether or not to include partial payments in the response. Partial payments will have the tenders collected so far, but the itemizations will be empty until the payment is completed.
	public var include_partial: Bool?
	/// The maximum number of payments to return in a single response. This value cannot exceed 200.
	public var limit: Int?
	/// The order in which payments are listed in the response. See [SortOrder](#type-sortorder) for possible values
	public var order: SortOrder?

	public init(batch_token: String? = nil, begin_time: String? = nil, end_time: String? = nil, include_partial: Bool? = nil, limit: Int? = nil, order: SortOrder? = nil) {
		self.batch_token = batch_token
		self.begin_time = begin_time
		self.end_time = end_time
		self.include_partial = include_partial
		self.limit = limit
		self.order = order
	}
}

public struct V1ListPaymentsResponse: Codable {
	public var items: [V1Payment]?

	public init(items: [V1Payment]? = nil) {
		self.items = items
	}
}

public struct V1ListRefundsRequest: Codable {
	/// A pagination cursor to retrieve the next set of results for your original query to the endpoint.
	public var batch_token: String?
	/// The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year.
	public var begin_time: String?
	/// The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time.
	public var end_time: String?
	/// The approximate number of refunds to return in a single response. Default: 100. Max: 200. Response may contain more results than the prescribed limit when refunds are made simultaneously to multiple tenders in a payment or when refunds are generated in an exchange to account for the value of returned goods.
	public var limit: Int?
	/// The order in which payments are listed in the response. See [SortOrder](#type-sortorder) for possible values
	public var order: SortOrder?

	public init(batch_token: String? = nil, begin_time: String? = nil, end_time: String? = nil, limit: Int? = nil, order: SortOrder? = nil) {
		self.batch_token = batch_token
		self.begin_time = begin_time
		self.end_time = end_time
		self.limit = limit
		self.order = order
	}
}

public struct V1ListRefundsResponse: Codable {
	public var items: [V1Refund]?

	public init(items: [V1Refund]? = nil) {
		self.items = items
	}
}

public struct V1ListSettlementsRequest: Codable {
	/// A pagination cursor to retrieve the next set of results for your original query to the endpoint.
	public var batch_token: String?
	/// The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year.
	public var begin_time: String?
	/// The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time.
	public var end_time: String?
	/// The maximum number of settlements to return in a single response. This value cannot exceed 200.
	public var limit: Int?
	/// The order in which settlements are listed in the response. See [SortOrder](#type-sortorder) for possible values
	public var order: SortOrder?
	/// Provide this parameter to retrieve only settlements with a particular status (SENT or FAILED). See [V1ListSettlementsRequestStatus](#type-v1listsettlementsrequeststatus) for possible values
	public var status: V1ListSettlementsRequestStatus?

	public init(batch_token: String? = nil, begin_time: String? = nil, end_time: String? = nil, limit: Int? = nil, order: SortOrder? = nil, status: V1ListSettlementsRequestStatus? = nil) {
		self.batch_token = batch_token
		self.begin_time = begin_time
		self.end_time = end_time
		self.limit = limit
		self.order = order
		self.status = status
	}
}

/// 
public enum V1ListSettlementsRequestStatus: String, Codable {
	case SENT
	case FAILED
}

public struct V1ListSettlementsResponse: Codable {
	public var items: [V1Settlement]?

	public init(items: [V1Settlement]? = nil) {
		self.items = items
	}
}

public struct V1Money: Codable {
	/// Amount in the lowest denominated value of this Currency. E.g. in USD these are cents, in JPY they are Yen (which do not have a 'cent' concept).
	public var amount: Int?
	///  See [Currency](#type-currency) for possible values
	public var currency_code: Currency?

	public init(amount: Int? = nil, currency_code: Currency? = nil) {
		self.amount = amount
		self.currency_code = currency_code
	}
}

/// V1Order
public struct V1Order: Codable {
	/// For Bitcoin transactions, the price of the buyer's order in satoshi (100 million satoshi equals 1 BTC).
	public var btc_price_satoshi: StringNumber?
	/// For Bitcoin transactions, the address that the buyer sent Bitcoin to.
	public var btc_receive_address: String?
	/// The email address of the order's buyer.
	public var buyer_email: String?
	/// A note provided by the buyer when the order was created, if any.
	public var buyer_note: String?
	/// A note provided by the merchant when the order's state was set to CANCELED, if any.
	public var canceled_note: String?
	/// A note provided by the merchant when the order's state was set to COMPLETED, if any
	public var completed_note: String?
	/// The time when the order was created, in ISO 8601 format.
	public var created_at: String?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The time when the order expires if no action is taken, in ISO 8601 format.
	public var expires_at: String?
	/// The order's unique identifier.
	public var id: String?
	/// The history of actions associated with the order.
	public var order_history: [V1OrderHistoryEntry]?
	/// The unique identifier of the payment associated with the order.
	public var payment_id: String?
	/// The promo code provided by the buyer, if any.
	public var promo_code: String?
	/// The name of the order's buyer.
	public var recipient_name: String?
	/// The phone number to use for the order's delivery.
	public var recipient_phone_number: String?
	/// A note provided by the merchant when the order's state was set to REFUNDED, if any.
	public var refunded_note: String?
	/// The address to ship the order to.
	public var shipping_address: Address?
	/// Whether the tax is an ADDITIVE tax or an INCLUSIVE tax. See [V1OrderState](#type-v1orderstate) for possible values
	public var state: V1OrderState?
	/// The amount of all items purchased in the order, before taxes and shipping.
	public var subtotal_money: V1Money?
	/// The tender used to pay for the order.
	public var tender: V1Tender?
	/// The total of all discounts applied to the order.
	public var total_discount_money: V1Money?
	/// The total cost of the order.
	public var total_price_money: V1Money?
	/// The shipping cost for the order.
	public var total_shipping_money: V1Money?
	/// The total of all taxes applied to the order.
	public var total_tax_money: V1Money?
	/// The time when the order was last modified, in ISO 8601 format.
	public var updated_at: String?

	/// V1Order
	/// - Parameters:
	///   - btc_price_satoshi: For Bitcoin transactions, the price of the buyer's order in satoshi (100 million satoshi equals 1 BTC).
	///   - btc_receive_address: For Bitcoin transactions, the address that the buyer sent Bitcoin to.
	///   - buyer_email: The email address of the order's buyer.
	///   - buyer_note: A note provided by the buyer when the order was created, if any.
	///   - canceled_note: A note provided by the merchant when the order's state was set to CANCELED, if any.
	///   - completed_note: A note provided by the merchant when the order's state was set to COMPLETED, if any
	///   - created_at: The time when the order was created, in ISO 8601 format.
	///   - errors: Any errors that occurred during the request.
	///   - expires_at: The time when the order expires if no action is taken, in ISO 8601 format.
	///   - id: The order's unique identifier.
	///   - order_history: The history of actions associated with the order.
	///   - payment_id: The unique identifier of the payment associated with the order.
	///   - promo_code: The promo code provided by the buyer, if any.
	///   - recipient_name: The name of the order's buyer.
	///   - recipient_phone_number: The phone number to use for the order's delivery.
	///   - refunded_note: A note provided by the merchant when the order's state was set to REFUNDED, if any.
	///   - shipping_address: The address to ship the order to.
	///   - state: Whether the tax is an ADDITIVE tax or an INCLUSIVE tax. See [V1OrderState](#type-v1orderstate) for possible values
	///   - subtotal_money: The amount of all items purchased in the order, before taxes and shipping.
	///   - tender: The tender used to pay for the order.
	///   - total_discount_money: The total of all discounts applied to the order.
	///   - total_price_money: The total cost of the order.
	///   - total_shipping_money: The shipping cost for the order.
	///   - total_tax_money: The total of all taxes applied to the order.
	///   - updated_at: The time when the order was last modified, in ISO 8601 format.
	public init(btc_price_satoshi: StringNumber? = nil, btc_receive_address: String? = nil, buyer_email: String? = nil, buyer_note: String? = nil, canceled_note: String? = nil, completed_note: String? = nil, created_at: String? = nil, errors: [SquareError]? = nil, expires_at: String? = nil, id: String? = nil, order_history: [V1OrderHistoryEntry]? = nil, payment_id: String? = nil, promo_code: String? = nil, recipient_name: String? = nil, recipient_phone_number: String? = nil, refunded_note: String? = nil, shipping_address: Address? = nil, state: V1OrderState? = nil, subtotal_money: V1Money? = nil, tender: V1Tender? = nil, total_discount_money: V1Money? = nil, total_price_money: V1Money? = nil, total_shipping_money: V1Money? = nil, total_tax_money: V1Money? = nil, updated_at: String? = nil) {
		self.btc_price_satoshi = btc_price_satoshi
		self.btc_receive_address = btc_receive_address
		self.buyer_email = buyer_email
		self.buyer_note = buyer_note
		self.canceled_note = canceled_note
		self.completed_note = completed_note
		self.created_at = created_at
		self.errors = errors
		self.expires_at = expires_at
		self.id = id
		self.order_history = order_history
		self.payment_id = payment_id
		self.promo_code = promo_code
		self.recipient_name = recipient_name
		self.recipient_phone_number = recipient_phone_number
		self.refunded_note = refunded_note
		self.shipping_address = shipping_address
		self.state = state
		self.subtotal_money = subtotal_money
		self.tender = tender
		self.total_discount_money = total_discount_money
		self.total_price_money = total_price_money
		self.total_shipping_money = total_shipping_money
		self.total_tax_money = total_tax_money
		self.updated_at = updated_at
	}
}

/// V1OrderHistoryEntry
public struct V1OrderHistoryEntry: Codable {
	/// The type of action performed on the order. See [V1OrderHistoryEntryAction](#type-v1orderhistoryentryaction) for possible values
	public var action: V1OrderHistoryEntryAction?
	/// The time when the action was performed, in ISO 8601 format.
	public var created_at: String?

	/// V1OrderHistoryEntry
	/// - Parameters:
	///   - action: The type of action performed on the order. See [V1OrderHistoryEntryAction](#type-v1orderhistoryentryaction) for possible values
	///   - created_at: The time when the action was performed, in ISO 8601 format.
	public init(action: V1OrderHistoryEntryAction? = nil, created_at: String? = nil) {
		self.action = action
		self.created_at = created_at
	}
}

/// 
public enum V1OrderHistoryEntryAction: String, Codable {
	case ORDER_PLACED
	case DECLINED
	case PAYMENT_RECEIVED
	case CANCELED
	case COMPLETED
	case REFUNDED
	case EXPIRED
}

/// 
public enum V1OrderState: String, Codable {
	case PENDING
	case OPEN
	case COMPLETED
	case CANCELED
	case REFUNDED
	case REJECTED
}

/// A payment represents a paid transaction between a Square merchant and a customer. Payment details are usually available from Connect API endpoints within a few minutes after the transaction completes.  Each Payment object includes several fields that end in `_money`. These fields describe the various amounts of money that contribute to the payment total:  <ul> <li> Monetary values are <b>positive</b> if they represent an <em>increase</em> in the amount of money the merchant receives (e.g., <code>tax_money</code>, <code>tip_money</code>). </li> <li> Monetary values are <b>negative</b> if they represent an <em>decrease</em> in the amount of money the merchant receives (e.g., <code>discount_money</code>, <code>refunded_money</code>). </li> </ul>
public struct V1Payment: Codable {
	/// All of the additive taxes associated with the payment.
	public var additive_tax: [V1PaymentTax]?
	/// The sum of all additive taxes associated with the payment.
	public var additive_tax_money: V1Money?
	/// The time when the payment was created, in ISO 8601 format. Reflects the time of the first payment if the object represents an incomplete partial payment, and the time of the last or complete payment otherwise.
	public var created_at: String?
	/// The unique identifier of the Square account that took the payment.
	public var creator_id: String?
	/// The device that took the payment.
	public var device: Device?
	/// The total of all discounts applied to the payment.
	public var discount_money: V1Money?
	/// The total of all sales, including any applicable taxes.
	public var gross_sales_money: V1Money?
	/// The payment's unique identifier.
	public var id: String?
	/// All of the inclusive taxes associated with the payment.
	public var inclusive_tax: [V1PaymentTax]?
	/// The sum of all inclusive taxes associated with the payment.
	public var inclusive_tax_money: V1Money?
	/// Indicates whether or not the payment is only partially paid for. If true, this payment will have the tenders collected so far, but the itemizations will be empty until the payment is completed.
	public var is_partial: Bool?
	/// The items purchased in the payment.
	public var itemizations: [V1PaymentItemization]?
	/// The unique identifier of the merchant that took the payment.
	public var merchant_id: String?
	/// The total of all sales, minus any applicable taxes.
	public var net_sales_money: V1Money?
	/// The amount to be deposited into the merchant's bank account for the payment.
	public var net_total_money: V1Money?
	/// The URL of the payment's detail page in the merchant dashboard. The merchant must be signed in to the merchant dashboard to view this page.
	public var payment_url: String?
	/// The total of all processing fees collected by Square for the payment.
	public var processing_fee_money: V1Money?
	/// The URL of the receipt for the payment. Note that for split tender payments, this URL corresponds to the receipt for the first tender listed in the payment's tender field. Each Tender object has its own receipt_url field you can use to get the other receipts associated with a split tender payment.
	public var receipt_url: String?
	/// The total of all refunds applied to the payment.
	public var refunded_money: V1Money?
	/// All of the refunds applied to the payment. Note that the value of all refunds on a payment can exceed the value of all tenders if a merchant chooses to refund money to a tender after previously accepting returned goods as part of an exchange.
	public var refunds: [V1Refund]?
	/// The total of all surcharges applied to the payment.
	public var surcharge_money: V1Money?
	/// A list of all surcharges associated with the payment.
	public var surcharges: [V1PaymentSurcharge]?
	/// The total of all sales, including any applicable taxes, rounded to the smallest legal unit of currency (e.g., the nearest penny in USD, the nearest nickel in CAD)
	public var swedish_rounding_money: V1Money?
	/// The total of all taxes applied to the payment. This is always the sum of inclusive_tax_money and additive_tax_money.
	public var tax_money: V1Money?
	/// All of the tenders associated with the payment.
	public var tender: [V1Tender]?
	/// The total of all tips applied to the payment.
	public var tip_money: V1Money?
	/// The total of all discounts applied to the payment.
	public var total_collected_money: V1Money?

	/// A payment represents a paid transaction between a Square merchant and a customer. Payment details are usually available from Connect API endpoints within a few minutes after the transaction completes.  Each Payment object includes several fields that end in `_money`. These fields describe the various amounts of money that contribute to the payment total:  <ul> <li> Monetary values are <b>positive</b> if they represent an <em>increase</em> in the amount of money the merchant receives (e.g., <code>tax_money</code>, <code>tip_money</code>). </li> <li> Monetary values are <b>negative</b> if they represent an <em>decrease</em> in the amount of money the merchant receives (e.g., <code>discount_money</code>, <code>refunded_money</code>). </li> </ul>
	/// - Parameters:
	///   - additive_tax: All of the additive taxes associated with the payment.
	///   - additive_tax_money: The sum of all additive taxes associated with the payment.
	///   - created_at: The time when the payment was created, in ISO 8601 format. Reflects the time of the first payment if the object represents an incomplete partial payment, and the time of the last or complete payment otherwise.
	///   - creator_id: The unique identifier of the Square account that took the payment.
	///   - device: The device that took the payment.
	///   - discount_money: The total of all discounts applied to the payment.
	///   - gross_sales_money: The total of all sales, including any applicable taxes.
	///   - id: The payment's unique identifier.
	///   - inclusive_tax: All of the inclusive taxes associated with the payment.
	///   - inclusive_tax_money: The sum of all inclusive taxes associated with the payment.
	///   - is_partial: Indicates whether or not the payment is only partially paid for. If true, this payment will have the tenders collected so far, but the itemizations will be empty until the payment is completed.
	///   - itemizations: The items purchased in the payment.
	///   - merchant_id: The unique identifier of the merchant that took the payment.
	///   - net_sales_money: The total of all sales, minus any applicable taxes.
	///   - net_total_money: The amount to be deposited into the merchant's bank account for the payment.
	///   - payment_url: The URL of the payment's detail page in the merchant dashboard. The merchant must be signed in to the merchant dashboard to view this page.
	///   - processing_fee_money: The total of all processing fees collected by Square for the payment.
	///   - receipt_url: The URL of the receipt for the payment. Note that for split tender payments, this URL corresponds to the receipt for the first tender listed in the payment's tender field. Each Tender object has its own receipt_url field you can use to get the other receipts associated with a split tender payment.
	///   - refunded_money: The total of all refunds applied to the payment.
	///   - refunds: All of the refunds applied to the payment. Note that the value of all refunds on a payment can exceed the value of all tenders if a merchant chooses to refund money to a tender after previously accepting returned goods as part of an exchange.
	///   - surcharge_money: The total of all surcharges applied to the payment.
	///   - surcharges: A list of all surcharges associated with the payment.
	///   - swedish_rounding_money: The total of all sales, including any applicable taxes, rounded to the smallest legal unit of currency (e.g., the nearest penny in USD, the nearest nickel in CAD)
	///   - tax_money: The total of all taxes applied to the payment. This is always the sum of inclusive_tax_money and additive_tax_money.
	///   - tender: All of the tenders associated with the payment.
	///   - tip_money: The total of all tips applied to the payment.
	///   - total_collected_money: The total of all discounts applied to the payment.
	public init(additive_tax: [V1PaymentTax]? = nil, additive_tax_money: V1Money? = nil, created_at: String? = nil, creator_id: String? = nil, device: Device? = nil, discount_money: V1Money? = nil, gross_sales_money: V1Money? = nil, id: String? = nil, inclusive_tax: [V1PaymentTax]? = nil, inclusive_tax_money: V1Money? = nil, is_partial: Bool? = nil, itemizations: [V1PaymentItemization]? = nil, merchant_id: String? = nil, net_sales_money: V1Money? = nil, net_total_money: V1Money? = nil, payment_url: String? = nil, processing_fee_money: V1Money? = nil, receipt_url: String? = nil, refunded_money: V1Money? = nil, refunds: [V1Refund]? = nil, surcharge_money: V1Money? = nil, surcharges: [V1PaymentSurcharge]? = nil, swedish_rounding_money: V1Money? = nil, tax_money: V1Money? = nil, tender: [V1Tender]? = nil, tip_money: V1Money? = nil, total_collected_money: V1Money? = nil) {
		self.additive_tax = additive_tax
		self.additive_tax_money = additive_tax_money
		self.created_at = created_at
		self.creator_id = creator_id
		self.device = device
		self.discount_money = discount_money
		self.gross_sales_money = gross_sales_money
		self.id = id
		self.inclusive_tax = inclusive_tax
		self.inclusive_tax_money = inclusive_tax_money
		self.is_partial = is_partial
		self.itemizations = itemizations
		self.merchant_id = merchant_id
		self.net_sales_money = net_sales_money
		self.net_total_money = net_total_money
		self.payment_url = payment_url
		self.processing_fee_money = processing_fee_money
		self.receipt_url = receipt_url
		self.refunded_money = refunded_money
		self.refunds = refunds
		self.surcharge_money = surcharge_money
		self.surcharges = surcharges
		self.swedish_rounding_money = swedish_rounding_money
		self.tax_money = tax_money
		self.tender = tender
		self.tip_money = tip_money
		self.total_collected_money = total_collected_money
	}
}

/// V1PaymentDiscount
public struct V1PaymentDiscount: Codable {
	/// The amount of money that this discount adds to the payment (note that this value is always negative or zero).
	public var applied_money: V1Money?
	/// The ID of the applied discount, if available. Discounts applied in older versions of Square Register might not have an ID.
	public var discount_id: String?
	/// The discount's name.
	public var name: String?

	/// V1PaymentDiscount
	/// - Parameters:
	///   - applied_money: The amount of money that this discount adds to the payment (note that this value is always negative or zero).
	///   - discount_id: The ID of the applied discount, if available. Discounts applied in older versions of Square Register might not have an ID.
	///   - name: The discount's name.
	public init(applied_money: V1Money? = nil, discount_id: String? = nil, name: String? = nil) {
		self.applied_money = applied_money
		self.discount_id = discount_id
		self.name = name
	}
}

/// V1PaymentItemDetail
public struct V1PaymentItemDetail: Codable {
	/// The name of the item's merchant-defined category, if any.
	public var category_name: String?
	/// The unique ID of the item purchased, if any.
	public var item_id: String?
	/// The unique ID of the item variation purchased, if any.
	public var item_variation_id: String?
	///  The item's merchant-defined SKU, if any.
	public var sku: String?

	/// V1PaymentItemDetail
	/// - Parameters:
	///   - category_name: The name of the item's merchant-defined category, if any.
	///   - item_id: The unique ID of the item purchased, if any.
	///   - item_variation_id: The unique ID of the item variation purchased, if any.
	///   - sku:  The item's merchant-defined SKU, if any.
	public init(category_name: String? = nil, item_id: String? = nil, item_variation_id: String? = nil, sku: String? = nil) {
		self.category_name = category_name
		self.item_id = item_id
		self.item_variation_id = item_variation_id
		self.sku = sku
	}
}

/// Payment include an` itemizations` field that lists the items purchased, along with associated fees, modifiers, and discounts. Each itemization has an `itemization_type` field that indicates which of the following the itemization represents:  <ul> <li>An item variation from the merchant's item library</li> <li>A custom monetary amount</li> <li> An action performed on a Square gift card, such as activating or reloading it. </li> </ul>  *Note**: itemization information included in a `Payment` object reflects details collected **at the time of the payment**. Details such as the name or price of items might have changed since the payment was processed.
public struct V1PaymentItemization: Codable {
	/// The total of all discounts applied to the itemization. This value is always negative or zero.
	public var discount_money: V1Money?
	/// All discounts applied to this itemization.
	public var discounts: [V1PaymentDiscount]?
	/// The total cost of the itemization and its modifiers, not including taxes or discounts.
	public var gross_sales_money: V1Money?
	/// Details of the item, including its unique identifier and the identifier of the item variation purchased.
	public var item_detail: V1PaymentItemDetail?
	/// The name of the item variation purchased, if any.
	public var item_variation_name: String?
	/// The type of purchase that the itemization represents, such as an ITEM or CUSTOM_AMOUNT See [V1PaymentItemizationItemizationType](#type-v1paymentitemizationitemizationtype) for possible values
	public var itemization_type: V1PaymentItemizationItemizationType?
	/// All modifier options applied to this itemization.
	public var modifiers: [V1PaymentModifier]?
	/// The item's name.
	public var name: String?
	/// The sum of gross_sales_money and discount_money.
	public var net_sales_money: V1Money?
	/// Notes entered by the merchant about the item at the time of payment, if any.
	public var notes: String?
	/// The quantity of the item purchased. This can be a decimal value.
	public var quantity: StringNumber?
	/// The cost of a single unit of this item.
	public var single_quantity_money: V1Money?
	/// All taxes applied to this itemization.
	public var taxes: [V1PaymentTax]?
	/// The total cost of the item, including all taxes and discounts.
	public var total_money: V1Money?

	/// Payment include an` itemizations` field that lists the items purchased, along with associated fees, modifiers, and discounts. Each itemization has an `itemization_type` field that indicates which of the following the itemization represents:  <ul> <li>An item variation from the merchant's item library</li> <li>A custom monetary amount</li> <li> An action performed on a Square gift card, such as activating or reloading it. </li> </ul>  *Note**: itemization information included in a `Payment` object reflects details collected **at the time of the payment**. Details such as the name or price of items might have changed since the payment was processed.
	/// - Parameters:
	///   - discount_money: The total of all discounts applied to the itemization. This value is always negative or zero.
	///   - discounts: All discounts applied to this itemization.
	///   - gross_sales_money: The total cost of the itemization and its modifiers, not including taxes or discounts.
	///   - item_detail: Details of the item, including its unique identifier and the identifier of the item variation purchased.
	///   - item_variation_name: The name of the item variation purchased, if any.
	///   - itemization_type: The type of purchase that the itemization represents, such as an ITEM or CUSTOM_AMOUNT See [V1PaymentItemizationItemizationType](#type-v1paymentitemizationitemizationtype) for possible values
	///   - modifiers: All modifier options applied to this itemization.
	///   - name: The item's name.
	///   - net_sales_money: The sum of gross_sales_money and discount_money.
	///   - notes: Notes entered by the merchant about the item at the time of payment, if any.
	///   - quantity: The quantity of the item purchased. This can be a decimal value.
	///   - single_quantity_money: The cost of a single unit of this item.
	///   - taxes: All taxes applied to this itemization.
	///   - total_money: The total cost of the item, including all taxes and discounts.
	public init(discount_money: V1Money? = nil, discounts: [V1PaymentDiscount]? = nil, gross_sales_money: V1Money? = nil, item_detail: V1PaymentItemDetail? = nil, item_variation_name: String? = nil, itemization_type: V1PaymentItemizationItemizationType? = nil, modifiers: [V1PaymentModifier]? = nil, name: String? = nil, net_sales_money: V1Money? = nil, notes: String? = nil, quantity: StringNumber? = nil, single_quantity_money: V1Money? = nil, taxes: [V1PaymentTax]? = nil, total_money: V1Money? = nil) {
		self.discount_money = discount_money
		self.discounts = discounts
		self.gross_sales_money = gross_sales_money
		self.item_detail = item_detail
		self.item_variation_name = item_variation_name
		self.itemization_type = itemization_type
		self.modifiers = modifiers
		self.name = name
		self.net_sales_money = net_sales_money
		self.notes = notes
		self.quantity = quantity
		self.single_quantity_money = single_quantity_money
		self.taxes = taxes
		self.total_money = total_money
	}
}

/// 
public enum V1PaymentItemizationItemizationType: String, Codable {
	case ITEM
	case CUSTOM_AMOUNT
	case GIFT_CARD_ACTIVATION
	case GIFT_CARD_RELOAD
	case GIFT_CARD_UNKNOWN
	case OTHER
}

/// V1PaymentModifier
public struct V1PaymentModifier: Codable {
	/// The amount of money that this modifier option adds to the payment.
	public var applied_money: V1Money?
	/// The ID of the applied modifier option, if available. Modifier options applied in older versions of Square Register might not have an ID.
	public var modifier_option_id: String?
	/// The modifier option's name.
	public var name: String?

	/// V1PaymentModifier
	/// - Parameters:
	///   - applied_money: The amount of money that this modifier option adds to the payment.
	///   - modifier_option_id: The ID of the applied modifier option, if available. Modifier options applied in older versions of Square Register might not have an ID.
	///   - name: The modifier option's name.
	public init(applied_money: V1Money? = nil, modifier_option_id: String? = nil, name: String? = nil) {
		self.applied_money = applied_money
		self.modifier_option_id = modifier_option_id
		self.name = name
	}
}

/// V1PaymentSurcharge
public struct V1PaymentSurcharge: Codable {
	/// The amount of the surcharge as a Money object. Exactly one of rate or amount_money should be set.
	public var amount_money: V1Money?
	/// The amount of money applied to the order as a result of the surcharge.
	public var applied_money: V1Money?
	/// The name of the surcharge.
	public var name: String?
	/// The amount of the surcharge as a percentage. The percentage is provided as a string representing the decimal equivalent of the percentage. For example, "0.7" corresponds to a 7% surcharge. Exactly one of rate or amount_money should be set.
	public var rate: String?
	/// A Square-issued unique identifier associated with the surcharge.
	public var surcharge_id: String?
	/// Indicates whether the surcharge is taxable.
	public var taxable: Bool?
	/// The list of taxes that should be applied to the surcharge.
	public var taxes: [V1PaymentTax]?
	/// Indicates the source of the surcharge. For example, if it was applied as an automatic gratuity for a large group. See [V1PaymentSurchargeType](#type-v1paymentsurchargetype) for possible values
	public var type: V1PaymentSurchargeType?

	/// V1PaymentSurcharge
	/// - Parameters:
	///   - amount_money: The amount of the surcharge as a Money object. Exactly one of rate or amount_money should be set.
	///   - applied_money: The amount of money applied to the order as a result of the surcharge.
	///   - name: The name of the surcharge.
	///   - rate: The amount of the surcharge as a percentage. The percentage is provided as a string representing the decimal equivalent of the percentage. For example, "0.7" corresponds to a 7% surcharge. Exactly one of rate or amount_money should be set.
	///   - surcharge_id: A Square-issued unique identifier associated with the surcharge.
	///   - taxable: Indicates whether the surcharge is taxable.
	///   - taxes: The list of taxes that should be applied to the surcharge.
	///   - type: Indicates the source of the surcharge. For example, if it was applied as an automatic gratuity for a large group. See [V1PaymentSurchargeType](#type-v1paymentsurchargetype) for possible values
	public init(amount_money: V1Money? = nil, applied_money: V1Money? = nil, name: String? = nil, rate: String? = nil, surcharge_id: String? = nil, taxable: Bool? = nil, taxes: [V1PaymentTax]? = nil, type: V1PaymentSurchargeType? = nil) {
		self.amount_money = amount_money
		self.applied_money = applied_money
		self.name = name
		self.rate = rate
		self.surcharge_id = surcharge_id
		self.taxable = taxable
		self.taxes = taxes
		self.type = type
	}
}

/// 
public enum V1PaymentSurchargeType: String, Codable {
	case UNKNOWN
	case AUTO_GRATUITY
	case CUSTOM
}

/// V1PaymentTax
public struct V1PaymentTax: Codable {
	/// The amount of money that this tax adds to the payment.
	public var applied_money: V1Money?
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?
	/// The ID of the tax, if available. Taxes applied in older versions of Square Register might not have an ID.
	public var fee_id: String?
	/// Whether the tax is an ADDITIVE tax or an INCLUSIVE tax. See [V1PaymentTaxInclusionType](#type-v1paymenttaxinclusiontype) for possible values
	public var inclusion_type: V1PaymentTaxInclusionType?
	/// The merchant-defined name of the tax.
	public var name: String?
	/// The rate of the tax, as a string representation of a decimal number. A value of 0.07 corresponds to a rate of 7%.
	public var rate: String?

	/// V1PaymentTax
	/// - Parameters:
	///   - applied_money: The amount of money that this tax adds to the payment.
	///   - errors: Any errors that occurred during the request.
	///   - fee_id: The ID of the tax, if available. Taxes applied in older versions of Square Register might not have an ID.
	///   - inclusion_type: Whether the tax is an ADDITIVE tax or an INCLUSIVE tax. See [V1PaymentTaxInclusionType](#type-v1paymenttaxinclusiontype) for possible values
	///   - name: The merchant-defined name of the tax.
	///   - rate: The rate of the tax, as a string representation of a decimal number. A value of 0.07 corresponds to a rate of 7%.
	public init(applied_money: V1Money? = nil, errors: [SquareError]? = nil, fee_id: String? = nil, inclusion_type: V1PaymentTaxInclusionType? = nil, name: String? = nil, rate: String? = nil) {
		self.applied_money = applied_money
		self.errors = errors
		self.fee_id = fee_id
		self.inclusion_type = inclusion_type
		self.name = name
		self.rate = rate
	}
}

/// 
public enum V1PaymentTaxInclusionType: String, Codable {
	case ADDITIVE
	case INCLUSIVE
}

/// Represents a phone number.
public struct V1PhoneNumber: Codable {
	/// The phone number's international calling code. For US phone numbers, this value is +1.
	public var calling_code: String
	/// The phone number.
	public var number: String

	/// Represents a phone number.
	/// - Parameters:
	///   - calling_code: The phone number's international calling code. For US phone numbers, this value is +1.
	///   - number: The phone number.
	public init(calling_code: String, number: String) {
		self.calling_code = calling_code
		self.number = number
	}
}

/// V1Refund
public struct V1Refund: Codable {
	/// The time when the merchant initiated the refund for Square to process, in ISO 8601 format.
	public var created_at: String?
	/// Indicates whether or not the refund is associated with an exchange. If is_exchange is true, the refund reflects the value of goods returned in the exchange not the total money refunded.
	public var is_exchange: Bool?
	public var merchant_id: String?
	/// A Square-issued ID associated with the refund. For single-tender refunds, payment_id is the ID of the original payment ID. For split-tender refunds, payment_id is the ID of the original tender. For exchange-based refunds (is_exchange == true), payment_id is the ID of the original payment ID even if the payment includes other tenders.
	public var payment_id: String?
	/// The time when Square processed the refund on behalf of the merchant, in ISO 8601 format.
	public var processed_at: String?
	/// The merchant-specified reason for the refund.
	public var reason: String?
	/// All of the additive taxes associated with the refund.
	public var refunded_additive_tax: [V1PaymentTax]?
	/// The amount of additive tax money refunded. This amount is always negative.
	public var refunded_additive_tax_money: V1Money?
	/// The amount of discount money refunded. This amount is always positive.
	public var refunded_discount_money: V1Money?
	/// All of the inclusive taxes associated with the refund.
	public var refunded_inclusive_tax: [V1PaymentTax]?
	/// The amount of inclusive tax money refunded. This amount is always negative.
	public var refunded_inclusive_tax_money: V1Money?
	/// The amount of money refunded. This amount is always negative.
	public var refunded_money: V1Money?
	/// The amount of processing fee money refunded. This amount is always positive.
	public var refunded_processing_fee_money: V1Money?
	/// The amount of surcharge money refunded. This amount is always negative.
	public var refunded_surcharge_money: V1Money?
	/// A list of all surcharges associated with the refund.
	public var refunded_surcharges: [V1PaymentSurcharge]?
	/// The total amount of tax money refunded. This amount is always negative.
	public var refunded_tax_money: V1Money?
	/// The amount of tip money refunded. This amount is always negative.
	public var refunded_tip_money: V1Money?
	/// The type of refund See [V1RefundType](#type-v1refundtype) for possible values
	public var type: V1RefundType?

	/// V1Refund
	/// - Parameters:
	///   - created_at: The time when the merchant initiated the refund for Square to process, in ISO 8601 format.
	///   - is_exchange: Indicates whether or not the refund is associated with an exchange. If is_exchange is true, the refund reflects the value of goods returned in the exchange not the total money refunded.
	///   - merchant_id: 
	///   - payment_id: A Square-issued ID associated with the refund. For single-tender refunds, payment_id is the ID of the original payment ID. For split-tender refunds, payment_id is the ID of the original tender. For exchange-based refunds (is_exchange == true), payment_id is the ID of the original payment ID even if the payment includes other tenders.
	///   - processed_at: The time when Square processed the refund on behalf of the merchant, in ISO 8601 format.
	///   - reason: The merchant-specified reason for the refund.
	///   - refunded_additive_tax: All of the additive taxes associated with the refund.
	///   - refunded_additive_tax_money: The amount of additive tax money refunded. This amount is always negative.
	///   - refunded_discount_money: The amount of discount money refunded. This amount is always positive.
	///   - refunded_inclusive_tax: All of the inclusive taxes associated with the refund.
	///   - refunded_inclusive_tax_money: The amount of inclusive tax money refunded. This amount is always negative.
	///   - refunded_money: The amount of money refunded. This amount is always negative.
	///   - refunded_processing_fee_money: The amount of processing fee money refunded. This amount is always positive.
	///   - refunded_surcharge_money: The amount of surcharge money refunded. This amount is always negative.
	///   - refunded_surcharges: A list of all surcharges associated with the refund.
	///   - refunded_tax_money: The total amount of tax money refunded. This amount is always negative.
	///   - refunded_tip_money: The amount of tip money refunded. This amount is always negative.
	///   - type: The type of refund See [V1RefundType](#type-v1refundtype) for possible values
	public init(created_at: String? = nil, is_exchange: Bool? = nil, merchant_id: String? = nil, payment_id: String? = nil, processed_at: String? = nil, reason: String? = nil, refunded_additive_tax: [V1PaymentTax]? = nil, refunded_additive_tax_money: V1Money? = nil, refunded_discount_money: V1Money? = nil, refunded_inclusive_tax: [V1PaymentTax]? = nil, refunded_inclusive_tax_money: V1Money? = nil, refunded_money: V1Money? = nil, refunded_processing_fee_money: V1Money? = nil, refunded_surcharge_money: V1Money? = nil, refunded_surcharges: [V1PaymentSurcharge]? = nil, refunded_tax_money: V1Money? = nil, refunded_tip_money: V1Money? = nil, type: V1RefundType? = nil) {
		self.created_at = created_at
		self.is_exchange = is_exchange
		self.merchant_id = merchant_id
		self.payment_id = payment_id
		self.processed_at = processed_at
		self.reason = reason
		self.refunded_additive_tax = refunded_additive_tax
		self.refunded_additive_tax_money = refunded_additive_tax_money
		self.refunded_discount_money = refunded_discount_money
		self.refunded_inclusive_tax = refunded_inclusive_tax
		self.refunded_inclusive_tax_money = refunded_inclusive_tax_money
		self.refunded_money = refunded_money
		self.refunded_processing_fee_money = refunded_processing_fee_money
		self.refunded_surcharge_money = refunded_surcharge_money
		self.refunded_surcharges = refunded_surcharges
		self.refunded_tax_money = refunded_tax_money
		self.refunded_tip_money = refunded_tip_money
		self.type = type
	}
}

/// 
public enum V1RefundType: String, Codable {
	case FULL
	case PARTIAL
}

public struct V1RetrieveEmployeeRequest: Codable {

	public init() {
	}
}

public struct V1RetrieveEmployeeRoleRequest: Codable {

	public init() {
	}
}

public struct V1RetrieveOrderRequest: Codable {

	public init() {
	}
}

public struct V1RetrievePaymentRequest: Codable {

	public init() {
	}
}

public struct V1RetrieveSettlementRequest: Codable {

	public init() {
	}
}

/// V1Settlement
public struct V1Settlement: Codable {
	/// The Square-issued unique identifier for the bank account associated with the settlement.
	public var bank_account_id: String?
	/// The entries included in this settlement.
	public var entries: [V1SettlementEntry]?
	/// The settlement's unique identifier.
	public var id: String?
	/// The time when the settlement was submitted for deposit or withdrawal, in ISO 8601 format.
	public var initiated_at: String?
	/// The settlement's current status. See [V1SettlementStatus](#type-v1settlementstatus) for possible values
	public var status: V1SettlementStatus?
	/// The amount of money involved in the settlement. A positive amount indicates a deposit, and a negative amount indicates a withdrawal. This amount is never zero.
	public var total_money: V1Money?

	/// V1Settlement
	/// - Parameters:
	///   - bank_account_id: The Square-issued unique identifier for the bank account associated with the settlement.
	///   - entries: The entries included in this settlement.
	///   - id: The settlement's unique identifier.
	///   - initiated_at: The time when the settlement was submitted for deposit or withdrawal, in ISO 8601 format.
	///   - status: The settlement's current status. See [V1SettlementStatus](#type-v1settlementstatus) for possible values
	///   - total_money: The amount of money involved in the settlement. A positive amount indicates a deposit, and a negative amount indicates a withdrawal. This amount is never zero.
	public init(bank_account_id: String? = nil, entries: [V1SettlementEntry]? = nil, id: String? = nil, initiated_at: String? = nil, status: V1SettlementStatus? = nil, total_money: V1Money? = nil) {
		self.bank_account_id = bank_account_id
		self.entries = entries
		self.id = id
		self.initiated_at = initiated_at
		self.status = status
		self.total_money = total_money
	}
}

/// V1SettlementEntry
public struct V1SettlementEntry: Codable {
	/// The total amount of money this entry contributes to the total settlement amount.
	public var amount_money: V1Money?
	/// The amount of all Square fees associated with this settlement entry. This value is always negative or zero.
	public var fee_money: V1Money?
	/// The settlement's unique identifier.
	public var payment_id: String?
	/// The settlement's current status. See [V1SettlementEntryType](#type-v1settlemententrytype) for possible values
	public var type: V1SettlementEntryType?

	/// V1SettlementEntry
	/// - Parameters:
	///   - amount_money: The total amount of money this entry contributes to the total settlement amount.
	///   - fee_money: The amount of all Square fees associated with this settlement entry. This value is always negative or zero.
	///   - payment_id: The settlement's unique identifier.
	///   - type: The settlement's current status. See [V1SettlementEntryType](#type-v1settlemententrytype) for possible values
	public init(amount_money: V1Money? = nil, fee_money: V1Money? = nil, payment_id: String? = nil, type: V1SettlementEntryType? = nil) {
		self.amount_money = amount_money
		self.fee_money = fee_money
		self.payment_id = payment_id
		self.type = type
	}
}

/// 
public enum V1SettlementEntryType: String, Codable {
	/// A manual adjustment applied to the merchant's account by Square
	case ADJUSTMENT
	/// A payment from an existing Square balance, such as a gift card
	case BALANCE_CHARGE
	/// A credit card payment CAPTURE
	case CHARGE
	/// Square offers Free Payments Processing for a variety of business scenarios including seller referral or when we want to apologize for a bug, customer service, repricing complication, etc. This entry represents a credit to the merchant for the purposes of Free Processing.
	case FREE_PROCESSING
	/// An adjustment made by Square related to holding/releasing a payment
	case HOLD_ADJUSTMENT
	/// a fee paid to a 3rd party merchant
	case PAID_SERVICE_FEE
	/// a refund for a 3rd party merchant fee
	case PAID_SERVICE_FEE_REFUND
	/// Repayment for a redemption code
	case REDEMPTION_CODE
	/// A refund for an existing card payment
	case REFUND
	/// An entry created when we receive a response for the ACH file we sent indicating that the settlement of the original entry failed.
	case RETURNED_PAYOUT
	/// Initial deposit to a merchant for a Capital merchant cash advance (MCA).
	case SQUARE_CAPITAL_ADVANCE
	/// Capital merchant cash advance (MCA) assessment. These are, generally, proportional to the merchant's sales but may be issued for other reasons related to the MCA.
	case SQUARE_CAPITAL_PAYMENT
	/// Capital merchant cash advance (MCA) assessment refund. These are, generally, proportional to the merchant's refunds but may be issued for other reasons related to the MCA.
	case SQUARE_CAPITAL_REVERSED_PAYMENT
	/// Fee charged for subscription to a Square product
	case SUBSCRIPTION_FEE
	/// Refund of a previously charged Square product subscription fee.
	case SUBSCRIPTION_FEE_REFUND
	case OTHER
	/// A payment in which Square covers part of the funds for a purchase
	case INCENTED_PAYMENT
	/// A settlement failed to be processed and the settlement amount has been returned to the account
	case RETURNED_ACH_ENTRY
	/// Refund for cancelling a Square Plus subscription
	case RETURNED_SQUARE_275
	/// Fee charged for a Square Plus subscription ($275)
	case SQUARE_275
	/// Settlements to or withdrawals from the Square Card (an asset)
	case SQUARE_CARD
}

/// 
public enum V1SettlementStatus: String, Codable {
	case FAILED
	case SENT
}

/// A tender represents a discrete monetary exchange. Square represents this exchange as a money object with a specific currency and amount, where the amount is given in the smallest denomination of the given currency.  Square POS can accept more than one form of tender for a single payment (such as by splitting a bill between a credit card and a gift card). The `tender` field of the Payment object lists all forms of tender used for the payment.  Split tender payments behave slightly differently from single tender payments:  The receipt_url for a split tender corresponds only to the first tender listed in the tender field. To get the receipt URLs for the remaining tenders, use the receipt_url fields of the corresponding Tender objects.  *A note on gift cards**: when a customer purchases a Square gift card from a merchant, the merchant receives the full amount of the gift card in the associated payment.  When that gift card is used as a tender, the balance of the gift card is reduced and the merchant receives no funds. A `Tender` object with a type of `SQUARE_GIFT_CARD` indicates a gift card was used for some or all of the associated payment.
public struct V1Tender: Codable {
	/// The brand of credit card provided. See [V1TenderCardBrand](#type-v1tendercardbrand) for possible values
	public var card_brand: V1TenderCardBrand?
	/// The amount of total_money returned to the buyer as change.
	public var change_back_money: V1Money?
	/// The ID of the employee that processed the tender.
	public var employee_id: String?
	/// The tender's unique ID. See [V1TenderEntryMethod](#type-v1tenderentrymethod) for possible values
	public var entry_method: V1TenderEntryMethod?
	/// The tender's unique ID.
	public var id: String?
	/// Indicates whether or not the tender is associated with an exchange. If is_exchange is true, the tender represents the value of goods returned in an exchange not the actual money paid. The exchange value reduces the tender amounts needed to pay for items purchased in the exchange.
	public var is_exchange: Bool?
	/// A human-readable description of the tender.
	public var name: String?
	/// The last four digits of the provided credit card's account number.
	public var pan_suffix: String?
	/// Notes entered by the merchant about the tender at the time of payment, if any. Typically only present for tender with the type: OTHER.
	public var payment_note: String?
	/// The URL of the receipt for the tender.
	public var receipt_url: String?
	/// The total of all refunds applied to this tender. This amount is always negative or zero.
	public var refunded_money: V1Money?
	/// The time when the tender was settled, in ISO 8601 format.
	public var settled_at: String?
	/// The time when the tender was created, in ISO 8601 format.
	public var tendered_at: String?
	/// The amount of total_money applied to the payment.
	public var tendered_money: V1Money?
	/// The total amount of money provided in this form of tender.
	public var total_money: V1Money?
	/// The type of tender. See [V1TenderType](#type-v1tendertype) for possible values
	public var type: V1TenderType?

	/// A tender represents a discrete monetary exchange. Square represents this exchange as a money object with a specific currency and amount, where the amount is given in the smallest denomination of the given currency.  Square POS can accept more than one form of tender for a single payment (such as by splitting a bill between a credit card and a gift card). The `tender` field of the Payment object lists all forms of tender used for the payment.  Split tender payments behave slightly differently from single tender payments:  The receipt_url for a split tender corresponds only to the first tender listed in the tender field. To get the receipt URLs for the remaining tenders, use the receipt_url fields of the corresponding Tender objects.  *A note on gift cards**: when a customer purchases a Square gift card from a merchant, the merchant receives the full amount of the gift card in the associated payment.  When that gift card is used as a tender, the balance of the gift card is reduced and the merchant receives no funds. A `Tender` object with a type of `SQUARE_GIFT_CARD` indicates a gift card was used for some or all of the associated payment.
	/// - Parameters:
	///   - card_brand: The brand of credit card provided. See [V1TenderCardBrand](#type-v1tendercardbrand) for possible values
	///   - change_back_money: The amount of total_money returned to the buyer as change.
	///   - employee_id: The ID of the employee that processed the tender.
	///   - entry_method: The tender's unique ID. See [V1TenderEntryMethod](#type-v1tenderentrymethod) for possible values
	///   - id: The tender's unique ID.
	///   - is_exchange: Indicates whether or not the tender is associated with an exchange. If is_exchange is true, the tender represents the value of goods returned in an exchange not the actual money paid. The exchange value reduces the tender amounts needed to pay for items purchased in the exchange.
	///   - name: A human-readable description of the tender.
	///   - pan_suffix: The last four digits of the provided credit card's account number.
	///   - payment_note: Notes entered by the merchant about the tender at the time of payment, if any. Typically only present for tender with the type: OTHER.
	///   - receipt_url: The URL of the receipt for the tender.
	///   - refunded_money: The total of all refunds applied to this tender. This amount is always negative or zero.
	///   - settled_at: The time when the tender was settled, in ISO 8601 format.
	///   - tendered_at: The time when the tender was created, in ISO 8601 format.
	///   - tendered_money: The amount of total_money applied to the payment.
	///   - total_money: The total amount of money provided in this form of tender.
	///   - type: The type of tender. See [V1TenderType](#type-v1tendertype) for possible values
	public init(card_brand: V1TenderCardBrand? = nil, change_back_money: V1Money? = nil, employee_id: String? = nil, entry_method: V1TenderEntryMethod? = nil, id: String? = nil, is_exchange: Bool? = nil, name: String? = nil, pan_suffix: String? = nil, payment_note: String? = nil, receipt_url: String? = nil, refunded_money: V1Money? = nil, settled_at: String? = nil, tendered_at: String? = nil, tendered_money: V1Money? = nil, total_money: V1Money? = nil, type: V1TenderType? = nil) {
		self.card_brand = card_brand
		self.change_back_money = change_back_money
		self.employee_id = employee_id
		self.entry_method = entry_method
		self.id = id
		self.is_exchange = is_exchange
		self.name = name
		self.pan_suffix = pan_suffix
		self.payment_note = payment_note
		self.receipt_url = receipt_url
		self.refunded_money = refunded_money
		self.settled_at = settled_at
		self.tendered_at = tendered_at
		self.tendered_money = tendered_money
		self.total_money = total_money
		self.type = type
	}
}

/// The brand of a credit card.
public enum V1TenderCardBrand: String, Codable {
	case OTHER_BRAND
	case VISA
	case MASTER_CARD
	case AMERICAN_EXPRESS
	case DISCOVER
	case DISCOVER_DINERS
	case JCB
	case CHINA_UNIONPAY
	case SQUARE_GIFT_CARD
}

/// 
public enum V1TenderEntryMethod: String, Codable {
	case MANUAL
	case SCANNED
	case SQUARE_CASH
	case SQUARE_WALLET
	case SWIPED
	case WEB_FORM
	case OTHER
}

/// 
public enum V1TenderType: String, Codable {
	case CREDIT_CARD
	case CASH
	case THIRD_PARTY_CARD
	case NO_SALE
	case SQUARE_WALLET
	case SQUARE_GIFT_CARD
	case UNKNOWN
	case OTHER
}

public struct V1UpdateEmployeeRequest: Codable {
	/// An object containing the fields to POST for the request.  See the corresponding object definition for field details.
	public var body: V1Employee

	public init(body: V1Employee) {
		self.body = body
	}
}

public struct V1UpdateEmployeeRoleRequest: Codable {
	/// An object containing the fields to POST for the request.  See the corresponding object definition for field details.
	public var body: V1EmployeeRole

	public init(body: V1EmployeeRole) {
		self.body = body
	}
}

/// V1UpdateOrderRequest
public struct V1UpdateOrderRequest: Codable {
	/// The action to perform on the order (COMPLETE, CANCEL, or REFUND). See [V1UpdateOrderRequestAction](#type-v1updateorderrequestaction) for possible values
	public var action: V1UpdateOrderRequestAction
	/// A merchant-specified note about the canceling of the order. Only valid if action is CANCEL.
	public var canceled_note: String?
	/// A merchant-specified note about the completion of the order. Only valid if action is COMPLETE.
	public var completed_note: String?
	/// A merchant-specified note about the refunding of the order. Only valid if action is REFUND.
	public var refunded_note: String?
	/// The tracking number of the shipment associated with the order. Only valid if action is COMPLETE.
	public var shipped_tracking_number: String?

	/// V1UpdateOrderRequest
	/// - Parameters:
	///   - action: The action to perform on the order (COMPLETE, CANCEL, or REFUND). See [V1UpdateOrderRequestAction](#type-v1updateorderrequestaction) for possible values
	///   - canceled_note: A merchant-specified note about the canceling of the order. Only valid if action is CANCEL.
	///   - completed_note: A merchant-specified note about the completion of the order. Only valid if action is COMPLETE.
	///   - refunded_note: A merchant-specified note about the refunding of the order. Only valid if action is REFUND.
	///   - shipped_tracking_number: The tracking number of the shipment associated with the order. Only valid if action is COMPLETE.
	public init(action: V1UpdateOrderRequestAction, canceled_note: String? = nil, completed_note: String? = nil, refunded_note: String? = nil, shipped_tracking_number: String? = nil) {
		self.action = action
		self.canceled_note = canceled_note
		self.completed_note = completed_note
		self.refunded_note = refunded_note
		self.shipped_tracking_number = shipped_tracking_number
	}
}

/// 
public enum V1UpdateOrderRequestAction: String, Codable {
	case COMPLETE
	case CANCEL
	case REFUND
}

public struct VoidTransactionRequest: Codable {

	public init() {
	}
}

/// Defines the fields that are included in the response body of a request to the [VoidTransaction](#endpoint-voidtransaction) endpoint.
public struct VoidTransactionResponse: Codable {
	/// Any errors that occurred during the request.
	public var errors: [SquareError]?

	/// Defines the fields that are included in the response body of a request to the [VoidTransaction](#endpoint-voidtransaction) endpoint.
	/// - Parameters:
	///   - errors: Any errors that occurred during the request.
	public init(errors: [SquareError]? = nil) {
		self.errors = errors
	}
}

/// An object representing a team member's wage information.
public struct WageSetting: Codable {
	/// The timestamp in RFC 3339 format describing when the wage setting object was created. Ex: "2018-10-04T04:00:00-07:00" or "2019-02-05T12:00:00Z"
	public let created_at: Timestamp?
	/// Whether the team member is exempt from the overtime rules of the seller country.
	public var is_overtime_exempt: Bool?
	/// <b>Required</b> The ordered list of jobs that the team member is assigned to. The first job assignment is considered the team member's "Primary Job". <br> <b>Min Length 1    Max Length 12</b>
	public var job_assignments: [JobAssignment]?
	/// The unique ID of the `TeamMember` whom this wage setting describes.
	public var team_member_id: String?
	/// The timestamp in RFC 3339 format describing when the wage setting object was last updated. Ex: "2018-10-04T04:00:00-07:00" or "2019-02-05T12:00:00Z"
	public let updated_at: Timestamp?
	/// Used for resolving concurrency issues; request will fail if version provided does not match server version at time of request. If not provided, Square executes a blind write, potentially overwriting data from another write. Read about [optimistic concurrency](https://developer.squareup.com/docs/docs/working-with-apis/optimistic-concurrency) in Square APIs for more information.
	public var version: Int?

	/// An object representing a team member's wage information.
	/// - Parameters:
	///   - created_at: The timestamp in RFC 3339 format describing when the wage setting object was created. Ex: "2018-10-04T04:00:00-07:00" or "2019-02-05T12:00:00Z"
	///   - is_overtime_exempt: Whether the team member is exempt from the overtime rules of the seller country.
	///   - job_assignments: <b>Required</b> The ordered list of jobs that the team member is assigned to. The first job assignment is considered the team member's "Primary Job". <br> <b>Min Length 1    Max Length 12</b>
	///   - team_member_id: The unique ID of the `TeamMember` whom this wage setting describes.
	///   - updated_at: The timestamp in RFC 3339 format describing when the wage setting object was last updated. Ex: "2018-10-04T04:00:00-07:00" or "2019-02-05T12:00:00Z"
	///   - version: Used for resolving concurrency issues; request will fail if version provided does not match server version at time of request. If not provided, Square executes a blind write, potentially overwriting data from another write. Read about [optimistic concurrency](https://developer.squareup.com/docs/docs/working-with-apis/optimistic-concurrency) in Square APIs for more information.
	public init(created_at: Timestamp? = nil, is_overtime_exempt: Bool? = nil, job_assignments: [JobAssignment]? = nil, team_member_id: String? = nil, updated_at: Timestamp? = nil, version: Int? = nil) {
		self.created_at = created_at
		self.is_overtime_exempt = is_overtime_exempt
		self.job_assignments = job_assignments
		self.team_member_id = team_member_id
		self.updated_at = updated_at
		self.version = version
	}
}

/// The days of the week.
public enum Weekday: String, Codable {
	/// Monday
	case MON
	/// Tuesday
	case TUE
	/// Wednesday
	case WED
	/// Thursday
	case THU
	/// Friday
	case FRI
	/// Saturday
	case SAT
	/// Sunday
	case SUN
}

/// Sets the Day of the week and hour of the day that a business starts a work week. Used for the calculation of overtime pay.
public struct WorkweekConfig: Codable {
	/// A read-only timestamp in RFC 3339 format; presented in UTC
	public let created_at: Timestamp?
	/// UUID for this object
	public var id: String?
	/// The local time at which a business week cuts over. Represented as a string in `HH:MM` format (`HH:MM:SS` is also accepted, but seconds are truncated).
	public var start_of_day_local_time: String
	/// The day of the week on which a business week cuts over for compensation purposes. See [Weekday](#type-weekday) for possible values
	public var start_of_week: Weekday
	/// A read-only timestamp in RFC 3339 format; presented in UTC
	public let updated_at: Timestamp?
	/// Used for resolving concurrency issues; request will fail if version provided does not match server version at time of request. If not provided, Square executes a blind write; potentially overwriting data from another write.
	public var version: Int?

	/// Sets the Day of the week and hour of the day that a business starts a work week. Used for the calculation of overtime pay.
	/// - Parameters:
	///   - created_at: A read-only timestamp in RFC 3339 format; presented in UTC
	///   - id: UUID for this object
	///   - start_of_day_local_time: The local time at which a business week cuts over. Represented as a string in `HH:MM` format (`HH:MM:SS` is also accepted, but seconds are truncated).
	///   - start_of_week: The day of the week on which a business week cuts over for compensation purposes. See [Weekday](#type-weekday) for possible values
	///   - updated_at: A read-only timestamp in RFC 3339 format; presented in UTC
	///   - version: Used for resolving concurrency issues; request will fail if version provided does not match server version at time of request. If not provided, Square executes a blind write; potentially overwriting data from another write.
	public init(start_of_day_local_time: String, start_of_week: Weekday, created_at: Timestamp? = nil, id: String? = nil, updated_at: Timestamp? = nil, version: Int? = nil) {
		self.start_of_day_local_time = start_of_day_local_time
		self.start_of_week = start_of_week
		self.created_at = created_at
		self.id = id
		self.updated_at = updated_at
		self.version = version
	}
}

