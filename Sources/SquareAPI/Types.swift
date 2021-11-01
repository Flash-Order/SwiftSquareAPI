
/// Basic info about the API
public struct SquareAPIInfo {
	public static var version: String { return "2021-10-20" }

	public static var host: String { return "connect.squareup.com" }
}

/// An empty structure for a useful codable placeholder
public struct Empty: Codable {
	public init() { }
}

/// Represents an additional recipient (other than the merchant) receiving a portion of this tender.
public struct AdditionalRecipient: Codable {
	/// The amount of money distributed to the recipient.
	public var amount_money: Money
	/// The description of the additional recipient.
	public var description: String?
	/// The location ID for a recipient (other than the merchant) receiving a portion of this tender.
	public var location_id: String
	/// The unique ID for this [AdditionalRecipientReceivable](https://developer.squareup.com/reference/square_2021-10-20/objects/AdditionalRecipientReceivable), assigned by the server.
	public var receivable_id: String?

	/// Represents an additional recipient (other than the merchant) receiving a portion of this tender.
	/// - Parameters:
	///   - amount_money: The amount of money distributed to the recipient.
	///   - description: The description of the additional recipient.
	///   - location_id: The location ID for a recipient (other than the merchant) receiving a portion of this tender.
	///   - receivable_id: The unique ID for this [AdditionalRecipientReceivable](https://developer.squareup.com/reference/square_2021-10-20/objects/AdditionalRecipientReceivable), assigned by the server.
	public init(amount_money: Money, location_id: String, description: String? = nil, receivable_id: String? = nil) {
		self.amount_money = amount_money
		self.location_id = location_id
		self.description = description
		self.receivable_id = receivable_id
	}
}

/// Represents a postal address in a country. The address format is based on an [open-source library from Google](https://github.com/google/libaddressinput). For more information, see [AddressValidationMetadata](https://github.com/google/libaddressinput/wiki/AddressValidationMetadata). This format has dedicated fields for four address components: postal code, locality (city), administrative district (state, prefecture, or province), and sublocality (town or village). These components have dedicated fields in the `Address` object because software sometimes behaves differently based on them. For example, sales tax software may charge different amounts of sales tax based on the postal code, and some software is only available in certain states due to compliance reasons.  For the remaining address components, the `Address` type provides the `address_line_1` and `address_line_2` fields for free-form data entry. These fields are free-form because the remaining address components have too many variations around the world and typical software does not parse these components. These fields enable users to enter anything they want.  Note that, in the current implementation, all other `Address` type fields are blank. These include `address_line_3`, `sublocality_2`, `sublocality_3`, `administrative_district_level_2`, `administrative_district_level_3`, `first_name`, `last_name`, and `organization`.  When it comes to localization, the seller's language preferences (see [Language preferences](https://developer.squareup.com/docs/locations-api#location-specific-and-seller-level-language-preferences)) are ignored for addresses. Even though Square products (such as Square Point of Sale and the Seller Dashboard) mostly use a seller's language preference in communication, when it comes to addresses, they will use English for a US address, Japanese for an address in Japan, and so on.
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
	/// The address's country, in ISO 3166-1-alpha-2 format.
	public var country: String?
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

	/// Represents a postal address in a country. The address format is based on an [open-source library from Google](https://github.com/google/libaddressinput). For more information, see [AddressValidationMetadata](https://github.com/google/libaddressinput/wiki/AddressValidationMetadata). This format has dedicated fields for four address components: postal code, locality (city), administrative district (state, prefecture, or province), and sublocality (town or village). These components have dedicated fields in the `Address` object because software sometimes behaves differently based on them. For example, sales tax software may charge different amounts of sales tax based on the postal code, and some software is only available in certain states due to compliance reasons.  For the remaining address components, the `Address` type provides the `address_line_1` and `address_line_2` fields for free-form data entry. These fields are free-form because the remaining address components have too many variations around the world and typical software does not parse these components. These fields enable users to enter anything they want.  Note that, in the current implementation, all other `Address` type fields are blank. These include `address_line_3`, `sublocality_2`, `sublocality_3`, `administrative_district_level_2`, `administrative_district_level_3`, `first_name`, `last_name`, and `organization`.  When it comes to localization, the seller's language preferences (see [Language preferences](https://developer.squareup.com/docs/locations-api#location-specific-and-seller-level-language-preferences)) are ignored for addresses. Even though Square products (such as Square Point of Sale and the Seller Dashboard) mostly use a seller's language preference in communication, when it comes to addresses, they will use English for a US address, Japanese for an address in Japan, and so on.
	/// - Parameters:
	///   - address_line_1: The first line of the address.  Fields that start with `address_line` provide the address's most specific details, like street number, street name, and building name. They do *not* provide less specific details like city, state/province, or country (these details are provided in other fields).
	///   - address_line_2: The second line of the address, if any.
	///   - address_line_3: The third line of the address, if any.
	///   - administrative_district_level_1: A civil entity within the address's country. In the US, this is the state.
	///   - administrative_district_level_2: A civil entity within the address's `administrative_district_level_1`. In the US, this is the county.
	///   - administrative_district_level_3: A civil entity within the address's `administrative_district_level_2`, if any.
	///   - country: The address's country, in ISO 3166-1-alpha-2 format.
	///   - first_name: Optional first name when it's representing recipient.
	///   - last_name: Optional last name when it's representing recipient.
	///   - locality: The city or town of the address.
	///   - organization: Optional organization name when it's representing recipient.
	///   - postal_code: The address's postal code.
	///   - sublocality: A civil region within the address's `locality`, if any.
	///   - sublocality_2: A civil region within the address's `sublocality`, if any.
	///   - sublocality_3: A civil region within the address's `sublocality_2`, if any.
	public init(address_line_1: String? = nil, address_line_2: String? = nil, address_line_3: String? = nil, administrative_district_level_1: String? = nil, administrative_district_level_2: String? = nil, administrative_district_level_3: String? = nil, country: String? = nil, first_name: String? = nil, last_name: String? = nil, locality: String? = nil, organization: String? = nil, postal_code: String? = nil, sublocality: String? = nil, sublocality_2: String? = nil, sublocality_3: String? = nil) {
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

/// Defines an appointment segment of a booking.
public struct AppointmentSegment: Codable {
	/// The time span in minutes of an appointment segment.
	public var duration_minutes: Int
	/// The ID of the [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogItemVariation) object representing the service booked in this segment.
	public var service_variation_id: String
	/// The current version of the item variation representing the service booked in this segment.
	public var service_variation_version: Int
	/// The ID of the [TeamMember](https://developer.squareup.com/reference/square_2021-10-20/objects/TeamMember) object representing the team member booked in this segment.
	public var team_member_id: String

	/// Defines an appointment segment of a booking.
	/// - Parameters:
	///   - duration_minutes: The time span in minutes of an appointment segment.
	///   - service_variation_id: The ID of the [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogItemVariation) object representing the service booked in this segment.
	///   - service_variation_version: The current version of the item variation representing the service booked in this segment.
	///   - team_member_id: The ID of the [TeamMember](https://developer.squareup.com/reference/square_2021-10-20/objects/TeamMember) object representing the team member booked in this segment.
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
	/// The RFC 3339 timestamp specifying the beginning time of the slot available for booking.
	public var start_at: Timestamp?

	/// Describes a slot available for booking, encapsulating appointment segments, the location and starting time.
	/// - Parameters:
	///   - appointment_segments: The list of appointment segments available for booking
	///   - location_id: The ID of the location available for booking.
	///   - start_at: The RFC 3339 timestamp specifying the beginning time of the slot available for booking.
	public init(appointment_segments: [AppointmentSegment]? = nil, location_id: String? = nil, start_at: Timestamp? = nil) {
		self.appointment_segments = appointment_segments
		self.location_id = location_id
		self.start_at = start_at
	}
}

public struct BatchRetrieveCatalogObjectsRequest: Codable {
	/// The specific version of the catalog objects to be included in the response.  This allows you to retrieve historical versions of objects. The specified version value is matched against the [CatalogObject](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogObject)s' `version` attribute.
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
	/// A list of [CatalogObject](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogObject)s returned.
	public var objects: [CatalogObject]?
	/// A list of [CatalogObject](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogObject)s referenced by the object in the `objects` field.
	public var related_objects: [CatalogObject]?

	public init(errors: [SquareError]? = nil, objects: [CatalogObject]? = nil, related_objects: [CatalogObject]? = nil) {
		self.errors = errors
		self.objects = objects
		self.related_objects = related_objects
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

/// Represents the payment details of a card to be used for payments. These details are determined by the payment token generated by Web Payments SDK.
public struct Card: Codable {
	/// The billing address for this card.
	public var billing_address: Address?
	/// The first six digits of the card number, known as the Bank Identification Number (BIN). Only the Payments API returns this field.
	public let bin: String?
	/// The card's brand.
	public let card_brand: String?
	/// The type of the card. The Card object includes this field only in response to Payments API calls.
	public let card_type: String?
	/// The name of the cardholder.
	public var cardholder_name: String?
	/// The ID of a customer created using the Customers API to be associated with the card.
	public var customer_id: String?
	/// Indicates whether or not a card can be used for payments.
	public let enabled: Bool?
	/// The expiration month of the associated card as an integer between 1 and 12.
	public var exp_month: Int?
	/// The four-digit year of the card's expiration date.
	public var exp_year: Int?
	/// Intended as a Square-assigned identifier, based on the card number, to identify the card across multiple locations within a single application.
	public let fingerprint: String?
	/// Unique ID for this card. Generated by Square.
	public let id: String?
	/// The last 4 digits of the card number.
	public let last_4: String?
	/// Indicates whether the Card is prepaid or not. The Card object includes this field only in response to Payments API calls.
	public let prepaid_type: String?
	/// An optional user-defined reference ID that associates this card with another entity in an external system. For example, a customer ID from an external customer management system.
	public var reference_id: String?
	/// Current version number of the card. Increments with each card update. Requests to update an existing Card object will be rejected unless the version in the request matches the current version for the Card.
	public var version: Int?

	/// Represents the payment details of a card to be used for payments. These details are determined by the payment token generated by Web Payments SDK.
	/// - Parameters:
	///   - billing_address: The billing address for this card.
	///   - bin: The first six digits of the card number, known as the Bank Identification Number (BIN). Only the Payments API returns this field.
	///   - card_brand: The card's brand.
	///   - card_type: The type of the card. The Card object includes this field only in response to Payments API calls.
	///   - cardholder_name: The name of the cardholder.
	///   - customer_id: The ID of a customer created using the Customers API to be associated with the card.
	///   - enabled: Indicates whether or not a card can be used for payments.
	///   - exp_month: The expiration month of the associated card as an integer between 1 and 12.
	///   - exp_year: The four-digit year of the card's expiration date.
	///   - fingerprint: Intended as a Square-assigned identifier, based on the card number, to identify the card across multiple locations within a single application.
	///   - id: Unique ID for this card. Generated by Square.
	///   - last_4: The last 4 digits of the card number.
	///   - prepaid_type: Indicates whether the Card is prepaid or not. The Card object includes this field only in response to Payments API calls.
	///   - reference_id: An optional user-defined reference ID that associates this card with another entity in an external system. For example, a customer ID from an external customer management system.
	///   - version: Current version number of the card. Increments with each card update. Requests to update an existing Card object will be rejected unless the version in the request matches the current version for the Card.
	public init(billing_address: Address? = nil, bin: String? = nil, card_brand: String? = nil, card_type: String? = nil, cardholder_name: String? = nil, customer_id: String? = nil, enabled: Bool? = nil, exp_month: Int? = nil, exp_year: Int? = nil, fingerprint: String? = nil, id: String? = nil, last_4: String? = nil, prepaid_type: String? = nil, reference_id: String? = nil, version: Int? = nil) {
		self.billing_address = billing_address
		self.bin = bin
		self.card_brand = card_brand
		self.card_type = card_type
		self.cardholder_name = cardholder_name
		self.customer_id = customer_id
		self.enabled = enabled
		self.exp_month = exp_month
		self.exp_year = exp_year
		self.fingerprint = fingerprint
		self.id = id
		self.last_4 = last_4
		self.prepaid_type = prepaid_type
		self.reference_id = reference_id
		self.version = version
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
	case EBT
}

/// Reflects the current status of a card payment. Contains only non-confidential information.
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
	/// __Deprecated__: Use `Payment.device_details` instead.  Details about the device that took the payment.
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

	/// Reflects the current status of a card payment. Contains only non-confidential information.
	/// - Parameters:
	///   - application_cryptogram: For EMV payments, the cryptogram generated for the payment.
	///   - application_identifier: For EMV payments, the application ID identifies the EMV application used for the payment.
	///   - application_name: For EMV payments, the human-readable name of the EMV application used for the payment.
	///   - auth_result_code: The status code returned by the card issuer that describes the payment's authorization status.
	///   - avs_status: The status code returned from the Address Verification System (AVS) check. The code can be `AVS_ACCEPTED`, `AVS_REJECTED`, or `AVS_NOT_CHECKED`.
	///   - card: The credit card's non-confidential details.
	///   - card_payment_timeline: The timeline for card payments.
	///   - cvv_status: The status code returned from the Card Verification Value (CVV) check. The code can be `CVV_ACCEPTED`, `CVV_REJECTED`, or `CVV_NOT_CHECKED`.
	///   - device_details: __Deprecated__: Use `Payment.device_details` instead.  Details about the device that took the payment.
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
	/// The shift current state.
	public var state: String?

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
	///   - state: The shift current state.
	public init(cash_paid_in_money: Money? = nil, cash_paid_out_money: Money? = nil, cash_payment_money: Money? = nil, cash_refunds_money: Money? = nil, closed_at: String? = nil, closed_cash_money: Money? = nil, closing_employee_id: String? = nil, description: String? = nil, device: CashDrawerDevice? = nil, employee_ids: [String]? = nil, ended_at: String? = nil, ending_employee_id: String? = nil, expected_cash_money: Money? = nil, id: String? = nil, opened_at: String? = nil, opened_cash_money: Money? = nil, opening_employee_id: String? = nil, state: String? = nil) {
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
	/// The type of cash drawer shift event.
	public var event_type: String?
	/// The unique ID of the event.
	public var id: String?

	public init(created_at: String? = nil, description: String? = nil, employee_id: String? = nil, event_money: Money? = nil, event_type: String? = nil, id: String? = nil) {
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
	/// The shift current state.
	public var state: String?

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
	///   - state: The shift current state.
	public init(closed_at: String? = nil, closed_cash_money: Money? = nil, description: String? = nil, ended_at: String? = nil, expected_cash_money: Money? = nil, id: String? = nil, opened_at: String? = nil, opened_cash_money: Money? = nil, state: String? = nil) {
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

/// Stores details about a cash payment. Contains only non-confidential information. For more information, see  [Take Cash Payments](https://developer.squareup.com/docs/payments-api/take-payments/cash-payments).
public struct CashPaymentDetails: Codable {
	/// The amount and currency of the money supplied by the buyer.
	public var buyer_supplied_money: Money
	/// The amount of change due back to the buyer.  This read-only field is calculated from the `amount_money` and `buyer_supplied_money` fields.
	public var change_back_money: Money?

	/// Stores details about a cash payment. Contains only non-confidential information. For more information, see  [Take Cash Payments](https://developer.squareup.com/docs/payments-api/take-payments/cash-payments).
	/// - Parameters:
	///   - buyer_supplied_money: The amount and currency of the money supplied by the buyer.
	///   - change_back_money: The amount of change due back to the buyer.  This read-only field is calculated from the `amount_money` and `buyer_supplied_money` fields.
	public init(buyer_supplied_money: Money, change_back_money: Money? = nil) {
		self.buyer_supplied_money = buyer_supplied_money
		self.change_back_money = change_back_money
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

/// Contains information defining a custom attribute. Custom attributes are intended to store additional information about a catalog object or to associate a catalog object with an entity in another system. Do not use custom attributes to store any sensitive information (personally identifiable information, card details, etc.). [Read more about custom attributes](https://developer.squareup.com/docs/catalog-api/add-custom-attributes)
public struct CatalogCustomAttributeDefinition: Codable {
	/// The set of Catalog Object Types that this Custom Attribute may be applied to. Currently, only `ITEM` and `ITEM_VARIATION` are allowed. At least one type must be included.
	public var allowed_object_types: [String]
	/// The visibility of a custom attribute to applications other than the application that created the attribute.
	public var app_visibility: String?
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
	/// The visibility of a custom attribute in seller-facing UIs (including Square Point of Sale applications and Square Dashboard). May be modified.
	public var seller_visibility: String?
	/// __Read only.__ Contains information about the application that created this custom attribute definition.
	public var source_application: SourceApplication?
	/// Optionally, populated when `type` = `STRING`, unset otherwise.
	public var string_config: CatalogCustomAttributeDefinitionStringConfig?
	/// The type of this custom attribute. Cannot be modified after creation. Required.
	public var type: String

	/// Contains information defining a custom attribute. Custom attributes are intended to store additional information about a catalog object or to associate a catalog object with an entity in another system. Do not use custom attributes to store any sensitive information (personally identifiable information, card details, etc.). [Read more about custom attributes](https://developer.squareup.com/docs/catalog-api/add-custom-attributes)
	/// - Parameters:
	///   - allowed_object_types: The set of Catalog Object Types that this Custom Attribute may be applied to. Currently, only `ITEM` and `ITEM_VARIATION` are allowed. At least one type must be included.
	///   - app_visibility: The visibility of a custom attribute to applications other than the application that created the attribute.
	///   - custom_attribute_usage_count: __Read-only.__ The number of custom attributes that reference this custom attribute definition. Set by the server in response to a ListCatalog request with `include_counts` set to `true`.  If the actual count is greater than 100, `custom_attribute_usage_count` will be set to `100`.
	///   - description: Seller-oriented description of the meaning of this Custom Attribute, any constraints that the seller should observe, etc. May be displayed as a tooltip in Square UIs.
	///   - key: The name of the desired custom attribute key that can be used to access the custom attribute value on catalog objects. Cannot be modified after the custom attribute definition has been created. Must be between 1 and 60 characters, and may only contain the characters `[a-zA-Z0-9_-]`.
	///   - name:  The name of this definition for API and seller-facing UI purposes. The name must be unique within the (merchant, application) pair. Required. May not be empty and may not exceed 255 characters. Can be modified after creation.
	///   - number_config: Optionally, populated when `type` = `NUMBER`, unset otherwise.
	///   - selection_config: Populated when `type` is set to `SELECTION`, unset otherwise.
	///   - seller_visibility: The visibility of a custom attribute in seller-facing UIs (including Square Point of Sale applications and Square Dashboard). May be modified.
	///   - source_application: __Read only.__ Contains information about the application that created this custom attribute definition.
	///   - string_config: Optionally, populated when `type` = `STRING`, unset otherwise.
	///   - type: The type of this custom attribute. Cannot be modified after creation. Required.
	public init(allowed_object_types: [String], name: String, type: String, app_visibility: String? = nil, custom_attribute_usage_count: Int? = nil, description: String? = nil, key: String? = nil, number_config: CatalogCustomAttributeDefinitionNumberConfig? = nil, selection_config: CatalogCustomAttributeDefinitionSelectionConfig? = nil, seller_visibility: String? = nil, source_application: SourceApplication? = nil, string_config: CatalogCustomAttributeDefinitionStringConfig? = nil) {
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


/// An instance of a custom attribute. Custom attributes can be defined and added to `ITEM` and `ITEM_VARIATION` type catalog objects. [Read more about custom attributes](https://developer.squareup.com/docs/catalog-api/add-custom-attributes).
public struct CatalogCustomAttributeValue: Codable {
	/// A `true` or `false` value. Populated if `type` = `BOOLEAN`.
	public var boolean_value: Bool?
	/// __Read-only.__ The id of the [CatalogCustomAttributeDefinition](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogCustomAttributeDefinition) this value belongs to.
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
	/// __Read-only.__ A copy of type from the associated `CatalogCustomAttributeDefinition`.
	public let type: String?

	/// An instance of a custom attribute. Custom attributes can be defined and added to `ITEM` and `ITEM_VARIATION` type catalog objects. [Read more about custom attributes](https://developer.squareup.com/docs/catalog-api/add-custom-attributes).
	/// - Parameters:
	///   - boolean_value: A `true` or `false` value. Populated if `type` = `BOOLEAN`.
	///   - custom_attribute_definition_id: __Read-only.__ The id of the [CatalogCustomAttributeDefinition](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogCustomAttributeDefinition) this value belongs to.
	///   - key: __Read-only.__ A copy of key from the associated `CatalogCustomAttributeDefinition`.
	///   - name: The name of the custom attribute.
	///   - number_value: Populated if `type` = `NUMBER`. Contains a string representation of a decimal number, using a `.` as the decimal separator.
	///   - selection_uid_values: One or more choices from `allowed_selections`. Populated if `type` = `SELECTION`.
	///   - string_value: The string value of the custom attribute.  Populated if `type` = `STRING`.
	///   - type: __Read-only.__ A copy of type from the associated `CatalogCustomAttributeDefinition`.
	public init(boolean_value: Bool? = nil, custom_attribute_definition_id: String? = nil, key: String? = nil, name: String? = nil, number_value: String? = nil, selection_uid_values: [String]? = nil, string_value: String? = nil, type: String? = nil) {
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
	/// Indicates whether the discount is a fixed amount or percentage, or entered at the time of sale.
	public var discount_type: String?
	/// The color of the discount display label in the Square Point of Sale app. This must be a valid hex color code.
	public var label_color: String?
	/// Indicates whether this discount should reduce the price used to calculate tax.  Most discounts should use `MODIFY_TAX_BASIS`. However, in some circumstances taxes must be calculated based on an item's price, ignoring a particular discount. For example, in many US jurisdictions, a manufacturer coupon or instant rebate reduces the price a customer pays but does not reduce the sale price used to calculate how much sales tax is due. In this case, the discount representing that manufacturer coupon should have `DO_NOT_MODIFY_TAX_BASIS` for this field.  If you are unsure whether you need to use this field, consult your tax professional.
	public var modify_tax_basis: String?
	/// The discount name. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	public var name: String?
	/// The percentage of the discount as a string representation of a decimal number, using a `.` as the decimal separator and without a `%` sign. A value of `7.5` corresponds to `7.5%`. Specify a percentage of `0` if `discount_type` is `VARIABLE_PERCENTAGE`.  Do not use this field for amount-based or variable discounts.
	public var percentage: String?
	/// Indicates whether a mobile staff member needs to enter their PIN to apply the discount to a payment in the Square Point of Sale app.
	public var pin_required: Bool?

	/// A discount applicable to items.
	/// - Parameters:
	///   - amount_money: The amount of the discount. Specify an amount of `0` if `discount_type` is `VARIABLE_AMOUNT`.  Do not use this field for percentage-based or variable discounts.
	///   - discount_type: Indicates whether the discount is a fixed amount or percentage, or entered at the time of sale.
	///   - label_color: The color of the discount display label in the Square Point of Sale app. This must be a valid hex color code.
	///   - modify_tax_basis: Indicates whether this discount should reduce the price used to calculate tax.  Most discounts should use `MODIFY_TAX_BASIS`. However, in some circumstances taxes must be calculated based on an item's price, ignoring a particular discount. For example, in many US jurisdictions, a manufacturer coupon or instant rebate reduces the price a customer pays but does not reduce the sale price used to calculate how much sales tax is due. In this case, the discount representing that manufacturer coupon should have `DO_NOT_MODIFY_TAX_BASIS` for this field.  If you are unsure whether you need to use this field, consult your tax professional.
	///   - name: The discount name. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	///   - percentage: The percentage of the discount as a string representation of a decimal number, using a `.` as the decimal separator and without a `%` sign. A value of `7.5` corresponds to `7.5%`. Specify a percentage of `0` if `discount_type` is `VARIABLE_PERCENTAGE`.  Do not use this field for amount-based or variable discounts.
	///   - pin_required: Indicates whether a mobile staff member needs to enter their PIN to apply the discount to a payment in the Square Point of Sale app.
	public init(amount_money: Money? = nil, discount_type: String? = nil, label_color: String? = nil, modify_tax_basis: String? = nil, name: String? = nil, percentage: String? = nil, pin_required: Bool? = nil) {
		self.amount_money = amount_money
		self.discount_type = discount_type
		self.label_color = label_color
		self.modify_tax_basis = modify_tax_basis
		self.name = name
		self.percentage = percentage
		self.pin_required = pin_required
	}
}

/// A mapping between a temporary client-supplied ID and a permanent server-generated ID.  When calling [UpsertCatalogObject](https://developer.squareup.com/reference/square_2021-10-20/catalog-api/upsert-catalog-object) or [BatchUpsertCatalogObjects](https://developer.squareup.com/reference/square_2021-10-20/catalog-api/batch-upsert-catalog-objects) to create a [CatalogObject](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogObject) instance, you can supply a temporary ID for the to-be-created object, especially when the object is to be referenced elsewhere in the same request body. This temporary ID can be any string unique within the call, but must be prefixed by "#".  After the request is submitted and the object created, a permanent server-generated ID is assigned to the new object. The permanent ID is unique across the Square catalog.
public struct CatalogIdMapping: Codable {
	/// The client-supplied temporary `#`-prefixed ID for a new `CatalogObject`.
	public var client_object_id: String?
	/// The permanent ID for the CatalogObject created by the server.
	public var object_id: String?

	/// A mapping between a temporary client-supplied ID and a permanent server-generated ID.  When calling [UpsertCatalogObject](https://developer.squareup.com/reference/square_2021-10-20/catalog-api/upsert-catalog-object) or [BatchUpsertCatalogObjects](https://developer.squareup.com/reference/square_2021-10-20/catalog-api/batch-upsert-catalog-objects) to create a [CatalogObject](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogObject) instance, you can supply a temporary ID for the to-be-created object, especially when the object is to be referenced elsewhere in the same request body. This temporary ID can be any string unique within the call, but must be prefixed by "#".  After the request is submitted and the object created, a permanent server-generated ID is assigned to the new object. The permanent ID is unique across the Square catalog.
	/// - Parameters:
	///   - client_object_id: The client-supplied temporary `#`-prefixed ID for a new `CatalogObject`.
	///   - object_id: The permanent ID for the CatalogObject created by the server.
	public init(client_object_id: String? = nil, object_id: String? = nil) {
		self.client_object_id = client_object_id
		self.object_id = object_id
	}
}

/// An image file to use in Square catalogs. It can be associated with `CatalogItem`, `CatalogItemVariation`, `CatalogCategory`, and `CatalogModifierList` objects. Only the images on items and item variations are exposed in Dashboard. Only the first image on an item is displayed in Square Point of Sale (SPOS). Images on items and variations are displayed through Square Online Store. Images on other object types are for use by 3rd party application developers.
public struct CatalogImage: Codable {
	/// A caption that describes what is shown in the image. Displayed in the Square Online Store. This is a searchable attribute for use in applicable query filters using the [SearchCatalogObjects](https://developer.squareup.com/reference/square_2021-10-20/catalog-api/search-catalog-objects).
	public var caption: String?
	/// The internal name to identify this image in calls to the Square API. This is a searchable attribute for use in applicable query filters using the [SearchCatalogObjects](https://developer.squareup.com/reference/square_2021-10-20/catalog-api/search-catalog-objects). It is not unique and should not be shown in a buyer facing context.
	public var name: String?
	/// The URL of this image, generated by Square after an image is uploaded using the [CreateCatalogImage](https://developer.squareup.com/reference/square_2021-10-20/catalog-api/create-catalog-image) endpoint. To modify the image, use the UpdateCatalogImage endpoint. Do not change the URL field.
	public var url: String?

	/// An image file to use in Square catalogs. It can be associated with `CatalogItem`, `CatalogItemVariation`, `CatalogCategory`, and `CatalogModifierList` objects. Only the images on items and item variations are exposed in Dashboard. Only the first image on an item is displayed in Square Point of Sale (SPOS). Images on items and variations are displayed through Square Online Store. Images on other object types are for use by 3rd party application developers.
	/// - Parameters:
	///   - caption: A caption that describes what is shown in the image. Displayed in the Square Online Store. This is a searchable attribute for use in applicable query filters using the [SearchCatalogObjects](https://developer.squareup.com/reference/square_2021-10-20/catalog-api/search-catalog-objects).
	///   - name: The internal name to identify this image in calls to the Square API. This is a searchable attribute for use in applicable query filters using the [SearchCatalogObjects](https://developer.squareup.com/reference/square_2021-10-20/catalog-api/search-catalog-objects). It is not unique and should not be shown in a buyer facing context.
	///   - url: The URL of this image, generated by Square after an image is uploaded using the [CreateCatalogImage](https://developer.squareup.com/reference/square_2021-10-20/catalog-api/create-catalog-image) endpoint. To modify the image, use the UpdateCatalogImage endpoint. Do not change the URL field.
	public init(caption: String? = nil, name: String? = nil, url: String? = nil) {
		self.caption = caption
		self.name = name
		self.url = url
	}
}

/// A [CatalogObject](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogObject) instance of the `ITEM` type, also referred to as an item, in the catalog.
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
	/// The product type of the item. May not be changed once an item has been created.  Only items of product type `REGULAR` or `APPOINTMENTS_SERVICE` may be created by this API; items with other product types are read-only.
	public var product_type: String?
	/// If `false`, the Square Point of Sale app will present the `CatalogItem`'s details screen immediately, allowing the merchant to choose `CatalogModifier`s before adding the item to the cart.  This is the default behavior.  If `true`, the Square Point of Sale app will immediately add the item to the cart with the pre-selected modifiers, and merchants can edit modifiers by drilling down onto the item's details.  Third-party clients are encouraged to implement similar behaviors.
	public var skip_modifier_screen: Bool?
	/// A name to sort the item by. If this name is unspecified, namely, the `sort_name` field is absent, the regular `name` field is used for sorting.  It is currently supported for sellers of the Japanese locale only.
	public var sort_name: String?
	/// A set of IDs indicating the taxes enabled for this item. When updating an item, any taxes listed here will be added to the item. Taxes may also be added to or deleted from an item using `UpdateItemTaxes`.
	public var tax_ids: [String]?
	/// A list of [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogItemVariation) objects for this item. An item must have at least one variation.
	public var variations: [CatalogObject]?

	/// A [CatalogObject](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogObject) instance of the `ITEM` type, also referred to as an item, in the catalog.
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
	///   - product_type: The product type of the item. May not be changed once an item has been created.  Only items of product type `REGULAR` or `APPOINTMENTS_SERVICE` may be created by this API; items with other product types are read-only.
	///   - skip_modifier_screen: If `false`, the Square Point of Sale app will present the `CatalogItem`'s details screen immediately, allowing the merchant to choose `CatalogModifier`s before adding the item to the cart.  This is the default behavior.  If `true`, the Square Point of Sale app will immediately add the item to the cart with the pre-selected modifiers, and merchants can edit modifiers by drilling down onto the item's details.  Third-party clients are encouraged to implement similar behaviors.
	///   - sort_name: A name to sort the item by. If this name is unspecified, namely, the `sort_name` field is absent, the regular `name` field is used for sorting.  It is currently supported for sellers of the Japanese locale only.
	///   - tax_ids: A set of IDs indicating the taxes enabled for this item. When updating an item, any taxes listed here will be added to the item. Taxes may also be added to or deleted from an item using `UpdateItemTaxes`.
	///   - variations: A list of [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogItemVariation) objects for this item. An item must have at least one variation.
	public init(abbreviation: String? = nil, available_electronically: Bool? = nil, available_for_pickup: Bool? = nil, available_online: Bool? = nil, category_id: String? = nil, description: String? = nil, item_options: [CatalogItemOptionForItem]? = nil, label_color: String? = nil, modifier_list_info: [CatalogItemModifierListInfo]? = nil, name: String? = nil, product_type: String? = nil, skip_modifier_screen: Bool? = nil, sort_name: String? = nil, tax_ids: [String]? = nil, variations: [CatalogObject]? = nil) {
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
		self.sort_name = sort_name
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
	/// Indicates whether the item variation displays an alert when its inventory quantity is less than or equal to its `inventory_alert_threshold`.
	public var inventory_alert_type: String?
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
	/// Indicates whether the item variation's price is fixed or determined at the time of sale.
	public var pricing_type: String?
	/// If the `CatalogItem` that owns this item variation is of type `APPOINTMENTS_SERVICE`, then this is the duration of the service in milliseconds. For example, a 30 minute appointment would have the value `1800000`, which is equal to 30 (minutes) * 60 (seconds per minute) * 1000 (milliseconds per second).
	public var service_duration: Int?
	/// The item variation's SKU, if any. This is a searchable attribute for use in applicable query filters.
	public var sku: String?
	/// Whether stock is counted directly on this variation (TRUE) or only on its components (FALSE). For backward compatibility missing values will be interpreted as TRUE.
	public var stockable: Bool?
	/// The rule of conversion of the [CatalogStockConversion](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogStockConversion) type that describes how this non-stockable sellable/receivable item variation is converted to/from the stockable item variation sharing the same parent item.
	public var stockable_conversion: CatalogStockConversion?
	/// Tokens of employees that can perform the service represented by this variation. Only valid for variations of type `APPOINTMENTS_SERVICE`.
	public var team_member_ids: [String]?
	/// If `true`, inventory tracking is active for the variation.
	public var track_inventory: Bool?
	/// The universal product code (UPC) of the item variation, if any. This is a searchable attribute for use in applicable query filters.  The value of this attribute should be a number of 12-14 digits long.  This restriction is enforced on the Square Seller Dashboard, Square Point of Sale or Retail Point of Sale apps, where this attribute shows in the GTIN field. If a non-compliant UPC value is assigned to this attribute using the API, the value is not editable on the Seller Dashboard, Square Point of Sale or Retail Point of Sale apps unless it is updated to fit the expected format.
	public var upc: String?
	/// Arbitrary user metadata to associate with the item variation. This attribute value length is of Unicode code points.
	public var user_data: String?

	/// An item variation (i.e., product) in the Catalog object model. Each item may have a maximum of 250 item variations.
	/// - Parameters:
	///   - available_for_booking: If the `CatalogItem` that owns this item variation is of type `APPOINTMENTS_SERVICE`, a bool representing whether this service is available for booking.
	///   - inventory_alert_threshold: If the inventory quantity for the variation is less than or equal to this value and `inventory_alert_type` is `LOW_QUANTITY`, the variation displays an alert in the merchant dashboard.  This value is always an integer.
	///   - inventory_alert_type: Indicates whether the item variation displays an alert when its inventory quantity is less than or equal to its `inventory_alert_threshold`.
	///   - item_id: The ID of the `CatalogItem` associated with this item variation.
	///   - item_option_values: List of item option values associated with this item variation. Listed in the same order as the item options of the parent item.
	///   - location_overrides: Per-location price and inventory overrides.
	///   - measurement_unit_id: ID of the ‘CatalogMeasurementUnit’ that is used to measure the quantity sold of this item variation. If left unset, the item will be sold in whole quantities.
	///   - name: The item variation's name. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	///   - ordinal: The order in which this item variation should be displayed. This value is read-only. On writes, the ordinal for each item variation within a parent `CatalogItem` is set according to the item variations's position. On reads, the value is not guaranteed to be sequential or unique.
	///   - price_money: The item variation's price, if fixed pricing is used.
	///   - pricing_type: Indicates whether the item variation's price is fixed or determined at the time of sale.
	///   - service_duration: If the `CatalogItem` that owns this item variation is of type `APPOINTMENTS_SERVICE`, then this is the duration of the service in milliseconds. For example, a 30 minute appointment would have the value `1800000`, which is equal to 30 (minutes) * 60 (seconds per minute) * 1000 (milliseconds per second).
	///   - sku: The item variation's SKU, if any. This is a searchable attribute for use in applicable query filters.
	///   - stockable: Whether stock is counted directly on this variation (TRUE) or only on its components (FALSE). For backward compatibility missing values will be interpreted as TRUE.
	///   - stockable_conversion: The rule of conversion of the [CatalogStockConversion](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogStockConversion) type that describes how this non-stockable sellable/receivable item variation is converted to/from the stockable item variation sharing the same parent item.
	///   - team_member_ids: Tokens of employees that can perform the service represented by this variation. Only valid for variations of type `APPOINTMENTS_SERVICE`.
	///   - track_inventory: If `true`, inventory tracking is active for the variation.
	///   - upc: The universal product code (UPC) of the item variation, if any. This is a searchable attribute for use in applicable query filters.  The value of this attribute should be a number of 12-14 digits long.  This restriction is enforced on the Square Seller Dashboard, Square Point of Sale or Retail Point of Sale apps, where this attribute shows in the GTIN field. If a non-compliant UPC value is assigned to this attribute using the API, the value is not editable on the Seller Dashboard, Square Point of Sale or Retail Point of Sale apps unless it is updated to fit the expected format.
	///   - user_data: Arbitrary user metadata to associate with the item variation. This attribute value length is of Unicode code points.
	public init(available_for_booking: Bool? = nil, inventory_alert_threshold: Int? = nil, inventory_alert_type: String? = nil, item_id: String? = nil, item_option_values: [CatalogItemOptionValueForItemVariation]? = nil, location_overrides: [ItemVariationLocationOverrides]? = nil, measurement_unit_id: String? = nil, name: String? = nil, ordinal: Int? = nil, price_money: Money? = nil, pricing_type: String? = nil, service_duration: Int? = nil, sku: String? = nil, stockable: Bool? = nil, stockable_conversion: CatalogStockConversion? = nil, team_member_ids: [String]? = nil, track_inventory: Bool? = nil, upc: String? = nil, user_data: String? = nil) {
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
		self.stockable = stockable
		self.stockable_conversion = stockable_conversion
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
	/// Indicates whether multiple options from the modifier list can be applied to a single `CatalogItem`.
	public var selection_type: String?

	/// A list of modifiers applicable to items at the time of sale.  For example, a "Condiments" modifier list applicable to a "Hot Dog" item may contain "Ketchup", "Mustard", and "Relish" modifiers. Use the `selection_type` field to specify whether or not multiple selections from the modifier list are allowed.
	/// - Parameters:
	///   - modifiers: The options included in the `CatalogModifierList`. You must include at least one `CatalogModifier`. Each CatalogObject must have type `MODIFIER` and contain `CatalogModifier` data.
	///   - name: The name for the `CatalogModifierList` instance. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	///   - ordinal: Determines where this modifier list appears in a list of `CatalogModifierList` values.
	///   - selection_type: Indicates whether multiple options from the modifier list can be applied to a single `CatalogItem`.
	public init(modifiers: [CatalogObject]? = nil, name: String? = nil, ordinal: Int? = nil, selection_type: String? = nil) {
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

/// The wrapper object for the catalog entries of a given object type.  Depending on the `type` attribute value, a `CatalogObject` instance assumes a type-specific data to yield the corresponding type of catalog object.  For example, if `type=ITEM`, the `CatalogObject` instance must have the ITEM-specific data set on the `item_data` attribute. The resulting `CatalogObject` instance is also a `CatalogItem` instance.  In general, if `type=<OBJECT_TYPE>`, the `CatalogObject` instance must have the `<OBJECT_TYPE>`-specific data set on the `<object_type>_data` attribute. The resulting `CatalogObject` instance is also a `Catalog<ObjectType>` instance.    For a more detailed discussion of the Catalog data model, please see the [Design a Catalog](https://developer.squareup.com/docs/catalog-api/design-a-catalog) guide.
public struct CatalogObject: Codable {
	/// A list of locations where the object is not present, even if `present_at_all_locations` is `true`. This can include locations that are deactivated.
	public var absent_at_location_ids: [String]?
	/// The Connect v1 IDs for this object at each location where it is present, where they differ from the object's Connect V2 ID. The field will only be present for objects that have been created or modified by legacy APIs.
	public var catalog_v1_ids: [CatalogV1Id]?
	/// Structured data for a `CatalogCategory`, set for CatalogObjects of type `CATEGORY`.
	public var category_data: CatalogCategory?
	/// Structured data for a `CatalogCustomAttributeDefinition`, set for CatalogObjects of type `CUSTOM_ATTRIBUTE_DEFINITION`.
	public var custom_attribute_definition_data: CatalogCustomAttributeDefinition?
	/// A map (key-value pairs) of application-defined custom attribute values. The value of a key-value pair is a [CatalogCustomAttributeValue](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogCustomAttributeValue) object. The key is the `key` attribute value defined in the associated [CatalogCustomAttributeDefinition](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogCustomAttributeDefinition) object defined by the application making the request.  If the `CatalogCustomAttributeDefinition` object is defined by another application, the `CatalogCustomAttributeDefinition`'s key attribute value is prefixed by the defining application ID. For example, if the `CatalogCustomAttributeDefinition` has a `key` attribute of `"cocoa_brand"` and the defining application ID is `"abcd1234"`, the key in the map is `"abcd1234:cocoa_brand"` if the application making the request is different from the application defining the custom attribute definition. Otherwise, the key used in the map is simply `"cocoa_brand"`.  Application-defined custom attributes that are set at a global (location-independent) level. Custom attribute values are intended to store additional information about a catalog object or associations with an entity in another system. Do not use custom attributes to store any sensitive information (personally identifiable information, card details, etc.).
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
	/// A list of locations where the object is present, even if `present_at_all_locations` is `false`. This can include locations that are deactivated.
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
	/// The type of this object. Each object type has expected properties expressed in a structured format within its corresponding `*_data` field below.
	public var type: String
	/// Last modification [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) in RFC 3339 format, e.g., `"2016-08-15T23:59:33.123Z"` would indicate the UTC time (denoted by `Z`) of August 15, 2016 at 23:59:33 and 123 milliseconds.
	public let updated_at: Timestamp?
	/// The version of the object. When updating an object, the version supplied must match the version in the database, otherwise the write will be rejected as conflicting.
	public var version: Int?

	/// The wrapper object for the catalog entries of a given object type.  Depending on the `type` attribute value, a `CatalogObject` instance assumes a type-specific data to yield the corresponding type of catalog object.  For example, if `type=ITEM`, the `CatalogObject` instance must have the ITEM-specific data set on the `item_data` attribute. The resulting `CatalogObject` instance is also a `CatalogItem` instance.  In general, if `type=<OBJECT_TYPE>`, the `CatalogObject` instance must have the `<OBJECT_TYPE>`-specific data set on the `<object_type>_data` attribute. The resulting `CatalogObject` instance is also a `Catalog<ObjectType>` instance.    For a more detailed discussion of the Catalog data model, please see the [Design a Catalog](https://developer.squareup.com/docs/catalog-api/design-a-catalog) guide.
	/// - Parameters:
	///   - absent_at_location_ids: A list of locations where the object is not present, even if `present_at_all_locations` is `true`. This can include locations that are deactivated.
	///   - catalog_v1_ids: The Connect v1 IDs for this object at each location where it is present, where they differ from the object's Connect V2 ID. The field will only be present for objects that have been created or modified by legacy APIs.
	///   - category_data: Structured data for a `CatalogCategory`, set for CatalogObjects of type `CATEGORY`.
	///   - custom_attribute_definition_data: Structured data for a `CatalogCustomAttributeDefinition`, set for CatalogObjects of type `CUSTOM_ATTRIBUTE_DEFINITION`.
	///   - custom_attribute_values: A map (key-value pairs) of application-defined custom attribute values. The value of a key-value pair is a [CatalogCustomAttributeValue](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogCustomAttributeValue) object. The key is the `key` attribute value defined in the associated [CatalogCustomAttributeDefinition](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogCustomAttributeDefinition) object defined by the application making the request.  If the `CatalogCustomAttributeDefinition` object is defined by another application, the `CatalogCustomAttributeDefinition`'s key attribute value is prefixed by the defining application ID. For example, if the `CatalogCustomAttributeDefinition` has a `key` attribute of `"cocoa_brand"` and the defining application ID is `"abcd1234"`, the key in the map is `"abcd1234:cocoa_brand"` if the application making the request is different from the application defining the custom attribute definition. Otherwise, the key used in the map is simply `"cocoa_brand"`.  Application-defined custom attributes that are set at a global (location-independent) level. Custom attribute values are intended to store additional information about a catalog object or associations with an entity in another system. Do not use custom attributes to store any sensitive information (personally identifiable information, card details, etc.).
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
	///   - present_at_location_ids: A list of locations where the object is present, even if `present_at_all_locations` is `false`. This can include locations that are deactivated.
	///   - pricing_rule_data: Structured data for a `CatalogPricingRule`, set for CatalogObjects of type `PRICING_RULE`. A `CatalogPricingRule` object often works with a `CatalogProductSet` object or a `CatalogTimePeriod` object.
	///   - product_set_data: Structured data for a `CatalogProductSet`, set for CatalogObjects of type `PRODUCT_SET`.
	///   - quick_amounts_settings_data: Structured data for a `CatalogQuickAmountsSettings`, set for CatalogObjects of type `QUICK_AMOUNTS_SETTINGS`.
	///   - subscription_plan_data: Structured data for a `CatalogSubscriptionPlan`, set for CatalogObjects of type `SUBSCRIPTION_PLAN`.
	///   - tax_data: Structured data for a `CatalogTax`, set for CatalogObjects of type `TAX`.
	///   - time_period_data: Structured data for a `CatalogTimePeriod`, set for CatalogObjects of type `TIME_PERIOD`.
	///   - type: The type of this object. Each object type has expected properties expressed in a structured format within its corresponding `*_data` field below.
	///   - updated_at: Last modification [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) in RFC 3339 format, e.g., `"2016-08-15T23:59:33.123Z"` would indicate the UTC time (denoted by `Z`) of August 15, 2016 at 23:59:33 and 123 milliseconds.
	///   - version: The version of the object. When updating an object, the version supplied must match the version in the database, otherwise the write will be rejected as conflicting.
	public init(id: String, type: String, absent_at_location_ids: [String]? = nil, catalog_v1_ids: [CatalogV1Id]? = nil, category_data: CatalogCategory? = nil, custom_attribute_definition_data: CatalogCustomAttributeDefinition? = nil, custom_attribute_values: CatalogCustomAttributeValue? = nil, discount_data: CatalogDiscount? = nil, image_data: CatalogImage? = nil, image_id: String? = nil, is_deleted: Bool? = nil, item_data: CatalogItem? = nil, item_option_data: CatalogItemOption? = nil, item_option_value_data: CatalogItemOptionValue? = nil, item_variation_data: CatalogItemVariation? = nil, measurement_unit_data: CatalogMeasurementUnit? = nil, modifier_data: CatalogModifier? = nil, modifier_list_data: CatalogModifierList? = nil, present_at_all_locations: Bool? = nil, present_at_location_ids: [String]? = nil, pricing_rule_data: CatalogPricingRule? = nil, product_set_data: CatalogProductSet? = nil, quick_amounts_settings_data: CatalogQuickAmountsSettings? = nil, subscription_plan_data: CatalogSubscriptionPlan? = nil, tax_data: CatalogTax? = nil, time_period_data: CatalogTimePeriod? = nil, updated_at: Timestamp? = nil, version: Int? = nil) {
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

/// Possible types of CatalogObjects returned from the catalog, each containing type-specific properties in the `*_data` field corresponding to the specfied object type.
public enum CatalogObjectType: String, Codable {
	/// The `CatalogObject` instance is of the [CatalogItem](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogItem) type and represents an item. The item-specific data must be set on the `item_data` field.
	case ITEM
	/// The `CatalogObject` instance is of the [CatalogImage](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogImage) type and represents an image. The image-specific data must be set on the `image_data` field.
	case IMAGE
	/// The `CatalogObject` instance is of the [CatalogCategory](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogCategory) type and represents a category. The category-specific data must be set on the `category_data` field.
	case CATEGORY
	/// The `CatalogObject` instance is of the  [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogItemVariation) type and represents an item variation, also referred to as variation. The item variation-specific data must be set on the `item_variation_data` field.
	case ITEM_VARIATION
	/// The `CatalogObject` instance is of the [CatalogTax](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogTax) type and represents a tax. The tax-specific data must be set on the `tax_data` field.
	case TAX
	/// The `CatalogObject` instance is of the [CatalogDiscount](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogDiscount) type and represents a discount. The discount-specific data must be set on the `discount_data` field.
	case DISCOUNT
	/// The `CatalogObject` instance is of the [CatalogModifierList](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogModifierList) type and represents a modifier list. The modifier-list-specific data must be set on the `modifier_list_data` field.
	case MODIFIER_LIST
	/// The `CatalogObject` instance is of the [CatalogModifier](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogModifier) type and represents a modifier. The modifier-specific data must be set on the `modifier_data` field.
	case MODIFIER
	/// The `CatalogObject` instance is of the [CatalogPricingRule](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogPricingRule) type and represents a pricing rule. The pricing-rule-specific data must be set on the `pricing_rule_data` field.
	case PRICING_RULE
	/// The `CatalogObject` instance is of the [CatalogProductSet](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogProductSet) type and represents a product set. The product-set-specific data will be stored in the `product_set_data` field.
	case PRODUCT_SET
	/// The `CatalogObject` instance is of the [CatalogTimePeriod](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogTimePeriod) type and represents a time period. The time-period-specific data must be set on the `time_period_data` field.
	case TIME_PERIOD
	/// The `CatalogObject` instance is of the [CatalogMeasurementUnit](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogMeasurementUnit) type and represents a measurement unit specifying the unit of measure and precision in which an item variation is sold. The measurement-unit-specific data must set on the `measurement_unit_data` field.
	case MEASUREMENT_UNIT
	/// The `CatalogObject` instance is of the [CatalogSubscriptionPlan](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogSubscriptionPlan) type and represents a subscription plan. The subscription-plan-specific data must be stored on the `subscription_plan_data` field.
	case SUBSCRIPTION_PLAN
	/// The `CatalogObject` instance is of the [CatalogItemOption](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogItemOption) type and represents a list of options (such as a color or size of a T-shirt)  that can be assigned to item variations. The item-option-specific data must be on the `item_option_data` field.
	case ITEM_OPTION
	/// The `CatalogObject` instance is of the [CatalogItemOptionValue](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogItemOptionValue) type and represents a value associated with one or more item options. For example, an item option of "Size" may have item option values such as "Small" or "Medium". The item-option-value-specific data must be on the `item_option_value_data` field.
	case ITEM_OPTION_VAL
	/// The `CatalogObject` instance is of the [CatalogCustomAttributeDefinition](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogCustomAttributeDefinition) type and represents the definition of a custom attribute.  The custom-attribute-definition-specific data must be set on the `custom_attribute_definition_data` field.
	case CUSTOM_ATTRIBUTE_DEFINITION
	/// The `CatalogObject` instance is of the [CatalogQuickAmountsSettings](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogQuickAmountsSettings) type and represents settings to configure preset charges for quick payments at each location. For example, a location may have a list of both AUTO and MANUAL quick amounts that are set to DISABLED.  The quick-amounts-settings-specific data must be set on the `quick_amounts_settings_data` field.
	case QUICK_AMOUNTS_SETTINGS
}

/// Defines how discounts are automatically applied to a set of items that match the pricing rule during the active time period.
public struct CatalogPricingRule: Codable {
	/// __Deprecated__: Please use the `exclude_products_id` field to apply an exclude set instead. Exclude sets allow better control over quantity ranges and offer more flexibility for which matched items receive a discount.  `CatalogProductSet` to apply the pricing to. An apply rule matches within the subset of the cart that fits the match rules (the match set). An apply rule can only match once in the match set. If not supplied, the pricing will be applied to all products in the match set. Other products retain their base price, or a price generated by other rules.
	public var apply_products_id: String?
	/// A list of IDs of customer groups, the members of which are eligible for discounts specified in this pricing rule. Notice that a group ID is generated by the Customers API. If this field is not set, the specified discount applies to matched products sold to anyone whether the buyer has a customer profile created or not. If this `customer_group_ids_any` field is set, the specified discount applies only to matched products sold to customers belonging to the specified customer groups.
	public var customer_group_ids_any: [String]?
	/// Unique ID for the `CatalogDiscount` to take off the price of all matched items.
	public var discount_id: String?
	/// `CatalogProductSet` to exclude from the pricing rule. An exclude rule matches within the subset of the cart that fits the match rules (the match set). An exclude rule can only match once in the match set. If not supplied, the pricing will be applied to all products in the match set. Other products retain their base price, or a price generated by other rules.
	public var exclude_products_id: String?
	/// If an `exclude_products_id` was given, controls which subset of matched products is excluded from any discounts.  Default value: `LEAST_EXPENSIVE`
	public var exclude_strategy: String?
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
	///   - customer_group_ids_any: A list of IDs of customer groups, the members of which are eligible for discounts specified in this pricing rule. Notice that a group ID is generated by the Customers API. If this field is not set, the specified discount applies to matched products sold to anyone whether the buyer has a customer profile created or not. If this `customer_group_ids_any` field is set, the specified discount applies only to matched products sold to customers belonging to the specified customer groups.
	///   - discount_id: Unique ID for the `CatalogDiscount` to take off the price of all matched items.
	///   - exclude_products_id: `CatalogProductSet` to exclude from the pricing rule. An exclude rule matches within the subset of the cart that fits the match rules (the match set). An exclude rule can only match once in the match set. If not supplied, the pricing will be applied to all products in the match set. Other products retain their base price, or a price generated by other rules.
	///   - exclude_strategy: If an `exclude_products_id` was given, controls which subset of matched products is excluded from any discounts.  Default value: `LEAST_EXPENSIVE`
	///   - match_products_id: Unique ID for the `CatalogProductSet` that will be matched by this rule. A match rule matches within the entire cart, and can match multiple times. This field will always be set.
	///   - name: User-defined name for the pricing rule. For example, "Buy one get one free" or "10% off".
	///   - time_period_ids: A list of unique IDs for the catalog time periods when this pricing rule is in effect. If left unset, the pricing rule is always in effect.
	///   - valid_from_date: Represents the date the Pricing Rule is valid from. Represented in RFC 3339 full-date format (YYYY-MM-DD).
	///   - valid_from_local_time: Represents the local time the pricing rule should be valid from. Represented in RFC 3339 partial-time format (HH:MM:SS). Partial seconds will be truncated.
	///   - valid_until_date: Represents the date the Pricing Rule is valid until. Represented in RFC 3339 full-date format (YYYY-MM-DD).
	///   - valid_until_local_time: Represents the local time the pricing rule should be valid until. Represented in RFC 3339 partial-time format (HH:MM:SS). Partial seconds will be truncated.
	public init(apply_products_id: String? = nil, customer_group_ids_any: [String]? = nil, discount_id: String? = nil, exclude_products_id: String? = nil, exclude_strategy: String? = nil, match_products_id: String? = nil, name: String? = nil, time_period_ids: [String]? = nil, valid_from_date: Timestamp? = nil, valid_from_local_time: Timestamp? = nil, valid_until_date: Timestamp? = nil, valid_until_local_time: Timestamp? = nil) {
		self.apply_products_id = apply_products_id
		self.customer_group_ids_any = customer_group_ids_any
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

/// Represents a Quick Amount in the Catalog.
public struct CatalogQuickAmount: Codable {
	/// Represents the actual amount of the Quick Amount with Money type.
	public var amount: Money
	/// The order in which this Quick Amount should be displayed.
	public var ordinal: Int?
	/// Describes the ranking of the Quick Amount provided by machine learning model, in the range [0, 100]. MANUAL type amount will always have score = 100.
	public var score: Int?
	/// Represents the type of the Quick Amount.
	public var type: String

	/// Represents a Quick Amount in the Catalog.
	/// - Parameters:
	///   - amount: Represents the actual amount of the Quick Amount with Money type.
	///   - ordinal: The order in which this Quick Amount should be displayed.
	///   - score: Describes the ranking of the Quick Amount provided by machine learning model, in the range [0, 100]. MANUAL type amount will always have score = 100.
	///   - type: Represents the type of the Quick Amount.
	public init(amount: Money, type: String, ordinal: Int? = nil, score: Int? = nil) {
		self.amount = amount
		self.type = type
		self.ordinal = ordinal
		self.score = score
	}
}

/// A parent Catalog Object model represents a set of Quick Amounts and the settings control the amounts.
public struct CatalogQuickAmountsSettings: Codable {
	/// Represents a set of Quick Amounts at this location.
	public var amounts: [CatalogQuickAmount]?
	/// Represents location's eligibility for auto amounts The boolean should be consistent with whether there are AUTO amounts in the `amounts`.
	public var eligible_for_auto_amounts: Bool?
	/// Represents the option seller currently uses on Quick Amounts.
	public var option: String

	/// A parent Catalog Object model represents a set of Quick Amounts and the settings control the amounts.
	/// - Parameters:
	///   - amounts: Represents a set of Quick Amounts at this location.
	///   - eligible_for_auto_amounts: Represents location's eligibility for auto amounts The boolean should be consistent with whether there are AUTO amounts in the `amounts`.
	///   - option: Represents the option seller currently uses on Quick Amounts.
	public init(option: String, amounts: [CatalogQuickAmount]? = nil, eligible_for_auto_amounts: Bool? = nil) {
		self.option = option
		self.amounts = amounts
		self.eligible_for_auto_amounts = eligible_for_auto_amounts
	}
}

/// Describes a subscription plan. For more information, see [Set Up and Manage a Subscription Plan](https://developer.squareup.com/docs/subscriptions-api/setup-plan).
public struct CatalogSubscriptionPlan: Codable {
	/// The name of the plan.
	public var name: String
	/// A list of SubscriptionPhase containing the [SubscriptionPhase](https://developer.squareup.com/reference/square_2021-06-16/objects/SubscriptionPhase) for this plan.
	public let phases: [SubscriptionPhase]

	// no init-- this struct is read-only
}

/// Represents the rule of conversion between a stockable [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogItemVariation) and a non-stockable sell-by or receive-by `CatalogItemVariation` that share the same underlying stock.
public struct CatalogStockConversion: Codable {
	/// The converted equivalent quantity of the non-stockable [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogItemVariation) in its measurement unit. The `stockable_quantity` value and this `nonstockable_quantity` value together define the conversion ratio between stockable item variation and the non-stockable item variation. It accepts a decimal number in a string format that can take up to 10 digits before the decimal point and up to 5 digits after the decimal point.
	public var nonstockable_quantity: String
	/// References to the stockable [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogItemVariation) for this stock conversion. Selling, receiving or recounting the non-stockable `CatalogItemVariation` defined with a stock conversion results in adjustments of this stockable `CatalogItemVariation`. This immutable field must reference a stockable `CatalogItemVariation` that shares the parent [CatalogItem](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogItem) of the converted `CatalogItemVariation.`
	public var stockable_item_variation_id: String
	/// The quantity of the stockable item variation (as identified by `stockable_item_variation_id`) equivalent to the non-stockable item variation quantity (as specified in `nonstockable_quantity`) as defined by this stock conversion.  It accepts a decimal number in a string format that can take up to 10 digits before the decimal point and up to 5 digits after the decimal point.
	public var stockable_quantity: String

	/// Represents the rule of conversion between a stockable [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogItemVariation) and a non-stockable sell-by or receive-by `CatalogItemVariation` that share the same underlying stock.
	/// - Parameters:
	///   - nonstockable_quantity: The converted equivalent quantity of the non-stockable [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogItemVariation) in its measurement unit. The `stockable_quantity` value and this `nonstockable_quantity` value together define the conversion ratio between stockable item variation and the non-stockable item variation. It accepts a decimal number in a string format that can take up to 10 digits before the decimal point and up to 5 digits after the decimal point.
	///   - stockable_item_variation_id: References to the stockable [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogItemVariation) for this stock conversion. Selling, receiving or recounting the non-stockable `CatalogItemVariation` defined with a stock conversion results in adjustments of this stockable `CatalogItemVariation`. This immutable field must reference a stockable `CatalogItemVariation` that shares the parent [CatalogItem](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogItem) of the converted `CatalogItemVariation.`
	///   - stockable_quantity: The quantity of the stockable item variation (as identified by `stockable_item_variation_id`) equivalent to the non-stockable item variation quantity (as specified in `nonstockable_quantity`) as defined by this stock conversion.  It accepts a decimal number in a string format that can take up to 10 digits before the decimal point and up to 5 digits after the decimal point.
	public init(nonstockable_quantity: String, stockable_item_variation_id: String, stockable_quantity: String) {
		self.nonstockable_quantity = nonstockable_quantity
		self.stockable_item_variation_id = stockable_item_variation_id
		self.stockable_quantity = stockable_quantity
	}
}

/// A tax applicable to an item.
public struct CatalogTax: Codable {
	/// If `true`, the fee applies to custom amounts entered into the Square Point of Sale app that are not associated with a particular `CatalogItem`.
	public var applies_to_custom_amounts: Bool?
	/// Whether the tax is calculated based on a payment's subtotal or total.
	public var calculation_phase: String?
	/// A Boolean flag to indicate whether the tax is displayed as enabled (`true`) in the Square Point of Sale app or not (`false`).
	public var enabled: Bool?
	/// Whether the tax is `ADDITIVE` or `INCLUSIVE`.
	public var inclusion_type: String?
	/// The tax's name. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	public var name: String?
	/// The percentage of the tax in decimal form, using a `'.'` as the decimal separator and without a `'%'` sign. A value of `7.5` corresponds to 7.5%.
	public var percentage: String?

	/// A tax applicable to an item.
	/// - Parameters:
	///   - applies_to_custom_amounts: If `true`, the fee applies to custom amounts entered into the Square Point of Sale app that are not associated with a particular `CatalogItem`.
	///   - calculation_phase: Whether the tax is calculated based on a payment's subtotal or total.
	///   - enabled: A Boolean flag to indicate whether the tax is displayed as enabled (`true`) in the Square Point of Sale app or not (`false`).
	///   - inclusion_type: Whether the tax is `ADDITIVE` or `INCLUSIVE`.
	///   - name: The tax's name. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	///   - percentage: The percentage of the tax in decimal form, using a `'.'` as the decimal separator and without a `'%'` sign. A value of `7.5` corresponds to 7.5%.
	public init(applies_to_custom_amounts: Bool? = nil, calculation_phase: String? = nil, enabled: Bool? = nil, inclusion_type: String? = nil, name: String? = nil, percentage: String? = nil) {
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

public struct DeviceCheckoutOptions: Codable {
	/// The unique ID of the device intended for this `TerminalCheckout`. A list of `DeviceCode` objects can be retrieved from the /v2/devices/codes endpoint. Match a `DeviceCode.device_id` value with `device_id` to get the associated device code.
	public var device_id: String
	/// Instructs the device to skip the receipt screen. Defaults to false.
	public var skip_receipt_screen: Bool?
	/// Tip-specific settings.
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
	/// The targeting product type of the device code.
	public var product_type: String
	/// The pairing status of the device code.
	public let status: String?
	/// When this DeviceCode's status was last changed. Timestamp in RFC 3339 format.
	public let status_changed_at: Timestamp?

	public init(product_type: String, code: String? = nil, created_at: Timestamp? = nil, device_id: String? = nil, id: String? = nil, location_id: String? = nil, name: String? = nil, pair_by: Timestamp? = nil, paired_at: Timestamp? = nil, status: String? = nil, status_changed_at: Timestamp? = nil) {
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

/// Represents an error encountered during a request to the Connect API.  See [Handling errors](https://developer.squareup.com/docs/build-basics/handling-errors) for more information.
public struct SquareError: Codable {
	/// The high-level category for the error.
	public var category: String
	/// The specific code of the error.
	public var code: String
	/// A human-readable description of the error for debugging purposes.
	public var detail: String?
	/// The name of the field provided in the original request (if any) that the error pertains to.
	public var field: String?

	/// Represents an error encountered during a request to the Connect API.  See [Handling errors](https://developer.squareup.com/docs/build-basics/handling-errors) for more information.
	/// - Parameters:
	///   - category: The high-level category for the error.
	///   - code: The specific code of the error.
	///   - detail: A human-readable description of the error for debugging purposes.
	///   - field: The name of the field provided in the original request (if any) that the error pertains to.
	public init(category: String, code: String, detail: String? = nil, field: String? = nil) {
		self.category = category
		self.code = code
		self.detail = detail
		self.field = field
	}
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
	/// An error occurred when checking a merchant subscription status
	case MERCHANT_SUBSCRIPTION_ERROR
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
	/// A required subscription was not found for the merchant
	case MERCHANT_SUBSCRIPTION_NOT_FOUND
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
	/// Square received a decline without any additional information. If the payment information seems correct, the buyer can contact their issuer to ask for more information.
	case GENERIC_DECLINE
	/// The card issuer declined the request because the CVV value is invalid.
	case CVV_FAILURE
	/// The card issuer declined the request because the postal code is invalid.
	case ADDRESS_VERIFICATION_FAILURE
	/// The issuer was not able to locate the account on record.
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
	/// The card is not supported either in the geographic region or by the [merchant category code](https://developer.squareup.com/docs/locations-api#initialize-a-merchant-category-code) (MCC).
	case CARD_NOT_SUPPORTED
	/// The card issuer declined the request because the PIN is invalid.
	case INVALID_PIN
	/// The payment is missing a required PIN.
	case MISSING_PIN
	/// The payment is missing a required ACCOUNT_TYPE parameter.
	case MISSING_ACCOUNT_TYPE
	/// The postal code is incorrectly formatted.
	case INVALID_POSTAL_CODE
	/// The app_fee_money on a payment is too high.
	case INVALID_FEES
	/// The card must be swiped, tapped, or dipped. Payments attempted by manually entering the card number are declined.
	case MANUALLY_ENTERED_PAYMENT_NOT_SUPPORTED
	/// Square declined the request because the payment amount exceeded the processing limit for this merchant.
	case PAYMENT_LIMIT_EXCEEDED
	/// When a Gift Card is a payment source, you can allow taking a partial payment  by adding the `accept_partial_authorization` parameter in the request.  However, taking such a partial payment does not work if your request also includes  `tip_money`, `app_fee_money`, or both. Square declines such payments and returns  the `GIFT_CARD_AVAILABLE_AMOUNT` error.  For more information, see  [CreatePayment errors (additional information)](https://developer.squareup.com/docs/payments-api/error-codes#createpayment-errors-additional-information).
	case GIFT_CARD_AVAILABLE_AMOUNT
	/// The account provided cannot carry out transactions.
	case ACCOUNT_UNUSABLE
	/// Bank account rejected or was not authorized for the payment.
	case BUYER_REFUSED_PAYMENT
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

/// Stores details about an external payment. Contains only non-confidential information. For more information, see  [Take External Payments](https://developer.squareup.com/docs/payments-api/take-payments/external-payments).
public struct ExternalPaymentDetails: Codable {
	/// A description of the external payment source. For example,  "Food Delivery Service".
	public var source: String
	/// The fees paid to the source. The `amount_money` minus this field is  the net amount seller receives.
	public var source_fee_money: Money?
	/// An ID to associate the payment to its originating source.
	public var source_id: String?
	/// The type of external payment the seller received. It can be one of the following: - CHECK - Paid using a physical check. - BANK_TRANSFER - Paid using external bank transfer. - OTHER\_GIFT\_CARD - Paid using a non-Square gift card. - CRYPTO - Paid using a crypto currency. - SQUARE_CASH - Paid using Square Cash App. - SOCIAL - Paid using peer-to-peer payment applications. - EXTERNAL - A third-party application gathered this payment outside of Square. - EMONEY - Paid using an E-money provider. - CARD - A credit or debit card that Square does not support. - STORED_BALANCE - Use for house accounts, store credit, and so forth. - FOOD_VOUCHER - Restaurant voucher provided by employers to employees to pay for meals - OTHER - A type not listed here.
	public var type: String

	/// Stores details about an external payment. Contains only non-confidential information. For more information, see  [Take External Payments](https://developer.squareup.com/docs/payments-api/take-payments/external-payments).
	/// - Parameters:
	///   - source: A description of the external payment source. For example,  "Food Delivery Service".
	///   - source_fee_money: The fees paid to the source. The `amount_money` minus this field is  the net amount seller receives.
	///   - source_id: An ID to associate the payment to its originating source.
	///   - type: The type of external payment the seller received. It can be one of the following: - CHECK - Paid using a physical check. - BANK_TRANSFER - Paid using external bank transfer. - OTHER\_GIFT\_CARD - Paid using a non-Square gift card. - CRYPTO - Paid using a crypto currency. - SQUARE_CASH - Paid using Square Cash App. - SOCIAL - Paid using peer-to-peer payment applications. - EXTERNAL - A third-party application gathered this payment outside of Square. - EMONEY - Paid using an E-money provider. - CARD - A credit or debit card that Square does not support. - STORED_BALANCE - Use for house accounts, store credit, and so forth. - FOOD_VOUCHER - Restaurant voucher provided by employers to employees to pay for meals - OTHER - A type not listed here.
	public init(source: String, type: String, source_fee_money: Money? = nil, source_id: String? = nil) {
		self.source = source
		self.type = type
		self.source_fee_money = source_fee_money
		self.source_id = source_id
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

/// Price and inventory alerting overrides for a `CatalogItemVariation` at a specific `Location`.
public struct ItemVariationLocationOverrides: Codable {
	/// If the inventory quantity for the variation is less than or equal to this value and `inventory_alert_type` is `LOW_QUANTITY`, the variation displays an alert in the merchant dashboard.  This value is always an integer.
	public var inventory_alert_threshold: Int?
	/// Indicates whether the `CatalogItemVariation` displays an alert when its inventory quantity is less than or equal to its `inventory_alert_threshold`.
	public var inventory_alert_type: String?
	/// The ID of the `Location`. This can include locations that are deactivated.
	public var location_id: String?
	/// The price of the `CatalogItemVariation` at the given `Location`, or blank for variable pricing.
	public var price_money: Money?
	/// The pricing type (fixed or variable) for the `CatalogItemVariation` at the given `Location`.
	public var pricing_type: String?
	/// If `true`, inventory tracking is active for the `CatalogItemVariation` at this `Location`.
	public var track_inventory: Bool?

	/// Price and inventory alerting overrides for a `CatalogItemVariation` at a specific `Location`.
	/// - Parameters:
	///   - inventory_alert_threshold: If the inventory quantity for the variation is less than or equal to this value and `inventory_alert_type` is `LOW_QUANTITY`, the variation displays an alert in the merchant dashboard.  This value is always an integer.
	///   - inventory_alert_type: Indicates whether the `CatalogItemVariation` displays an alert when its inventory quantity is less than or equal to its `inventory_alert_threshold`.
	///   - location_id: The ID of the `Location`. This can include locations that are deactivated.
	///   - price_money: The price of the `CatalogItemVariation` at the given `Location`, or blank for variable pricing.
	///   - pricing_type: The pricing type (fixed or variable) for the `CatalogItemVariation` at the given `Location`.
	///   - track_inventory: If `true`, inventory tracking is active for the `CatalogItemVariation` at this `Location`.
	public init(inventory_alert_threshold: Int? = nil, inventory_alert_type: String? = nil, location_id: String? = nil, price_money: Money? = nil, pricing_type: String? = nil, track_inventory: Bool? = nil) {
		self.inventory_alert_threshold = inventory_alert_threshold
		self.inventory_alert_type = inventory_alert_type
		self.location_id = location_id
		self.price_money = price_money
		self.pricing_type = pricing_type
		self.track_inventory = track_inventory
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

/// Represents a unit of measurement to use with a quantity, such as ounces or inches. Exactly one of the following fields are required: `custom_unit`, `area_unit`, `length_unit`, `volume_unit`, and `weight_unit`.
public struct MeasurementUnit: Codable {
	/// Represents a standard area unit.
	public var area_unit: String?
	/// A custom unit of measurement defined by the seller using the Point of Sale app or ad-hoc as an order line item.
	public var custom_unit: MeasurementUnitCustom?
	/// Reserved for API integrations that lack the ability to specify a real measurement unit
	public var generic_unit: String?
	/// Represents a standard length unit.
	public var length_unit: String?
	/// Represents a standard unit of time.
	public var time_unit: String?
	/// Represents the type of the measurement unit.
	public var type: String?
	/// Represents a standard volume unit.
	public var volume_unit: String?
	/// Represents a standard unit of weight or mass.
	public var weight_unit: String?

	/// Represents a unit of measurement to use with a quantity, such as ounces or inches. Exactly one of the following fields are required: `custom_unit`, `area_unit`, `length_unit`, `volume_unit`, and `weight_unit`.
	/// - Parameters:
	///   - area_unit: Represents a standard area unit.
	///   - custom_unit: A custom unit of measurement defined by the seller using the Point of Sale app or ad-hoc as an order line item.
	///   - generic_unit: Reserved for API integrations that lack the ability to specify a real measurement unit
	///   - length_unit: Represents a standard length unit.
	///   - time_unit: Represents a standard unit of time.
	///   - type: Represents the type of the measurement unit.
	///   - volume_unit: Represents a standard volume unit.
	///   - weight_unit: Represents a standard unit of weight or mass.
	public init(area_unit: String? = nil, custom_unit: MeasurementUnitCustom? = nil, generic_unit: String? = nil, length_unit: String? = nil, time_unit: String? = nil, type: String? = nil, volume_unit: String? = nil, weight_unit: String? = nil) {
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
	/// The country code associated with the merchant account, in ISO 3166 format.
	public var country: String
	/// The currency associated with the merchant account, in ISO 4217 format.
	public var currency: String?
	/// The Square-issued ID of the merchant.
	public var id: String?
	/// The language code associated with the merchant account, in BCP 47 format.
	public var language_code: String?
	/// The ID of the main `Location` for this merchant.
	public var main_location_id: String?
	/// The merchant status, active or inactive.
	public var status: String?

	/// Represents a Square seller.
	/// - Parameters:
	///   - business_name: The business name of the merchant.
	///   - country: The country code associated with the merchant account, in ISO 3166 format.
	///   - currency: The currency associated with the merchant account, in ISO 4217 format.
	///   - id: The Square-issued ID of the merchant.
	///   - language_code: The language code associated with the merchant account, in BCP 47 format.
	///   - main_location_id: The ID of the main `Location` for this merchant.
	///   - status: The merchant status, active or inactive.
	public init(country: String, business_name: String? = nil, currency: String? = nil, id: String? = nil, language_code: String? = nil, main_location_id: String? = nil, status: String? = nil) {
		self.country = country
		self.business_name = business_name
		self.currency = currency
		self.id = id
		self.language_code = language_code
		self.main_location_id = main_location_id
		self.status = status
	}
}

/// Represents an amount of money. `Money` fields can be signed or unsigned. Fields that do not explicitly define whether they are signed or unsigned are considered unsigned and can only hold positive amounts. For signed fields, the sign of the value indicates the purpose of the money transfer. See [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts) for more information.
public struct Money: Codable {
	/// The amount of money, in the smallest denomination of the currency indicated by `currency`. For example, when `currency` is `USD`, `amount` is in cents. Monetary amounts can be positive or negative. See the specific field description to determine the meaning of the sign in a particular case.
	public var amount: Int?
	/// The type of currency, in __ISO 4217 format__. For example, the currency code for US dollars is `USD`.  See [Currency](https://developer.squareup.com/reference/square_2021-10-20/enums/Currency) for possible values.
	public var currency: String?

	/// Represents an amount of money. `Money` fields can be signed or unsigned. Fields that do not explicitly define whether they are signed or unsigned are considered unsigned and can only hold positive amounts. For signed fields, the sign of the value indicates the purpose of the money transfer. See [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts) for more information.
	/// - Parameters:
	///   - amount: The amount of money, in the smallest denomination of the currency indicated by `currency`. For example, when `currency` is `USD`, `amount` is in cents. Monetary amounts can be positive or negative. See the specific field description to determine the meaning of the sign in a particular case.
	///   - currency: The type of currency, in __ISO 4217 format__. For example, the currency code for US dollars is `USD`.  See [Currency](https://developer.squareup.com/reference/square_2021-10-20/enums/Currency) for possible values.
	public init(amount: Int? = nil, currency: String? = nil) {
		self.amount = amount
		self.currency = currency
	}
}

/// Contains all information related to a single order to process with Square, including line items that specify the products to purchase. `Order` objects also include information about any associated tenders, refunds, and returns.  All Connect V2 Transactions have all been converted to Orders including all associated itemization data.
public struct Order: Codable {
	/// The timestamp for when the order reached a terminal [state](https://developer.squareup.com/reference/square_2021-10-20/enums/OrderState), in RFC 3339 format (for example "2016-09-04T23:59:33.123Z").
	public let closed_at: Timestamp?
	/// The timestamp for when the order was created, in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	public let created_at: Timestamp?
	/// The ID of the [customer](https://developer.squareup.com/reference/square_2021-10-20/objects/Customer) associated with the order.  __IMPORTANT:__ You should specify a `customer_id` if you want the corresponding payment transactions to be explicitly linked to the customer in the Seller Dashboard. If this field is omitted, the  `customer_id` assigned to any underlying `Payment` objects is ignored and might result in the  creation of new [instant profiles](https://developer.squareup.com/docs/customers-api/what-it-does#instant-profiles).
	public var customer_id: String?
	/// The list of all discounts associated with the order.  Discounts can be scoped to either `ORDER` or `LINE_ITEM`. For discounts scoped to `LINE_ITEM`, an `OrderLineItemAppliedDiscount` must be added to each line item that the discount applies to. For discounts with `ORDER` scope, the server generates an `OrderLineItemAppliedDiscount` for every line item.  __IMPORTANT__: If `LINE_ITEM` scope is set on any discounts in this field, using the deprecated `line_items.discounts` field results in an error. Use `line_items.applied_discounts` instead.
	public var discounts: [OrderLineItemDiscount]?
	/// Details about order fulfillment.  Orders can only be created with at most one fulfillment. However, orders returned by the API might contain multiple fulfillments.
	public var fulfillments: [OrderFulfillment]?
	/// The order's unique ID.
	public let id: String?
	/// The line items included in the order.
	public var line_items: [OrderLineItem]?
	/// The ID of the seller location that this order is associated with.
	public var location_id: String
	/// Application-defined data attached to this order. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (such as personally identifiable information or card details).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries can also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a maximum length of 255 characters.  An application can have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  For more information, see  [Metadata](https://developer.squareup.com/docs/build-basics/metadata).
	public var metadata: String?
	/// The net money amounts (sale money - return money).
	public let net_amounts: OrderMoneyAmounts?
	/// Pricing options for an order. The options affect how the order's price is calculated. They can be used, for example, to apply automatic price adjustments that are based on  preconfigured [pricing rules](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogPricingRule).
	public var pricing_options: OrderPricingOptions?
	/// A client-specified ID to associate an entity in another system with this order.
	public var reference_id: String?
	/// The refunds that are part of this order.
	public let refunds: [Refund]?
	/// The rollup of the returned money amounts.
	public let return_amounts: OrderMoneyAmounts?
	/// A collection of items from sale orders being returned in this one. Normally part of an itemized return or exchange. There is exactly one `Return` object per sale `Order` being referenced.
	public let returns: [OrderReturn]?
	/// A set-like list of Rewards that have been added to the Order.
	public let rewards: [OrderReward]?
	/// A positive rounding adjustment to the total of the order. This adjustment is commonly used to apply cash rounding when the minimum unit of account is smaller than the lowest physical denomination of the currency.
	public let rounding_adjustment: OrderRoundingAdjustment?
	/// A list of service charges applied to the order.
	public var service_charges: [OrderServiceCharge]?
	/// The origination details of the order.
	public var source: OrderSource?
	/// The current state of the order.
	public var state: String?
	/// The list of all taxes associated with the order.  Taxes can be scoped to either `ORDER` or `LINE_ITEM`. For taxes with `LINE_ITEM` scope, an `OrderLineItemAppliedTax` must be added to each line item that the tax applies to. For taxes with `ORDER` scope, the server generates an `OrderLineItemAppliedTax` for every line item.  On reads, each tax in the list includes the total amount of that tax applied to the order.  __IMPORTANT__: If `LINE_ITEM` scope is set on any taxes in this field, using the deprecated `line_items.taxes` field results in an error. Use `line_items.applied_taxes` instead.
	public var taxes: [OrderLineItemTax]?
	/// The tenders that were used to pay for the order.
	public let tenders: [Tender]?
	/// A short-term identifier for the order (such as a customer first name, table number, or auto-generated order number that resets daily). For orders created in Square Point of Sale, the `ticket_name` is printed on in-person tickets and stubs. It converts to the `kitchen_printing.name` field in the bill cart feature details.
	public var ticket_name: String?
	/// The total amount of discount money to collect for the order.
	public let total_discount_money: Money?
	/// The total amount of money to collect for the order.
	public let total_money: Money?
	/// The total amount of money collected in service charges for the order.  Note: `total_service_charge_money` is the sum of `applied_money` fields for each individual service charge. Therefore, `total_service_charge_money` only includes inclusive tax amounts, not additive tax amounts.
	public let total_service_charge_money: Money?
	/// The total amount of tax money to collect for the order.
	public let total_tax_money: Money?
	/// The total amount of tip money to collect for the order.
	public let total_tip_money: Money?
	/// The timestamp for when the order was last updated, in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	public let updated_at: Timestamp?
	/// The version number, which is incremented each time an update is committed to the order. Orders not created through the API do not include a version number and therefore cannot be updated.  [Read more about working with versions](https://developer.squareup.com/docs/orders-api/manage-orders#update-orders).
	public var version: Int?

	/// Contains all information related to a single order to process with Square, including line items that specify the products to purchase. `Order` objects also include information about any associated tenders, refunds, and returns.  All Connect V2 Transactions have all been converted to Orders including all associated itemization data.
	/// - Parameters:
	///   - closed_at: The timestamp for when the order reached a terminal [state](https://developer.squareup.com/reference/square_2021-10-20/enums/OrderState), in RFC 3339 format (for example "2016-09-04T23:59:33.123Z").
	///   - created_at: The timestamp for when the order was created, in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	///   - customer_id: The ID of the [customer](https://developer.squareup.com/reference/square_2021-10-20/objects/Customer) associated with the order.  __IMPORTANT:__ You should specify a `customer_id` if you want the corresponding payment transactions to be explicitly linked to the customer in the Seller Dashboard. If this field is omitted, the  `customer_id` assigned to any underlying `Payment` objects is ignored and might result in the  creation of new [instant profiles](https://developer.squareup.com/docs/customers-api/what-it-does#instant-profiles).
	///   - discounts: The list of all discounts associated with the order.  Discounts can be scoped to either `ORDER` or `LINE_ITEM`. For discounts scoped to `LINE_ITEM`, an `OrderLineItemAppliedDiscount` must be added to each line item that the discount applies to. For discounts with `ORDER` scope, the server generates an `OrderLineItemAppliedDiscount` for every line item.  __IMPORTANT__: If `LINE_ITEM` scope is set on any discounts in this field, using the deprecated `line_items.discounts` field results in an error. Use `line_items.applied_discounts` instead.
	///   - fulfillments: Details about order fulfillment.  Orders can only be created with at most one fulfillment. However, orders returned by the API might contain multiple fulfillments.
	///   - id: The order's unique ID.
	///   - line_items: The line items included in the order.
	///   - location_id: The ID of the seller location that this order is associated with.
	///   - metadata: Application-defined data attached to this order. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (such as personally identifiable information or card details).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries can also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a maximum length of 255 characters.  An application can have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  For more information, see  [Metadata](https://developer.squareup.com/docs/build-basics/metadata).
	///   - net_amounts: The net money amounts (sale money - return money).
	///   - pricing_options: Pricing options for an order. The options affect how the order's price is calculated. They can be used, for example, to apply automatic price adjustments that are based on  preconfigured [pricing rules](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogPricingRule).
	///   - reference_id: A client-specified ID to associate an entity in another system with this order.
	///   - refunds: The refunds that are part of this order.
	///   - return_amounts: The rollup of the returned money amounts.
	///   - returns: A collection of items from sale orders being returned in this one. Normally part of an itemized return or exchange. There is exactly one `Return` object per sale `Order` being referenced.
	///   - rewards: A set-like list of Rewards that have been added to the Order.
	///   - rounding_adjustment: A positive rounding adjustment to the total of the order. This adjustment is commonly used to apply cash rounding when the minimum unit of account is smaller than the lowest physical denomination of the currency.
	///   - service_charges: A list of service charges applied to the order.
	///   - source: The origination details of the order.
	///   - state: The current state of the order.
	///   - taxes: The list of all taxes associated with the order.  Taxes can be scoped to either `ORDER` or `LINE_ITEM`. For taxes with `LINE_ITEM` scope, an `OrderLineItemAppliedTax` must be added to each line item that the tax applies to. For taxes with `ORDER` scope, the server generates an `OrderLineItemAppliedTax` for every line item.  On reads, each tax in the list includes the total amount of that tax applied to the order.  __IMPORTANT__: If `LINE_ITEM` scope is set on any taxes in this field, using the deprecated `line_items.taxes` field results in an error. Use `line_items.applied_taxes` instead.
	///   - tenders: The tenders that were used to pay for the order.
	///   - ticket_name: A short-term identifier for the order (such as a customer first name, table number, or auto-generated order number that resets daily). For orders created in Square Point of Sale, the `ticket_name` is printed on in-person tickets and stubs. It converts to the `kitchen_printing.name` field in the bill cart feature details.
	///   - total_discount_money: The total amount of discount money to collect for the order.
	///   - total_money: The total amount of money to collect for the order.
	///   - total_service_charge_money: The total amount of money collected in service charges for the order.  Note: `total_service_charge_money` is the sum of `applied_money` fields for each individual service charge. Therefore, `total_service_charge_money` only includes inclusive tax amounts, not additive tax amounts.
	///   - total_tax_money: The total amount of tax money to collect for the order.
	///   - total_tip_money: The total amount of tip money to collect for the order.
	///   - updated_at: The timestamp for when the order was last updated, in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	///   - version: The version number, which is incremented each time an update is committed to the order. Orders not created through the API do not include a version number and therefore cannot be updated.  [Read more about working with versions](https://developer.squareup.com/docs/orders-api/manage-orders#update-orders).
	public init(location_id: String, closed_at: Timestamp? = nil, created_at: Timestamp? = nil, customer_id: String? = nil, discounts: [OrderLineItemDiscount]? = nil, fulfillments: [OrderFulfillment]? = nil, id: String? = nil, line_items: [OrderLineItem]? = nil, metadata: String? = nil, net_amounts: OrderMoneyAmounts? = nil, pricing_options: OrderPricingOptions? = nil, reference_id: String? = nil, refunds: [Refund]? = nil, return_amounts: OrderMoneyAmounts? = nil, returns: [OrderReturn]? = nil, rewards: [OrderReward]? = nil, rounding_adjustment: OrderRoundingAdjustment? = nil, service_charges: [OrderServiceCharge]? = nil, source: OrderSource? = nil, state: String? = nil, taxes: [OrderLineItemTax]? = nil, tenders: [Tender]? = nil, ticket_name: String? = nil, total_discount_money: Money? = nil, total_money: Money? = nil, total_service_charge_money: Money? = nil, total_tax_money: Money? = nil, total_tip_money: Money? = nil, updated_at: Timestamp? = nil, version: Int? = nil) {
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
		self.ticket_name = ticket_name
		self.total_discount_money = total_discount_money
		self.total_money = total_money
		self.total_service_charge_money = total_service_charge_money
		self.total_tax_money = total_tax_money
		self.total_tip_money = total_tip_money
		self.updated_at = updated_at
		self.version = version
	}
}

/// Contains details about how to fulfill this order.
public struct OrderFulfillment: Codable {
	/// Application-defined data attached to this fulfillment. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (such as personally identifiable information or card details).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries can also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a maximum length of 255 characters.  An application can have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  For more information, see [Metadata](https://developer.squareup.com/docs/build-basics/metadata).
	public var metadata: String?
	/// Contains details for a pickup fulfillment. These details are required when the fulfillment type is `PICKUP`.
	public var pickup_details: OrderFulfillmentPickupDetails?
	/// Contains details for a shipment fulfillment. These details are required when the fulfillment type is `SHIPMENT`.  A shipment fulfillment's relationship to fulfillment `state`: `PROPOSED`: A shipment is requested. `RESERVED`: Fulfillment accepted. Shipment processing. `PREPARED`: Shipment packaged. Shipping label created. `COMPLETED`: Package has been shipped. `CANCELED`: Shipment has been canceled. `FAILED`: Shipment has failed.
	public var shipment_details: OrderFulfillmentShipmentDetails?
	/// The state of the fulfillment.
	public var state: String?
	/// The type of the fulfillment.
	public var type: String?
	/// A unique ID that identifies the fulfillment only within this order.
	public var uid: String?

	/// Contains details about how to fulfill this order.
	/// - Parameters:
	///   - metadata: Application-defined data attached to this fulfillment. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (such as personally identifiable information or card details).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries can also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a maximum length of 255 characters.  An application can have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  For more information, see [Metadata](https://developer.squareup.com/docs/build-basics/metadata).
	///   - pickup_details: Contains details for a pickup fulfillment. These details are required when the fulfillment type is `PICKUP`.
	///   - shipment_details: Contains details for a shipment fulfillment. These details are required when the fulfillment type is `SHIPMENT`.  A shipment fulfillment's relationship to fulfillment `state`: `PROPOSED`: A shipment is requested. `RESERVED`: Fulfillment accepted. Shipment processing. `PREPARED`: Shipment packaged. Shipping label created. `COMPLETED`: Package has been shipped. `CANCELED`: Shipment has been canceled. `FAILED`: Shipment has failed.
	///   - state: The state of the fulfillment.
	///   - type: The type of the fulfillment.
	///   - uid: A unique ID that identifies the fulfillment only within this order.
	public init(metadata: String? = nil, pickup_details: OrderFulfillmentPickupDetails? = nil, shipment_details: OrderFulfillmentShipmentDetails? = nil, state: String? = nil, type: String? = nil, uid: String? = nil) {
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
	/// The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)  indicating when the fulfillment was accepted. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	public let accepted_at: Timestamp?
	/// The duration of time after which an open and accepted pickup fulfillment is automatically moved to the `COMPLETED` state. The duration must be in RFC 3339 format (for example, "P1W3D").  If not set, this pickup fulfillment remains accepted until it is canceled or completed.
	public var auto_complete_duration: Timestamp?
	/// A description of why the pickup was canceled. The maximum length: 100 characters.
	public var cancel_reason: String?
	/// The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)  indicating when the fulfillment was canceled. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	public let canceled_at: Timestamp?
	/// Specific details for curbside pickup. These details can only be populated if `is_curbside_pickup` is set to `true`.
	public var curbside_pickup_details: OrderFulfillmentPickupDetailsCurbsidePickupDetails?
	/// The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) indicating when the fulfillment expired. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	public let expired_at: Timestamp?
	/// The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)  indicating when this fulfillment expires if it is not accepted. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z"). The expiration time can only be set up to 7 days in the future. If `expires_at` is not set, this pickup fulfillment is automatically accepted when  placed.
	public var expires_at: Timestamp?
	/// If set to `true`, indicates that this pickup order is for curbside pickup, not in-store pickup.
	public var is_curbside_pickup: Bool?
	/// A note meant to provide additional instructions about the pickup fulfillment displayed in the Square Point of Sale application and set by the API.
	public var note: String?
	/// The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) indicating when the fulfillment was picked up by the recipient. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	public let picked_up_at: Timestamp?
	/// The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)  that represents the start of the pickup window. Must be in RFC 3339 timestamp format, e.g.,  "2016-09-04T23:59:33.123Z".  For fulfillments with the schedule type `ASAP`, this is automatically set to the current time plus the expected duration to prepare the fulfillment.
	public var pickup_at: Timestamp?
	/// The window of time in which the order should be picked up after the `pickup_at` timestamp. Must be in RFC 3339 duration format, e.g., "P1W3D". Can be used as an informational guideline for merchants.
	public var pickup_window_duration: Timestamp?
	/// The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)  indicating when the fulfillment was placed. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	public let placed_at: Timestamp?
	/// The duration of time it takes to prepare this fulfillment. The duration must be in RFC 3339 format (for example, "P1W3D").
	public var prep_time_duration: Timestamp?
	/// The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)  indicating when the fulfillment is marked as ready for pickup. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	public let ready_at: Timestamp?
	/// Information about the person meant to pick up this fulfillment from a physical location.
	public var recipient: OrderFulfillmentRecipient?
	/// The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)  indicating when the fulfillment was rejected. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	public let rejected_at: Timestamp?
	/// The schedule type of the pickup fulfillment. Defaults to `SCHEDULED`.
	public var schedule_type: String?

	/// Contains details necessary to fulfill a pickup order.
	/// - Parameters:
	///   - accepted_at: The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)  indicating when the fulfillment was accepted. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	///   - auto_complete_duration: The duration of time after which an open and accepted pickup fulfillment is automatically moved to the `COMPLETED` state. The duration must be in RFC 3339 format (for example, "P1W3D").  If not set, this pickup fulfillment remains accepted until it is canceled or completed.
	///   - cancel_reason: A description of why the pickup was canceled. The maximum length: 100 characters.
	///   - canceled_at: The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)  indicating when the fulfillment was canceled. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	///   - curbside_pickup_details: Specific details for curbside pickup. These details can only be populated if `is_curbside_pickup` is set to `true`.
	///   - expired_at: The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) indicating when the fulfillment expired. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	///   - expires_at: The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)  indicating when this fulfillment expires if it is not accepted. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z"). The expiration time can only be set up to 7 days in the future. If `expires_at` is not set, this pickup fulfillment is automatically accepted when  placed.
	///   - is_curbside_pickup: If set to `true`, indicates that this pickup order is for curbside pickup, not in-store pickup.
	///   - note: A note meant to provide additional instructions about the pickup fulfillment displayed in the Square Point of Sale application and set by the API.
	///   - picked_up_at: The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) indicating when the fulfillment was picked up by the recipient. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	///   - pickup_at: The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)  that represents the start of the pickup window. Must be in RFC 3339 timestamp format, e.g.,  "2016-09-04T23:59:33.123Z".  For fulfillments with the schedule type `ASAP`, this is automatically set to the current time plus the expected duration to prepare the fulfillment.
	///   - pickup_window_duration: The window of time in which the order should be picked up after the `pickup_at` timestamp. Must be in RFC 3339 duration format, e.g., "P1W3D". Can be used as an informational guideline for merchants.
	///   - placed_at: The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)  indicating when the fulfillment was placed. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	///   - prep_time_duration: The duration of time it takes to prepare this fulfillment. The duration must be in RFC 3339 format (for example, "P1W3D").
	///   - ready_at: The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)  indicating when the fulfillment is marked as ready for pickup. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	///   - recipient: Information about the person meant to pick up this fulfillment from a physical location.
	///   - rejected_at: The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)  indicating when the fulfillment was rejected. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	///   - schedule_type: The schedule type of the pickup fulfillment. Defaults to `SCHEDULED`.
	public init(accepted_at: Timestamp? = nil, auto_complete_duration: Timestamp? = nil, cancel_reason: String? = nil, canceled_at: Timestamp? = nil, curbside_pickup_details: OrderFulfillmentPickupDetailsCurbsidePickupDetails? = nil, expired_at: Timestamp? = nil, expires_at: Timestamp? = nil, is_curbside_pickup: Bool? = nil, note: String? = nil, picked_up_at: Timestamp? = nil, pickup_at: Timestamp? = nil, pickup_window_duration: Timestamp? = nil, placed_at: Timestamp? = nil, prep_time_duration: Timestamp? = nil, ready_at: Timestamp? = nil, recipient: OrderFulfillmentRecipient? = nil, rejected_at: Timestamp? = nil, schedule_type: String? = nil) {
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
	/// The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)  indicating when the buyer arrived and is waiting for pickup. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	public var buyer_arrived_at: Timestamp?
	/// Specific details for curbside pickup, such as parking number and vehicle model.
	public var curbside_details: String?

	/// Specific details for curbside pickup.
	/// - Parameters:
	///   - buyer_arrived_at: The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates)  indicating when the buyer arrived and is waiting for pickup. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	///   - curbside_details: Specific details for curbside pickup, such as parking number and vehicle model.
	public init(buyer_arrived_at: Timestamp? = nil, curbside_details: String? = nil) {
		self.buyer_arrived_at = buyer_arrived_at
		self.curbside_details = curbside_details
	}
}

/// The schedule type of the pickup fulfillment.
public enum OrderFulfillmentPickupDetailsScheduleType: String, Codable {
	/// Indicates that the fulfillment will be picked up at a scheduled pickup time.
	case SCHEDULED
	/// Indicates that the fulfillment will be picked up as soon as possible and should be prepared immediately.
	case ASAP
}

/// Contains information about the recipient of a fulfillment.
public struct OrderFulfillmentRecipient: Codable {
	/// The address of the fulfillment recipient.  If provided, the address overrides the value pulled from the customer profile indicated by `customer_id`.
	public var address: Address?
	/// The customer ID of the customer associated with the fulfillment.  If `customer_id` is provided, the fulfillment recipient's `display_name`, `email_address`, and `phone_number` are automatically populated from the targeted customer profile. If these fields are set in the request, the request values overrides the information from the customer profile. If the targeted customer profile does not contain the necessary information and these fields are left unset, the request results in an error.
	public var customer_id: String?
	/// The display name of the fulfillment recipient.  If provided, the display name overrides the value pulled from the customer profile indicated by `customer_id`.
	public var display_name: String?
	/// The email address of the fulfillment recipient.  If provided, the email address overrides the value pulled from the customer profile indicated by `customer_id`.
	public var email_address: String?
	/// The phone number of the fulfillment recipient.  If provided, the phone number overrides the value pulled from the customer profile indicated by `customer_id`.
	public var phone_number: String?

	/// Contains information about the recipient of a fulfillment.
	/// - Parameters:
	///   - address: The address of the fulfillment recipient.  If provided, the address overrides the value pulled from the customer profile indicated by `customer_id`.
	///   - customer_id: The customer ID of the customer associated with the fulfillment.  If `customer_id` is provided, the fulfillment recipient's `display_name`, `email_address`, and `phone_number` are automatically populated from the targeted customer profile. If these fields are set in the request, the request values overrides the information from the customer profile. If the targeted customer profile does not contain the necessary information and these fields are left unset, the request results in an error.
	///   - display_name: The display name of the fulfillment recipient.  If provided, the display name overrides the value pulled from the customer profile indicated by `customer_id`.
	///   - email_address: The email address of the fulfillment recipient.  If provided, the email address overrides the value pulled from the customer profile indicated by `customer_id`.
	///   - phone_number: The phone number of the fulfillment recipient.  If provided, the phone number overrides the value pulled from the customer profile indicated by `customer_id`.
	public init(address: Address? = nil, customer_id: String? = nil, display_name: String? = nil, email_address: String? = nil, phone_number: String? = nil) {
		self.address = address
		self.customer_id = customer_id
		self.display_name = display_name
		self.email_address = email_address
		self.phone_number = phone_number
	}
}

/// Contains the details necessary to fulfill a shipment order.
public struct OrderFulfillmentShipmentDetails: Codable {
	/// A description of why the shipment was canceled.
	public var cancel_reason: String?
	/// The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) indicating the shipment was canceled. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	public var canceled_at: Timestamp?
	/// The shipping carrier being used to ship this fulfillment (such as UPS, FedEx, or USPS).
	public var carrier: String?
	/// The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) indicating when the shipment is expected to be delivered to the shipping carrier. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	public var expected_shipped_at: Timestamp?
	/// The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) indicating when the shipment failed to be completed. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	public let failed_at: Timestamp?
	/// A description of why the shipment failed to be completed.
	public var failure_reason: String?
	/// The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) indicating when this fulfillment was moved to the `RESERVED` state, which  indicates that preparation of this shipment has begun. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	public let in_progress_at: Timestamp?
	/// The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) indicating when this fulfillment was moved to the `PREPARED` state, which indicates that the fulfillment is packaged. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	public let packaged_at: Timestamp?
	/// The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) indicating when the shipment was requested. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	public let placed_at: Timestamp?
	/// Information about the person meant to receive this shipment fulfillment.
	public var recipient: OrderFulfillmentRecipient?
	/// The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) indicating when this fulfillment was moved to the `COMPLETED` state, which indicates that the fulfillment has been given to the shipping carrier. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	public let shipped_at: Timestamp?
	/// A note with additional information for the shipping carrier.
	public var shipping_note: String?
	/// A description of the type of shipping product purchased from the carrier (such as First Class, Priority, or Express).
	public var shipping_type: String?
	/// The reference number provided by the carrier to track the shipment's progress.
	public var tracking_number: String?
	/// A link to the tracking webpage on the carrier's website.
	public var tracking_url: String?

	/// Contains the details necessary to fulfill a shipment order.
	/// - Parameters:
	///   - cancel_reason: A description of why the shipment was canceled.
	///   - canceled_at: The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) indicating the shipment was canceled. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	///   - carrier: The shipping carrier being used to ship this fulfillment (such as UPS, FedEx, or USPS).
	///   - expected_shipped_at: The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) indicating when the shipment is expected to be delivered to the shipping carrier. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	///   - failed_at: The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) indicating when the shipment failed to be completed. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	///   - failure_reason: A description of why the shipment failed to be completed.
	///   - in_progress_at: The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) indicating when this fulfillment was moved to the `RESERVED` state, which  indicates that preparation of this shipment has begun. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	///   - packaged_at: The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) indicating when this fulfillment was moved to the `PREPARED` state, which indicates that the fulfillment is packaged. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	///   - placed_at: The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) indicating when the shipment was requested. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	///   - recipient: Information about the person meant to receive this shipment fulfillment.
	///   - shipped_at: The [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) indicating when this fulfillment was moved to the `COMPLETED` state, which indicates that the fulfillment has been given to the shipping carrier. The timestamp must be in RFC 3339 format (for example, "2016-09-04T23:59:33.123Z").
	///   - shipping_note: A note with additional information for the shipping carrier.
	///   - shipping_type: A description of the type of shipping product purchased from the carrier (such as First Class, Priority, or Express).
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

/// Represents a line item in an order. Each line item describes a different product to purchase, with its own quantity and price details.
public struct OrderLineItem: Codable {
	/// The list of references to discounts applied to this line item. Each `OrderLineItemAppliedDiscount` has a `discount_uid` that references the `uid` of a top-level `OrderLineItemDiscounts` applied to the line item. On reads, the amount applied is populated.  An `OrderLineItemAppliedDiscount` is automatically created on every line item for all `ORDER` scoped discounts that are added to the order. `OrderLineItemAppliedDiscount` records for `LINE_ITEM` scoped discounts must be added in requests for the discount to apply to any line items.  To change the amount of a discount, modify the referenced top-level discount.
	public var applied_discounts: [OrderLineItemAppliedDiscount]?
	/// The list of references to taxes applied to this line item. Each `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level `OrderLineItemTax` applied to the line item. On reads, the amount applied is populated.  An `OrderLineItemAppliedTax` is automatically created on every line item for all `ORDER` scoped taxes added to the order. `OrderLineItemAppliedTax` records for `LINE_ITEM` scoped taxes must be added in requests for the tax to apply to any line items.  To change the amount of a tax, modify the referenced top-level tax.
	public var applied_taxes: [OrderLineItemAppliedTax]?
	/// The base price for a single unit of the line item.
	public var base_price_money: Money?
	/// The [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogItemVariation) ID applied to this line item.
	public var catalog_object_id: String?
	/// The version of the catalog object that this line item references.
	public var catalog_version: Int?
	/// The amount of money made in gross sales for this line item. The amount is calculated as the sum of the variation's total price and each modifier's total price.
	public let gross_sales_money: Money?
	/// The type of line item: an itemized sale, a non-itemized sale (custom amount), or the activation or reloading of a gift card.
	public var item_type: String?
	/// Application-defined data attached to this line item. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (such as personally identifiable information or card details).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries can also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a maximum length of 255 characters.  An application can have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  For more information, see [Metadata](https://developer.squareup.com/docs/build-basics/metadata).
	public var metadata: String?
	/// The [CatalogModifier](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogModifier)s applied to this line item.
	public var modifiers: [OrderLineItemModifier]?
	/// The name of the line item.
	public var name: String?
	/// The note of the line item.
	public var note: String?
	/// Describes pricing adjustments that are blocked from manual and automatic application to a line item. For more information, see [Apply Taxes and Discounts](https://developer.squareup.com/docs/orders-api/apply-taxes-and-discounts).
	public var pricing_blocklists: OrderLineItemPricingBlocklists?
	/// The quantity purchased, formatted as a decimal number. For example, `"3"`.  Line items with a quantity of `"0"` are automatically removed when paying for or otherwise completing the order.  Line items with a `quantity_unit` can have non-integer quantities. For example, `"1.70000"`.
	public var quantity: String
	/// The unit and precision that this line item's quantity is measured in.
	public var quantity_unit: OrderQuantityUnit?
	/// The total amount of discount money to collect for the line item.
	public let total_discount_money: Money?
	/// The total amount of money to collect for this line item.
	public let total_money: Money?
	/// The total amount of tax money to collect for the line item.
	public let total_tax_money: Money?
	/// A unique ID that identifies the line item only within this order.
	public var uid: String?
	/// The name of the variation applied to this line item.
	public var variation_name: String?
	/// The total price of all item variations sold in this line item. The price is calculated as `base_price_money` multiplied by `quantity`. It does not include modifiers.
	public let variation_total_price_money: Money?

	/// Represents a line item in an order. Each line item describes a different product to purchase, with its own quantity and price details.
	/// - Parameters:
	///   - applied_discounts: The list of references to discounts applied to this line item. Each `OrderLineItemAppliedDiscount` has a `discount_uid` that references the `uid` of a top-level `OrderLineItemDiscounts` applied to the line item. On reads, the amount applied is populated.  An `OrderLineItemAppliedDiscount` is automatically created on every line item for all `ORDER` scoped discounts that are added to the order. `OrderLineItemAppliedDiscount` records for `LINE_ITEM` scoped discounts must be added in requests for the discount to apply to any line items.  To change the amount of a discount, modify the referenced top-level discount.
	///   - applied_taxes: The list of references to taxes applied to this line item. Each `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level `OrderLineItemTax` applied to the line item. On reads, the amount applied is populated.  An `OrderLineItemAppliedTax` is automatically created on every line item for all `ORDER` scoped taxes added to the order. `OrderLineItemAppliedTax` records for `LINE_ITEM` scoped taxes must be added in requests for the tax to apply to any line items.  To change the amount of a tax, modify the referenced top-level tax.
	///   - base_price_money: The base price for a single unit of the line item.
	///   - catalog_object_id: The [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogItemVariation) ID applied to this line item.
	///   - catalog_version: The version of the catalog object that this line item references.
	///   - gross_sales_money: The amount of money made in gross sales for this line item. The amount is calculated as the sum of the variation's total price and each modifier's total price.
	///   - item_type: The type of line item: an itemized sale, a non-itemized sale (custom amount), or the activation or reloading of a gift card.
	///   - metadata: Application-defined data attached to this line item. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (such as personally identifiable information or card details).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries can also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a maximum length of 255 characters.  An application can have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  For more information, see [Metadata](https://developer.squareup.com/docs/build-basics/metadata).
	///   - modifiers: The [CatalogModifier](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogModifier)s applied to this line item.
	///   - name: The name of the line item.
	///   - note: The note of the line item.
	///   - pricing_blocklists: Describes pricing adjustments that are blocked from manual and automatic application to a line item. For more information, see [Apply Taxes and Discounts](https://developer.squareup.com/docs/orders-api/apply-taxes-and-discounts).
	///   - quantity: The quantity purchased, formatted as a decimal number. For example, `"3"`.  Line items with a quantity of `"0"` are automatically removed when paying for or otherwise completing the order.  Line items with a `quantity_unit` can have non-integer quantities. For example, `"1.70000"`.
	///   - quantity_unit: The unit and precision that this line item's quantity is measured in.
	///   - total_discount_money: The total amount of discount money to collect for the line item.
	///   - total_money: The total amount of money to collect for this line item.
	///   - total_tax_money: The total amount of tax money to collect for the line item.
	///   - uid: A unique ID that identifies the line item only within this order.
	///   - variation_name: The name of the variation applied to this line item.
	///   - variation_total_price_money: The total price of all item variations sold in this line item. The price is calculated as `base_price_money` multiplied by `quantity`. It does not include modifiers.
	public init(quantity: String, applied_discounts: [OrderLineItemAppliedDiscount]? = nil, applied_taxes: [OrderLineItemAppliedTax]? = nil, base_price_money: Money? = nil, catalog_object_id: String? = nil, catalog_version: Int? = nil, gross_sales_money: Money? = nil, item_type: String? = nil, metadata: String? = nil, modifiers: [OrderLineItemModifier]? = nil, name: String? = nil, note: String? = nil, pricing_blocklists: OrderLineItemPricingBlocklists? = nil, quantity_unit: OrderQuantityUnit? = nil, total_discount_money: Money? = nil, total_money: Money? = nil, total_tax_money: Money? = nil, uid: String? = nil, variation_name: String? = nil, variation_total_price_money: Money? = nil) {
		self.quantity = quantity
		self.applied_discounts = applied_discounts
		self.applied_taxes = applied_taxes
		self.base_price_money = base_price_money
		self.catalog_object_id = catalog_object_id
		self.catalog_version = catalog_version
		self.gross_sales_money = gross_sales_money
		self.item_type = item_type
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

/// Represents an applied portion of a discount to a line item in an order.  Order scoped discounts have automatically applied discounts present for each line item. Line-item scoped discounts must have applied discounts added manually for any applicable line items. The corresponding applied money is automatically computed based on participating line items.
public struct OrderLineItemAppliedDiscount: Codable {
	/// The amount of money applied by the discount to the line item.
	public let applied_money: Money?
	/// The `uid` of the discount that the applied discount represents. It must reference a discount present in the `order.discounts` field.  This field is immutable. To change which discounts apply to a line item, you must delete the discount and re-add it as a new `OrderLineItemAppliedDiscount`.
	public var discount_uid: String
	/// A unique ID that identifies the applied discount only within this order.
	public var uid: String?

	/// Represents an applied portion of a discount to a line item in an order.  Order scoped discounts have automatically applied discounts present for each line item. Line-item scoped discounts must have applied discounts added manually for any applicable line items. The corresponding applied money is automatically computed based on participating line items.
	/// - Parameters:
	///   - applied_money: The amount of money applied by the discount to the line item.
	///   - discount_uid: The `uid` of the discount that the applied discount represents. It must reference a discount present in the `order.discounts` field.  This field is immutable. To change which discounts apply to a line item, you must delete the discount and re-add it as a new `OrderLineItemAppliedDiscount`.
	///   - uid: A unique ID that identifies the applied discount only within this order.
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
	/// The `uid` of the tax for which this applied tax represents. It must reference a tax present in the `order.taxes` field.  This field is immutable. To change which taxes apply to a line item, delete and add a new `OrderLineItemAppliedTax`.
	public var tax_uid: String
	/// A unique ID that identifies the applied tax only within this order.
	public var uid: String?

	/// Represents an applied portion of a tax to a line item in an order.  Order-scoped taxes automatically include the applied taxes in each line item. Line item taxes must be referenced from any applicable line items. The corresponding applied money is automatically computed, based on the set of participating line items.
	/// - Parameters:
	///   - applied_money: The amount of money applied by the tax to the line item.
	///   - tax_uid: The `uid` of the tax for which this applied tax represents. It must reference a tax present in the `order.taxes` field.  This field is immutable. To change which taxes apply to a line item, delete and add a new `OrderLineItemAppliedTax`.
	///   - uid: A unique ID that identifies the applied tax only within this order.
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
	/// The amount of discount actually applied to the line item.  The amount represents the amount of money applied as a line-item scoped discount. When an amount-based discount is scoped to the entire order, the value of `applied_money` is different than `amount_money` because the total amount of the discount is distributed across all line items.
	public var applied_money: Money?
	/// The catalog object ID referencing [CatalogDiscount](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogDiscount).
	public var catalog_object_id: String?
	/// The version of the catalog object that this discount references.
	public var catalog_version: Int?
	/// Application-defined data attached to this discount. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (such as personally identifiable information or card details).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries can also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a maximum length of 255 characters.  An application can have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  For more information, see [Metadata](https://developer.squareup.com/docs/build-basics/metadata).
	public var metadata: String?
	/// The discount's name.
	public var name: String?
	/// The percentage of the discount, as a string representation of a decimal number. A value of `7.25` corresponds to a percentage of 7.25%.  `percentage` is not set for amount-based discounts.
	public var percentage: String?
	/// The object ID of a [pricing rule](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogPricingRule) to be applied  automatically to this discount. The specification and application of the discounts, to  which a `pricing_rule_id` is assigned, are completely controlled by the corresponding  pricing rule.
	public let pricing_rule_id: String?
	/// The reward IDs corresponding to this discount. The application and specification of discounts that have `reward_ids` are completely controlled by the backing criteria corresponding to the reward tiers of the rewards that are added to the order through the Loyalty API. To manually unapply discounts that are the result of added rewards, the rewards must be removed from the order through the Loyalty API.
	public let reward_ids: [String]?
	/// Indicates the level at which the discount applies. For `ORDER` scoped discounts, Square generates references in `applied_discounts` on all order line items that do not have them. For `LINE_ITEM` scoped discounts, the discount only applies to line items with a discount reference in their `applied_discounts` field.  This field is immutable. To change the scope of a discount, you must delete the discount and re-add it as a new discount.
	public var scope: String?
	/// The type of the discount.  Discounts that do not reference a catalog object ID must have a type of `FIXED_PERCENTAGE` or `FIXED_AMOUNT`.
	public var type: String?
	/// A unique ID that identifies the discount only within this order.
	public var uid: String?

	/// Represents a discount that applies to one or more line items in an order.  Fixed-amount, order-scoped discounts are distributed across all non-zero line item totals. The amount distributed to each line item is relative to the amount contributed by the item to the order subtotal.
	/// - Parameters:
	///   - amount_money: The total declared monetary amount of the discount.  `amount_money` is not set for percentage-based discounts.
	///   - applied_money: The amount of discount actually applied to the line item.  The amount represents the amount of money applied as a line-item scoped discount. When an amount-based discount is scoped to the entire order, the value of `applied_money` is different than `amount_money` because the total amount of the discount is distributed across all line items.
	///   - catalog_object_id: The catalog object ID referencing [CatalogDiscount](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogDiscount).
	///   - catalog_version: The version of the catalog object that this discount references.
	///   - metadata: Application-defined data attached to this discount. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (such as personally identifiable information or card details).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries can also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a maximum length of 255 characters.  An application can have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  For more information, see [Metadata](https://developer.squareup.com/docs/build-basics/metadata).
	///   - name: The discount's name.
	///   - percentage: The percentage of the discount, as a string representation of a decimal number. A value of `7.25` corresponds to a percentage of 7.25%.  `percentage` is not set for amount-based discounts.
	///   - pricing_rule_id: The object ID of a [pricing rule](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogPricingRule) to be applied  automatically to this discount. The specification and application of the discounts, to  which a `pricing_rule_id` is assigned, are completely controlled by the corresponding  pricing rule.
	///   - reward_ids: The reward IDs corresponding to this discount. The application and specification of discounts that have `reward_ids` are completely controlled by the backing criteria corresponding to the reward tiers of the rewards that are added to the order through the Loyalty API. To manually unapply discounts that are the result of added rewards, the rewards must be removed from the order through the Loyalty API.
	///   - scope: Indicates the level at which the discount applies. For `ORDER` scoped discounts, Square generates references in `applied_discounts` on all order line items that do not have them. For `LINE_ITEM` scoped discounts, the discount only applies to line items with a discount reference in their `applied_discounts` field.  This field is immutable. To change the scope of a discount, you must delete the discount and re-add it as a new discount.
	///   - type: The type of the discount.  Discounts that do not reference a catalog object ID must have a type of `FIXED_PERCENTAGE` or `FIXED_AMOUNT`.
	///   - uid: A unique ID that identifies the discount only within this order.
	public init(amount_money: Money? = nil, applied_money: Money? = nil, catalog_object_id: String? = nil, catalog_version: Int? = nil, metadata: String? = nil, name: String? = nil, percentage: String? = nil, pricing_rule_id: String? = nil, reward_ids: [String]? = nil, scope: String? = nil, type: String? = nil, uid: String? = nil) {
		self.amount_money = amount_money
		self.applied_money = applied_money
		self.catalog_object_id = catalog_object_id
		self.catalog_version = catalog_version
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

/// Indicates whether this is a line-item or order-level discount.
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
	/// Apply the discount as a fixed percentage (such as 5%) off the item price.
	case FIXED_PERCENTAGE
	/// Apply the discount as a fixed monetary value (such as $1.00) off the item price.
	case FIXED_AMOUNT
	/// Apply the discount as a variable percentage based on the item price.  The specific discount percentage of a `VARIABLE_PERCENTAGE` discount is assigned at the time of the purchase.
	case VARIABLE_PERCENTAGE
	/// Apply the discount as a variable amount based on the item price.  The specific discount amount of a `VARIABLE_AMOUNT` discount is assigned at the time of the purchase.
	case VARIABLE_AMOUNT
}

/// Represents the line item type.
public enum OrderLineItemItemType: String, Codable {
	/// Indicates that the line item is an itemized sale.
	case ITEM
	/// Indicates that the line item is a non-itemized sale.
	case CUSTOM_AMOUNT
	/// Indicates that the line item is a gift card sale. Gift cards sold through the Orders API are sold in an unactivated state and can be activated through the Gift Cards API using the line item `uid`.
	case GIFT_CARD
}

/// A [CatalogModifier](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogModifier).
public struct OrderLineItemModifier: Codable {
	/// The base price for the modifier.  `base_price_money` is required for ad hoc modifiers. If both `catalog_object_id` and `base_price_money` are set, `base_price_money` will override the predefined [CatalogModifier](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogModifier) price.
	public var base_price_money: Money?
	/// The catalog object ID referencing [CatalogModifier](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogModifier).
	public var catalog_object_id: String?
	/// The version of the catalog object that this modifier references.
	public var catalog_version: Int?
	/// The name of the item modifier.
	public var name: String?
	/// The total price of the item modifier for its line item. This is the modifier's `base_price_money` multiplied by the line item's quantity.
	public let total_price_money: Money?
	/// A unique ID that identifies the modifier only within this order.
	public var uid: String?

	/// A [CatalogModifier](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogModifier).
	/// - Parameters:
	///   - base_price_money: The base price for the modifier.  `base_price_money` is required for ad hoc modifiers. If both `catalog_object_id` and `base_price_money` are set, `base_price_money` will override the predefined [CatalogModifier](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogModifier) price.
	///   - catalog_object_id: The catalog object ID referencing [CatalogModifier](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogModifier).
	///   - catalog_version: The version of the catalog object that this modifier references.
	///   - name: The name of the item modifier.
	///   - total_price_money: The total price of the item modifier for its line item. This is the modifier's `base_price_money` multiplied by the line item's quantity.
	///   - uid: A unique ID that identifies the modifier only within this order.
	public init(base_price_money: Money? = nil, catalog_object_id: String? = nil, catalog_version: Int? = nil, name: String? = nil, total_price_money: Money? = nil, uid: String? = nil) {
		self.base_price_money = base_price_money
		self.catalog_object_id = catalog_object_id
		self.catalog_version = catalog_version
		self.name = name
		self.total_price_money = total_price_money
		self.uid = uid
	}
}

/// Describes pricing adjustments that are blocked from manual and  automatic application to a line item. For more information, see  [Apply Taxes and Discounts](https://developer.squareup.com/docs/orders-api/apply-taxes-and-discounts).
public struct OrderLineItemPricingBlocklists: Codable {
	/// A list of discounts blocked from applying to the line item.  Discounts can be blocked by the `discount_uid` (for ad hoc discounts) or  the `discount_catalog_object_id` (for catalog discounts).
	public var blocked_discounts: [OrderLineItemPricingBlocklistsBlockedDiscount]?
	/// A list of taxes blocked from applying to the line item.  Taxes can be blocked by the `tax_uid` (for ad hoc taxes) or  the `tax_catalog_object_id` (for catalog taxes).
	public var blocked_taxes: [OrderLineItemPricingBlocklistsBlockedTax]?

	/// Describes pricing adjustments that are blocked from manual and  automatic application to a line item. For more information, see  [Apply Taxes and Discounts](https://developer.squareup.com/docs/orders-api/apply-taxes-and-discounts).
	/// - Parameters:
	///   - blocked_discounts: A list of discounts blocked from applying to the line item.  Discounts can be blocked by the `discount_uid` (for ad hoc discounts) or  the `discount_catalog_object_id` (for catalog discounts).
	///   - blocked_taxes: A list of taxes blocked from applying to the line item.  Taxes can be blocked by the `tax_uid` (for ad hoc taxes) or  the `tax_catalog_object_id` (for catalog taxes).
	public init(blocked_discounts: [OrderLineItemPricingBlocklistsBlockedDiscount]? = nil, blocked_taxes: [OrderLineItemPricingBlocklistsBlockedTax]? = nil) {
		self.blocked_discounts = blocked_discounts
		self.blocked_taxes = blocked_taxes
	}
}

/// A discount to block from applying to a line item. The discount must be  identified by either `discount_uid` or `discount_catalog_object_id`, but not both.
public struct OrderLineItemPricingBlocklistsBlockedDiscount: Codable {
	/// The `catalog_object_id` of the discount that should be blocked.  Use this field to block catalog discounts. For ad hoc discounts, use the  `discount_uid` field.
	public var discount_catalog_object_id: String?
	/// The `uid` of the discount that should be blocked. Use this field to block  ad hoc discounts. For catalog discounts, use the `discount_catalog_object_id` field.
	public var discount_uid: String?
	/// A unique ID of the `BlockedDiscount` within the order.
	public var uid: String?

	/// A discount to block from applying to a line item. The discount must be  identified by either `discount_uid` or `discount_catalog_object_id`, but not both.
	/// - Parameters:
	///   - discount_catalog_object_id: The `catalog_object_id` of the discount that should be blocked.  Use this field to block catalog discounts. For ad hoc discounts, use the  `discount_uid` field.
	///   - discount_uid: The `uid` of the discount that should be blocked. Use this field to block  ad hoc discounts. For catalog discounts, use the `discount_catalog_object_id` field.
	///   - uid: A unique ID of the `BlockedDiscount` within the order.
	public init(discount_catalog_object_id: String? = nil, discount_uid: String? = nil, uid: String? = nil) {
		self.discount_catalog_object_id = discount_catalog_object_id
		self.discount_uid = discount_uid
		self.uid = uid
	}
}

/// A tax to block from applying to a line item. The tax must be  identified by either `tax_uid` or `tax_catalog_object_id`, but not both.
public struct OrderLineItemPricingBlocklistsBlockedTax: Codable {
	/// The `catalog_object_id` of the tax that should be blocked.  Use this field to block catalog taxes. For ad hoc taxes, use the  `tax_uid` field.
	public var tax_catalog_object_id: String?
	/// The `uid` of the tax that should be blocked. Use this field to block  ad hoc taxes. For catalog, taxes use the `tax_catalog_object_id` field.
	public var tax_uid: String?
	/// A unique ID of the `BlockedTax` within the order.
	public var uid: String?

	/// A tax to block from applying to a line item. The tax must be  identified by either `tax_uid` or `tax_catalog_object_id`, but not both.
	/// - Parameters:
	///   - tax_catalog_object_id: The `catalog_object_id` of the tax that should be blocked.  Use this field to block catalog taxes. For ad hoc taxes, use the  `tax_uid` field.
	///   - tax_uid: The `uid` of the tax that should be blocked. Use this field to block  ad hoc taxes. For catalog, taxes use the `tax_catalog_object_id` field.
	///   - uid: A unique ID of the `BlockedTax` within the order.
	public init(tax_catalog_object_id: String? = nil, tax_uid: String? = nil, uid: String? = nil) {
		self.tax_catalog_object_id = tax_catalog_object_id
		self.tax_uid = tax_uid
		self.uid = uid
	}
}

/// Represents a tax that applies to one or more line item in the order.  Fixed-amount, order-scoped taxes are distributed across all non-zero line item totals. The amount distributed to each line item is relative to the amount the item contributes to the order subtotal.
public struct OrderLineItemTax: Codable {
	/// The amount of money applied by the tax in the order.
	public var applied_money: Money?
	/// Determines whether the tax was automatically applied to the order based on the catalog configuration. For an example, see  [Automatically Apply Taxes to an Order](https://developer.squareup.com/docs/orders-api/apply-taxes-and-discounts/auto-apply-taxes).
	public let auto_applied: Bool?
	/// The catalog object ID referencing [CatalogTax](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogTax).
	public var catalog_object_id: String?
	/// The version of the catalog object that this tax references.
	public var catalog_version: Int?
	/// Application-defined data attached to this tax. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (such as personally identifiable information or card details).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries can also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a maximum length of 255 characters.  An application can have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  For more information, see [Metadata](https://developer.squareup.com/docs/build-basics/metadata).
	public var metadata: String?
	/// The tax's name.
	public var name: String?
	/// The percentage of the tax, as a string representation of a decimal number. For example, a value of `"7.25"` corresponds to a percentage of 7.25%.
	public var percentage: String?
	/// Indicates the level at which the tax applies. For `ORDER` scoped taxes, Square generates references in `applied_taxes` on all order line items that do not have them. For `LINE_ITEM` scoped taxes, the tax only applies to line items with references in their `applied_taxes` field.  This field is immutable. To change the scope, you must delete the tax and re-add it as a new tax.
	public var scope: String?
	/// Indicates the calculation method used to apply the tax.
	public var type: String?
	/// A unique ID that identifies the tax only within this order.
	public var uid: String?

	/// Represents a tax that applies to one or more line item in the order.  Fixed-amount, order-scoped taxes are distributed across all non-zero line item totals. The amount distributed to each line item is relative to the amount the item contributes to the order subtotal.
	/// - Parameters:
	///   - applied_money: The amount of money applied by the tax in the order.
	///   - auto_applied: Determines whether the tax was automatically applied to the order based on the catalog configuration. For an example, see  [Automatically Apply Taxes to an Order](https://developer.squareup.com/docs/orders-api/apply-taxes-and-discounts/auto-apply-taxes).
	///   - catalog_object_id: The catalog object ID referencing [CatalogTax](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogTax).
	///   - catalog_version: The version of the catalog object that this tax references.
	///   - metadata: Application-defined data attached to this tax. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (such as personally identifiable information or card details).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries can also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a maximum length of 255 characters.  An application can have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  For more information, see [Metadata](https://developer.squareup.com/docs/build-basics/metadata).
	///   - name: The tax's name.
	///   - percentage: The percentage of the tax, as a string representation of a decimal number. For example, a value of `"7.25"` corresponds to a percentage of 7.25%.
	///   - scope: Indicates the level at which the tax applies. For `ORDER` scoped taxes, Square generates references in `applied_taxes` on all order line items that do not have them. For `LINE_ITEM` scoped taxes, the tax only applies to line items with references in their `applied_taxes` field.  This field is immutable. To change the scope, you must delete the tax and re-add it as a new tax.
	///   - type: Indicates the calculation method used to apply the tax.
	///   - uid: A unique ID that identifies the tax only within this order.
	public init(applied_money: Money? = nil, auto_applied: Bool? = nil, catalog_object_id: String? = nil, catalog_version: Int? = nil, metadata: String? = nil, name: String? = nil, percentage: String? = nil, scope: String? = nil, type: String? = nil, uid: String? = nil) {
		self.applied_money = applied_money
		self.auto_applied = auto_applied
		self.catalog_object_id = catalog_object_id
		self.catalog_version = catalog_version
		self.metadata = metadata
		self.name = name
		self.percentage = percentage
		self.scope = scope
		self.type = type
		self.uid = uid
	}
}

/// Indicates whether this is a line-item or order-level tax.
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
	/// The tax is an additive tax. The tax amount is added on top of the price. For example, an item with a cost of 1.00 USD and a 10% additive tax has a total cost to the buyer of 1.10 USD.
	case ADDITIVE
	/// The tax is an inclusive tax. Inclusive taxes are already included in the line item price or order total. For example, an item with a cost of 1.00 USD and a 10% inclusive tax has a pretax cost of 0.91 USD (91 cents) and a 0.09 (9 cents) tax for a total cost of 1.00 USD to the buyer.
	case INCLUSIVE
}

/// A collection of various money amounts.
public struct OrderMoneyAmounts: Codable {
	/// The money associated with discounts.
	public var discount_money: Money?
	/// The money associated with service charges.
	public var service_charge_money: Money?
	/// The money associated with taxes.
	public var tax_money: Money?
	/// The money associated with tips.
	public var tip_money: Money?
	/// The total money.
	public var total_money: Money?

	/// A collection of various money amounts.
	/// - Parameters:
	///   - discount_money: The money associated with discounts.
	///   - service_charge_money: The money associated with service charges.
	///   - tax_money: The money associated with taxes.
	///   - tip_money: The money associated with tips.
	///   - total_money: The total money.
	public init(discount_money: Money? = nil, service_charge_money: Money? = nil, tax_money: Money? = nil, tip_money: Money? = nil, total_money: Money? = nil) {
		self.discount_money = discount_money
		self.service_charge_money = service_charge_money
		self.tax_money = tax_money
		self.tip_money = tip_money
		self.total_money = total_money
	}
}

/// Pricing options for an order. The options affect how the order's price is calculated. They can be used, for example, to apply automatic price adjustments that are based on preconfigured [pricing rules](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogPricingRule).
public struct OrderPricingOptions: Codable {
	/// The option to determine whether pricing rule-based discounts are automatically applied to an order.
	public var auto_apply_discounts: Bool?
	/// The option to determine whether rule-based taxes are automatically applied to an order when the criteria of the corresponding rules are met.
	public var auto_apply_taxes: Bool?

	/// Pricing options for an order. The options affect how the order's price is calculated. They can be used, for example, to apply automatic price adjustments that are based on preconfigured [pricing rules](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogPricingRule).
	/// - Parameters:
	///   - auto_apply_discounts: The option to determine whether pricing rule-based discounts are automatically applied to an order.
	///   - auto_apply_taxes: The option to determine whether rule-based taxes are automatically applied to an order when the criteria of the corresponding rules are met.
	public init(auto_apply_discounts: Bool? = nil, auto_apply_taxes: Bool? = nil) {
		self.auto_apply_discounts = auto_apply_discounts
		self.auto_apply_taxes = auto_apply_taxes
	}
}

/// Contains the measurement unit for a quantity and a precision that specifies the number of digits after the decimal point for decimal quantities.
public struct OrderQuantityUnit: Codable {
	/// The catalog object ID referencing the [CatalogMeasurementUnit](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogMeasurementUnit).  This field is set when this is a catalog-backed measurement unit.
	public var catalog_object_id: String?
	/// The version of the catalog object that this measurement unit references.  This field is set when this is a catalog-backed measurement unit.
	public var catalog_version: Int?
	/// A [MeasurementUnit](https://developer.squareup.com/reference/square_2021-10-20/objects/MeasurementUnit) that represents the unit of measure for the quantity.
	public var measurement_unit: MeasurementUnit?
	/// For non-integer quantities, represents the number of digits after the decimal point that are recorded for this quantity.  For example, a precision of 1 allows quantities such as `"1.0"` and `"1.1"`, but not `"1.01"`.  Min: 0. Max: 5.
	public var precision: Int?

	/// Contains the measurement unit for a quantity and a precision that specifies the number of digits after the decimal point for decimal quantities.
	/// - Parameters:
	///   - catalog_object_id: The catalog object ID referencing the [CatalogMeasurementUnit](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogMeasurementUnit).  This field is set when this is a catalog-backed measurement unit.
	///   - catalog_version: The version of the catalog object that this measurement unit references.  This field is set when this is a catalog-backed measurement unit.
	///   - measurement_unit: A [MeasurementUnit](https://developer.squareup.com/reference/square_2021-10-20/objects/MeasurementUnit) that represents the unit of measure for the quantity.
	///   - precision: For non-integer quantities, represents the number of digits after the decimal point that are recorded for this quantity.  For example, a precision of 1 allows quantities such as `"1.0"` and `"1.1"`, but not `"1.01"`.  Min: 0. Max: 5.
	public init(catalog_object_id: String? = nil, catalog_version: Int? = nil, measurement_unit: MeasurementUnit? = nil, precision: Int? = nil) {
		self.catalog_object_id = catalog_object_id
		self.catalog_version = catalog_version
		self.measurement_unit = measurement_unit
		self.precision = precision
	}
}

/// The set of line items, service charges, taxes, discounts, tips, and other items being returned in an order.
public struct OrderReturn: Codable {
	/// An aggregate monetary value being returned by this return entry.
	public var return_amounts: OrderMoneyAmounts?
	/// A collection of references to discounts being returned for an order, including the total applied discount amount to be returned. The discounts must reference a top-level discount ID from the source order.
	public var return_discounts: [OrderReturnDiscount]?
	/// A collection of line items that are being returned.
	public var return_line_items: [OrderReturnLineItem]?
	/// A collection of service charges that are being returned.
	public let return_service_charges: [OrderReturnServiceCharge]?
	/// A collection of references to taxes being returned for an order, including the total applied tax amount to be returned. The taxes must reference a top-level tax ID from the source order.
	public var return_taxes: [OrderReturnTax]?
	/// A positive or negative rounding adjustment to the total value being returned. Adjustments are commonly used to apply cash rounding when the minimum unit of the account is smaller than the lowest physical denomination of the currency.
	public var rounding_adjustment: OrderRoundingAdjustment?
	/// An order that contains the original sale of these return line items. This is unset for unlinked returns.
	public var source_order_id: String?
	/// A unique ID that identifies the return only within this order.
	public var uid: String?

	/// The set of line items, service charges, taxes, discounts, tips, and other items being returned in an order.
	/// - Parameters:
	///   - return_amounts: An aggregate monetary value being returned by this return entry.
	///   - return_discounts: A collection of references to discounts being returned for an order, including the total applied discount amount to be returned. The discounts must reference a top-level discount ID from the source order.
	///   - return_line_items: A collection of line items that are being returned.
	///   - return_service_charges: A collection of service charges that are being returned.
	///   - return_taxes: A collection of references to taxes being returned for an order, including the total applied tax amount to be returned. The taxes must reference a top-level tax ID from the source order.
	///   - rounding_adjustment: A positive or negative rounding adjustment to the total value being returned. Adjustments are commonly used to apply cash rounding when the minimum unit of the account is smaller than the lowest physical denomination of the currency.
	///   - source_order_id: An order that contains the original sale of these return line items. This is unset for unlinked returns.
	///   - uid: A unique ID that identifies the return only within this order.
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
	/// The amount of discount actually applied to this line item. When an amount-based discount is at the order level, this value is different from `amount_money` because the discount is distributed across the line items.
	public var applied_money: Money?
	/// The catalog object ID referencing [CatalogDiscount](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogDiscount).
	public var catalog_object_id: String?
	/// The version of the catalog object that this discount references.
	public var catalog_version: Int?
	/// The discount's name.
	public var name: String?
	/// The percentage of the tax, as a string representation of a decimal number. A value of `"7.25"` corresponds to a percentage of 7.25%.  `percentage` is not set for amount-based discounts.
	public var percentage: String?
	/// Indicates the level at which the `OrderReturnDiscount` applies. For `ORDER` scoped discounts, the server generates references in `applied_discounts` on all `OrderReturnLineItem`s. For `LINE_ITEM` scoped discounts, the discount is only applied to `OrderReturnLineItem`s with references in their `applied_discounts` field.
	public var scope: String?
	/// The discount `uid` from the order that contains the original application of this discount.
	public var source_discount_uid: String?
	/// The type of the discount. If it is created by the API, it is `FIXED_PERCENTAGE` or `FIXED_AMOUNT`.  Discounts that do not reference a catalog object ID must have a type of `FIXED_PERCENTAGE` or `FIXED_AMOUNT`.
	public var type: String?
	/// A unique ID that identifies the returned discount only within this order.
	public var uid: String?

	/// Represents a discount being returned that applies to one or more return line items in an order.  Fixed-amount, order-scoped discounts are distributed across all non-zero return line item totals. The amount distributed to each return line item is relative to that item’s contribution to the order subtotal.
	/// - Parameters:
	///   - amount_money: The total declared monetary amount of the discount.  `amount_money` is not set for percentage-based discounts.
	///   - applied_money: The amount of discount actually applied to this line item. When an amount-based discount is at the order level, this value is different from `amount_money` because the discount is distributed across the line items.
	///   - catalog_object_id: The catalog object ID referencing [CatalogDiscount](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogDiscount).
	///   - catalog_version: The version of the catalog object that this discount references.
	///   - name: The discount's name.
	///   - percentage: The percentage of the tax, as a string representation of a decimal number. A value of `"7.25"` corresponds to a percentage of 7.25%.  `percentage` is not set for amount-based discounts.
	///   - scope: Indicates the level at which the `OrderReturnDiscount` applies. For `ORDER` scoped discounts, the server generates references in `applied_discounts` on all `OrderReturnLineItem`s. For `LINE_ITEM` scoped discounts, the discount is only applied to `OrderReturnLineItem`s with references in their `applied_discounts` field.
	///   - source_discount_uid: The discount `uid` from the order that contains the original application of this discount.
	///   - type: The type of the discount. If it is created by the API, it is `FIXED_PERCENTAGE` or `FIXED_AMOUNT`.  Discounts that do not reference a catalog object ID must have a type of `FIXED_PERCENTAGE` or `FIXED_AMOUNT`.
	///   - uid: A unique ID that identifies the returned discount only within this order.
	public init(amount_money: Money? = nil, applied_money: Money? = nil, catalog_object_id: String? = nil, catalog_version: Int? = nil, name: String? = nil, percentage: String? = nil, scope: String? = nil, source_discount_uid: String? = nil, type: String? = nil, uid: String? = nil) {
		self.amount_money = amount_money
		self.applied_money = applied_money
		self.catalog_object_id = catalog_object_id
		self.catalog_version = catalog_version
		self.name = name
		self.percentage = percentage
		self.scope = scope
		self.source_discount_uid = source_discount_uid
		self.type = type
		self.uid = uid
	}
}

/// The line item being returned in an order.
public struct OrderReturnLineItem: Codable {
	/// The list of references to `OrderReturnDiscount` entities applied to the return line item. Each `OrderLineItemAppliedDiscount` has a `discount_uid` that references the `uid` of a top-level `OrderReturnDiscount` applied to the return line item. On reads, the applied amount is populated.
	public var applied_discounts: [OrderLineItemAppliedDiscount]?
	/// The list of references to `OrderReturnTax` entities applied to the return line item. Each `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level `OrderReturnTax` applied to the return line item. On reads, the applied amount is populated.
	public var applied_taxes: [OrderLineItemAppliedTax]?
	/// The base price for a single unit of the line item.
	public var base_price_money: Money?
	/// The [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogItemVariation) ID applied to this return line item.
	public var catalog_object_id: String?
	/// The version of the catalog object that this line item references.
	public var catalog_version: Int?
	/// The gross return amount of money calculated as (item base price + modifiers price) * quantity.
	public let gross_return_money: Money?
	/// The type of line item: an itemized return, a non-itemized return (custom amount), or the return of an unactivated gift card sale.
	public var item_type: String?
	/// The name of the line item.
	public var name: String?
	/// The note of the return line item.
	public var note: String?
	/// The quantity returned, formatted as a decimal number. For example, `"3"`.  Line items with a `quantity_unit` can have non-integer quantities. For example, `"1.70000"`.
	public var quantity: String
	/// The unit and precision that this return line item's quantity is measured in.
	public var quantity_unit: OrderQuantityUnit?
	/// The [CatalogModifier](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogModifier)s applied to this line item.
	public var return_modifiers: [OrderReturnLineItemModifier]?
	/// The `uid` of the line item in the original sale order.
	public var source_line_item_uid: String?
	/// The total amount of discount money to return for the line item.
	public let total_discount_money: Money?
	/// The total amount of money to return for this line item.
	public let total_money: Money?
	/// The total amount of tax money to return for the line item.
	public let total_tax_money: Money?
	/// A unique ID for this return line-item entry.
	public var uid: String?
	/// The name of the variation applied to this return line item.
	public var variation_name: String?
	/// The total price of all item variations returned in this line item. The price is calculated as `base_price_money` multiplied by `quantity` and  does not include modifiers.
	public let variation_total_price_money: Money?

	/// The line item being returned in an order.
	/// - Parameters:
	///   - applied_discounts: The list of references to `OrderReturnDiscount` entities applied to the return line item. Each `OrderLineItemAppliedDiscount` has a `discount_uid` that references the `uid` of a top-level `OrderReturnDiscount` applied to the return line item. On reads, the applied amount is populated.
	///   - applied_taxes: The list of references to `OrderReturnTax` entities applied to the return line item. Each `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level `OrderReturnTax` applied to the return line item. On reads, the applied amount is populated.
	///   - base_price_money: The base price for a single unit of the line item.
	///   - catalog_object_id: The [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogItemVariation) ID applied to this return line item.
	///   - catalog_version: The version of the catalog object that this line item references.
	///   - gross_return_money: The gross return amount of money calculated as (item base price + modifiers price) * quantity.
	///   - item_type: The type of line item: an itemized return, a non-itemized return (custom amount), or the return of an unactivated gift card sale.
	///   - name: The name of the line item.
	///   - note: The note of the return line item.
	///   - quantity: The quantity returned, formatted as a decimal number. For example, `"3"`.  Line items with a `quantity_unit` can have non-integer quantities. For example, `"1.70000"`.
	///   - quantity_unit: The unit and precision that this return line item's quantity is measured in.
	///   - return_modifiers: The [CatalogModifier](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogModifier)s applied to this line item.
	///   - source_line_item_uid: The `uid` of the line item in the original sale order.
	///   - total_discount_money: The total amount of discount money to return for the line item.
	///   - total_money: The total amount of money to return for this line item.
	///   - total_tax_money: The total amount of tax money to return for the line item.
	///   - uid: A unique ID for this return line-item entry.
	///   - variation_name: The name of the variation applied to this return line item.
	///   - variation_total_price_money: The total price of all item variations returned in this line item. The price is calculated as `base_price_money` multiplied by `quantity` and  does not include modifiers.
	public init(quantity: String, applied_discounts: [OrderLineItemAppliedDiscount]? = nil, applied_taxes: [OrderLineItemAppliedTax]? = nil, base_price_money: Money? = nil, catalog_object_id: String? = nil, catalog_version: Int? = nil, gross_return_money: Money? = nil, item_type: String? = nil, name: String? = nil, note: String? = nil, quantity_unit: OrderQuantityUnit? = nil, return_modifiers: [OrderReturnLineItemModifier]? = nil, source_line_item_uid: String? = nil, total_discount_money: Money? = nil, total_money: Money? = nil, total_tax_money: Money? = nil, uid: String? = nil, variation_name: String? = nil, variation_total_price_money: Money? = nil) {
		self.quantity = quantity
		self.applied_discounts = applied_discounts
		self.applied_taxes = applied_taxes
		self.base_price_money = base_price_money
		self.catalog_object_id = catalog_object_id
		self.catalog_version = catalog_version
		self.gross_return_money = gross_return_money
		self.item_type = item_type
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
	/// The base price for the modifier.  `base_price_money` is required for ad hoc modifiers. If both `catalog_object_id` and `base_price_money` are set, `base_price_money` overrides the predefined [CatalogModifier](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogModifier) price.
	public var base_price_money: Money?
	/// The catalog object ID referencing [CatalogModifier](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogModifier).
	public var catalog_object_id: String?
	/// The version of the catalog object that this line item modifier references.
	public var catalog_version: Int?
	/// The name of the item modifier.
	public var name: String?
	/// The modifier `uid` from the order's line item that contains the original sale of this line item modifier.
	public var source_modifier_uid: String?
	/// The total price of the item modifier for its line item. This is the modifier's `base_price_money` multiplied by the line item's quantity.
	public let total_price_money: Money?
	/// A unique ID that identifies the return modifier only within this order.
	public var uid: String?

	/// A line item modifier being returned.
	/// - Parameters:
	///   - base_price_money: The base price for the modifier.  `base_price_money` is required for ad hoc modifiers. If both `catalog_object_id` and `base_price_money` are set, `base_price_money` overrides the predefined [CatalogModifier](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogModifier) price.
	///   - catalog_object_id: The catalog object ID referencing [CatalogModifier](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogModifier).
	///   - catalog_version: The version of the catalog object that this line item modifier references.
	///   - name: The name of the item modifier.
	///   - source_modifier_uid: The modifier `uid` from the order's line item that contains the original sale of this line item modifier.
	///   - total_price_money: The total price of the item modifier for its line item. This is the modifier's `base_price_money` multiplied by the line item's quantity.
	///   - uid: A unique ID that identifies the return modifier only within this order.
	public init(base_price_money: Money? = nil, catalog_object_id: String? = nil, catalog_version: Int? = nil, name: String? = nil, source_modifier_uid: String? = nil, total_price_money: Money? = nil, uid: String? = nil) {
		self.base_price_money = base_price_money
		self.catalog_object_id = catalog_object_id
		self.catalog_version = catalog_version
		self.name = name
		self.source_modifier_uid = source_modifier_uid
		self.total_price_money = total_price_money
		self.uid = uid
	}
}

/// Represents the service charge applied to the original order.
public struct OrderReturnServiceCharge: Codable {
	/// The amount of a non-percentage-based service charge.  Either `percentage` or `amount_money` should be set, but not both.
	public var amount_money: Money?
	/// The amount of money applied to the order by the service charge, including any inclusive tax amounts, as calculated by Square.  - For fixed-amount service charges, `applied_money` is equal to `amount_money`. - For percentage-based service charges, `applied_money` is the money calculated using the percentage.
	public let applied_money: Money?
	/// The list of references to `OrderReturnTax` entities applied to the `OrderReturnServiceCharge`. Each `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level `OrderReturnTax` that is being applied to the `OrderReturnServiceCharge`. On reads, the applied amount is populated.
	public var applied_taxes: [OrderLineItemAppliedTax]?
	/// The calculation phase after which to apply the service charge.
	public let calculation_phase: String?
	/// The catalog object ID of the associated [OrderServiceCharge](https://developer.squareup.com/reference/square_2021-10-20/objects/OrderServiceCharge).
	public var catalog_object_id: String?
	/// The version of the catalog object that this service charge references.
	public var catalog_version: Int?
	/// The name of the service charge.
	public var name: String?
	/// The percentage of the service charge, as a string representation of a decimal number. For example, a value of `"7.25"` corresponds to a percentage of 7.25%.  Either `percentage` or `amount_money` should be set, but not both.
	public var percentage: String?
	/// The service charge `uid` from the order containing the original service charge. `source_service_charge_uid` is `null` for unlinked returns.
	public var source_service_charge_uid: String?
	/// Indicates whether the surcharge can be taxed. Service charges calculated in the `TOTAL_PHASE` cannot be marked as taxable.
	public var taxable: Bool?
	/// The total amount of money to collect for the service charge.  __NOTE__: If an inclusive tax is applied to the service charge, `total_money` does not equal `applied_money` plus `total_tax_money` because the inclusive tax amount is already included in both `applied_money` and `total_tax_money`.
	public let total_money: Money?
	/// The total amount of tax money to collect for the service charge.
	public let total_tax_money: Money?
	/// A unique ID that identifies the return service charge only within this order.
	public var uid: String?

	/// Represents the service charge applied to the original order.
	/// - Parameters:
	///   - amount_money: The amount of a non-percentage-based service charge.  Either `percentage` or `amount_money` should be set, but not both.
	///   - applied_money: The amount of money applied to the order by the service charge, including any inclusive tax amounts, as calculated by Square.  - For fixed-amount service charges, `applied_money` is equal to `amount_money`. - For percentage-based service charges, `applied_money` is the money calculated using the percentage.
	///   - applied_taxes: The list of references to `OrderReturnTax` entities applied to the `OrderReturnServiceCharge`. Each `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level `OrderReturnTax` that is being applied to the `OrderReturnServiceCharge`. On reads, the applied amount is populated.
	///   - calculation_phase: The calculation phase after which to apply the service charge.
	///   - catalog_object_id: The catalog object ID of the associated [OrderServiceCharge](https://developer.squareup.com/reference/square_2021-10-20/objects/OrderServiceCharge).
	///   - catalog_version: The version of the catalog object that this service charge references.
	///   - name: The name of the service charge.
	///   - percentage: The percentage of the service charge, as a string representation of a decimal number. For example, a value of `"7.25"` corresponds to a percentage of 7.25%.  Either `percentage` or `amount_money` should be set, but not both.
	///   - source_service_charge_uid: The service charge `uid` from the order containing the original service charge. `source_service_charge_uid` is `null` for unlinked returns.
	///   - taxable: Indicates whether the surcharge can be taxed. Service charges calculated in the `TOTAL_PHASE` cannot be marked as taxable.
	///   - total_money: The total amount of money to collect for the service charge.  __NOTE__: If an inclusive tax is applied to the service charge, `total_money` does not equal `applied_money` plus `total_tax_money` because the inclusive tax amount is already included in both `applied_money` and `total_tax_money`.
	///   - total_tax_money: The total amount of tax money to collect for the service charge.
	///   - uid: A unique ID that identifies the return service charge only within this order.
	public init(amount_money: Money? = nil, applied_money: Money? = nil, applied_taxes: [OrderLineItemAppliedTax]? = nil, calculation_phase: String? = nil, catalog_object_id: String? = nil, catalog_version: Int? = nil, name: String? = nil, percentage: String? = nil, source_service_charge_uid: String? = nil, taxable: Bool? = nil, total_money: Money? = nil, total_tax_money: Money? = nil, uid: String? = nil) {
		self.amount_money = amount_money
		self.applied_money = applied_money
		self.applied_taxes = applied_taxes
		self.calculation_phase = calculation_phase
		self.catalog_object_id = catalog_object_id
		self.catalog_version = catalog_version
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
	/// The amount of money applied by the tax in an order.
	public var applied_money: Money?
	/// The catalog object ID referencing [CatalogTax](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogTax).
	public var catalog_object_id: String?
	/// The version of the catalog object that this tax references.
	public var catalog_version: Int?
	/// The tax's name.
	public var name: String?
	/// The percentage of the tax, as a string representation of a decimal number. For example, a value of `"7.25"` corresponds to a percentage of 7.25%.
	public var percentage: String?
	/// Indicates the level at which the `OrderReturnTax` applies. For `ORDER` scoped taxes, Square generates references in `applied_taxes` on all `OrderReturnLineItem`s. For `LINE_ITEM` scoped taxes, the tax is only applied to `OrderReturnLineItem`s with references in their `applied_discounts` field.
	public var scope: String?
	/// The tax `uid` from the order that contains the original tax charge.
	public var source_tax_uid: String?
	/// Indicates the calculation method used to apply the tax.
	public var type: String?
	/// A unique ID that identifies the returned tax only within this order.
	public var uid: String?

	/// Represents a tax being returned that applies to one or more return line items in an order.  Fixed-amount, order-scoped taxes are distributed across all non-zero return line item totals. The amount distributed to each return line item is relative to that item’s contribution to the order subtotal.
	/// - Parameters:
	///   - applied_money: The amount of money applied by the tax in an order.
	///   - catalog_object_id: The catalog object ID referencing [CatalogTax](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogTax).
	///   - catalog_version: The version of the catalog object that this tax references.
	///   - name: The tax's name.
	///   - percentage: The percentage of the tax, as a string representation of a decimal number. For example, a value of `"7.25"` corresponds to a percentage of 7.25%.
	///   - scope: Indicates the level at which the `OrderReturnTax` applies. For `ORDER` scoped taxes, Square generates references in `applied_taxes` on all `OrderReturnLineItem`s. For `LINE_ITEM` scoped taxes, the tax is only applied to `OrderReturnLineItem`s with references in their `applied_discounts` field.
	///   - source_tax_uid: The tax `uid` from the order that contains the original tax charge.
	///   - type: Indicates the calculation method used to apply the tax.
	///   - uid: A unique ID that identifies the returned tax only within this order.
	public init(applied_money: Money? = nil, catalog_object_id: String? = nil, catalog_version: Int? = nil, name: String? = nil, percentage: String? = nil, scope: String? = nil, source_tax_uid: String? = nil, type: String? = nil, uid: String? = nil) {
		self.applied_money = applied_money
		self.catalog_object_id = catalog_object_id
		self.catalog_version = catalog_version
		self.name = name
		self.percentage = percentage
		self.scope = scope
		self.source_tax_uid = source_tax_uid
		self.type = type
		self.uid = uid
	}
}

/// Represents a reward that can be applied to an order if the necessary reward tier criteria are met. Rewards are created through the Loyalty API.
public struct OrderReward: Codable {
	/// The identifier of the reward.
	public var id: String
	/// The identifier of the reward tier corresponding to this reward.
	public var reward_tier_id: String

	/// Represents a reward that can be applied to an order if the necessary reward tier criteria are met. Rewards are created through the Loyalty API.
	/// - Parameters:
	///   - id: The identifier of the reward.
	///   - reward_tier_id: The identifier of the reward tier corresponding to this reward.
	public init(id: String, reward_tier_id: String) {
		self.id = id
		self.reward_tier_id = reward_tier_id
	}
}

/// A rounding adjustment of the money being returned. Commonly used to apply cash rounding when the minimum unit of the account is smaller than the lowest physical denomination of the currency.
public struct OrderRoundingAdjustment: Codable {
	/// The actual rounding adjustment amount.
	public var amount_money: Money?
	/// The name of the rounding adjustment from the original sale order.
	public var name: String?
	/// A unique ID that identifies the rounding adjustment only within this order.
	public var uid: String?

	/// A rounding adjustment of the money being returned. Commonly used to apply cash rounding when the minimum unit of the account is smaller than the lowest physical denomination of the currency.
	/// - Parameters:
	///   - amount_money: The actual rounding adjustment amount.
	///   - name: The name of the rounding adjustment from the original sale order.
	///   - uid: A unique ID that identifies the rounding adjustment only within this order.
	public init(amount_money: Money? = nil, name: String? = nil, uid: String? = nil) {
		self.amount_money = amount_money
		self.name = name
		self.uid = uid
	}
}

/// Represents a service charge applied to an order.
public struct OrderServiceCharge: Codable {
	/// The amount of a non-percentage-based service charge.  Exactly one of `percentage` or `amount_money` should be set.
	public var amount_money: Money?
	/// The amount of money applied to the order by the service charge, including any inclusive tax amounts, as calculated by Square.  - For fixed-amount service charges, `applied_money` is equal to `amount_money`. - For percentage-based service charges, `applied_money` is the money calculated using the percentage.
	public let applied_money: Money?
	/// The list of references to the taxes applied to this service charge. Each `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level `OrderLineItemTax` that is being applied to this service charge. On reads, the amount applied is populated.  An `OrderLineItemAppliedTax` is automatically created on every taxable service charge for all `ORDER` scoped taxes that are added to the order. `OrderLineItemAppliedTax` records for `LINE_ITEM` scoped taxes must be added in requests for the tax to apply to any taxable service charge. Taxable service charges have the `taxable` field set to `true` and calculated in the `SUBTOTAL_PHASE`.  To change the amount of a tax, modify the referenced top-level tax.
	public var applied_taxes: [OrderLineItemAppliedTax]?
	/// The calculation phase at which to apply the service charge.
	public var calculation_phase: String?
	/// The catalog object ID referencing the service charge [CatalogObject](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogObject).
	public var catalog_object_id: String?
	/// The version of the catalog object that this service charge references.
	public var catalog_version: Int?
	/// Application-defined data attached to this service charge. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (such as personally identifiable information or card details).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries can also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a maximum length of 255 characters.  An application can have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  For more information, see [Metadata](https://developer.squareup.com/docs/build-basics/metadata).
	public var metadata: String?
	/// The name of the service charge.
	public var name: String?
	/// The service charge percentage as a string representation of a decimal number. For example, `"7.25"` indicates a service charge of 7.25%.  Exactly 1 of `percentage` or `amount_money` should be set.
	public var percentage: String?
	/// Indicates whether the service charge can be taxed. If set to `true`, order-level taxes automatically apply to the service charge. Note that service charges calculated in the `TOTAL_PHASE` cannot be marked as taxable.
	public var taxable: Bool?
	/// The total amount of money to collect for the service charge.  __Note__: If an inclusive tax is applied to the service charge, `total_money` does not equal `applied_money` plus `total_tax_money` because the inclusive tax amount is already included in both `applied_money` and `total_tax_money`.
	public let total_money: Money?
	/// The total amount of tax money to collect for the service charge.
	public let total_tax_money: Money?
	/// The type of the service charge.
	public let type: String?
	/// A unique ID that identifies the service charge only within this order.
	public var uid: String?

	/// Represents a service charge applied to an order.
	/// - Parameters:
	///   - amount_money: The amount of a non-percentage-based service charge.  Exactly one of `percentage` or `amount_money` should be set.
	///   - applied_money: The amount of money applied to the order by the service charge, including any inclusive tax amounts, as calculated by Square.  - For fixed-amount service charges, `applied_money` is equal to `amount_money`. - For percentage-based service charges, `applied_money` is the money calculated using the percentage.
	///   - applied_taxes: The list of references to the taxes applied to this service charge. Each `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level `OrderLineItemTax` that is being applied to this service charge. On reads, the amount applied is populated.  An `OrderLineItemAppliedTax` is automatically created on every taxable service charge for all `ORDER` scoped taxes that are added to the order. `OrderLineItemAppliedTax` records for `LINE_ITEM` scoped taxes must be added in requests for the tax to apply to any taxable service charge. Taxable service charges have the `taxable` field set to `true` and calculated in the `SUBTOTAL_PHASE`.  To change the amount of a tax, modify the referenced top-level tax.
	///   - calculation_phase: The calculation phase at which to apply the service charge.
	///   - catalog_object_id: The catalog object ID referencing the service charge [CatalogObject](https://developer.squareup.com/reference/square_2021-10-20/objects/CatalogObject).
	///   - catalog_version: The version of the catalog object that this service charge references.
	///   - metadata: Application-defined data attached to this service charge. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (such as personally identifiable information or card details).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries can also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a maximum length of 255 characters.  An application can have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  For more information, see [Metadata](https://developer.squareup.com/docs/build-basics/metadata).
	///   - name: The name of the service charge.
	///   - percentage: The service charge percentage as a string representation of a decimal number. For example, `"7.25"` indicates a service charge of 7.25%.  Exactly 1 of `percentage` or `amount_money` should be set.
	///   - taxable: Indicates whether the service charge can be taxed. If set to `true`, order-level taxes automatically apply to the service charge. Note that service charges calculated in the `TOTAL_PHASE` cannot be marked as taxable.
	///   - total_money: The total amount of money to collect for the service charge.  __Note__: If an inclusive tax is applied to the service charge, `total_money` does not equal `applied_money` plus `total_tax_money` because the inclusive tax amount is already included in both `applied_money` and `total_tax_money`.
	///   - total_tax_money: The total amount of tax money to collect for the service charge.
	///   - type: The type of the service charge.
	///   - uid: A unique ID that identifies the service charge only within this order.
	public init(amount_money: Money? = nil, applied_money: Money? = nil, applied_taxes: [OrderLineItemAppliedTax]? = nil, calculation_phase: String? = nil, catalog_object_id: String? = nil, catalog_version: Int? = nil, metadata: String? = nil, name: String? = nil, percentage: String? = nil, taxable: Bool? = nil, total_money: Money? = nil, total_tax_money: Money? = nil, type: String? = nil, uid: String? = nil) {
		self.amount_money = amount_money
		self.applied_money = applied_money
		self.applied_taxes = applied_taxes
		self.calculation_phase = calculation_phase
		self.catalog_object_id = catalog_object_id
		self.catalog_version = catalog_version
		self.metadata = metadata
		self.name = name
		self.percentage = percentage
		self.taxable = taxable
		self.total_money = total_money
		self.total_tax_money = total_tax_money
		self.type = type
		self.uid = uid
	}
}

/// Represents a phase in the process of calculating order totals. Service charges are applied after the indicated phase.  [Read more about how order totals are calculated.](https://developer.squareup.com/docs/orders-api/how-it-works#how-totals-are-calculated)
public enum OrderServiceChargeCalculationPhase: String, Codable {
	/// The service charge is applied after discounts, but before taxes.
	case SUBTOTAL_PHASE
	/// The service charge is applied after all discounts and taxes are applied.
	case TOTAL_PHASE
}

/// 
public enum OrderServiceChargeType: String, Codable {
	case AUTO_GRATUITY
	case CUSTOM
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

public typealias BankAccountPaymentDetails = Empty

/// Represents a payment processed by the Square API.
public struct Payment: Codable {
	/// The amount processed for this payment, not including `tip_money`.  The amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
	public var amount_money: Money?
	/// The amount the developer is taking as a fee for facilitating the payment on behalf of the seller. This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Take Payments and Collect Fees](https://developer.squareup.com/docs/payments-api/take-payments-and-collect-fees).  The amount cannot be more than 90% of the `total_money` value.
	public var app_fee_money: Money?
	/// Details about the application that took the payment.
	public let application_details: ApplicationDetails?
	/// The initial amount of money approved for this payment.
	public var approved_money: Money?
	/// Details about a bank account payment. These details are only populated if the source_type is `BANK_ACCOUNT`.
	public let bank_account_details: BankAccountPaymentDetails?
	/// The buyer's billing address.
	public let billing_address: Address?
	/// The buyer's email address.
	public let buyer_email_address: String?
	/// Actions that can be performed on this payment: - `EDIT_AMOUNT_UP` - The payment amount can be edited up. - `EDIT_AMOUNT_DOWN` - The payment amount can be edited down. - `EDIT_TIP_AMOUNT_UP` - The tip amount can be edited up. - `EDIT_TIP_AMOUNT_DOWN` - The tip amount can be edited down.
	public let capabilities: [String]?
	/// Details about a card payment. These details are only populated if the source_type is `CARD`.
	public let card_details: CardPaymentDetails?
	/// Details about a cash payment. These details are only populated if the source_type is `CASH`.
	public var cash_details: CashPaymentDetails?
	/// The timestamp of when the payment was created, in RFC 3339 format.
	public let created_at: Timestamp?
	/// The [Customer](https://developer.squareup.com/reference/square_2021-10-20/objects/Customer) ID of the customer associated with the payment.
	public let customer_id: String?
	/// The action to be applied to the payment when the `delay_duration` has elapsed. This field is read-only.  Current values include `CANCEL`.
	public let delay_action: String?
	/// The duration of time after the payment's creation when Square automatically applies the `delay_action` to the payment. This automatic `delay_action` applies only to payments that do not reach a terminal state (COMPLETED, CANCELED, or FAILED) before the `delay_duration` time period.  This field is specified as a time duration, in RFC 3339 format.  Notes: This feature is only supported for card payments.  Default:  - Card-present payments: "PT36H" (36 hours) from the creation time. - Card-not-present payments: "P7D" (7 days) from the creation time.
	public let delay_duration: Timestamp?
	/// The read-only timestamp of when the `delay_action` is automatically applied, in RFC 3339 format.  Note that this field is calculated by summing the payment's `delay_duration` and `created_at` fields. The `created_at` field is generated by Square and might not exactly match the time on your local machine.
	public let delayed_until: Timestamp?
	/// Details about the device that took the payment.
	public let device_details: DeviceDetails?
	/// __Deprecated__: Use `Payment.team_member_id` instead.  An optional ID of the employee associated with taking the payment.
	public let employee_id: String?
	/// Details about an external payment. The details are only populated  if the `source_type` is `EXTERNAL`.
	public let external_details: ExternalPaymentDetails?
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
	/// The source type for this payment.  Current values include `CARD`, `BANK_ACCOUNT`, `WALLET`, `CASH`, or `EXTERNAL`.
	public let source_type: String?
	/// Additional payment information that gets added to the customer's card statement as part of the statement description.  Note that the `statement_description_identifier` might get truncated on the statement description to fit the required information including the Square identifier (SQ *) and the name of the seller taking the payment.
	public let statement_description_identifier: String?
	/// Indicates whether the payment is APPROVED, PENDING, COMPLETED, CANCELED, or FAILED.
	public let status: String?
	/// An optional ID of the [TeamMember](https://developer.squareup.com/reference/square_2021-10-20/objects/TeamMember) associated with taking the payment.
	public let team_member_id: String?
	/// The amount designated as a tip.   This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
	public var tip_money: Money?
	/// The total amount for the payment, including `amount_money` and `tip_money`. This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
	public let total_money: Money?
	/// The timestamp of when the payment was last updated, in RFC 3339 format.
	public let updated_at: Timestamp?
	/// Used for optimistic concurrency. This opaque token identifies a specific version of the `Payment` object.
	public var version_token: String?
	/// Details about an wallet payment. The details are only populated  if the `source_type` is `WALLET`.
	public let wallet_details: DigitalWalletDetails?

	/// Represents a payment processed by the Square API.
	/// - Parameters:
	///   - amount_money: The amount processed for this payment, not including `tip_money`.  The amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
	///   - app_fee_money: The amount the developer is taking as a fee for facilitating the payment on behalf of the seller. This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Take Payments and Collect Fees](https://developer.squareup.com/docs/payments-api/take-payments-and-collect-fees).  The amount cannot be more than 90% of the `total_money` value.
	///   - application_details: Details about the application that took the payment.
	///   - approved_money: The initial amount of money approved for this payment.
	///   - bank_account_details: Details about a bank account payment. These details are only populated if the source_type is `BANK_ACCOUNT`.
	///   - billing_address: The buyer's billing address.
	///   - buyer_email_address: The buyer's email address.
	///   - capabilities: Actions that can be performed on this payment: - `EDIT_AMOUNT_UP` - The payment amount can be edited up. - `EDIT_AMOUNT_DOWN` - The payment amount can be edited down. - `EDIT_TIP_AMOUNT_UP` - The tip amount can be edited up. - `EDIT_TIP_AMOUNT_DOWN` - The tip amount can be edited down.
	///   - card_details: Details about a card payment. These details are only populated if the source_type is `CARD`.
	///   - cash_details: Details about a cash payment. These details are only populated if the source_type is `CASH`.
	///   - created_at: The timestamp of when the payment was created, in RFC 3339 format.
	///   - customer_id: The [Customer](https://developer.squareup.com/reference/square_2021-10-20/objects/Customer) ID of the customer associated with the payment.
	///   - delay_action: The action to be applied to the payment when the `delay_duration` has elapsed. This field is read-only.  Current values include `CANCEL`.
	///   - delay_duration: The duration of time after the payment's creation when Square automatically applies the `delay_action` to the payment. This automatic `delay_action` applies only to payments that do not reach a terminal state (COMPLETED, CANCELED, or FAILED) before the `delay_duration` time period.  This field is specified as a time duration, in RFC 3339 format.  Notes: This feature is only supported for card payments.  Default:  - Card-present payments: "PT36H" (36 hours) from the creation time. - Card-not-present payments: "P7D" (7 days) from the creation time.
	///   - delayed_until: The read-only timestamp of when the `delay_action` is automatically applied, in RFC 3339 format.  Note that this field is calculated by summing the payment's `delay_duration` and `created_at` fields. The `created_at` field is generated by Square and might not exactly match the time on your local machine.
	///   - device_details: Details about the device that took the payment.
	///   - employee_id: __Deprecated__: Use `Payment.team_member_id` instead.  An optional ID of the employee associated with taking the payment.
	///   - external_details: Details about an external payment. The details are only populated  if the `source_type` is `EXTERNAL`.
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
	///   - source_type: The source type for this payment.  Current values include `CARD`, `BANK_ACCOUNT`, `WALLET`, `CASH`, or `EXTERNAL`.
	///   - statement_description_identifier: Additional payment information that gets added to the customer's card statement as part of the statement description.  Note that the `statement_description_identifier` might get truncated on the statement description to fit the required information including the Square identifier (SQ *) and the name of the seller taking the payment.
	///   - status: Indicates whether the payment is APPROVED, PENDING, COMPLETED, CANCELED, or FAILED.
	///   - team_member_id: An optional ID of the [TeamMember](https://developer.squareup.com/reference/square_2021-10-20/objects/TeamMember) associated with taking the payment.
	///   - tip_money: The amount designated as a tip.   This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
	///   - total_money: The total amount for the payment, including `amount_money` and `tip_money`. This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
	///   - updated_at: The timestamp of when the payment was last updated, in RFC 3339 format.
	///   - version_token: Used for optimistic concurrency. This opaque token identifies a specific version of the `Payment` object.
	///   - wallet_details: Details about an wallet payment. The details are only populated  if the `source_type` is `WALLET`.
	public init(amount_money: Money? = nil, app_fee_money: Money? = nil, application_details: ApplicationDetails? = nil, approved_money: Money? = nil, bank_account_details: BankAccountPaymentDetails? = nil, billing_address: Address? = nil, buyer_email_address: String? = nil, capabilities: [String]? = nil, card_details: CardPaymentDetails? = nil, cash_details: CashPaymentDetails? = nil, created_at: Timestamp? = nil, customer_id: String? = nil, delay_action: String? = nil, delay_duration: Timestamp? = nil, delayed_until: Timestamp? = nil, device_details: DeviceDetails? = nil, employee_id: String? = nil, external_details: ExternalPaymentDetails? = nil, id: String? = nil, location_id: String? = nil, note: String? = nil, order_id: String? = nil, processing_fee: [ProcessingFee]? = nil, receipt_number: String? = nil, receipt_url: String? = nil, reference_id: String? = nil, refund_ids: [String]? = nil, refunded_money: Money? = nil, risk_evaluation: RiskEvaluation? = nil, shipping_address: Address? = nil, source_type: String? = nil, statement_description_identifier: String? = nil, status: String? = nil, team_member_id: String? = nil, tip_money: Money? = nil, total_money: Money? = nil, updated_at: Timestamp? = nil, version_token: String? = nil, wallet_details: DigitalWalletDetails? = nil) {
		self.amount_money = amount_money
		self.app_fee_money = app_fee_money
		self.application_details = application_details
		self.approved_money = approved_money
		self.bank_account_details = bank_account_details
		self.billing_address = billing_address
		self.buyer_email_address = buyer_email_address
		self.capabilities = capabilities
		self.card_details = card_details
		self.cash_details = cash_details
		self.created_at = created_at
		self.customer_id = customer_id
		self.delay_action = delay_action
		self.delay_duration = delay_duration
		self.delayed_until = delayed_until
		self.device_details = device_details
		self.employee_id = employee_id
		self.external_details = external_details
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
		self.team_member_id = team_member_id
		self.tip_money = tip_money
		self.total_money = total_money
		self.updated_at = updated_at
		self.version_token = version_token
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
	/// The current status of the refund (`PENDING`, `APPROVED`, `REJECTED`, or `FAILED`).
	public var status: String
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
	///   - status: The current status of the refund (`PENDING`, `APPROVED`, `REJECTED`, or `FAILED`).
	///   - tender_id: The ID of the refunded tender.
	///   - transaction_id: The ID of the transaction that the refunded tender is part of.
	public init(amount_money: Money, id: String, location_id: String, reason: String, status: String, tender_id: String, transaction_id: String, additional_recipients: [AdditionalRecipient]? = nil, created_at: Timestamp? = nil, processing_fee_money: Money? = nil) {
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

/// Represents fraud risk information for the associated payment.  When you take a payment through Square's Payments API (using the `CreatePayment` endpoint), Square evaluates it and assigns a risk level to the payment. Sellers can use this information to determine the course of action (for example, provide the goods/services or refund the payment).
public struct RiskEvaluation: Codable {
	/// The timestamp when payment risk was evaluated, in RFC 3339 format.
	public let created_at: Timestamp?
	/// The risk level associated with the payment
	public var risk_level: String?

	/// Represents fraud risk information for the associated payment.  When you take a payment through Square's Payments API (using the `CreatePayment` endpoint), Square evaluates it and assigns a risk level to the payment. Sellers can use this information to determine the course of action (for example, provide the goods/services or refund the payment).
	/// - Parameters:
	///   - created_at: The timestamp when payment risk was evaluated, in RFC 3339 format.
	///   - risk_level: The risk level associated with the payment
	public init(created_at: Timestamp? = nil, risk_level: String? = nil) {
		self.created_at = created_at
		self.risk_level = risk_level
	}
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
	/// Read-only Square ID assigned to the application. Only used for [Product](https://developer.squareup.com/reference/square_2021-10-20/enums/Product) type `EXTERNAL_API`.
	public var application_id: String?
	/// Read-only display name assigned to the application (e.g. `"Custom Application"`, `"Square POS 4.74 for Android"`).
	public var name: String?
	/// Read-only [Product](https://developer.squareup.com/reference/square_2021-10-20/enums/Product) type for the application.
	public var product: String?

	/// Provides information about the application used to generate a change.
	/// - Parameters:
	///   - application_id: Read-only Square ID assigned to the application. Only used for [Product](https://developer.squareup.com/reference/square_2021-10-20/enums/Product) type `EXTERNAL_API`.
	///   - name: Read-only display name assigned to the application (e.g. `"Custom Application"`, `"Square POS 4.74 for Android"`).
	///   - product: Read-only [Product](https://developer.squareup.com/reference/square_2021-10-20/enums/Product) type for the application.
	public init(application_id: String? = nil, name: String? = nil, product: String? = nil) {
		self.application_id = application_id
		self.name = name
		self.product = product
	}
}

/// Describes a phase in a subscription plan. For more information, see [Set Up and Manage a Subscription Plan](https://developer.squareup.com/docs/subscriptions-api/setup-plan).
public struct SubscriptionPhase: Codable {
	/// The billing cadence of the phase. For example, weekly or monthly. This field cannot be changed after a `SubscriptionPhase` is created.
	public var cadence: String
	/// The position this phase appears in the sequence of phases defined for the plan, indexed from 0. This field cannot be changed after a `SubscriptionPhase` is created.
	public var ordinal: Int?
	/// The number of `cadence`s the phase lasts. If not set, the phase never ends. Only the last phase can be indefinite. This field cannot be changed after a `SubscriptionPhase` is created.
	public var periods: Int?
	/// The amount to bill for each `cadence`.
	public var recurring_price_money: Money
	/// The Square-assigned ID of the subscription phase. This field cannot be changed after a `SubscriptionPhase` is created.
	public var uid: String?

	/// Describes a phase in a subscription plan. For more information, see [Set Up and Manage a Subscription Plan](https://developer.squareup.com/docs/subscriptions-api/setup-plan).
	/// - Parameters:
	///   - cadence: The billing cadence of the phase. For example, weekly or monthly. This field cannot be changed after a `SubscriptionPhase` is created.
	///   - ordinal: The position this phase appears in the sequence of phases defined for the plan, indexed from 0. This field cannot be changed after a `SubscriptionPhase` is created.
	///   - periods: The number of `cadence`s the phase lasts. If not set, the phase never ends. Only the last phase can be indefinite. This field cannot be changed after a `SubscriptionPhase` is created.
	///   - recurring_price_money: The amount to bill for each `cadence`.
	///   - uid: The Square-assigned ID of the subscription phase. This field cannot be changed after a `SubscriptionPhase` is created.
	public init(cadence: String, recurring_price_money: Money, ordinal: Int? = nil, periods: Int? = nil, uid: String? = nil) {
		self.cadence = cadence
		self.recurring_price_money = recurring_price_money
		self.ordinal = ordinal
		self.periods = periods
		self.uid = uid
	}
}

/// Represents a tender (i.e., a method of payment) used in a Square transaction.
public struct Tender: Codable {
	/// Additional recipients (other than the merchant) receiving a portion of this tender. For example, fees assessed on the purchase by a third party integration.
	public var additional_recipients: [AdditionalRecipient]?
	/// The total amount of the tender, including `tip_money`. If the tender has a `payment_id`, the `total_money` of the corresponding [Payment](https://developer.squareup.com/reference/square_2021-10-20/objects/Payment) will be equal to the `amount_money` of the tender.
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
	/// The ID of the [Payment](https://developer.squareup.com/reference/square_2021-10-20/objects/Payment) that corresponds to this tender. This value is only present for payments created with the v2 Payments API.
	public var payment_id: String?
	/// The amount of any Square processing fees applied to the tender.  This field is not immediately populated when a new transaction is created. It is usually available after about ten seconds.
	public var processing_fee_money: Money?
	/// The tip's amount of the tender.
	public var tip_money: Money?
	/// The ID of the tender's associated transaction.
	public var transaction_id: String?
	/// The type of tender, such as `CARD` or `CASH`.
	public var type: String

	/// Represents a tender (i.e., a method of payment) used in a Square transaction.
	/// - Parameters:
	///   - additional_recipients: Additional recipients (other than the merchant) receiving a portion of this tender. For example, fees assessed on the purchase by a third party integration.
	///   - amount_money: The total amount of the tender, including `tip_money`. If the tender has a `payment_id`, the `total_money` of the corresponding [Payment](https://developer.squareup.com/reference/square_2021-10-20/objects/Payment) will be equal to the `amount_money` of the tender.
	///   - card_details: The details of the card tender.  This value is present only if the value of `type` is `CARD`.
	///   - cash_details: The details of the cash tender.  This value is present only if the value of `type` is `CASH`.
	///   - created_at: The timestamp for when the tender was created, in RFC 3339 format.
	///   - customer_id: If the tender is associated with a customer or represents a customer's card on file, this is the ID of the associated customer.
	///   - id: The tender's unique ID.
	///   - location_id: The ID of the transaction's associated location.
	///   - note: An optional note associated with the tender at the time of payment.
	///   - payment_id: The ID of the [Payment](https://developer.squareup.com/reference/square_2021-10-20/objects/Payment) that corresponds to this tender. This value is only present for payments created with the v2 Payments API.
	///   - processing_fee_money: The amount of any Square processing fees applied to the tender.  This field is not immediately populated when a new transaction is created. It is usually available after about ten seconds.
	///   - tip_money: The tip's amount of the tender.
	///   - transaction_id: The ID of the tender's associated transaction.
	///   - type: The type of tender, such as `CARD` or `CASH`.
	public init(type: String, additional_recipients: [AdditionalRecipient]? = nil, amount_money: Money? = nil, card_details: TenderCardDetails? = nil, cash_details: TenderCashDetails? = nil, created_at: Timestamp? = nil, customer_id: String? = nil, id: String? = nil, location_id: String? = nil, note: String? = nil, payment_id: String? = nil, processing_fee_money: Money? = nil, tip_money: Money? = nil, transaction_id: String? = nil) {
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
	/// The method used to enter the card's details for the transaction.
	public var entry_method: String?
	/// The credit card payment's current state (such as `AUTHORIZED` or `CAPTURED`). See [TenderCardDetailsStatus](https://developer.squareup.com/reference/square_2021-10-20/enums/TenderCardDetailsStatus) for possible values.
	public var status: String?

	/// Represents additional details of a tender with `type` `CARD` or `SQUARE_GIFT_CARD`
	/// - Parameters:
	///   - card: The credit card's non-confidential details.
	///   - entry_method: The method used to enter the card's details for the transaction.
	///   - status: The credit card payment's current state (such as `AUTHORIZED` or `CAPTURED`). See [TenderCardDetailsStatus](https://developer.squareup.com/reference/square_2021-10-20/enums/TenderCardDetailsStatus) for possible values.
	public init(card: Card? = nil, entry_method: String? = nil, status: String? = nil) {
		self.card = card
		self.entry_method = entry_method
		self.status = status
	}
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

public struct TerminalCheckout: Codable {
	/// The amount of money (including the tax amount) that the Square Terminal device should try to collect.
	public var amount_money: Money
	/// The ID of the application that created the checkout.
	public let app_id: String?
	/// Present if the status is `CANCELED`.
	public let cancel_reason: String?
	/// The time when the `TerminalCheckout` was created, as an RFC 3339 timestamp.
	public let created_at: Timestamp?
	/// An optional ID of the customer associated with the checkout.
	public var customer_id: String?
	/// An RFC 3339 duration, after which the checkout is automatically canceled. A `TerminalCheckout` that is `PENDING` is automatically `CANCELED` and has a cancellation reason of `TIMED_OUT`.  Default: 5 minutes from creation  Maximum: 5 minutes
	public var deadline_duration: Timestamp?
	/// Options to control the display and behavior of the Square Terminal device.
	public var device_options: DeviceCheckoutOptions
	/// A unique ID for this `TerminalCheckout`.
	public let id: String?
	/// The location of the device where the `TerminalCheckout` was directed.
	public let location_id: String?
	/// An optional note to associate with the checkout, as well as with any payments used to complete the checkout.
	public var note: String?
	/// A list of IDs for payments created by this `TerminalCheckout`.
	public let payment_ids: [String]?
	/// The type of payment the terminal should attempt to capture from. Defaults to `CARD_PRESENT`.
	public var payment_type: String?
	/// An optional user-defined reference ID that can be used to associate this `TerminalCheckout` to another entity in an external system. For example, an order ID generated by a third-party shopping cart. The ID is also associated with any payments used to complete the checkout.
	public var reference_id: String?
	/// The status of the `TerminalCheckout`. Options: `PENDING`, `IN_PROGRESS`, `CANCEL_REQUESTED`, `CANCELED`, `COMPLETED`
	public let status: String?
	/// The time when the `TerminalCheckout` was last updated, as an RFC 3339 timestamp.
	public let updated_at: Timestamp?

	public init(amount_money: Money, device_options: DeviceCheckoutOptions, app_id: String? = nil, cancel_reason: String? = nil, created_at: Timestamp? = nil, customer_id: String? = nil, deadline_duration: Timestamp? = nil, id: String? = nil, location_id: String? = nil, note: String? = nil, payment_ids: [String]? = nil, payment_type: String? = nil, reference_id: String? = nil, status: String? = nil, updated_at: Timestamp? = nil) {
		self.amount_money = amount_money
		self.device_options = device_options
		self.app_id = app_id
		self.cancel_reason = cancel_reason
		self.created_at = created_at
		self.customer_id = customer_id
		self.deadline_duration = deadline_duration
		self.id = id
		self.location_id = location_id
		self.note = note
		self.payment_ids = payment_ids
		self.payment_type = payment_type
		self.reference_id = reference_id
		self.status = status
		self.updated_at = updated_at
	}
}

public struct TipSettings: Codable {
	/// Indicates whether tipping is enabled for this checkout. Defaults to false.
	public var allow_tipping: Bool?
	/// Indicates whether custom tip amounts are allowed during the checkout flow. Defaults to false.
	public var custom_tip_field: Bool?
	/// Indicates whether tip options should be presented on the screen before presenting the signature screen during card payment. Defaults to false.
	public var separate_tip_screen: Bool?
	/// Enables the "Smart Tip Amounts" behavior. Exact tipping options depend on the region in which the Square seller is active.  For payments under 10.00, in the Australia, Canada, Ireland, United Kingdom, and United States, tipping options are presented as no tip, .50, 1.00 or 2.00.  For payment amounts of 10.00 or greater, tipping options are presented as the following percentages: 0%, 5%, 10%, 15%.  If set to true, the `tip_percentages` settings is ignored. Defaults to false.  To learn more about smart tipping, see [Accept Tips with the Square App](https://squareup.com/help/us/en/article/5069-accept-tips-with-the-square-app).
	public var smart_tipping: Bool?
	/// A list of tip percentages that should be presented during the checkout flow, specified as up to 3 non-negative integers from 0 to 100 (inclusive). Defaults to 15, 20, and 25.
	public var tip_percentages: [Int]?

	public init(allow_tipping: Bool? = nil, custom_tip_field: Bool? = nil, separate_tip_screen: Bool? = nil, smart_tipping: Bool? = nil, tip_percentages: [Int]? = nil) {
		self.allow_tipping = allow_tipping
		self.custom_tip_field = custom_tip_field
		self.separate_tip_screen = separate_tip_screen
		self.smart_tipping = smart_tipping
		self.tip_percentages = tip_percentages
	}
}

public struct V1Money: Codable {
	/// Amount in the lowest denominated value of this Currency. E.g. in USD these are cents, in JPY they are Yen (which do not have a 'cent' concept).
	public var amount: Int?
	public var currency_code: String?

	public init(amount: Int? = nil, currency_code: String? = nil) {
		self.amount = amount
		self.currency_code = currency_code
	}
}

/// A payment represents a paid transaction between a Square merchant and a customer. Payment details are usually available from Connect API endpoints within a few minutes after the transaction completes.  Each Payment object includes several fields that end in `_money`. These fields describe the various amounts of money that contribute to the payment total:  <ul> <li> Monetary values are <b>positive</b> if they represent an <em>increase</em> in the amount of money the merchant receives (e.g., <code>tax_money</code>, <code>tip_money</code>). </li> <li> Monetary values are <b>negative</b> if they represent an <em>decrease</em> in the amount of money the merchant receives (e.g., <code>discount_money</code>, <code>refunded_money</code>). </li> </ul>
public struct V1Payment: Codable {
	/// All of the additive taxes associated with the payment.
//	public var additive_tax: [V1PaymentTax]?
//	/// The sum of all additive taxes associated with the payment.
//	public var additive_tax_money: V1Money?
//	/// The time when the payment was created, in ISO 8601 format. Reflects the time of the first payment if the object represents an incomplete partial payment, and the time of the last or complete payment otherwise.
//	public var created_at: String?
//	/// The unique identifier of the Square account that took the payment.
//	public var creator_id: String?
//	/// The device that took the payment.
//	public var device: Device?
//	/// The total of all discounts applied to the payment.
//	public var discount_money: V1Money?
//	/// The total of all sales, including any applicable taxes.
//	public var gross_sales_money: V1Money?
//	/// The payment's unique identifier.
//	public var id: String?
//	/// All of the inclusive taxes associated with the payment.
//	public var inclusive_tax: [V1PaymentTax]?
//	/// The sum of all inclusive taxes associated with the payment.
//	public var inclusive_tax_money: V1Money?
//	/// Indicates whether or not the payment is only partially paid for. If true, this payment will have the tenders collected so far, but the itemizations will be empty until the payment is completed.
//	public var is_partial: Bool?
//	/// The items purchased in the payment.
//	public var itemizations: [V1PaymentItemization]?
//	/// The unique identifier of the merchant that took the payment.
//	public var merchant_id: String?
//	/// The total of all sales, minus any applicable taxes.
//	public var net_sales_money: V1Money?
//	/// The amount to be deposited into the merchant's bank account for the payment.
//	public var net_total_money: V1Money?
//	/// The URL of the payment's detail page in the merchant dashboard. The merchant must be signed in to the merchant dashboard to view this page.
//	public var payment_url: String?
//	/// The total of all processing fees collected by Square for the payment.
//	public var processing_fee_money: V1Money?
//	/// The URL of the receipt for the payment. Note that for split tender payments, this URL corresponds to the receipt for the first tender listed in the payment's tender field. Each Tender object has its own receipt_url field you can use to get the other receipts associated with a split tender payment.
//	public var receipt_url: String?
//	/// The total of all refunds applied to the payment.
//	public var refunded_money: V1Money?
//	/// All of the refunds applied to the payment. Note that the value of all refunds on a payment can exceed the value of all tenders if a merchant chooses to refund money to a tender after previously accepting returned goods as part of an exchange.
//	public var refunds: [V1Refund]?
//	/// The total of all surcharges applied to the payment.
//	public var surcharge_money: V1Money?
//	/// A list of all surcharges associated with the payment.
//	public var surcharges: [V1PaymentSurcharge]?
//	/// The total of all sales, including any applicable taxes, rounded to the smallest legal unit of currency (e.g., the nearest penny in USD, the nearest nickel in CAD)
//	public var swedish_rounding_money: V1Money?
//	/// The total of all taxes applied to the payment. This is always the sum of inclusive_tax_money and additive_tax_money.
//	public var tax_money: V1Money?
	/// All of the tenders associated with the payment.
	public var tender: [V1Tender]?
	/// The total of all tips applied to the payment.
	public var tip_money: V1Money?
	/// The total of all discounts applied to the payment.
//	public var total_collected_money: V1Money?
	
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
//	public init(additive_tax: [V1PaymentTax]? = nil, additive_tax_money: V1Money? = nil, created_at: String? = nil, creator_id: String? = nil, device: Device? = nil, discount_money: V1Money? = nil, gross_sales_money: V1Money? = nil, id: String? = nil, inclusive_tax: [V1PaymentTax]? = nil, inclusive_tax_money: V1Money? = nil, is_partial: Bool? = nil, itemizations: [V1PaymentItemization]? = nil, merchant_id: String? = nil, net_sales_money: V1Money? = nil, net_total_money: V1Money? = nil, payment_url: String? = nil, processing_fee_money: V1Money? = nil, receipt_url: String? = nil, refunded_money: V1Money? = nil, refunds: [V1Refund]? = nil, surcharge_money: V1Money? = nil, surcharges: [V1PaymentSurcharge]? = nil, swedish_rounding_money: V1Money? = nil, tax_money: V1Money? = nil, tender: [V1Tender]? = nil, tip_money: V1Money? = nil, total_collected_money: V1Money? = nil) {
//		self.additive_tax = additive_tax
//		self.additive_tax_money = additive_tax_money
//		self.created_at = created_at
//		self.creator_id = creator_id
//		self.device = device
//		self.discount_money = discount_money
//		self.gross_sales_money = gross_sales_money
//		self.id = id
//		self.inclusive_tax = inclusive_tax
//		self.inclusive_tax_money = inclusive_tax_money
//		self.is_partial = is_partial
//		self.itemizations = itemizations
//		self.merchant_id = merchant_id
//		self.net_sales_money = net_sales_money
//		self.net_total_money = net_total_money
//		self.payment_url = payment_url
//		self.processing_fee_money = processing_fee_money
//		self.receipt_url = receipt_url
//		self.refunded_money = refunded_money
//		self.refunds = refunds
//		self.surcharge_money = surcharge_money
//		self.surcharges = surcharges
//		self.swedish_rounding_money = swedish_rounding_money
//		self.tax_money = tax_money
//		self.tender = tender
//		self.tip_money = tip_money
//		self.total_collected_money = total_collected_money
//	}
}

/// A tender represents a discrete monetary exchange. Square represents this exchange as a money object with a specific currency and amount, where the amount is given in the smallest denomination of the given currency.  Square POS can accept more than one form of tender for a single payment (such as by splitting a bill between a credit card and a gift card). The `tender` field of the Payment object lists all forms of tender used for the payment.  Split tender payments behave slightly differently from single tender payments:  The receipt_url for a split tender corresponds only to the first tender listed in the tender field. To get the receipt URLs for the remaining tenders, use the receipt_url fields of the corresponding Tender objects.  *A note on gift cards**: when a customer purchases a Square gift card from a merchant, the merchant receives the full amount of the gift card in the associated payment.  When that gift card is used as a tender, the balance of the gift card is reduced and the merchant receives no funds. A `Tender` object with a type of `SQUARE_GIFT_CARD` indicates a gift card was used for some or all of the associated payment.
public struct V1Tender: Codable {
	/// The brand of credit card provided.
	public var card_brand: String?
	/// The amount of total_money returned to the buyer as change.
	public var change_back_money: V1Money?
	/// The ID of the employee that processed the tender.
	public var employee_id: String?
	/// The tender's unique ID.
	public var entry_method: String?
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
	/// The type of tender.
	public var type: String?

	/// A tender represents a discrete monetary exchange. Square represents this exchange as a money object with a specific currency and amount, where the amount is given in the smallest denomination of the given currency.  Square POS can accept more than one form of tender for a single payment (such as by splitting a bill between a credit card and a gift card). The `tender` field of the Payment object lists all forms of tender used for the payment.  Split tender payments behave slightly differently from single tender payments:  The receipt_url for a split tender corresponds only to the first tender listed in the tender field. To get the receipt URLs for the remaining tenders, use the receipt_url fields of the corresponding Tender objects.  *A note on gift cards**: when a customer purchases a Square gift card from a merchant, the merchant receives the full amount of the gift card in the associated payment.  When that gift card is used as a tender, the balance of the gift card is reduced and the merchant receives no funds. A `Tender` object with a type of `SQUARE_GIFT_CARD` indicates a gift card was used for some or all of the associated payment.
	/// - Parameters:
	///   - card_brand: The brand of credit card provided.
	///   - change_back_money: The amount of total_money returned to the buyer as change.
	///   - employee_id: The ID of the employee that processed the tender.
	///   - entry_method: The tender's unique ID.
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
	///   - type: The type of tender.
//	public init(card_brand: String? = nil, change_back_money: V1Money? = nil, employee_id: String? = nil, entry_method: String? = nil, id: String? = nil, is_exchange: Bool? = nil, name: String? = nil, pan_suffix: String? = nil, payment_note: String? = nil, receipt_url: String? = nil, refunded_money: V1Money? = nil, settled_at: String? = nil, tendered_at: String? = nil, tendered_money: V1Money? = nil, total_money: V1Money? = nil, type: String? = nil) {
//		self.card_brand = card_brand
//		self.change_back_money = change_back_money
//		self.employee_id = employee_id
//		self.entry_method = entry_method
//		self.id = id
//		self.is_exchange = is_exchange
//		self.name = name
//		self.pan_suffix = pan_suffix
//		self.payment_note = payment_note
//		self.receipt_url = receipt_url
//		self.refunded_money = refunded_money
//		self.settled_at = settled_at
//		self.tendered_at = tendered_at
//		self.tendered_money = tendered_money
//		self.total_money = total_money
//		self.type = type
//	}
}

