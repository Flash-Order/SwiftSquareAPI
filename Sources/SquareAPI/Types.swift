struct ListDeviceCodesResponse: Codable {
	/// A pagination cursor to retrieve the next set of results for your original query to the endpoint. This value is present only if the request succeeded and additional results are available.  See [Paginating results](#paginatingresults) for more information.
	var cursor: String?
	/// The queried DeviceCode.
	var device_codes: [DeviceCode]?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct Shift: Codable {
	/// A list of any paid or unpaid breaks that were taken during this shift.
	var breaks: [Break]?
	/// A read-only timestamp in RFC 3339 format; presented in UTC.
	let created_at: Timestamp?
	/// The ID of the employee this shift belongs to. DEPRECATED at version 2020-08-26. Use `team_member_id` instead
	var employee_id: String?
	/// RFC 3339; shifted to timezone + offset. Precision up to the minute is respected; seconds are truncated.
	var end_at: Timestamp?
	/// UUID for this object
	var id: String?
	/// The ID of the location this shift occurred at. Should be based on where the employee clocked in.
	var location_id: String?
	/// RFC 3339; shifted to location timezone + offset. Precision up to the minute is respected; seconds are truncated.
	var start_at: Timestamp
	/// Describes working state of the current `Shift`. See [ShiftStatus](#type-shiftstatus) for possible values
	var status: ShiftStatus?
	/// The ID of the team member this shift belongs to. Replaced `employee_id` at version "2020-08-26"
	var team_member_id: String?
	/// Read-only convenience value that is calculated from the location based on `location_id`. Format: the IANA Timezone Database identifier for the location timezone.
	var timezone: String?
	/// A read-only timestamp in RFC 3339 format; presented in UTC.
	let updated_at: Timestamp?
	/// Used for resolving concurrency issues; request will fail if version provided does not match server version at time of request. If not provided, Square executes a blind write; potentially overwriting data from another write.
	var version: Int?
	/// Job and pay related information. If wage is not set on create, will default to a wage of zero money. If title is not set on create, will default to the name of the role the employee is assigned to, if any.
	var wage: ShiftWage?
}

/// Determines item visibility in Ecom (Online Store) and Online Checkout.
enum EcomVisibility: String, Content {
	/// Item is not synced with Ecom (Weebly). This is the default state
	case UNINDEXED
	/// Item is synced but is unavailable within Ecom (Weebly) and Online Checkout
	case UNAVAILABLE
	/// Option for seller to choose manually created Quick Amounts.
	case HIDDEN
	/// Item is synced but available within Ecom (Weebly) and Online Checkout but is hidden from Ecom Store.
	case VISIBLE
}

struct RetrieveLoyaltyRewardResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The loyalty reward retrieved.
	var reward: LoyaltyReward?
}

struct Availability: Codable {
	/// The list of appointment segments available for booking
	var appointment_segments: [AppointmentSegment]?
	/// The ID of the location available for booking.
	var location_id: String?
	/// The RFC-3339 timestamp specifying the beginning time of the slot available for booking.
	var start_at: Timestamp?
}

struct Payment: Codable {
	/// The amount processed for this payment, not including `tip_money`.  The amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
	var amount_money: Money?
	/// The amount the developer is taking as a fee for facilitating the payment on behalf of the seller. This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Take Payments and Collect Fees](https://developer.squareup.com/docs/payments-api/take-payments-and-collect-fees).  The amount cannot be more than 90% of the `total_money` value.
	var app_fee_money: Money?
	/// The buyer's billing address.
	let billing_address: Address?
	/// The buyer's email address.
	let buyer_email_address: String?
	/// Non-confidential details about the source. The details are only populated if the `source_type` is `CARD`.
	let card_details: CardPaymentDetails?
	/// The timestamp of when the payment was created, in RFC 3339 format.
	let created_at: Timestamp?
	/// The `Customer` ID of the customer associated with the payment.
	let customer_id: String?
	/// The action to be applied to the payment when the `delay_duration` has elapsed. This field is read-only.  Current values include `CANCEL`.
	let delay_action: String?
	/// The duration of time after the payment's creation when Square automatically applies the `delay_action` to the payment. This automatic `delay_action` applies only to payments that do not reach a terminal state (COMPLETED, CANCELED, or FAILED) before the `delay_duration` time period.  This field is specified as a time duration, in RFC 3339 format.  Notes: This feature is only supported for card payments.  Default:  - Card-present payments: "PT36H" (36 hours) from the creation time. - Card-not-present payments: "P7D" (7 days) from the creation time.
	let delay_duration: Timestamp?
	/// The read-only timestamp of when the `delay_action` is automatically applied, in RFC 3339 format.  Note that this field is calculated by summing the payment's `delay_duration` and `created_at` fields. The `created_at` field is generated by Square and might not exactly match the time on your local machine.
	let delayed_until: Timestamp?
	/// An optional ID of the employee associated with taking the payment.
	let employee_id: String?
	/// A unique ID for the payment.
	let id: String?
	/// The ID of the location associated with the payment.
	let location_id: String?
	/// An optional note to include when creating a payment.
	let note: String?
	/// The ID of the order associated with the payment.
	let order_id: String?
	/// The processing fees and fee adjustments assessed by Square for this payment.
	let processing_fee: [ProcessingFee]?
	/// The payment's receipt number. The field is missing if a payment is canceled.
	let receipt_number: String?
	/// The URL for the payment's receipt. The field is only populated for COMPLETED payments.
	let receipt_url: String?
	/// An optional ID that associates the payment with an entity in another system.
	let reference_id: String?
	/// A list of `refund_id`s identifying refunds for the payment.
	let refund_ids: [String]?
	/// The total amount of the payment refunded to date.   This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents).
	let refunded_money: Money?
	/// Provides information about the risk associated with the payment, as determined by Square. This field is present for payments to sellers that have opted in to receive risk evaluations.
	let risk_evaluation: RiskEvaluation?
	/// The buyer's shipping address.
	let shipping_address: Address?
	/// The source type for this payment.  Current values include `CARD`.
	let source_type: String?
	/// Additional payment information that gets added to the customer's card statement as part of the statement description.  Note that the `statement_description_identifier` might get truncated on the statement description to fit the required information including the Square identifier (SQ *) and the name of the seller taking the payment.
	let statement_description_identifier: String?
	/// Indicates whether the payment is APPROVED, COMPLETED, CANCELED, or FAILED.
	let status: String?
	/// The amount designated as a tip.   This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
	var tip_money: Money?
	/// The total amount for the payment, including `amount_money` and `tip_money`. This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
	let total_money: Money?
	/// The timestamp of when the payment was last updated, in RFC 3339 format.
	let updated_at: Timestamp?
}

/// Indicates the method used to enter the card's details.
enum TenderCardDetailsEntryMethod: String, Content {
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

struct TeamMember: Codable {
	/// Describes the team member's assigned locations.
	var assigned_locations: TeamMemberAssignedLocations?
	/// The timestamp in RFC 3339 format describing when the team member was created. Ex: "2018-10-04T04:00:00-07:00" or "2019-02-05T12:00:00Z"
	let created_at: Timestamp?
	/// The email address associated with the team member.
	var email_address: String?
	/// The family (i.e., last) name associated with the team member.
	var family_name: String?
	/// The given (i.e., first) name associated with the team member.
	var given_name: String?
	/// The unique ID for the team member.
	let id: String?
	/// Whether the team member is the owner of the Square account.
	let is_owner: Bool?
	/// The team member's phone number in E.164 format. Examples: +14155552671 - the country code is 1 for US +551155256325 - the country code is 55 for BR
	var phone_number: String?
	/// A second ID used to associate the team member with an entity in another system.
	var reference_id: String?
	/// Describes the status of the team member. See [TeamMemberStatus](#type-teammemberstatus) for possible values
	var status: TeamMemberStatus?
	/// The timestamp in RFC 3339 format describing when the team member was last updated. Ex: "2018-10-04T04:00:00-07:00" or "2019-02-05T12:00:00Z"
	let updated_at: Timestamp?
}

/// When to calculate the taxes due on a cart.
enum TaxCalculationPhase: String, Content {
	/// The fee is calculated based on the payment's subtotal.
	case TAX_SUBTOTAL_PHASE
	/// The fee is calculated based on the payment's total.
	case TAX_TOTAL_PHASE
}

struct RetrieveTeamMemberRequest: Codable {
}

struct SubscriptionPhase: Codable {
	/// The billing cadence of the phase. For example, weekly or monthly. This field cannot be changed after a `SubscriptionPhase` is created. See [SubscriptionCadence](#type-subscriptioncadence) for possible values
	var cadence: SubscriptionCadence
	/// The position this phase appears in the sequence of phases defined for the plan, indexed from 0. This field cannot be changed after a `SubscriptionPhase` is created.
	var ordinal: Int?
	/// The number of `cadence`s the phase lasts. If not set, the phase never ends. Only the last phase can be indefinite. This field cannot be changed after a `SubscriptionPhase` is created.
	var periods: Int?
	/// The amount to bill for each `cadence`.
	var recurring_price_money: Money
	/// The Square-assigned ID of the subscription phase. This field cannot be changed after a `SubscriptionPhase` is created.
	var uid: String?
}

/// 
enum V1AdjustInventoryRequestAdjustmentType: String, Content {
	/// 
	case SALE
	/// 
	case RECEIVE_STOCK
	/// 
	case MANUAL_ADJUST
}

struct V1DeleteDiscountRequest: Codable {
}

/// The current state of a cash drawer shift.
enum CashDrawerShiftState: String, Content {
	/// An open cash drawer shift.
	case OPEN
	/// A cash drawer shift that is ended but has not yet had an employee content audit.
	case ENDED
	/// An ended cash drawer shift that is closed with a completed employee content audit and recorded result.
	case CLOSED
}

/// Indicates the type of the payment request. An invoice supports the following payment request combinations: - 1 balance - 1 deposit with 1 balance - 2 - 12 installments - 1 deposit with 2 - 12 installments  For more information,  see [Payment requests](https://developer.squareup.com/docs/docs/invoices-api/overview#payment-requests).
enum InvoiceRequestType: String, Content {
	/// Identifies that the payment request is for the balance amount, after accounting for any  other payment requests in the invoice:   - If the invoice specifies only a balance payment request, it refers to the  total amount identified by the associated order.  - If the invoice also specifies a deposit request, the balance payment request refers to  the remaining amount. - `INSTALLMENT` and `BALANCE` are not allowed together.
	case BALANCE
	/// Identifies that the payment request is for a deposit. You have the option of specifying  an exact amount or a percentage of the total order amount. If you request a deposit,  it must be due before any other payment requests.
	case DEPOSIT
	/// Identifies that the payment request is for an installment. An invoice can request payments in installments.  Along with installments, you can request an optional deposit. All these payment requests must add to the total order amount.
	case INSTALLMENT
}

struct OnboardAppointmentsRequest: Codable {
}

struct OrderLineItemPricingBlocklistsBlockedTax: Codable {
	/// The `catalog_object_id` of the tax that should be blocked.  Use this field to block catalog taxes. For ad-hoc taxes use the  `tax_uid` field.
	var tax_catalog_object_id: String?
	/// The `uid` of the tax that should be blocked. Use this field to block  ad-hoc taxes. For catalog taxes use the `tax_catalog_object_id` field.
	var tax_uid: String?
	/// Unique ID of the `BlockedTax` within the order.
	var uid: String?
}

struct LoyaltyProgramExpirationPolicy: Codable {
	/// The duration of time before points expire, in RFC 3339 format.
	let expiration_duration: Timestamp
}

/// The capabilities a location may have.
enum LocationCapability: String, Content {
	/// The permission to process credit card transactions with Square.  The location can process credit cards if this value is present in the `capabilities` array of the `Location`.
	case CREDIT_CARD_PROCESSING
}

struct V1CreateVariationRequest: Codable {
	/// An object containing the fields to POST for the request.  See the corresponding object definition for field details.
	var body: V1Variation?
}

struct V1RetrieveCashDrawerShiftRequest: Codable {
}

struct RevokeTokenRequest: Codable {
	/// The access token of the merchant whose token you want to revoke. Do not provide a value for merchant_id if you provide this parameter.
	var access_token: String?
	/// The Square issued ID for your application, available from the [application dashboard](https://connect.squareup.com/apps).
	var client_id: String?
	/// The ID of the merchant whose token you want to revoke. Do not provide a value for access_token if you provide this parameter.
	var merchant_id: String?
	/// If `true`, terminate the given single access token, but do not terminate the entire authorization. Default: `false`
	var revoke_only_access_token: Bool?
}

struct BatchDeleteCatalogObjectsRequest: Codable {
	/// The IDs of the CatalogObjects to be deleted. When an object is deleted, other objects in the graph that depend on that object will be deleted as well (for example, deleting a CatalogItem will delete its CatalogItemVariation.
	var object_ids: [String]?
}

struct CatalogModifierList: Codable {
	/// The options included in the `CatalogModifierList`. You must include at least one `CatalogModifier`. Each CatalogObject must have type `MODIFIER` and contain `CatalogModifier` data.
	var modifiers: [CatalogObject]?
	/// The name for the `CatalogModifierList` instance. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	var name: String?
	/// Determines where this modifier list appears in a list of `CatalogModifierList` values.
	var ordinal: Int?
	/// Indicates whether multiple options from the modifier list can be applied to a single `CatalogItem`. See [CatalogModifierListSelectionType](#type-catalogmodifierlistselectiontype) for possible values
	var selection_type: CatalogModifierListSelectionType?
}

struct V1RetrieveItemRequest: Codable {
}

struct UpdateOrderResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The updated Order.
	var order: Order?
}

struct V1ListSettlementsResponse: Codable {
	var items: [V1Settlement]?
}

struct CatalogQueryPrefix: Codable {
	/// The name of the attribute to be searched.
	var attribute_name: String
	/// The desired prefix of the search attribute value.
	var attribute_prefix: String
}

/// Specifies the action for Square to take for processing the invoice. For example,  email the invoice, charge a customer's card on file, or do nothing.
enum InvoiceRequestMethod: String, Content {
	/// Directs Square to email the invoice to the customer after the invoice is published  (either immediately or at the `scheduled_at` time, if specified in the `invoice`.
	case EMAIL
	/// Directs Square to charge the card on file on the `due_date` specified in the payment request,  after the invoice is published.
	case CHARGE_CARD_ON_FILE
	/// Directs Square to take no specific action on the invoice. In this case, the seller  (or the application developer) follows up with the customer for payment. For example,  a seller might collect a payment in the Seller Dashboard or use the Point of Sale (POS) application.  The seller might also share the URL of the Square-hosted invoice page (`public_url`) with the customer requesting payment.
	case SHARE_MANUALLY
	/// Directs Square to charge the bank account on file on the `due_date` specified in the payment request, after the invoice is published.  This payment method applies only to recurring invoices that sellers create in the Seller Dashboard or other Square first-party application. The bank account is provided by the customer during the payment flow. You  cannot set `CHARGE_BANK_ON_FILE` as a payment source using the Invoices API.
	case CHARGE_BANK_ON_FILE
}

struct V1EmployeeRole: Codable {
	/// The time when the employee entity was created, in ISO 8601 format. Is set by Square when the Role is created.
	var created_at: String?
	/// The role's unique ID, Can only be set by Square.
	var id: String?
	/// If true, employees with this role have all permissions, regardless of the values indicated in permissions.
	var is_owner: Bool?
	/// The role's merchant-defined name.
	var name: String
	/// The role's permissions. See [V1EmployeeRolePermissions](#type-v1employeerolepermissions) for possible values
	var permissions: V1EmployeeRolePermissions
	/// The time when the employee entity was most recently updated, in ISO 8601 format. Is set by Square when the Role updated.
	var updated_at: String?
}

struct ListWorkweekConfigsRequest: Codable {
	/// Pointer to the next page of Workweek Config results to fetch.
	var cursor: String?
	/// Maximum number of Workweek Configs to return per page.
	var limit: Int?
}

struct CreateDisputeEvidenceTextResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The newly uploaded dispute evidence metadata.
	var evidence: DisputeEvidence?
}

/// A location's physical or mobile type.
enum LocationType: String, Content {
	/// A place of business with a physical location.
	case PHYSICAL
	/// A place of business that is mobile, such as a food truck or online store.
	case MOBILE
}

struct OnboardAppointmentsResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct V1ListItemsRequest: Codable {
	/// A pagination cursor to retrieve the next set of results for your original query to the endpoint.
	var batch_token: String?
}

struct V1ListPagesRequest: Codable {
}

struct CheckAppointmentsOnboardedRequest: Codable {
}

struct TerminalRefundQuerySort: Codable {
	/// The order in which results are listed. - `ASC` - oldest to newest - `DESC` - newest to oldest (default).
	var sort_order: String?
}

struct RetrieveLoyaltyAccountRequest: Codable {
}

struct OrderCreatedObject: Codable {
	/// Information about the created order.
	var order_created: OrderCreated?
}

struct CancelPaymentByIdempotencyKeyRequest: Codable {
	/// The `idempotency_key` identifying the payment to be canceled.
	var idempotency_key: String
}

struct V1RetrieveModifierListRequest: Codable {
}

struct DeleteCustomerGroupRequest: Codable {
}

/// Policies for accepting bookings.
enum BusinessBookingProfileBookingPolicy: String, Content {
	/// The seller accepts all booking requests automatically.
	case ACCEPT_ALL
	/// The seller must accept requests to complete bookings.
	case REQUIRES_ACCEPTANCE
}

struct PayOrderRequest: Codable {
	/// A value you specify that uniquely identifies this request among requests you've sent. If you're unsure whether a particular payment request was completed successfully, you can reattempt it with the same idempotency key without worrying about duplicate payments.  See [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency) for more information.
	var idempotency_key: String
	/// The version of the order being paid. If not supplied, the latest version will be paid.
	var order_version: Int?
	/// The IDs of the `payments` to collect. The payment total must match the order total.
	var payment_ids: [String]?
}

struct CatalogQueryItemsForModifierList: Codable {
	/// A set of `CatalogModifierList` IDs to be used to find associated `CatalogItem`s.
	var modifier_list_ids: [String]
}

struct CreateTerminalRefundRequest: Codable {
	/// A unique string that identifies this `CreateRefund` request. Keys can be any valid string but must be unique for every `CreateRefund` request.  See [Idempotency keys](https://developer.squareup.com/docs/basics/api101/idempotency) for more information.
	var idempotency_key: String
	/// The refund to create.
	var refund: TerminalRefund?
}

struct UpdateBreakTypeRequest: Codable {
	/// The updated `BreakType`.
	var break_type: BreakType
}

/// Indicates whether the program is currently active.
enum LoyaltyProgramStatus: String, Content {
	/// The loyalty program does not have an active subscription.  Loyalty API requests fail.
	case INACTIVE
	/// The program is fully functional. The program has an active subscription.
	case ACTIVE
}

struct SearchLoyaltyAccountsRequestLoyaltyAccountQuery: Codable {
	/// The set of customer IDs to use in the loyalty account search.    This cannot be combined with `mappings`.    Max: 30 customer IDs
	var customer_ids: [String]?
	/// The set of mappings to use in the loyalty account search.    This cannot be combined with `customer_ids`.    Max: 30 mappings
	var mappings: [LoyaltyAccountMapping]?
}

struct ListEmployeeWagesResponse: Codable {
	/// Value supplied in the subsequent request to fetch the next next page of Employee Wage results.
	var cursor: String?
	/// A page of Employee Wage results.
	var employee_wages: [EmployeeWage]?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct RedeemLoyaltyRewardResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The `LoyaltyEvent` for redeeming the reward.
	var event: LoyaltyEvent?
}

/// Specifies the `status` of `Shift` records to be returned.
enum ShiftFilterStatus: String, Content {
	/// Shifts that have been started and not ended.
	case OPEN
	/// Shifts that have been started and ended.
	case CLOSED
}

struct TerminalRefund: Codable {
	/// The amount of money, inclusive of `tax_money`, that the `TerminalRefund` should return. This value is limited to the amount taken in the original payment minus any completed or pending refunds.
	var amount_money: Money
	/// Present if the status is `CANCELED`. See [ActionCancelReason](#type-actioncancelreason) for possible values
	let cancel_reason: ActionCancelReason?
	/// The time when the `TerminalRefund` was created as an RFC 3339 timestamp.
	let created_at: Timestamp?
	/// The duration as an RFC 3339 duration, after which the refund will be automatically canceled. TerminalRefunds that are `PENDING` will be automatically `CANCELED` and have a cancellation reason of `TIMED_OUT`  Default: 5 minutes from creation  Maximum: 5 minutes
	var deadline_duration: Timestamp?
	/// The unique Id of the device intended for this `TerminalRefund`. The Id can be retrieved from /v2/devices api.
	var device_id: String?
	/// A unique ID for this `TerminalRefund`
	let id: String?
	/// The reference to the Square order id for the payment identified by the `payment_id`.
	let order_id: String?
	/// Unique ID of the payment being refunded.
	var payment_id: String
	/// A description of the reason for the refund. Note: maximum 192 characters
	var reason: String?
	/// The reference to the payment refund created by completing this `TerminalRefund`.
	let refund_id: String?
	/// The status of the `TerminalRefund`. Options: `PENDING`, `IN_PROGRESS`, `CANCELED`, `COMPLETED`
	let status: String?
	/// The time when the `TerminalRefund` was last updated as an RFC 3339 timestamp.
	let updated_at: Timestamp?
}

struct ListEmployeesResponse: Codable {
	/// The token to be used to retrieve the next page of results.
	var cursor: String?
	var employees: [Employee]?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct GetTerminalCheckoutRequest: Codable {
}

struct CreateTerminalCheckoutRequest: Codable {
	/// The checkout to create.
	var checkout: TerminalCheckout
	/// A unique string that identifies this `CreateCheckout` request. Keys can be any valid string but must be unique for every `CreateCheckout` request.  See [Idempotency keys](https://developer.squareup.com/docs/basics/api101/idempotency) for more information.
	var idempotency_key: String
}

/// Indicates a refund's current status.
enum RefundStatus: String, Content {
	/// The refund is pending.
	case PENDING
	/// The refund has been approved by Square.
	case APPROVED
	/// The refund has been rejected by Square.
	case REJECTED
	/// The refund failed.
	case FAILED
}

struct OrderLineItemPricingBlocklistsBlockedDiscount: Codable {
	/// The `catalog_object_id` of the discount that should be blocked.  Use this field to block catalog discounts. For ad-hoc discounts use the  `discount_uid` field.
	var discount_catalog_object_id: String?
	/// The `uid` of the discount that should be blocked. Use this field to block  ad-hoc discounts. For catalog discounts use the `discount_catalog_object_id` field.
	var discount_uid: String?
	/// Unique ID of the `BlockedDiscount` within the order.
	var uid: String?
}

/// Indicates the country associated with another entity, such as a business. Values are in [ISO 3166-1-alpha-2 format](http://www.iso.org/iso/home/standards/country_codes.htm).
enum Country: String, Content {
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

struct CreateCustomerGroupResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The successfully created customer group.
	var group: CustomerGroup?
}

struct V1ListTimecardsRequest: Codable {
	/// A pagination cursor to retrieve the next set of results for your original query to the endpoint.
	var batch_token: String?
	/// If filtering results by their clockin_time field, the beginning of the requested reporting period, in ISO 8601 format.
	var begin_clockin_time: String?
	/// If filtering results by their clockout_time field, the beginning of the requested reporting period, in ISO 8601 format.
	var begin_clockout_time: String?
	/// If filtering results by their updated_at field, the beginning of the requested reporting period, in ISO 8601 format.
	var begin_updated_at: String?
	/// If true, only deleted timecards are returned. If false, only valid timecards are returned.If you don't provide this parameter, both valid and deleted timecards are returned.
	var deleted: Bool?
	/// If provided, the endpoint returns only timecards for the employee with the specified ID.
	var employee_id: String?
	/// If filtering results by their clockin_time field, the end of the requested reporting period, in ISO 8601 format.
	var end_clockin_time: String?
	/// If filtering results by their clockout_time field, the end of the requested reporting period, in ISO 8601 format.
	var end_clockout_time: String?
	/// If filtering results by their updated_at field, the end of the requested reporting period, in ISO 8601 format.
	var end_updated_at: String?
	/// The maximum integer number of employee entities to return in a single response. Default 100, maximum 200.
	var limit: Int?
	/// The order in which timecards are listed in the response, based on their created_at field. See [SortOrder](#type-sortorder) for possible values
	var order: SortOrder?
}

struct CaptureTransactionRequest: Codable {
}

struct CashDrawerShiftSummary: Codable {
	/// The shift close time in ISO 8601 format.
	var closed_at: String?
	/// The amount of money found in the cash drawer at the end of the shift by an auditing employee. The amount must be greater than or equal to zero.
	var closed_cash_money: Money?
	/// An employee free-text description of a cash drawer shift.
	var description: String?
	/// The shift end time in ISO 8601 format.
	var ended_at: String?
	/// The amount of money that should be in the cash drawer at the end of the shift, based on the cash drawer events on the shift. The amount is correct if all shift employees accurately recorded their cash drawer shift events. Unrecorded events and events with the wrong amount result in an incorrect expected_cash_money amount that can be negative.
	var expected_cash_money: Money?
	/// The shift unique ID.
	var id: String?
	/// The shift start time in ISO 8601 format.
	var opened_at: String?
	/// The amount of money in the cash drawer at the start of the shift. This must be a positive amount.
	var opened_cash_money: Money?
	/// The shift current state. See [CashDrawerShiftState](#type-cashdrawershiftstate) for possible values
	var state: CashDrawerShiftState?
}

struct CatalogDiscount: Codable {
	/// The amount of the discount. Specify an amount of `0` if `discount_type` is `VARIABLE_AMOUNT`.  Do not use this field for percentage-based or variable discounts.
	var amount_money: Money?
	/// Indicates whether the discount is a fixed amount or percentage, or entered at the time of sale. See [CatalogDiscountType](#type-catalogdiscounttype) for possible values
	var discount_type: CatalogDiscountType?
	/// The color of the discount display label in the Square Point of Sale app. This must be a valid hex color code.
	var label_color: String?
	/// Indicates whether this discount should reduce the price used to calculate tax.  Most discounts should use `MODIFY_TAX_BASIS`. However, in some circumstances taxes must be calculated based on an item's price, ignoring a particular discount. For example, in many US jurisdictions, a manufacturer coupon or instant rebate reduces the price a customer pays but does not reduce the sale price used to calculate how much sales tax is due. In this case, the discount representing that manufacturer coupon should have `DO_NOT_MODIFY_TAX_BASIS` for this field.  If you are unsure whether you need to use this field, consult your tax professional. See [CatalogDiscountModifyTaxBasis](#type-catalogdiscountmodifytaxbasis) for possible values
	var modify_tax_basis: CatalogDiscountModifyTaxBasis?
	/// The discount name. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	var name: String?
	/// The percentage of the discount as a string representation of a decimal number, using a `.` as the decimal separator and without a `%` sign. A value of `7.5` corresponds to `7.5%`. Specify a percentage of `0` if `discount_type` is `VARIABLE_PERCENTAGE`.  Do not use this field for amount-based or variable discounts.
	var percentage: String?
	/// Indicates whether a mobile staff member needs to enter their PIN to apply the discount to a payment in the Square Point of Sale app.
	var pin_required: Bool?
}

struct CustomerGroup: Codable {
	/// The timestamp when the customer group was created, in RFC 3339 format.
	let created_at: Timestamp?
	/// Unique Square-generated ID for the customer group.
	let id: String?
	/// Name of the customer group.
	var name: String
	/// The timesamp when the customer group was last updated, in RFC 3339 format.
	let updated_at: Timestamp?
}

struct InvoicePaymentRequest: Codable {
	/// The ID of the card on file to charge for the payment request. To get the customer’s card on file, use the `customer_id` of the invoice recipient to call `RetrieveCustomer` in the Customers API. Then, get the ID of the target card from the `cards` field in the response.
	var card_id: String?
	/// The amount of the payment request, computed using the order amount and information from the various payment request fields (`request_type`,  `fixed_amount_requested_money`, and `percentage_requested`).
	let computed_amount_money: Money?
	/// The due date (in the invoice location's time zone) for the payment request.  After this date, the invoice becomes overdue.
	var due_date: String?
	/// If the payment request specifies `DEPOSIT` or `INSTALLMENT` as the  `request_type`,  this indicates the request amount. You cannot specify this when `request_type` is `BALANCE` or when the  payment request includes the `percentage_requested` field.
	var fixed_amount_requested_money: Money?
	/// Specifies the amount for the payment request in percentage:  - When the payment `request_type` is `DEPOSIT`, it is the percentage of the order total amount. - When the payment `request_type` is `INSTALLMENT`, it is the percentage of the order total less  the deposit, if requested. The sum of the `percentage_requested` in all installment  payment requests must be equal to 100.  You cannot specify this when the payment `request_type` is `BALANCE` or when the  payment request specifies the `fixed_amount_requested_money` field.
	var percentage_requested: String?
	/// A list of one or more reminders to send for the payment request.
	var reminders: [InvoicePaymentReminder]?
	/// Indicates how Square processes the payment request. See [InvoiceRequestMethod](#type-invoicerequestmethod) for possible values
	var request_method: InvoiceRequestMethod?
	/// Identifies the payment request type. This type defines how the payment request amount is determined. See [InvoiceRequestType](#type-invoicerequesttype) for possible values
	var request_type: InvoiceRequestType?
	/// If the most recent payment was a cash payment  in a currency that rounds cash payments (such as, `CAD` or `AUD`) and the payment  is rounded from `computed_amount_money` in the payment request, then this  field specifies the rounding adjustment applied. This amount  might be negative.
	let rounding_adjustment_included_money: Money?
	/// If set to true, the Square-hosted invoice page (the `public_url` field of the invoice)  provides a place for the customer to pay a tip.   This field is allowed only on the final payment request   and the payment `request_type` must be `BALANCE` or `INSTALLMENT`.
	var tipping_enabled: Bool?
	/// The amount of money already paid for the specific payment request.  This amount might include a rounding adjustment if the most recent invoice payment  was in cash in a currency that rounds cash payments (such as, `CAD` or `AUD`).
	let total_completed_amount_money: Money?
	/// The Square-generated ID of the payment request in an `invoice`.
	let uid: String?
}

struct BatchUpsertCatalogObjectsRequest: Codable {
	/// A batch of CatalogObjects to be inserted/updated atomically. The objects within a batch will be inserted in an all-or-nothing fashion, i.e., if an error occurs attempting to insert or update an object within a batch, the entire batch will be rejected. However, an error in one batch will not affect other batches within the same request.  For each object, its `updated_at` field is ignored and replaced with a current [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates), and its `is_deleted` field must not be set to `true`.  To modify an existing object, supply its ID. To create a new object, use an ID starting with `#`. These IDs may be used to create relationships between an object and attributes of other objects that reference it. For example, you can create a CatalogItem with ID `#ABC` and a CatalogItemVariation with its `item_id` attribute set to `#ABC` in order to associate the CatalogItemVariation with its parent CatalogItem.  Any `#`-prefixed IDs are valid only within a single atomic batch, and will be replaced by server-generated IDs.  Each batch may contain up to 1,000 objects. The total number of objects across all batches for a single request may not exceed 10,000. If either of these limits is violated, an error will be returned and no objects will be inserted or updated.
	var batches: [CatalogObjectBatch]
	/// A value you specify that uniquely identifies this request among all your requests. A common way to create a valid idempotency key is to use a Universally unique identifier (UUID).  If you're unsure whether a particular request was successful, you can reattempt it with the same idempotency key without worrying about creating duplicate objects.  See [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency) for more information.
	var idempotency_key: String
}

struct RetrieveTeamMemberResponse: Codable {
	/// The errors that occurred during the request.
	var errors: [Error]?
	/// The successfully retrieved `TeamMember` object.
	var team_member: TeamMember?
}

struct CreateLoyaltyAccountRequest: Codable {
	/// A unique string that identifies this `CreateLoyaltyAccount` request.  Keys can be any valid string, but must be unique for every request.
	var idempotency_key: String
	/// The loyalty account to create.
	var loyalty_account: LoyaltyAccount
}

struct SubscriptionEvent: Codable {
	/// The date, in YYYY-MM-DD format (for example, 2013-01-15), when the subscription event went into effect.
	var effective_date: String
	/// The ID of the subscription event.
	var id: String
	/// The ID of the subscription plan associated with the subscription.
	var plan_id: String
	/// Type of the subscription event. See [SubscriptionEventSubscriptionEventType](#type-subscriptioneventsubscriptioneventtype) for possible values
	var subscription_event_type: SubscriptionEventSubscriptionEventType
}

/// 
enum V1PageCellPlaceholderType: String, Content {
	/// 
	case ALL_ITEMS
	/// 
	case DISCOUNTS_CATEGORY
	/// 
	case REWARDS_FINDER
}

/// The possible subscription event types.
enum SubscriptionEventSubscriptionEventType: String, Content {
	/// The subscription started.
	case START_SUBSCRIPTION
	/// The subscription plan changed.
	case PLAN_CHANGE
	/// The subscription stopped.
	case STOP_SUBSCRIPTION
}

struct Card: Codable {
	/// The billing address for this card.
	var billing_address: Address?
	/// The first six digits of the card number, known as the Bank Identification Number (BIN). Only the Payments API returns this field.
	let bin: String?
	/// The card's brand. See [CardBrand](#type-cardbrand) for possible values
	let card_brand: CardBrand?
	/// The type of the card. The Card object includes this field only in response to Payments API calls. See [CardType](#type-cardtype) for possible values
	let card_type: CardType?
	/// The name of the cardholder.
	var cardholder_name: String?
	/// The expiration month of the associated card as an integer between 1 and 12.
	var exp_month: Int?
	/// The four-digit year of the card's expiration date.
	var exp_year: Int?
	/// __Not currently set.__ Intended as a Square-assigned identifier, based on the card number, to identify the card across multiple locations within a single application.
	let fingerprint: String?
	/// Unique ID for this card. Generated by Square.
	let id: String?
	/// The last 4 digits of the card number.
	let last_4: String?
	/// Indicates whether the Card is prepaid or not. The Card object includes this field only in response to Payments API calls. See [CardPrepaidType](#type-cardprepaidtype) for possible values
	let prepaid_type: CardPrepaidType?
}

struct InvoiceFilter: Codable {
	/// Limits the search to the specified customers, within the specified locations.  Specifying a customer is optional. In the current implementation,  a maximum of one customer can be specified.
	var customer_ids: [String]?
	/// Limits the search to the specified locations. A location is required.  In the current implementation, only one location can be specified.
	var location_ids: [String]
}

struct OrderRoundingAdjustment: Codable {
	/// Actual rounding adjustment amount.
	var amount_money: Money?
	/// The name of the rounding adjustment from the original sale Order.
	var name: String?
	/// Unique ID that identifies the rounding adjustment only within this order.
	var uid: String?
}

struct GetPaymentResponse: Codable {
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The requested `Payment`.
	var payment: Payment?
}

/// Defines the visibility of a custom attribute to applications other than their creating application.
enum CatalogCustomAttributeDefinitionAppVisibility: String, Content {
	/// Other applications cannot read this custom attribute.
	case APP_VISIBILITY_HIDDEN
	/// Other applications can read this custom attribute definition and values.
	case APP_VISIBILITY_READ_ONLY
	/// Other applications can read and write custom attribute values on objects. They can read but cannot edit the custom attribute definition.
	case APP_VISIBILITY_READ_WRITE_VALUES
}

struct SearchTeamMembersResponse: Codable {
	/// The opaque cursor for fetching the next page. Read about [pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination) with Square APIs for more information.
	var cursor: String?
	/// The errors that occurred during the request.
	var errors: [Error]?
	/// The filtered list of `TeamMember` objects.
	var team_members: [TeamMember]?
}

struct V1ListSettlementsRequest: Codable {
	/// A pagination cursor to retrieve the next set of results for your original query to the endpoint.
	var batch_token: String?
	/// The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year.
	var begin_time: String?
	/// The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time.
	var end_time: String?
	/// The maximum number of settlements to return in a single response. This value cannot exceed 200.
	var limit: Int?
	/// The order in which settlements are listed in the response. See [SortOrder](#type-sortorder) for possible values
	var order: SortOrder?
	/// Provide this parameter to retrieve only settlements with a particular status (SENT or FAILED). See [V1ListSettlementsRequestStatus](#type-v1listsettlementsrequeststatus) for possible values
	var status: V1ListSettlementsRequestStatus?
}

struct UpdateBookingRequest: Codable {
	/// The booking to be updated. Individual attributes explicitly specified here override the corresponding values of the existing booking.
	var booking: Booking
	/// A unique key to make this request an idempotent operation.
	var idempotency_key: String?
}

struct V1Payment: Codable {
	/// All of the additive taxes associated with the payment.
	var additive_tax: [V1PaymentTax]?
	/// The sum of all additive taxes associated with the payment.
	var additive_tax_money: V1Money?
	/// The time when the payment was created, in ISO 8601 format. Reflects the time of the first payment if the object represents an incomplete partial payment, and the time of the last or complete payment otherwise.
	var created_at: String?
	/// The unique identifier of the Square account that took the payment.
	var creator_id: String?
	/// The device that took the payment.
	var device: Device?
	/// The total of all discounts applied to the payment.
	var discount_money: V1Money?
	/// The total of all sales, including any applicable taxes.
	var gross_sales_money: V1Money?
	/// The payment's unique identifier.
	var id: String?
	/// All of the inclusive taxes associated with the payment.
	var inclusive_tax: [V1PaymentTax]?
	/// The sum of all inclusive taxes associated with the payment.
	var inclusive_tax_money: V1Money?
	/// Indicates whether or not the payment is only partially paid for. If true, this payment will have the tenders collected so far, but the itemizations will be empty until the payment is completed.
	var is_partial: Bool?
	/// The items purchased in the payment.
	var itemizations: [V1PaymentItemization]?
	/// The unique identifier of the merchant that took the payment.
	var merchant_id: String?
	/// The total of all sales, minus any applicable taxes.
	var net_sales_money: V1Money?
	/// The amount to be deposited into the merchant's bank account for the payment.
	var net_total_money: V1Money?
	/// The URL of the payment's detail page in the merchant dashboard. The merchant must be signed in to the merchant dashboard to view this page.
	var payment_url: String?
	/// The total of all processing fees collected by Square for the payment.
	var processing_fee_money: V1Money?
	/// The URL of the receipt for the payment. Note that for split tender payments, this URL corresponds to the receipt for the first tender listed in the payment's tender field. Each Tender object has its own receipt_url field you can use to get the other receipts associated with a split tender payment.
	var receipt_url: String?
	/// The total of all refunds applied to the payment.
	var refunded_money: V1Money?
	/// All of the refunds applied to the payment. Note that the value of all refunds on a payment can exceed the value of all tenders if a merchant chooses to refund money to a tender after previously accepting returned goods as part of an exchange.
	var refunds: [V1Refund]?
	/// The total of all surcharges applied to the payment.
	var surcharge_money: V1Money?
	/// A list of all surcharges associated with the payment.
	var surcharges: [V1PaymentSurcharge]?
	/// The total of all sales, including any applicable taxes, rounded to the smallest legal unit of currency (e.g., the nearest penny in USD, the nearest nickel in CAD)
	var swedish_rounding_money: V1Money?
	/// The total of all taxes applied to the payment. This is always the sum of inclusive_tax_money and additive_tax_money.
	var tax_money: V1Money?
	/// All of the tenders associated with the payment.
	var tender: [V1Tender]?
	/// The total of all tips applied to the payment.
	var tip_money: V1Money?
	/// The total of all discounts applied to the payment.
	var total_collected_money: V1Money?
}

struct Customer: Codable {
	/// The physical address associated with the customer profile.
	var address: Address?
	/// The birthday associated with the customer profile, in RFC 3339 format. Year is optional, timezone and times are not allowed. For example: `0000-09-01T00:00:00-00:00` indicates a birthday on September 1st. `1998-09-01T00:00:00-00:00` indications a birthday on September 1st __1998__.
	var birthday: Timestamp?
	/// Payment details of cards stored on file for the customer profile.
	var cards: [Card]?
	/// A business name associated with the customer profile.
	var company_name: String?
	/// The timestamp when the customer profile was created, in RFC 3339 format.
	let created_at: Timestamp?
	/// A creation source represents the method used to create the customer profile. See [CustomerCreationSource](#type-customercreationsource) for possible values
	var creation_source: CustomerCreationSource?
	/// The email address associated with the customer profile.
	var email_address: String?
	/// The family (i.e., last) name associated with the customer profile.
	var family_name: String?
	/// The given (i.e., first) name associated with the customer profile.
	var given_name: String?
	/// The IDs of customer groups the customer belongs to.
	var group_ids: [String]?
	/// The customer groups and segments the customer belongs to. This deprecated field has been replaced with  the dedicated `group_ids` for customer groups and the dedicated `segment_ids` field for customer segments. You can retrieve information about a given customer group and segment respectively using the Customer Groups API and Customer Segments API.
	var groups: [CustomerGroupInfo]?
	/// A unique Square-assigned ID for the customer profile.
	var id: String?
	/// A nickname for the customer profile.
	var nickname: String?
	/// A custom note associated with the customer profile.
	var note: String?
	/// The 11-digit phone number associated with the customer profile.
	var phone_number: String?
	/// Represents general customer preferences.
	var preferences: CustomerPreferences?
	/// An optional, second ID used to associate the customer profile with an entity in another system.
	var reference_id: String?
	/// The IDs of segments the customer belongs to.
	var segment_ids: [String]?
	/// The timestamp when the customer profile was last updated, in RFC 3339 format.
	let updated_at: Timestamp?
}

struct CatalogV1Id: Codable {
	/// The ID for an object used in the Square API V1, if the object ID differs from the Square API V2 object ID.
	var catalog_v1_id: String?
	/// The ID of the `Location` this Connect V1 ID is associated with.
	var location_id: String?
}

struct RetrieveBusinessBookingProfileRequest: Codable {
}

struct InventoryTransfer: Codable {
	/// The Square generated ID of the `CatalogObject` being tracked.
	var catalog_object_id: String?
	/// The `CatalogObjectType` of the `CatalogObject` being tracked.Tracking is only supported for the `ITEM_VARIATION` type.
	var catalog_object_type: String?
	/// A read-only timestamp in RFC 3339 format that indicates when Square received the transfer request.
	let created_at: Timestamp?
	/// The Square ID of the `Employee` responsible for the inventory transfer.
	var employee_id: String?
	/// The Square ID of the `Location` where the related quantity of items were tracked before the transfer.
	var from_location_id: String?
	/// A unique ID generated by Square for the `InventoryTransfer`.
	var id: String?
	/// A client-generated timestamp in RFC 3339 format that indicates when the transfer took place. For write actions, the `occurred_at` timestamp cannot be older than 24 hours or in the future relative to the time of the request.
	var occurred_at: Timestamp?
	/// The number of items affected by the transfer as a decimal string. Can support up to 5 digits after the decimal point.
	var quantity: String?
	/// An optional ID provided by the application to tie the `InventoryTransfer` to an external system.
	var reference_id: String?
	/// Read-only information about the application that initiated the inventory transfer.
	var source: SourceApplication?
	/// The `InventoryState` for the quantity of items being transferred. See [InventoryState](#type-inventorystate) for possible values
	var state: InventoryState?
	/// The Square ID of the `Location` where the related quantity of items were tracked after the transfer.
	var to_location_id: String?
}

struct V1ModifierList: Codable {
	/// The modifier list's unique ID.
	var id: String?
	/// The options included in the modifier list.
	var modifier_options: [V1ModifierOption]?
	/// The modifier list's name.
	var name: String?
	/// Indicates whether MULTIPLE options or a SINGLE option from the modifier list can be applied to a single item. See [V1ModifierListSelectionType](#type-v1modifierlistselectiontype) for possible values
	var selection_type: V1ModifierListSelectionType?
	/// The ID of the CatalogObject in the Connect v2 API. Objects that are shared across multiple locations share the same v2 ID.
	var v2_id: String?
}

/// The type of mapping.
enum LoyaltyAccountMappingType: String, Content {
	/// The loyalty account is mapped by phone.
	case PHONE
}

struct V1Timecard: Codable {
	/// The ID of the location the employee clocked in from. We strongly reccomend providing a clockin_location_id. Square uses the clockin_location_id to determine a timecard’s timezone and overtime rules.
	var clockin_location_id: String?
	/// The clock-in time for the timecard, in ISO 8601 format.
	var clockin_time: String?
	/// The ID of the location the employee clocked out from. Provide this value only if importing timecard information from another system.
	var clockout_location_id: String?
	/// The clock-out time for the timecard, in ISO 8601 format. Provide this value only if importing timecard information from another system.
	var clockout_time: String?
	/// The time when the timecard was created, in ISO 8601 format.
	var created_at: String?
	/// If true, the timecard was deleted by the merchant, and it is no longer valid.
	var deleted: Bool?
	/// The total number of doubletime seconds worked in the timecard.
	var doubletime_seconds_worked: Float?
	/// The ID of the employee the timecard is associated with.
	var employee_id: String
	/// The timecard's unique ID.
	var id: String?
	/// The total number of overtime seconds worked in the timecard.
	var overtime_seconds_worked: Float?
	/// The total number of regular (non-overtime) seconds worked in the timecard.
	var regular_seconds_worked: Float?
	/// The time when the timecard was most recently updated, in ISO 8601 format.
	var updated_at: String?
}

struct LoyaltyEvent: Codable {
	/// Provides metadata when the event `type` is `ACCUMULATE_POINTS`.
	let accumulate_points: LoyaltyEventAccumulatePoints?
	/// Provides metadata when the event `type` is `ADJUST_POINTS`.
	let adjust_points: LoyaltyEventAdjustPoints?
	/// Provides metadata when the event `type` is `CREATE_REWARD`.
	let create_reward: LoyaltyEventCreateReward?
	/// The timestamp when the event was created, in RFC 3339 format.
	let created_at: Timestamp
	/// Provides metadata when the event `type` is `DELETE_REWARD`.
	let delete_reward: LoyaltyEventDeleteReward?
	/// Provides metadata when the event `type` is `EXPIRE_POINTS`.
	let expire_points: LoyaltyEventExpirePoints?
	/// The Square-assigned ID of the loyalty event.
	let id: String
	/// The ID of the `location` where the event occurred.
	let location_id: String?
	/// The ID of the `loyalty account` in which the event occurred.
	let loyalty_account_id: String
	/// Provides metadata when the event `type` is `OTHER`.
	let other_event: LoyaltyEventOther?
	/// Provides metadata when the event `type` is `REDEEM_REWARD`.
	let redeem_reward: LoyaltyEventRedeemReward?
	/// Defines whether the event was generated by the Square Point of Sale. See [LoyaltyEventSource](#type-loyaltyeventsource) for possible values
	let source: LoyaltyEventSource
	/// The type of the loyalty event. See [LoyaltyEventType](#type-loyaltyeventtype) for possible values
	let type: LoyaltyEventType
}

struct CatalogCustomAttributeDefinition: Codable {
	/// The set of Catalog Object Types that this Custom Attribute may be applied to. Currently, only `ITEM` and `ITEM_VARIATION` are allowed. At least one type must be included. See [CatalogObjectType](#type-catalogobjecttype) for possible values
	var allowed_object_types: CatalogObjectType
	/// The visibility of a custom attribute to applications other than the application that created the attribute. See [CatalogCustomAttributeDefinitionAppVisibility](#type-catalogcustomattributedefinitionappvisibility) for possible values
	var app_visibility: CatalogCustomAttributeDefinitionAppVisibility?
	/// __Read-only.__ The number of custom attributes that reference this custom attribute definition. Set by the server in response to a ListCatalog request with `include_counts` set to `true`.  If the actual count is greater than 100, `custom_attribute_usage_count` will be set to `100`.
	let custom_attribute_usage_count: Int?
	/// Seller-oriented description of the meaning of this Custom Attribute, any constraints that the seller should observe, etc. May be displayed as a tooltip in Square UIs.
	var description: String?
	/// The name of the desired custom attribute key that can be used to access the custom attribute value on catalog objects. Cannot be modified after the custom attribute definition has been created. Must be between 1 and 60 characters, and may only contain the characters `[a-zA-Z0-9_-]`.
	var key: String?
	///  The name of this definition for API and seller-facing UI purposes. The name must be unique within the (merchant, application) pair. Required. May not be empty and may not exceed 255 characters. Can be modified after creation.
	var name: String
	/// Optionally, populated when `type` = `NUMBER`, unset otherwise.
	var number_config: CatalogCustomAttributeDefinitionNumberConfig?
	/// Populated when `type` is set to `SELECTION`, unset otherwise.
	var selection_config: CatalogCustomAttributeDefinitionSelectionConfig?
	/// The visibility of a custom attribute in seller-facing UIs (including Square Point of Sale applications and Square Dashboard). May be modified. See [CatalogCustomAttributeDefinitionSellerVisibility](#type-catalogcustomattributedefinitionsellervisibility) for possible values
	var seller_visibility: CatalogCustomAttributeDefinitionSellerVisibility?
	/// __Read only.__ Contains information about the application that created this custom attribute definition.
	var source_application: SourceApplication?
	/// Optionally, populated when `type` = `STRING`, unset otherwise.
	var string_config: CatalogCustomAttributeDefinitionStringConfig?
	/// The type of this custom attribute. Cannot be modified after creation. Required. See [CatalogCustomAttributeDefinitionType](#type-catalogcustomattributedefinitiontype) for possible values
	var type: CatalogCustomAttributeDefinitionType
}

struct CreateShiftResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The `Shift` that was created on the request.
	var shift: Shift?
}

struct RetrieveEmployeeRequest: Codable {
}

/// How to apply a CatalogDiscount to a CatalogItem.
enum CatalogDiscountType: String, Content {
	/// Apply the discount as a fixed percentage (e.g., 5%) off the item price.
	case FIXED_PERCENTAGE
	/// Apply the discount as a fixed amount (e.g., $1.00) off the item price.
	case FIXED_AMOUNT
	/// Apply the discount as a variable percentage off the item price. The percentage will be specified at the time of sale.
	case VARIABLE_PERCENTAGE
	/// Apply the discount as a variable amount off the item price. The amount will be specified at the time of sale.
	case VARIABLE_AMOUNT
}

struct SourceApplication: Codable {
	/// Read-only Square ID assigned to the application. Only used for `Product` type `EXTERNAL_API`.
	var application_id: String?
	/// Read-only display name assigned to the application (e.g. `"Custom Application"`, `"Square POS 4.74 for Android"`).
	var name: String?
	/// Read-only `Product` type for the application. See [Product](#type-product) for possible values
	var product: Product?
}

struct UpdateItemModifierListsRequest: Codable {
	/// The IDs of the catalog items associated with the CatalogModifierList objects being updated.
	var item_ids: [String]
	/// The IDs of the CatalogModifierList objects to disable for the CatalogItem.
	var modifier_lists_to_disable: [String]?
	/// The IDs of the CatalogModifierList objects to enable for the CatalogItem.
	var modifier_lists_to_enable: [String]?
}

struct SearchLoyaltyEventsResponse: Codable {
	/// The pagination cursor to be used in a subsequent  request. If empty, this is the final response.  For more information,  see [Pagination](https://developer.squareup.com/docs/docs/basics/api101/pagination).
	var cursor: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The loyalty events that satisfy the search criteria.
	var events: [LoyaltyEvent]?
}

struct DeleteBreakTypeRequest: Codable {
}

struct V1UpdateTimecardRequest: Codable {
	/// An object containing the fields to POST for the request. See the corresponding object definition for field details.
	var body: V1Timecard
}

struct ListCustomerSegmentsResponse: Codable {
	/// A pagination cursor to be used in subsequent calls to __ListCustomerSegments__ to retrieve the next set of query results. Only present only if the request succeeded and additional results are available.  See the [Pagination guide](https://developer.squareup.com/docs/docs/working-with-apis/pagination) for more information.
	var cursor: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The list of customer segments belonging to the associated Square account.
	var segments: [CustomerSegment]?
}

/// The status of the Employee being retrieved.
enum EmployeeStatus: String, Content {
	/// Specifies that the employee is in the Active state.
	case ACTIVE
	/// Specifies that the employee is in the Inactive state.
	case INACTIVE
}

struct RegisterDomainResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// Status of the domain registration.  See `RegisterDomainResponseStatus` for possible values. See [RegisterDomainResponseStatus](#type-registerdomainresponsestatus) for possible values
	var status: RegisterDomainResponseStatus?
}

struct ListSubscriptionEventsResponse: Codable {
	/// When a response is truncated, it includes a cursor that you can  use in a subsequent request to fetch the next set of events.  If empty, this is the final response.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	var cursor: String?
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The `SubscriptionEvents` retrieved.
	var subscription_events: [SubscriptionEvent]?
}

/// Determines the billing cadence of a `Subscription`
enum SubscriptionCadence: String, Content {
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

struct ListEmployeeWagesRequest: Codable {
	/// Pointer to the next page of Employee Wage results to fetch.
	var cursor: String?
	/// Filter wages returned to only those that are associated with the specified employee.
	var employee_id: String?
	/// Maximum number of Employee Wages to return per page. Can range between 1 and 200. The default is the maximum at 200.
	var limit: Int?
}

/// Indicates whether a CatalogModifierList supports multiple selections.
enum CatalogModifierListSelectionType: String, Content {
	/// Indicates that a CatalogModifierList allows only a single CatalogModifier to be selected.
	case SINGLE
	/// Indicates that a CatalogModifierList allows multiple CatalogModifier to be selected.
	case MULTIPLE
}

struct V1ListCashDrawerShiftsRequest: Codable {
	/// The beginning of the requested reporting period, in ISO 8601 format. Default value: The current time minus 90 days.
	var begin_time: String?
	/// The beginning of the requested reporting period, in ISO 8601 format. Default value: The current time.
	var end_time: String?
	/// The order in which cash drawer shifts are listed in the response, based on their created_at field. Default value: ASC See [SortOrder](#type-sortorder) for possible values
	var order: SortOrder?
}

struct LoyaltyEventCreateReward: Codable {
	/// The ID of the `loyalty program`.
	let loyalty_program_id: String
	/// The loyalty points used to create the reward.
	let points: Int
	/// The Square-assigned ID of the created `loyalty reward`. This field is returned only if the event source is `LOYALTY_API`.
	let reward_id: String?
}

struct CompletePaymentRequest: Codable {
}

struct SearchTerminalRefundsRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query.
	var cursor: String?
	/// Limit the number of results returned for a single request.
	var limit: Int?
	/// Query the terminal refunds based on given conditions and sort order. Calling `SearchTerminalRefunds` without an explicitly query parameter will return all available refunds with the default sort order.
	var query: TerminalRefundQuery?
}

struct CatalogCustomAttributeDefinitionSelectionConfigCustomAttributeSelection: Codable {
	/// Selection name, unique within `allowed_selections`.
	var name: String
	/// Unique ID set by Square.
	var uid: String?
}

struct GetDeviceCodeRequest: Codable {
}

struct RetrieveTeamMemberBookingProfileRequest: Codable {
}

struct TeamMemberBookingProfile: Codable {
	/// The description of the team member.
	var description: String?
	/// The display name of the team member.
	var display_name: String?
	/// Indicates whether the team member can be booked through the Bookings API or the seller's online booking channel or site (`true) or not (`false`).
	var is_bookable: Bool?
	/// The URL of the team member's image for the bookings profile.
	var profile_image_url: String?
	/// The ID of the `TeamMember` object for the team member associated with the booking profile.
	var team_member_id: String?
}

/// Types of location where service is provided.
enum BusinessAppointmentSettingsBookingLocationType: String, Content {
	/// The service is provided at a seller location.
	case BUSINESS_LOCATION
	/// The service is provided at a customer location.
	case CUSTOMER_LOCATION
	/// The service is provided over the phone.
	case PHONE
}

struct SearchTeamMembersRequest: Codable {
	/// The opaque cursor for fetching the next page. Read about [pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination) with Square APIs for more information.
	var cursor: String?
	/// The maximum number of `TeamMember` objects in a page (25 by default).
	var limit: Int?
	/// The query parameters.
	var query: SearchTeamMembersQuery?
}

struct CreateOrderRequest: Codable {
	/// A value you specify that uniquely identifies this order among orders you've created.  If you're unsure whether a particular order was created successfully, you can reattempt it with the same idempotency key without worrying about creating duplicate orders.  See [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency) for more information.
	var idempotency_key: String?
	/// The ID of the business location to associate the order with.
	var location_id: String?
	/// The order to create. If this field is set, then the only other top-level field that can be set is the idempotency_key.
	var order: Order?
}

struct RetrieveInventoryPhysicalCountRequest: Codable {
}

struct UpdateTeamMemberRequest: Codable {
	/// The data which will be used to update the `TeamMember` object.
	var team_member: TeamMember?
}

struct V1InventoryEntry: Codable {
	/// The current available quantity of the item variation.
	var quantity_on_hand: Float?
	/// The variation that the entry corresponds to.
	var variation_id: String?
}

struct DeleteCustomerCardRequest: Codable {
}

struct ObtainTokenResponse: Codable {
	/// A valid OAuth access token. OAuth access tokens are 64 bytes long. Provide the access token in a header with every request to Connect API endpoints. See [OAuth API: Walkthrough](https://developer.squareup.com/docs/oauth-api/walkthrough) for more information.
	var access_token: String?
	/// The date when access_token expires, in [ISO 8601](http://www.iso.org/iso/home/standards/iso8601.htm) format.
	var expires_at: String?
	/// Then OpenID token belonging to this this person. Only present if the OPENID scope is included in the authorize request.
	var id_token: String?
	/// The ID of the authorizing merchant's business.
	var merchant_id: String?
	/// __LEGACY FIELD__. The ID of the subscription plan the merchant signed up for. Only present if the merchant signed up for a subscription during authorization.
	var plan_id: String?
	/// A refresh token. OAuth refresh tokens are 64 bytes long. For more information, see [OAuth access token management](https://developer.squareup.com/docs/authz/oauth/how-it-works#oauth-access-token-management).
	var refresh_token: String?
	/// A boolean indicating the access token is a short-lived access token. The short-lived access token returned in the response will expire in 24 hours.
	var short_lived: Bool?
	/// __LEGACY FIELD__. The ID of a subscription plan the merchant signed up for. Only present if the merchant signed up for a subscription during authorization.
	var subscription_id: String?
	/// This value is always _bearer_.
	var token_type: String?
}

struct VoidTransactionResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct AdditionalRecipient: Codable {
	/// The amount of money distributed to the recipient.
	var amount_money: Money
	/// The description of the additional recipient.
	var description: String
	/// The location ID for a recipient (other than the merchant) receiving a portion of this tender.
	var location_id: String
	/// The unique ID for this `AdditionalRecipientReceivable`, assigned by the server.
	var receivable_id: String?
}

struct OrderFulfillmentUpdatedObject: Codable {
	/// Information about the updated order fulfillment.
	var order_fulfillment_updated: OrderFulfillmentUpdated?
}

struct V1ListEmployeeRolesResponse: Codable {
	var items: [V1EmployeeRole]?
}

struct V1DeleteTimecardResponse: Codable {
}

/// The state of the order.
enum OrderState: String, Content {
	/// Indicates the order is open. Open orders may be updated.
	case OPEN
	/// Indicates the order is completed. Completed orders are fully paid. This is a terminal state.
	case COMPLETED
	/// Indicates the order is canceled. Canceled orders are not paid. This is a terminal state.
	case CANCELED
}

struct DeleteCustomerCardResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct InvoiceQuery: Codable {
	/// Query filters to apply in  searching invoices.  For more information, see [Retrieve invoices](https://developer.squareup.com/docs/docs/invoices-api/overview#retrieve-invoices).
	var filter: InvoiceFilter
	/// Describes the sort order for the search result.
	var sort: InvoiceSort?
}

/// 
enum V1CashDrawerShiftEventType: String, Content {
	/// 
	case OPEN
	/// 
	case ENDED
	/// 
	case CLOSED
}

struct InvoiceCustomField: Codable {
	/// The label or title of the custom field. This field is required for a custom field.
	var label: String?
	/// The location of the custom field on the invoice. This field is required for a custom field. See [InvoiceCustomFieldPlacement](#type-invoicecustomfieldplacement) for possible values
	var placement: InvoiceCustomFieldPlacement?
	/// The text of the custom field. If omitted, only the label is rendered.
	var value: String?
}

/// Possible types of CatalogObjects returned from the Catalog, each containing type-specific properties in the `*_data` field corresponding to the object type.
enum CatalogObjectType: String, Content {
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

struct CatalogCustomAttributeDefinitionSelectionConfig: Codable {
	/// The set of valid `CatalogCustomAttributeSelections`. Up to a maximum of 100 selections can be defined. Can be modified.
	var allowed_selections: [CatalogCustomAttributeDefinitionSelectionConfigCustomAttributeSelection]?
	/// The maximum number of selections that can be set. The maximum value for this attribute is 100. The default value is 1. The value can be modified, but changing the value will not affect existing custom attribute values on objects. Clients need to handle custom attributes with more selected values than allowed by this limit.
	var max_allowed_selections: Int?
}

struct V1RetrieveEmployeeRoleRequest: Codable {
}

struct Dispute: Codable {
	/// The disputed amount. The amount can be less than the entire transaction amount. For example, a cardholder purchased multiple items, however initiated dispute only for some of the items.
	var amount_money: Money?
	/// The ID of the dispute in the card brand system, generated by the card brand.
	var brand_dispute_id: String?
	/// The card brand used in the disputed payment. See [CardBrand](#type-cardbrand) for possible values
	var card_brand: CardBrand?
	/// The timestamp when the dispute was created, in RFC 3339 format.
	let created_at: Timestamp?
	/// The unique ID for this `Dispute`, generated by Square.
	var dispute_id: String?
	/// The payment challenged in this dispute.
	var disputed_payment: DisputedPayment?
	/// The time when the next action is due, in RFC 3339 format.
	var due_at: Timestamp?
	/// The IDs of the evidence associated with the dispute.
	var evidence_ids: [String]?
	/// The ID of the location where the dispute originated.
	var location_id: String?
	/// The dispute reason why the cardholder initiated the dispute with their bank. See [DisputeReason](#type-disputereason) for possible values
	var reason: DisputeReason?
	/// The timestamp when the dispute was reported, in RFC 3339 format.
	var reported_date: Timestamp?
	/// The current state of this dispute. See [DisputeState](#type-disputestate) for possible values
	var state: DisputeState?
	/// The timestamp when the dispute was last updated, in RFC 3339 format.
	let updated_at: Timestamp?
	/// The current version of the `Dispute`.
	var version: Int?
}

struct RetrieveBusinessBookingProfileResponse: Codable {
	/// The seller's booking profile.
	var business_booking_profile: BusinessBookingProfile?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct ListLocationsResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The business locations.
	var locations: [Location]?
}

struct DeleteBreakTypeResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct OrderSource: Codable {
	/// The name used to identify the place (physical or digital) that an order originates. If unset, the name defaults to the name of the application that created the order.
	var name: String?
}

struct CatalogQueryText: Codable {
	/// A list of 1, 2, or 3 search keywords. Keywords with fewer than 3 characters are ignored.
	var keywords: [String]
}

struct LoyaltyEventAccumulatePoints: Codable {
	/// The ID of the `loyalty program`.
	let loyalty_program_id: String?
	/// The ID of the `order` for which the buyer accumulated the points. This field is returned only if the Orders API is used to process orders.
	var order_id: String?
	/// The number of points accumulated by the event.
	var points: Int?
}

/// 
enum V1TenderEntryMethod: String, Content {
	/// 
	case MANUAL
	/// 
	case SCANNED
	/// 
	case SQUARE_CASH
	/// 
	case SQUARE_WALLET
	/// 
	case SWIPED
	/// 
	case WEB_FORM
	/// 
	case OTHER
}

struct AddGroupToCustomerRequest: Codable {
}

struct SearchAvailabilityResponse: Codable {
	/// List of slots available for booking.
	var availabilities: [Availability]?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct CashDrawerDevice: Codable {
	/// The device Square-issued ID
	var id: String?
	/// The device merchant-specified name.
	var name: String?
}

struct LoyaltyReward: Codable {
	/// The timestamp when the reward was created, in RFC 3339 format.
	let created_at: Timestamp?
	/// The Square-assigned ID of the loyalty reward.
	let id: String?
	/// The Square-assigned ID of the `loyalty account` to which the reward belongs.
	var loyalty_account_id: String
	/// The Square-assigned ID of the `order` to which the reward is attached.
	var order_id: String?
	/// The number of loyalty points used for the reward.
	let points: Int?
	/// The timestamp when the reward was redeemed, in RFC 3339 format.
	let redeemed_at: Timestamp?
	/// The Square-assigned ID of the `reward tier` used to create the reward.
	var reward_tier_id: String
	/// The status of a loyalty reward. See [LoyaltyRewardStatus](#type-loyaltyrewardstatus) for possible values
	let status: LoyaltyRewardStatus?
	/// The timestamp when the reward was last updated, in RFC 3339 format.
	let updated_at: Timestamp?
}

struct Error: Codable {
	/// The high-level category for the error. See [ErrorCategory](#type-errorcategory) for possible values
	var category: ErrorCategory
	/// The specific code of the error. See [ErrorCode](#type-errorcode) for possible values
	var code: ErrorCode
	/// A human-readable description of the error for debugging purposes.
	var detail: String?
	/// The name of the field provided in the original request (if any) that the error pertains to.
	var field: String?
}

struct GetTerminalRefundResponse: Codable {
	/// Information on errors encountered during the request.
	var errors: [Error]?
	/// The requested `Refund`
	var refund: TerminalRefund?
}

struct RetrieveCustomerRequest: Codable {
}

struct ListTeamMemberBookingProfilesResponse: Codable {
	/// The cursor for paginating through the results.
	var cursor: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The list of team member booking profiles.
	var team_member_booking_profiles: [TeamMemberBookingProfile]?
}

struct SearchOrdersDateTimeFilter: Codable {
	/// Time range for filtering on the `closed_at` timestamp. If you use this value, you must also set the `sort_field` in the OrdersSearchSort object to `CLOSED_AT`.
	var closed_at: TimeRange?
	/// Time range for filtering on the `created_at` timestamp. If you use this value, you must also set the `sort_field` in the OrdersSearchSort object to `CREATED_AT`.
	var created_at: TimeRange?
	/// Time range for filtering on the `updated_at` timestamp. If you use this value, you must also set the `sort_field` in the OrdersSearchSort object to `UPDATED_AT`.
	var updated_at: TimeRange?
}

struct BusinessBookingProfile: Codable {
	/// Indicates whether customers can cancel or reschedule their own bookings (`true`) or not (`false`).
	var allow_user_cancel: Bool?
	/// Indicates whether the seller is open for booking.
	var booking_enabled: Bool?
	/// The policy for the seller to automatically accept booking requests (`ACCEPT_ALL`) or not (`REQUIRES_ACCEPTANCE`).
	var booking_policy: BusinessBookingProfileBookingPolicy?
	/// Settings for appointment-type bookings.
	var business_appointment_settings: BusinessAppointmentSettings?
	/// The RFC-3339 timestamp specifying the booking's creation time.
	let created_at: Timestamp?
	/// The choice of customer's time zone information of a booking. The Square online booking site and all notifications to customers uses either the seller location’s time zone or the time zone the customer chooses at booking.
	var customer_timezone_choice: BusinessBookingProfileCustomerTimezoneChoice?
	/// The ID of the seller, obtainable using the Merchants API.
	var seller_id: String?
}

struct UpdateInvoiceResponse: Codable {
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The updated invoice.
	var invoice: Invoice?
}

/// The type of the dispute evidence.
enum DisputeEvidenceType: String, Content {
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

/// 
enum V1DiscountDiscountType: String, Content {
	/// 
	case FIXED
	/// 
	case VARIABLE_PERCENTAGE
	/// 
	case VARIABLE_AMOUNT
}

/// 
enum V1ListSettlementsRequestStatus: String, Content {
	/// 
	case SENT
	/// 
	case FAILED
}

struct UpdateSubscriptionRequest: Codable {
	/// The subscription object containing the current version, and fields to update. Unset fields will be left at their current server values, and JSON `null` values will be treated as a request to clear the relevant data.
	var subscription: Subscription?
}

struct BalancePaymentDetails: Codable {
	/// The ID of the account used to fund the payment.
	var account_id: String?
	/// The balance payment’s current state. The state can be COMPLETED or FAILED.
	var status: String?
}

struct V1ListRefundsResponse: Codable {
	var items: [V1Refund]?
}

struct CreateInvoiceRequest: Codable {
	/// A unique string that identifies the `CreateInvoice` request. If you do not  provide `idempotency_key` (or provide an empty string as the value), the endpoint  treats each request as independent.  For more information, see [Idempotency](https://developer.squareup.com/docs/docs/working-with-apis/idempotency).
	var idempotency_key: String?
	/// The invoice to create.
	var invoice: Invoice
}

/// 
enum V1UpdateModifierListRequestSelectionType: String, Content {
	/// 
	case SINGLE
	/// 
	case MULTIPLE
}

/// The status of domain registration.
enum RegisterDomainResponseStatus: String, Content {
	/// The domain is added, but not verified.
	case PENDING
	/// The domain is added and verified. It can be used to accept Apple Pay transactions.
	case VERIFIED
}

struct UpsertCatalogObjectResponse: Codable {
	/// The successfully created or updated CatalogObject.
	var catalog_object: CatalogObject?
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The mapping between client and server IDs for this upsert.
	var id_mappings: [CatalogIdMapping]?
}

struct V1CreateDiscountRequest: Codable {
	/// An object containing the fields to POST for the request.  See the corresponding object definition for field details.
	var body: V1Discount?
}

struct ListTransactionsResponse: Codable {
	/// A pagination cursor for retrieving the next set of results, if any remain. Provide this value as the `cursor` parameter in a subsequent request to this endpoint.  See [Paginating results](#paginatingresults) for more information.
	var cursor: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// An array of transactions that match your query.
	var transactions: [Transaction]?
}

struct ChargeRequest: Codable {
	/// The basic primitive of multi-party transaction. The value is optional. The transaction facilitated by you can be split from here.  If you provide this value, the `amount_money` value in your additional_recipients must not be more than 90% of the `amount_money` value in the charge request. The `location_id` must be the valid location of the app owner merchant.  This field requires the `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission.  This field is currently not supported in sandbox.
	var additional_recipients: [AdditionalRecipient]?
	/// The amount of money to charge.  Note that you specify the amount in the __smallest denomination of the applicable currency__. For example, US dollar amounts are specified in cents. See [Working with monetary amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts) for details.  The value of `currency` must match the currency associated with the business that is charging the card.
	var amount_money: Money
	/// The buyer's billing address. This value is optional, but this transaction is ineligible for chargeback protection if neither this parameter nor `shipping_address` is provided.
	var billing_address: Address?
	/// The buyer's email address, if available. This value is optional, but this transaction is ineligible for chargeback protection if it is not provided.
	var buyer_email_address: String?
	/// A nonce generated from the `SqPaymentForm` that represents the card to charge.  The application that provides a nonce to this endpoint must be the _same application_ that generated the nonce with the `SqPaymentForm`. Otherwise, the nonce is invalid.  Do not provide a value for this field if you provide a value for `customer_card_id`.
	var card_nonce: String?
	/// The ID of the customer card on file to charge. Do not provide a value for this field if you provide a value for `card_nonce`.  If you provide this value, you _must_ also provide a value for `customer_id`.
	var customer_card_id: String?
	/// The ID of the customer to associate this transaction with. This field is required if you provide a value for `customer_card_id`, and optional otherwise.
	var customer_id: String?
	/// If `true`, the request will only perform an Auth on the provided card. You can then later perform either a Capture (with the `CaptureTransaction` or a Void (with the `VoidTransaction`.  Default value: `false`
	var delay_capture: Bool?
	/// A value you specify that uniquely identifies this transaction among transactions you've created.  If you're unsure whether a particular transaction succeeded, you can reattempt it with the same idempotency key without worrying about double-charging the buyer.  See [Idempotency keys](#idempotencykeys) for more information.
	var idempotency_key: String
	/// An optional note to associate with the transaction.  This value cannot exceed 60 characters.
	var note: String?
	/// The ID of the order to associate with this transaction.  If you provide this value, the `amount_money` value of your request must __exactly match__ the value of the order's `total_money` field.
	var order_id: String?
	/// An optional ID you can associate with the transaction for your own purposes (such as to associate the transaction with an entity ID in your own database).  This value cannot exceed 40 characters.
	var reference_id: String?
	/// The buyer's shipping address, if available. This value is optional, but this transaction is ineligible for chargeback protection if neither this parameter nor `billing_address` is provided.
	var shipping_address: Address?
	/// A token generated by SqPaymentForm's verifyBuyer() that represents customer's device info and 3ds challenge result.
	var verification_token: String?
}

struct V1PageCell: Codable {
	/// The column of the cell. Always an integer between 0 and 4, inclusive.
	var column: Int?
	/// The unique identifier of the entity represented in the cell. Not present for cells with an object_type of PLACEHOLDER.
	var object_id: String?
	/// The type of entity represented in the cell (ITEM, DISCOUNT, CATEGORY, or PLACEHOLDER). See [V1PageCellObjectType](#type-v1pagecellobjecttype) for possible values
	var object_type: V1PageCellObjectType?
	/// The unique identifier of the page the cell is included on.
	var page_id: String?
	/// For a cell with an object_type of PLACEHOLDER, this value indicates the cell's special behavior. See [V1PageCellPlaceholderType](#type-v1pagecellplaceholdertype) for possible values
	var placeholder_type: V1PageCellPlaceholderType?
	/// The row of the cell. Always an integer between 0 and 4, inclusive.
	var row: Int?
}

/// 
enum V1OrderState: String, Content {
	/// 
	case PENDING
	/// 
	case OPEN
	/// 
	case COMPLETED
	/// 
	case CANCELED
	/// 
	case REFUNDED
	/// 
	case REJECTED
}

/// Enumerates the `Shift` fields to sort on.
enum ShiftSortField: String, Content {
	/// The start date/time of a `Shift`
	case START_AT
	/// The end date/time of a `Shift`
	case END_AT
	/// The date/time that a `Shift` is created
	case CREATED_AT
	/// The most recent date/time that a `Shift` is updated
	case UPDATED_AT
}

struct RetrieveSubscriptionResponse: Codable {
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The subscription retrieved.
	var subscription: Subscription?
}

struct UpdateSubscriptionResponse: Codable {
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The modified `Subscription` object.
	var subscription: Subscription?
}

struct CalculateOrderRequest: Codable {
	/// The order to be calculated. Expects the entire order, not a sparse update.
	var order: Order
	/// Identifies one or more loyalty reward tiers to apply during order calculation. The discounts defined by the reward tiers are added to the order only to preview the effect of applying the specified reward(s). The reward(s) do not correspond to actual redemptions, that is, no `reward`s are created. Therefore, the reward `id`s are random strings used only to reference the reward tier.
	var proposed_rewards: [OrderReward]?
}

struct CreateBreakTypeRequest: Codable {
	/// The `BreakType` to be created.
	var break_type: BreakType
	/// Unique string value to insure idempotency of the operation
	var idempotency_key: String?
}

struct RedeemLoyaltyRewardRequest: Codable {
	/// A unique string that identifies this `RedeemLoyaltyReward` request.  Keys can be any valid string, but must be unique for every request.
	var idempotency_key: String
	/// The ID of the `location` where the reward is redeemed.
	var location_id: String
}

struct ListCashDrawerShiftEventsRequest: Codable {
	/// Opaque cursor for fetching the next page of results.
	var cursor: String?
	/// Number of resources to be returned in a page of results (200 by default, 1000 max).
	var limit: Int?
	/// The ID of the location to list cash drawer shifts for.
	var location_id: String
}

struct CreateShiftRequest: Codable {
	/// Unique string value to insure the idempotency of the operation.
	var idempotency_key: String?
	/// The `Shift` to be created
	var shift: Shift
}

/// Indicates whether customers should be included in, or excluded from, the result set when they match the filtering criteria.
enum CustomerInclusionExclusion: String, Content {
	/// Customers should be included in the result set when they match the filtering criteria.
	case INCLUDE
	/// Customers should be excluded from the result set when they match the filtering criteria.
	case EXCLUDE
}

struct V1UpdatePageCellRequest: Codable {
	/// An object containing the fields to POST for the request.  See the corresponding object definition for field details.
	var body: V1PageCell
}

struct RiskEvaluation: Codable {
	/// The timestamp when payment risk was evaluated, in RFC3339 format.
	var created_at: Timestamp?
	/// The risk level associated with the payment
	var risk_level: RiskEvaluationRiskLevel?
}

/// The list of possible dispute states.
enum DisputeState: String, Content {
	/// 
	case UNKNOWN_STATE
	/// 
	case INQUIRY_EVIDENCE_REQUIRED
	/// 
	case INQUIRY_PROCESSING
	/// 
	case INQUIRY_CLOSED
	/// 
	case EVIDENCE_REQUIRED
	/// 
	case PROCESSING
	/// 
	case WON
	/// 
	case LOST
	/// 
	case ACCEPTED
	/// 
	case WAITING_THIRD_PARTY
}

struct RetrieveLoyaltyAccountResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The loyalty account.
	var loyalty_account: LoyaltyAccount?
}

struct RetrieveMerchantResponse: Codable {
	/// Information on errors encountered during the request.
	var errors: [Error]?
	/// The requested `Merchant` object.
	var merchant: Merchant?
}

struct RevokeTokenResponse: Codable {
	/// If the request is successful, this is true.
	var success: Bool?
}

struct SearchSubscriptionsRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	var cursor: String?
	/// The upper limit on the number of subscriptions to return  in the response.   Default: `200`
	var limit: Int?
	/// Query subscriptions based on the given conditions and sort order. Calling SearchSubscriptions without an explicit query parameter will return all subscriptions.
	var query: SearchSubscriptionsQuery?
}

struct BankAccount: Codable {
	/// The last few digits of the account number.
	var account_number_suffix: String
	/// The financial purpose of the associated bank account. See [BankAccountType](#type-bankaccounttype) for possible values
	var account_type: BankAccountType
	/// Read only. Name of actual financial institution.  For example "Bank of America".
	var bank_name: String?
	/// The ISO 3166 Alpha-2 country code where the bank account is based. See [Country](#type-country) for possible values
	var country: Country
	/// Indicates whether it is possible for Square to send money to this bank account.
	var creditable: Bool
	/// The 3-character ISO 4217 currency code indicating the operating currency of the bank account. For example, the currency code for US dollars is `USD`. See [Currency](#type-currency) for possible values
	var currency: Currency
	/// Reference identifier that will be displayed to UK bank account owners when collecting direct debit authorization. Only required for UK bank accounts.
	var debit_mandate_reference_id: String?
	/// Indicates whether it is possible for Square to take money from this  bank account.
	var debitable: Bool
	/// A Square-assigned, unique identifier for the bank account based on the account information. The account fingerprint can be used to compare account entries and determine if the they represent the same real-world bank account.
	var fingerprint: String?
	/// Name of the account holder. This name must match the name  on the targeted bank account record.
	var holder_name: String
	/// The unique, Square-issued identifier for the bank account.
	var id: String
	/// The location to which the bank account belongs.
	var location_id: String?
	/// Primary identifier for the bank. For more information, see  [Bank Accounts API](https://developer.squareup.com/docs/docs/bank-accounts-api).
	var primary_bank_identification_number: String
	/// Client-provided identifier for linking the banking account to an entity in a third-party system (for example, a bank account number or a user identifier).
	var reference_id: String?
	/// Secondary identifier for the bank. For more information, see  [Bank Accounts API](https://developer.squareup.com/docs/docs/bank-accounts-api).
	var secondary_bank_identification_number: String?
	/// Read-only. The current verification status of this BankAccount object. See [BankAccountStatus](#type-bankaccountstatus) for possible values
	var status: BankAccountStatus
	/// The current version of the `BankAccount`.
	var version: Int?
}

/// Defines supported stock levels of the item inventory.
enum SearchCatalogItemsRequestStockLevel: String, Content {
	/// The item inventory is empty.
	case OUT
	/// The item inventory is low.
	case LOW
}

struct CustomerGroupInfo: Codable {
	/// The ID of the Customer Group.
	var id: String
	/// The name of the Customer Group.
	var name: String
}

struct DeleteLoyaltyRewardResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct V1Item: Codable {
	/// The text of the item's display label in Square Point of Sale. Only up to the first five characters of the string are used.
	var abbreviation: String?
	/// If true, the item can be added to pickup orders from the merchant's online store. Default value: false
	var available_for_pickup: Bool?
	/// If true, the item can be added to shipping orders from the merchant's online store.
	var available_online: Bool?
	/// The category the item belongs to, if any.
	var category: V1Category?
	/// The ID of the item's category, if any.
	var category_id: String?
	/// The color of the discount's display label in Square Point of Sale, if not the default color. The default color is 9da2a6. See [V1ItemColor](#type-v1itemcolor) for possible values
	var color: V1ItemColor?
	/// The item's description.
	var description: String?
	/// The fees that apply to the item, if any.
	var fees: [V1Fee]?
	/// The item's ID. Must be unique among all entity IDs ever provided on behalf of the merchant. You can never reuse an ID. This value can include alphanumeric characters, dashes (-), and underscores (_).
	var id: String?
	/// The item's master image, if any.
	var master_image: V1ItemImage?
	/// The modifier lists that apply to the item, if any.
	var modifier_lists: [V1ModifierList]?
	/// The item's name.
	var name: String?
	/// Deprecated. This field is not used.
	var taxable: Bool?
	/// The item's type. This value is NORMAL for almost all items. See [V1ItemType](#type-v1itemtype) for possible values
	var type: V1ItemType?
	/// The ID of the CatalogObject in the Connect v2 API. Objects that are shared across multiple locations share the same v2 ID.
	var v2_id: String?
	/// The item's variations. You must specify at least one variation.
	var variations: [V1Variation]?
	/// Indicates whether the item is viewable from the merchant's online store (PUBLIC) or PRIVATE. See [V1ItemVisibility](#type-v1itemvisibility) for possible values
	var visibility: V1ItemVisibility?
}

struct ListLoyaltyProgramsResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// A list of `LoyaltyProgram` for the merchant.
	var programs: [LoyaltyProgram]?
}

struct V1PaymentItemization: Codable {
	/// The total of all discounts applied to the itemization. This value is always negative or zero.
	var discount_money: V1Money?
	/// All discounts applied to this itemization.
	var discounts: [V1PaymentDiscount]?
	/// The total cost of the itemization and its modifiers, not including taxes or discounts.
	var gross_sales_money: V1Money?
	/// Details of the item, including its unique identifier and the identifier of the item variation purchased.
	var item_detail: V1PaymentItemDetail?
	/// The name of the item variation purchased, if any.
	var item_variation_name: String?
	/// The type of purchase that the itemization represents, such as an ITEM or CUSTOM_AMOUNT See [V1PaymentItemizationItemizationType](#type-v1paymentitemizationitemizationtype) for possible values
	var itemization_type: V1PaymentItemizationItemizationType?
	/// All modifier options applied to this itemization.
	var modifiers: [V1PaymentModifier]?
	/// The item's name.
	var name: String?
	/// The sum of gross_sales_money and discount_money.
	var net_sales_money: V1Money?
	/// Notes entered by the merchant about the item at the time of payment, if any.
	var notes: String?
	/// The quantity of the item purchased. This can be a decimal value.
	var quantity: Float?
	/// The cost of a single unit of this item.
	var single_quantity_money: V1Money?
	/// All taxes applied to this itemization.
	var taxes: [V1PaymentTax]?
	/// The total cost of the item, including all taxes and discounts.
	var total_money: V1Money?
}

struct LoyaltyProgramAccrualRule: Codable {
	/// The type of the accrual rule that defines how buyers can earn points. See [LoyaltyProgramAccrualRuleType](#type-loyaltyprogramaccrualruletype) for possible values
	let accrual_type: LoyaltyProgramAccrualRuleType
	/// The ID of the `catalog object` to purchase to earn the number of points defined by the rule. This is either an item variation or a category, depending on the type. This is defined on `ITEM_VARIATION` rules and `CATEGORY` rules.
	let catalog_object_id: String?
	/// The number of points that  buyers earn based on the `accrual_type`.
	let points: Int?
	/// When the accrual rule is spend-based (`accrual_type` is `SPEND`), this field indicates the amount that a buyer must spend  to earn the points. For example, suppose the accrual rule is "earn 1 point for every $10 you spend".  Then, buyer earns a point for every $10 they spend. If  buyer spends $105, the buyer earns 10 points.
	let spend_amount_money: Money?
	/// When the accrual rule is visit-based (`accrual_type` is `VISIT`), this field indicates the minimum purchase required during the visit to  quality for the reward.
	let visit_minimum_amount_money: Money?
}

struct V1AdjustInventoryRequest: Codable {
	/// The reason for the inventory adjustment. See [V1AdjustInventoryRequestAdjustmentType](#type-v1adjustinventoryrequestadjustmenttype) for possible values
	var adjustment_type: V1AdjustInventoryRequestAdjustmentType?
	/// A note about the inventory adjustment.
	var memo: String?
	/// The number to adjust the variation's quantity by.
	var quantity_delta: Float?
}

/// Choices of customer-facing time zone used for bookings.
enum BusinessBookingProfileCustomerTimezoneChoice: String, Content {
	/// Use the time zone of the business location for bookings.
	case BUSINESS_LOCATION_TIMEZONE
	/// Use the customer-chosen time zone for bookings.
	case CUSTOMER_CHOICE
}

struct V1ListBankAccountsRequest: Codable {
}

struct RemoveDisputeEvidenceResponse: Codable {
	/// Information about errors encountered during the request.
	var errors: [Error]?
}

/// Determines a seller's option on Quick Amounts feature.
enum CatalogQuickAmountsSettingsOption: String, Content {
	/// Option for seller to disable Quick Amounts.
	case DISABLED
	/// Option for seller to choose manually created Quick Amounts.
	case MANUAL
	/// Option for seller to choose automatically created Quick Amounts.
	case AUTO
}

struct ListCustomerGroupsRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query.  See the [Pagination guide](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
	var cursor: String?
}

struct BatchRetrieveOrdersResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The requested orders. This will omit any requested orders that do not exist.
	var orders: [Order]?
}

struct V1ListModifierListsResponse: Codable {
	var items: [V1ModifierList]?
}

/// The list of possible reasons why a cardholder might initiate a dispute with their bank.
enum DisputeReason: String, Content {
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

struct CatalogSubscriptionPlan: Codable {
	/// The name of the plan.
	var name: String?
	/// A list of SubscriptionPhase containing the `SubscriptionPhase` for this plan.
	var phases: [SubscriptionPhase]?
}

struct OrderReturnLineItem: Codable {
	/// The list of references to `OrderReturnDiscount` entities applied to the returned line item. Each `OrderLineItemAppliedDiscount` has a `discount_uid` that references the `uid` of a top-level `OrderReturnDiscount` applied to the returned line item. On reads, the amount applied is populated.
	var applied_discounts: [OrderLineItemAppliedDiscount]?
	/// The list of references to `OrderReturnTax` entities applied to the returned line item. Each `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level `OrderReturnTax` applied to the returned line item. On reads, the amount applied is populated.
	var applied_taxes: [OrderLineItemAppliedTax]?
	/// The base price for a single unit of the line item.
	var base_price_money: Money?
	/// The `CatalogItemVariation` id applied to this returned line item.
	var catalog_object_id: String?
	/// The gross return amount of money calculated as (item base price + modifiers price) * quantity.
	let gross_return_money: Money?
	/// The name of the line item.
	var name: String?
	/// The note of the returned line item.
	var note: String?
	/// The quantity returned, formatted as a decimal number. For example: `"3"`.  Line items with a `quantity_unit` can have non-integer quantities. For example: `"1.70000"`.
	var quantity: String
	/// The unit and precision that this return line item's quantity is measured in.
	var quantity_unit: OrderQuantityUnit?
	/// The `CatalogModifier`s applied to this line item.
	var return_modifiers: [OrderReturnLineItemModifier]?
	/// `uid` of the LineItem in the original sale Order.
	var source_line_item_uid: String?
	/// The total discount amount of money to return for the line item.
	let total_discount_money: Money?
	/// The total amount of money to return for this line item.
	let total_money: Money?
	/// The total tax amount of money to return for the line item.
	let total_tax_money: Money?
	/// Unique identifier for this return line item entry.
	var uid: String?
	/// The name of the variation applied to this returned line item.
	var variation_name: String?
	/// The total price of all item variations returned in this line item. Calculated as `base_price_money` multiplied by `quantity`. Does not include modifiers.
	let variation_total_price_money: Money?
}

/// 
enum V1UpdateOrderRequestAction: String, Content {
	/// 
	case COMPLETE
	/// 
	case CANCEL
	/// 
	case REFUND
}

/// 
enum V1CashDrawerEventEventType: String, Content {
	/// 
	case NO_SALE
	/// 
	case CASH_TENDER_PAYMENT
	/// 
	case OTHER_TENDER_PAYMENT
	/// 
	case CASH_TENDER_CANCELED_PAYMENT
	/// 
	case OTHER_TENDER_CANCELED_PAYMENT
	/// 
	case CASH_TENDER_REFUND
	/// 
	case OTHER_TENDER_REFUND
	/// 
	case PAID_IN
	/// 
	case PAID_OUT
}

struct OrderFulfillmentPickupDetails: Codable {
	/// The [timestamp](#workingwithdates) indicating when the fulfillment was accepted. In RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	let accepted_at: Timestamp?
	/// The duration of time after which an open and accepted pickup fulfillment will automatically move to the `COMPLETED` state. Must be in RFC3339 duration format e.g., "P1W3D".  If not set, this pickup fulfillment will remain accepted until it is canceled or completed.
	var auto_complete_duration: Timestamp?
	/// A description of why the pickup was canceled. Max length: 100 characters.
	var cancel_reason: String?
	/// The [timestamp](#workingwithdates) in RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z", indicating when the fulfillment was canceled.
	let canceled_at: Timestamp?
	/// Specific details for curbside pickup. Can only be populated if `is_curbside_pickup` is true.
	var curbside_pickup_details: OrderFulfillmentPickupDetailsCurbsidePickupDetails?
	/// The [timestamp](#workingwithdates) indicating when the fulfillment expired. In RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	let expired_at: Timestamp?
	/// The [timestamp](#workingwithdates) indicating when this fulfillment will expire if it is not accepted. Must be in RFC 3339 format e.g., "2016-09-04T23:59:33.123Z". Expiration time can only be set up to 7 days in the future. If `expires_at` is not set, this pickup fulfillment will be automatically accepted when placed.
	var expires_at: Timestamp?
	/// If true, indicates this pickup order is for curbside pickup, not in-store pickup.
	var is_curbside_pickup: Bool?
	/// A note meant to provide additional instructions about the pickup fulfillment displayed in the Square Point of Sale and set by the API.
	var note: String?
	/// The [timestamp](#workingwithdates) indicating when the fulfillment was picked up by the recipient. In RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	let picked_up_at: Timestamp?
	/// The [timestamp](#workingwithdates) that represents the start of the pickup window. Must be in RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z". For fulfillments with the schedule type `ASAP`, this is automatically set to the current time plus the expected duration to prepare the fulfillment.
	var pickup_at: Timestamp?
	/// The window of time in which the order should be picked up after the `pickup_at` timestamp. Must be in RFC3339 duration format, e.g., "P1W3D". Can be used as an informational guideline for merchants.
	var pickup_window_duration: Timestamp?
	/// The [timestamp](#workingwithdates) indicating when the fulfillment was placed. Must be in RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	let placed_at: Timestamp?
	/// The duration of time it takes to prepare this fulfillment. Must be in RFC3339 duration format, e.g., "P1W3D".
	var prep_time_duration: Timestamp?
	/// The [timestamp](#workingwithdates) indicating when the fulfillment is marked as ready for pickup. In RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	let ready_at: Timestamp?
	/// Information on the person meant to pick up this fulfillment from a physical location.
	var recipient: OrderFulfillmentRecipient?
	/// The [timestamp](#workingwithdates) indicating when the fulfillment was rejected. In RFC3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	let rejected_at: Timestamp?
	/// The schedule type of the pickup fulfillment. Defaults to `SCHEDULED`. See [OrderFulfillmentPickupDetailsScheduleType](#type-orderfulfillmentpickupdetailsscheduletype) for possible values
	var schedule_type: OrderFulfillmentPickupDetailsScheduleType?
}

struct CreateCustomerCardRequest: Codable {
	/// Address information for the card on file. Only the `postal_code` field is required for payments in the US and Canada.
	var billing_address: Address?
	/// A card nonce representing the credit card to link to the customer.  Card nonces are generated by the Square Payment Form when customers enter their card information. See [Embedding the payment form](https://developer.squareup.com/docs/payment-form/payment-form-walkthrough) for more information.  __NOTE:__ Card nonces generated by digital wallets (e.g., Apple Pay) cannot be used to create a customer card.
	var card_nonce: String
	/// The full name printed on the credit card.
	var cardholder_name: String?
	/// An identifying token generated by `SqPaymentForm.verifyBuyer()`. Verification tokens encapsulate customer device information and 3-D Secure challenge results to indicate that Square has verified the buyer identity.
	var verification_token: String?
}

struct ListCustomersRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query.  See the [Pagination guide](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
	var cursor: String?
	/// Indicates how Customers should be sorted.  Default: `DEFAULT`. See [CustomerSortField](#type-customersortfield) for possible values
	var sort_field: CustomerSortField?
	/// Indicates whether Customers should be sorted in ascending (`ASC`) or descending (`DESC`) order.  Default: `ASC`. See [SortOrder](#type-sortorder) for possible values
	var sort_order: SortOrder?
}

struct OrderLineItemTax: Codable {
	/// The amount of the money applied by the tax in the order.
	var applied_money: Money?
	/// Determines whether the tax was automatically applied to the order based on the catalog configuration. For an example, see  [Automatically Apply Taxes to an Order](https://developer.squareup.com/docs/docs/orders-api/apply-taxes-and-discounts/auto-apply-taxes).
	let auto_applied: Bool?
	/// The catalog object id referencing `CatalogTax`.
	var catalog_object_id: String?
	/// Application-defined data attached to this tax. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (personally identifiable information, card details, etc.).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries may also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a max length of 255 characters.  An application may have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  See [Metadata](https://developer.squareup.com/docs/build-basics/metadata) for more information.
	var metadata: String?
	/// The tax's name.
	var name: String?
	/// The percentage of the tax, as a string representation of a decimal number. For example, a value of `"7.25"` corresponds to a percentage of 7.25%.
	var percentage: String?
	/// Indicates the level at which the tax applies. For `ORDER` scoped taxes, Square generates references in `applied_taxes` on all order line items that do not have them. For `LINE_ITEM` scoped taxes, the tax will only apply to line items with references in their `applied_taxes` field.  This field is immutable. To change the scope, you must delete the tax and re-add it as a new tax. See [OrderLineItemTaxScope](#type-orderlineitemtaxscope) for possible values
	var scope: OrderLineItemTaxScope?
	/// Indicates the calculation method used to apply the tax. See [OrderLineItemTaxType](#type-orderlineitemtaxtype) for possible values
	var type: OrderLineItemTaxType?
	/// Unique ID that identifies the tax only within this order.
	var uid: String?
}

/// 
enum V1EmployeeRolePermissions: String, Content {
	/// 
	case REGISTER_ACCESS_SALES_HISTORY
	/// 
	case REGISTER_APPLY_RESTRICTED_DISCOUNTS
	/// 
	case REGISTER_CHANGE_SETTINGS
	/// 
	case REGISTER_EDIT_ITEM
	/// 
	case REGISTER_ISSUE_REFUNDS
	/// 
	case REGISTER_OPEN_CASH_DRAWER_OUTSIDE_SALE
	/// 
	case REGISTER_VIEW_SUMMARY_REPORTS
}

struct V1ListBankAccountsResponse: Codable {
	var items: [V1BankAccount]?
}

struct DeleteCatalogObjectResponse: Codable {
	/// The database [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) of this deletion in RFC 3339 format, e.g., `2016-09-04T23:59:33.123Z`.
	var deleted_at: Timestamp?
	/// The IDs of all catalog objects deleted by this request. Multiple IDs may be returned when associated objects are also deleted, for example a catalog item variation will be deleted (and its ID included in this field) when its parent catalog item is deleted.
	var deleted_object_ids: [String]?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct OrderReturnServiceCharge: Codable {
	/// The amount of a non-percentage based service charge.  Exactly one of `percentage` or `amount_money` should be set.
	var amount_money: Money?
	/// The amount of money applied to the order by the service charge, including any inclusive tax amounts, as calculated by Square.  - For fixed-amount service charges, `applied_money` is equal to `amount_money`. - For percentage-based service charges, `applied_money` is the money calculated using the percentage.
	let applied_money: Money?
	/// The list of references to `OrderReturnTax` entities applied to the `OrderReturnServiceCharge`. Each `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level `OrderReturnTax` that is being applied to the `OrderReturnServiceCharge`. On reads, the amount applied is populated.
	var applied_taxes: [OrderLineItemAppliedTax]?
	/// The calculation phase after which to apply the service charge. See [OrderServiceChargeCalculationPhase](#type-orderservicechargecalculationphase) for possible values
	let calculation_phase: OrderServiceChargeCalculationPhase?
	/// The catalog object ID of the associated `CatalogServiceCharge`.
	var catalog_object_id: String?
	/// The name of the service charge.
	var name: String?
	/// The percentage of the service charge, as a string representation of a decimal number. For example, a value of `"7.25"` corresponds to a percentage of 7.25%.  Exactly one of `percentage` or `amount_money` should be set.
	var percentage: String?
	/// `uid` of the Service Charge from the Order containing the original charge of the service charge. `source_service_charge_uid` is `null` for unlinked returns.
	var source_service_charge_uid: String?
	/// Indicates whether the surcharge can be taxed. Service charges calculated in the `TOTAL_PHASE` cannot be marked as taxable.
	var taxable: Bool?
	/// The total amount of money to collect for the service charge.  __NOTE__: if an inclusive tax is applied to the service charge, `total_money` does not equal `applied_money` plus `total_tax_money` since the inclusive tax amount will already be included in both `applied_money` and `total_tax_money`.
	let total_money: Money?
	/// The total amount of tax money to collect for the service charge.
	let total_tax_money: Money?
	/// Unique ID that identifies the return service charge only within this order.
	var uid: String?
}

struct OrderUpdated: Codable {
	/// Timestamp for when the order was created in RFC 3339 format.
	let created_at: Timestamp?
	/// The ID of the merchant location this order is associated with.
	var location_id: String?
	/// The order's unique ID.
	var order_id: String?
	/// The state of the order. See [OrderState](#type-orderstate) for possible values
	var state: OrderState?
	/// Timestamp for when the order was last updated in RFC 3339 format.
	let updated_at: Timestamp?
	/// Version number which is incremented each time an update is committed to the order. Orders that were not created through the API will not include a version and thus cannot be updated.  [Read more about working with versions](https://developer.squareup.com/docs/docs/orders-api/manage-orders#update-orders)
	var version: Int?
}

struct V1ListFeesRequest: Codable {
}

struct DisputeEvidenceFile: Codable {
	/// The file name including the file extension. For example: "receipt.tiff".
	var filename: String?
	/// Dispute evidence files must be application/pdf, image/heic, image/heif, image/jpeg, image/png, or image/tiff formats.
	var filetype: String?
}

struct CatalogObjectBatch: Codable {
	/// A list of CatalogObjects belonging to this batch.
	var objects: [CatalogObject]
}

/// The unit of volume used to measure a quantity.
enum MeasurementUnitVolume: String, Content {
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

struct ListTeamMemberWagesRequest: Codable {
	/// Pointer to the next page of Employee Wage results to fetch.
	var cursor: String?
	/// Maximum number of Team Member Wages to return per page. Can range between 1 and 200. The default is the maximum at 200.
	var limit: Int?
	/// Filter wages returned to only those that are associated with the specified team member.
	var team_member_id: String?
}

/// Indicates whether Square should alert the merchant when the inventory quantity of a CatalogItemVariation is low.
enum InventoryAlertType: String, Content {
	/// The variation does not display an alert.
	case NONE
	/// The variation generates an alert when its quantity is low.
	case LOW_QUANTITY
}

struct CreateLoyaltyAccountResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The newly created loyalty account.
	var loyalty_account: LoyaltyAccount?
}

struct OrderLineItem: Codable {
	/// The list of references to discounts applied to this line item. Each `OrderLineItemAppliedDiscount` has a `discount_uid` that references the `uid` of a top-level `OrderLineItemDiscounts` applied to the line item. On reads, the amount applied is populated.  An `OrderLineItemAppliedDiscount` will be automatically created on every line item for all `ORDER` scoped discounts that are added to the order. `OrderLineItemAppliedDiscount` records for `LINE_ITEM` scoped discounts must be added in requests for the discount to apply to any line items.  To change the amount of a discount, modify the referenced top-level discount.
	var applied_discounts: [OrderLineItemAppliedDiscount]?
	/// The list of references to taxes applied to this line item. Each `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level `OrderLineItemTax` applied to the line item. On reads, the amount applied is populated.  An `OrderLineItemAppliedTax` will be automatically created on every line item for all `ORDER` scoped taxes added to the order. `OrderLineItemAppliedTax` records for `LINE_ITEM` scoped taxes must be added in requests for the tax to apply to any line items.  To change the amount of a tax, modify the referenced top-level tax.
	var applied_taxes: [OrderLineItemAppliedTax]?
	/// The base price for a single unit of the line item.
	var base_price_money: Money?
	/// The `CatalogItemVariation` id applied to this line item.
	var catalog_object_id: String?
	/// The amount of money made in gross sales for this line item. Calculated as the sum of the variation's total price and each modifier's total price.
	let gross_sales_money: Money?
	/// Application-defined data attached to this line item. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (personally identifiable information, card details, etc.).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries may also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a max length of 255 characters.  An application may have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  See [Metadata](https://developer.squareup.com/docs/build-basics/metadata) for more information.
	var metadata: String?
	/// The `CatalogModifier`s applied to this line item.
	var modifiers: [OrderLineItemModifier]?
	/// The name of the line item.
	var name: String?
	/// The note of the line item.
	var note: String?
	/// Describes pricing adjustments that are blocked from manual and automatic application to a line item. For more information, see [Apply Taxes and Discounts](https://developer.squareup.com/docs/docs/orders-api/apply-taxes-and-discounts).
	var pricing_blocklists: OrderLineItemPricingBlocklists?
	/// The quantity purchased, formatted as a decimal number. For example: `"3"`.  Line items with a quantity of `"0"` will be automatically removed upon paying for or otherwise completing the order.  Line items with a `quantity_unit` can have non-integer quantities. For example: `"1.70000"`.
	var quantity: String
	/// The unit and precision that this line item's quantity is measured in.
	var quantity_unit: OrderQuantityUnit?
	/// The total discount amount of money to collect for the line item.
	let total_discount_money: Money?
	/// The total amount of money to collect for this line item.
	let total_money: Money?
	/// The total tax amount of money to collect for the line item.
	let total_tax_money: Money?
	/// Unique ID that identifies the line item only within this order.
	var uid: String?
	/// The name of the variation applied to this line item.
	var variation_name: String?
	/// The total price of all item variations sold in this line item. Calculated as `base_price_money` multiplied by `quantity`. Does not include modifiers.
	let variation_total_price_money: Money?
}

struct CreateOrderResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The newly created order.
	var order: Order?
}

struct ShiftWorkday: Codable {
	/// Dates for fetching the shifts
	var date_range: DateRange?
	/// Location-specific timezones convert workdays to datetime filters. Every location included in the query must have a timezone, or this field must be provided as a fallback. Format: the IANA timezone database identifier for the relevant timezone.
	var default_timezone: String?
	/// The strategy on which the dates are applied. See [ShiftWorkdayMatcher](#type-shiftworkdaymatcher) for possible values
	var match_shifts_by: ShiftWorkdayMatcher?
}

/// 
enum V1ItemVisibility: String, Content {
	/// 
	case PUBLIC
	/// 
	case PRIVATE
}

/// The order (e.g., chronological or alphabetical) in which results from a request are returned.
enum SortOrder: String, Content {
	/// The results are returned in descending (e.g., newest-first or Z-A) order.
	case DESC
	/// The results are returned in ascending (e.g., oldest-first or A-Z) order.
	case ASC
}

/// Determines the type of a specific Quick Amount.
enum CatalogQuickAmountType: String, Content {
	/// Quick Amount is created manually by the seller.
	case QUICK_AMOUNT_TYPE_MANUAL
	/// Quick Amount is generated automatically by machine learning algorithms.
	case QUICK_AMOUNT_TYPE_AUTO
}

struct ListMerchantsResponse: Codable {
	/// If the  response is truncated, the cursor to use in next  request to fetch next set of objects.
	var cursor: Int?
	/// Information on errors encountered during the request.
	var errors: [Error]?
	/// The requested `Merchant` entities.
	var merchant: [Merchant]?
}

struct SubmitEvidenceRequest: Codable {
}

/// Describes the type of this unit and indicates which field contains the unit information. This is an ‘open’ enum.
enum MeasurementUnitUnitType: String, Content {
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

struct AccumulateLoyaltyPointsResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The resulting loyalty event.
	var event: LoyaltyEvent?
}

struct CalculateOrderResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The calculated version of the order provided in the request.
	var order: Order?
}

/// Actions that resulted in a change to a timecard. All timecard events created with the Connect API have an event type that begins with `API`.
enum V1TimecardEventEventType: String, Content {
	/// The timecard was created by a request to the `CreateTimecard` endpoint.
	case API_CREATE
	/// The timecard was edited by a request to the `UpdateTimecard` endpoint.
	case API_EDIT
	/// The timecard was deleted by a request to the `DeleteTimecard` endpoint.
	case API_DELETE
	/// The employee clocked in via Square Point of Sale.
	case REGISTER_CLOCKIN
	/// The employee clocked out via Square Point of Sale.
	case REGISTER_CLOCKOUT
	/// A supervisor clocked out the employee from the merchant dashboard.
	case DASHBOARD_SUPERVISOR_CLOSE
	/// A supervisor manually edited the timecard from the merchant dashboard
	case DASHBOARD_EDIT
	/// A supervisor deleted the timecard from the merchant dashboard.
	case DASHBOARD_DELETE
}

struct CancelInvoiceResponse: Codable {
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The canceled invoice.
	var invoice: Invoice?
}

struct SearchAvailabilityQuery: Codable {
	/// The query filter to search for availabilities of existing bookings.
	var filter: SearchAvailabilityFilter
}

/// Unit of weight used to measure a quantity.
enum MeasurementUnitWeight: String, Content {
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

struct InvoicePaymentReminder: Codable {
	/// The reminder message.
	var message: String?
	/// The number of days before (a negative number) or after (a positive number) the payment request `due_date` when the reminder is sent. For example, -3 indicates that the reminder should be sent 3 days before the payment request `due_date`.
	var relative_scheduled_days: Int?
	/// If sent, the timestamp when the reminder was sent, in RFC 3339 format.
	let sent_at: Timestamp?
	/// The status of the reminder. See [InvoicePaymentReminderStatus](#type-invoicepaymentreminderstatus) for possible values
	let status: InvoicePaymentReminderStatus?
	/// A Square-assigned ID that uniquely identifies the reminder within the `InvoicePaymentRequest`.
	let uid: String?
}

struct BatchChangeInventoryRequest: Codable {
	/// The set of physical counts and inventory adjustments to be made. Changes are applied based on the client-supplied timestamp and may be sent out of order.
	var changes: [InventoryChange]?
	/// A client-supplied, universally unique identifier (UUID) for the request.  See [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency) in the [API Development 101](https://developer.squareup.com/docs/basics/api101/overview) section for more information.
	var idempotency_key: String?
	/// Indicates whether the current physical count should be ignored if the quantity is unchanged since the last physical count. Default: `true`.
	var ignore_unchanged_counts: Bool?
}

struct PublishInvoiceResponse: Codable {
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The published invoice.
	var invoice: Invoice?
}

struct OrderReturnTax: Codable {
	/// The amount of the money applied by the tax in an order.
	var applied_money: Money?
	/// The catalog object id referencing `CatalogTax`.
	var catalog_object_id: String?
	/// The tax's name.
	var name: String?
	/// The percentage of the tax, as a string representation of a decimal number. For example, a value of `"7.25"` corresponds to a percentage of 7.25%.
	var percentage: String?
	/// Indicates the level at which the `OrderReturnTax` applies. For `ORDER` scoped taxes, Square generates references in `applied_taxes` on all `OrderReturnLineItem`s. For `LINE_ITEM` scoped taxes, the tax will only apply to `OrderReturnLineItem`s with references in their `applied_discounts` field. See [OrderLineItemTaxScope](#type-orderlineitemtaxscope) for possible values
	var scope: OrderLineItemTaxScope?
	/// `uid` of the Tax from the Order which contains the original charge of this tax.
	var source_tax_uid: String?
	/// Indicates the calculation method used to apply the tax. See [OrderLineItemTaxType](#type-orderlineitemtaxtype) for possible values
	var type: OrderLineItemTaxType?
	/// Unique ID that identifies the return tax only within this order.
	var uid: String?
}

struct GetTerminalRefundRequest: Codable {
}

struct RetrieveDisputeEvidenceResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// Metadata about the dispute evidence file.
	var evidence: DisputeEvidence?
}

struct Employee: Codable {
	/// A read-only timestamp in RFC 3339 format.
	let created_at: Timestamp?
	/// The employee's email address
	var email: String?
	/// The employee's first name.
	var first_name: String?
	/// UUID for this object.
	var id: String?
	/// Whether this employee is the owner of the merchant. Each merchant has one owner employee, and that employee has full authority over the account.
	var is_owner: Bool?
	/// The employee's last name.
	var last_name: String?
	/// A list of location IDs where this employee has access to.
	var location_ids: [String]?
	/// The employee's phone number in E.164 format, i.e. "+12125554250"
	var phone_number: String?
	/// Specifies the status of the employees being fetched. See [EmployeeStatus](#type-employeestatus) for possible values
	var status: EmployeeStatus?
	/// A read-only timestamp in RFC 3339 format.
	let updated_at: Timestamp?
}

struct LoyaltyEventQuery: Codable {
	/// The query filter criteria.
	var filter: LoyaltyEventFilter?
}

/// 
enum CardSquareProduct: String, Content {
	/// 
	case UNKNOWN_SQUARE_PRODUCT
	/// 
	case CONNECT_API
	/// 
	case DASHBOARD
	/// 
	case REGISTER_CLIENT
	/// 
	case BUYER_DASHBOARD
	/// 
	case WEB
	/// 
	case INVOICES
	/// 
	case GIFT_CARD
	/// 
	case VIRTUAL_TERMINAL
	/// 
	case READER_SDK
}

struct BulkCreateTeamMembersRequest: Codable {
	/// The data which will be used to create the `TeamMember` objects. Each key is the `idempotency_key` that maps to the `CreateTeamMemberRequest`.
	var team_members: CreateTeamMemberRequest
}

struct LoyaltyEventRedeemReward: Codable {
	/// The ID of the `loyalty program`.
	let loyalty_program_id: String
	/// The ID of the `order` that redeemed the reward. This field is returned only if the Orders API is used to process orders.
	let order_id: String?
	/// The ID of the redeemed `loyalty reward`. This field is returned only if the event source is `LOYALTY_API`.
	let reward_id: String?
}

struct V1ListOrdersRequest: Codable {
	/// A pagination cursor to retrieve the next set of results for your original query to the endpoint.
	var batch_token: String?
	/// The maximum number of payments to return in a single response. This value cannot exceed 200.
	var limit: Int?
	/// TThe order in which payments are listed in the response. See [SortOrder](#type-sortorder) for possible values
	var order: SortOrder?
}

struct GetBankAccountResponse: Codable {
	/// The requested `BankAccount` object.
	var bank_account: BankAccount?
	/// Information on errors encountered during the request.
	var errors: [Error]?
}

struct RetrieveWageSettingResponse: Codable {
	/// The errors that occurred during the request.
	var errors: [Error]?
	/// The successfully retrieved `WageSetting` object.
	var wage_setting: WageSetting?
}

struct CancelBookingRequest: Codable {
	/// The revision number for the booking used for optimistic concurrency.
	var booking_version: Int?
	/// A unique key to make this request an idempotent operation.
	var idempotency_key: String?
}

struct ListBankAccountsResponse: Codable {
	/// List of BankAccounts associated with this account.
	var bank_accounts: [BankAccount]?
	/// When a response is truncated, it includes a cursor that you can  use in a subsequent request to fetch next set of bank accounts. If empty, this is the final response.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	var cursor: String?
	/// Information on errors encountered during the request.
	var errors: [Error]?
}

struct RetrieveCustomerGroupRequest: Codable {
}

struct CatalogModifierOverride: Codable {
	/// The ID of the `CatalogModifier` whose default behavior is being overridden.
	var modifier_id: String
	/// If `true`, this `CatalogModifier` should be selected by default for this `CatalogItem`.
	var on_by_default: Bool?
}

struct V1ListTimecardsResponse: Codable {
	var items: [V1Timecard]?
}

struct SearchOrdersStateFilter: Codable {
	/// States to filter for. See [OrderState](#type-orderstate) for possible values
	var states: OrderState
}

struct ListDeviceCodesRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query.  See [Paginating results](#paginatingresults) for more information.
	var cursor: String?
	/// If specified, only returns DeviceCodes of the specified location. Returns DeviceCodes of all locations if empty.
	var location_id: String?
	/// If specified, only returns DeviceCodes targeting the specified product type. Returns DeviceCodes of all product types if empty. See [ProductType](#type-producttype) for possible values
	var product_type: ProductType?
	/// If specified, returns DeviceCodes with the specified statuses. Returns DeviceCodes of status `PAIRED` and `UNPAIRED` if empty. See [DeviceCodeStatus](#type-devicecodestatus) for possible values
	var status: DeviceCodeStatus?
}

struct DeleteInvoiceRequest: Codable {
	/// The version of the `invoice` to delete. If you do not know the version, you can call `GetInvoice` or  `ListInvoices`.
	var version: Int?
}

struct V1CreateModifierListRequest: Codable {
	/// An object containing the fields to POST for the request.  See the corresponding object definition for field details.
	var body: V1ModifierList?
}

struct ListRefundsResponse: Codable {
	/// A pagination cursor for retrieving the next set of results, if any remain. Provide this value as the `cursor` parameter in a subsequent request to this endpoint.  See [Paginating results](#paginatingresults) for more information.
	var cursor: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// An array of refunds that match your query.
	var refunds: [Refund]?
}

struct RetrieveLocationResponse: Codable {
	/// Information on errors encountered during the request.
	var errors: [Error]?
	/// The requested location.
	var location: Location?
}

/// The category of the seller’s cancellation policy.
enum BusinessAppointmentSettingsCancellationPolicy: String, Content {
	/// Cancellations are treated as no shows and may incur a fee as specified by `cancellation_fee_money`.
	case CANCELLATION_TREATED_AS_NO_SHOW
	/// Cancellations follow the seller-specified policy that is described in free-form text and not enforced automatically by Square.
	case CUSTOM_POLICY
}

struct MeasurementUnitCustom: Codable {
	/// The abbreviation of the custom unit, such as "bsh" (bushel). This appears in the cart for the Point of Sale app, and in reports.
	var abbreviation: String
	/// The name of the custom unit, for example "bushel".
	var name: String
}

struct GetShiftRequest: Codable {
}

struct V1UpdateEmployeeRequest: Codable {
	/// An object containing the fields to POST for the request.  See the corresponding object definition for field details.
	var body: V1Employee
}

struct ListBreakTypesRequest: Codable {
	/// Pointer to the next page of Break Type results to fetch.
	var cursor: String?
	/// Maximum number of Break Types to return per page. Can range between 1 and 200. The default is the maximum at 200.
	var limit: Int?
	/// Filter Break Types returned to only those that are associated with the specified location.
	var location_id: String?
}

struct V1ApplyFeeRequest: Codable {
}

struct CatalogQuickAmount: Codable {
	/// Represents the actual amount of the Quick Amount with Money type.
	var amount: Money
	/// The order in which this Quick Amount should be displayed.
	var ordinal: Int?
	/// Describes the ranking of the Quick Amount provided by machine learning model, in the range [0, 100]. MANUAL type amount will always have score = 100.
	var score: Int?
	/// Represents the type of the Quick Amount. See [CatalogQuickAmountType](#type-catalogquickamounttype) for possible values
	var type: CatalogQuickAmountType
}

struct SearchCatalogItemsResponse: Codable {
	/// Pagination token used in the next request to return more of the search result.
	var cursor: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// Returned items matching the specified query expressions.
	var items: [CatalogObject]?
	/// Ids of returned item variations matching the specified query expression.
	var matched_variation_ids: [String]?
}

struct V1ListInventoryResponse: Codable {
	var items: [V1InventoryEntry]?
}

struct OrderFulfillmentPickupDetailsCurbsidePickupDetails: Codable {
	/// The [timestamp](#workingwithdates) in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z", indicating when the buyer arrived and is waiting for pickup.
	var buyer_arrived_at: Timestamp?
	/// Specific details for curbside pickup, such as parking number, vehicle model, etc.
	var curbside_details: String?
}

struct RetrieveOrderRequest: Codable {
}

/// Enumerates the possible statuses the team member can have within a business.
enum TeamMemberStatus: String, Content {
	/// The team member can log in to Point of Sale and Dashboard.
	case ACTIVE
	/// The team member can no longer log in to Point of Sale or Dashboard, but their sales reports remain available.
	case INACTIVE
}

struct RetrieveTransactionResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The requested transaction.
	var transaction: Transaction?
}

struct DeleteShiftRequest: Codable {
}

struct ListTeamMemberWagesResponse: Codable {
	/// Value supplied in the subsequent request to fetch the next next page of Team Member Wage results.
	var cursor: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// A page of Team Member Wage results.
	var team_member_wages: [TeamMemberWage]?
}

struct V1DeletePageRequest: Codable {
}

struct AdjustLoyaltyPointsRequest: Codable {
	/// The points to adjust (add or subtract) and the reason for the adjustment.
	var adjust_points: LoyaltyEventAdjustPoints
	/// A unique string that identifies this `AdjustLoyaltyPoints` request.  Keys can be any valid string, but must be unique for every request.
	var idempotency_key: String
}

struct StandardUnitDescription: Codable {
	/// UI display abbreviation for the measurement unit. For example, 'lb'.
	var abbreviation: String?
	/// UI display name of the measurement unit. For example, 'Pound'.
	var name: String?
	/// Identifies the measurement unit being described.
	var unit: MeasurementUnit?
}

struct DeleteCatalogObjectRequest: Codable {
}

struct V1RetrieveEmployeeRequest: Codable {
}

struct V1PaymentItemDetail: Codable {
	/// The name of the item's merchant-defined category, if any.
	var category_name: String?
	/// The unique ID of the item purchased, if any.
	var item_id: String?
	/// The unique ID of the item variation purchased, if any.
	var item_variation_id: String?
	///  The item's merchant-defined SKU, if any.
	var sku: String?
}

struct UpsertCatalogObjectRequest: Codable {
	/// A value you specify that uniquely identifies this request among all your requests. A common way to create a valid idempotency key is to use a Universally unique identifier (UUID).  If you're unsure whether a particular request was successful, you can reattempt it with the same idempotency key without worrying about creating duplicate objects.  See [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency) for more information.
	var idempotency_key: String
	/// A CatalogObject to be created or updated.  - For updates, the object must be active (the `is_deleted` field is not `true`). - For creates, the object ID must start with `#`. The provided ID is replaced with a server-generated ID.
	var object: CatalogObject
}

struct CreateDeviceCodeRequest: Codable {
	/// The device code to create.
	var device_code: DeviceCode
	/// A unique string that identifies this CreateCheckout request. Keys can be any valid string but must be unique for every CreateCheckout request.  See [Idempotency keys](https://developer.squareup.com/docs/basics/api101/idempotency) for more information.
	var idempotency_key: String
}

struct RenewTokenResponse: Codable {
	/// The renewed access token. This value might be different from the `access_token` you provided in your request. You provide this token in a header with every request to Connect API endpoints. See [Request and response headers](https://developer.squareup.com/docs/api/connect/v2/#requestandresponseheaders) for the format of this header.
	var access_token: String?
	/// The date when access_token expires, in [ISO 8601](http://www.iso.org/iso/home/standards/iso8601.htm) format.
	var expires_at: String?
	/// The ID of the authorizing merchant's business.
	var merchant_id: String?
	/// __LEGACY FIELD__. The ID of the subscription plan the merchant signed up for. Only present if the merchant signed up for a subscription during authorization.
	var plan_id: String?
	/// __LEGACY FIELD__. The ID of the merchant subscription associated with the authorization. Only present if the merchant signed up for a subscription during authorization..
	var subscription_id: String?
	/// This value is always _bearer_.
	var token_type: String?
}

struct RetrieveInventoryChangesResponse: Codable {
	/// The set of inventory changes for the requested object and locations.
	var changes: [InventoryChange]?
	/// The pagination cursor to be used in a subsequent request. If unset, this is the final response.  See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
	var cursor: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct V1ListTimecardEventsResponse: Codable {
	var items: [V1TimecardEvent]?
}

struct CatalogItemOptionForItem: Codable {
	/// The unique id of the item option, used to form the dimensions of the item option matrix in a specified order.
	var item_option_id: String?
}

/// Enumerates the possible pay types that a job can be assigned.
enum JobAssignmentPayType: String, Content {
	/// The job does not have a defined pay type.
	case NONE
	/// The job pays on an hourly basis.
	case HOURLY
	/// The job pays an annual salary.
	case SALARY
}

struct LoyaltyEventFilter: Codable {
	/// Filter events by date time range.  For each range, the start time is inclusive and the end time  is exclusive.
	var date_time_filter: LoyaltyEventDateTimeFilter?
	/// Filter events by location.
	var location_filter: LoyaltyEventLocationFilter?
	/// Filter events by loyalty account.
	var loyalty_account_filter: LoyaltyEventLoyaltyAccountFilter?
	/// Filter events by the order associated with the event.
	var order_filter: LoyaltyEventOrderFilter?
	/// Filter events by event type.
	var type_filter: LoyaltyEventTypeFilter?
}

struct RegisterDomainRequest: Codable {
	/// A domain name as described in RFC-1034 that will be registered with ApplePay
	var domain_name: String
}

struct GetPaymentRefundRequest: Codable {
}

struct V1UpdateDiscountRequest: Codable {
	/// An object containing the fields to POST for the request.  See the corresponding object definition for field details.
	var body: V1Discount
}

struct SearchLoyaltyRewardsRequestLoyaltyRewardQuery: Codable {
	/// The ID of the `loyalty account` to which the loyalty reward belongs.
	var loyalty_account_id: String
	/// The status of the loyalty reward. See [LoyaltyRewardStatus](#type-loyaltyrewardstatus) for possible values
	var status: LoyaltyRewardStatus?
}

struct RetrieveEmployeeResponse: Codable {
	var employee: Employee?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct CatalogQueryItemVariationsForItemOptionValues: Codable {
	/// A set of `CatalogItemOptionValue` IDs to be used to find associated `CatalogItemVariation`s. All ItemVariations that contain all of the given Item Option Values (in any order) will be returned.
	var item_option_value_ids: [String]?
}

struct SearchOrdersFulfillmentFilter: Codable {
	/// List of `fulfillment states` to filter for. Will return orders if any of its fulfillments match any of the fulfillment states listed in this field. See [OrderFulfillmentState](#type-orderfulfillmentstate) for possible values
	var fulfillment_states: OrderFulfillmentState?
	/// List of `fulfillment types` to filter for. Will return orders if any of its fulfillments match any of the fulfillment types listed in this field. See [OrderFulfillmentType](#type-orderfulfillmenttype) for possible values
	var fulfillment_types: OrderFulfillmentType?
}

/// 
enum V1VariationPricingType: String, Content {
	/// 
	case FIXED_PRICING
	/// 
	case VARIABLE_PRICING
}

struct SearchLoyaltyAccountsResponse: Codable {
	/// The pagination cursor to use in a subsequent  request. If empty, this is the final response. For more information,  see [Pagination](https://developer.squareup.com/docs/docs/basics/api101/pagination).
	var cursor: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The loyalty accounts that met the search criteria,   in order of creation date.
	var loyalty_accounts: [LoyaltyAccount]?
}

struct UpdateItemTaxesResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The database [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) of this update in RFC 3339 format, e.g., `2016-09-04T23:59:33.123Z`.
	var updated_at: Timestamp?
}

struct SearchSubscriptionsFilter: Codable {
	/// A filter to select subscriptions based on the customer.
	var customer_ids: [String]?
	/// A filter to select subscriptions based the location.
	var location_ids: [String]?
}

/// Field to use for sorting.
enum InvoiceSortField: String, Content {
	/// The field works as follows:  - If the invoice is a draft, it uses the invoice `created_at` date. - If the invoice is scheduled for publication, it uses the `scheduled_at` date. - If the invoice is published, it uses the invoice publication date.
	case INVOICE_SORT_DATE
}

struct OrderLineItemAppliedTax: Codable {
	/// The amount of money applied by the tax to the line item.
	let applied_money: Money?
	/// The `uid` of the tax for which this applied tax represents.  Must reference a tax present in the `order.taxes` field.  This field is immutable. To change which taxes apply to a line item, delete and add new `OrderLineItemAppliedTax`s.
	var tax_uid: String
	/// Unique ID that identifies the applied tax only within this order.
	var uid: String?
}

struct GetPaymentRequest: Codable {
}

struct V1PhoneNumber: Codable {
	/// The phone number's international calling code. For US phone numbers, this value is +1.
	var calling_code: String
	/// The phone number.
	var number: String
}

struct V1CreateEmployeeRoleRequest: Codable {
	/// An EmployeeRole object with a name and permissions, and an optional owner flag.
	var employee_role: V1EmployeeRole?
}

/// The days of the week.
enum Weekday: String, Content {
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

struct CatalogQuery: Codable {
	/// An exact query expression to return objects with attribute name and value matching the specified attribute name and value exactly. Value matching is case insensitive.
	var exact_query: CatalogQueryExact?
	/// A query expression to return item variations (of the `CatalogItemVariation` that contain all of the specified `CatalogItemOption` IDs.
	var item_variations_for_item_option_values_query: CatalogQueryItemVariationsForItemOptionValues?
	/// A query expression to return items that contains the specified item options (as identified the corresponding `CatalogItemOption` IDs).
	var items_for_item_options_query: CatalogQueryItemsForItemOptions?
	/// A query expression to return items that have any of the given modifier list (as identifieid by the coresponding `CatalogModifierList`s IDs) enabled.
	var items_for_modifier_list_query: CatalogQueryItemsForModifierList?
	/// A query expression to return items that have any of the specified taxes (as identified by the corresponding `CatalogTax` object IDs) enabled.
	var items_for_tax_query: CatalogQueryItemsForTax?
	/// A prefix query expression to return objects with attribute values that have a prefix matching the specified string value. Value maching is case insensitive.
	var prefix_query: CatalogQueryPrefix?
	/// A range query expression to return objects with numberic values that lie in the specified range.
	var range_query: CatalogQueryRange?
	/// A set query expression to return objects with attribute name and value matching the specified attribute name and any of the specified attribute values exactly. Value matching is case insensitive.
	var set_query: CatalogQuerySet?
	/// A query expression to sort returned query result by the given attribute.
	var sorted_attribute_query: CatalogQuerySortedAttribute?
	/// A text query expression to return objectd whose searchable attributes contain all of the given keywords, irrespective of their order. For example, if a `CatalogItem` contains custom attribute values of `{"name": "t-shirt"}` and `{"description": "Small, Purple"}`, the query filter of `{"keywords": ["shirt", "sma", "purp"]}` returns this item.
	var text_query: CatalogQueryText?
}

struct CatalogImage: Codable {
	/// A caption that describes what is shown in the image. Displayed in the Square Online Store. This is a searchable attribute for use in applicable query filters.
	var caption: String?
	/// The internal name to identify this image in calls to the Square API.
	var name: String?
	/// The URL of this image, generated by Square after an image is uploaded using the `CreateCatalogImage` endpoint.
	var url: String?
}

struct OrderLineItemAppliedDiscount: Codable {
	/// The amount of money applied by the discount to the line item.
	let applied_money: Money?
	/// The `uid` of the discount the applied discount represents. Must reference a discount present in the `order.discounts` field.  This field is immutable. To change which discounts apply to a line item, you must delete the discount and re-add it as a new `OrderLineItemAppliedDiscount`.
	var discount_uid: String
	/// Unique ID that identifies the applied discount only within this order.
	var uid: String?
}

struct CatalogPricingRule: Codable {
	/// __Deprecated__: Please use the `exclude_products_id` field to apply an exclude set instead. Exclude sets allow better control over quantity ranges and offer more flexibility for which matched items receive a discount.  `CatalogProductSet` to apply the pricing to. An apply rule matches within the subset of the cart that fits the match rules (the match set). An apply rule can only match once in the match set. If not supplied, the pricing will be applied to all products in the match set. Other products retain their base price, or a price generated by other rules.
	var apply_products_id: String?
	/// Unique ID for the `CatalogDiscount` to take off the price of all matched items.
	var discount_id: String?
	/// `CatalogProductSet` to exclude from the pricing rule. An exclude rule matches within the subset of the cart that fits the match rules (the match set). An exclude rule can only match once in the match set. If not supplied, the pricing will be applied to all products in the match set. Other products retain their base price, or a price generated by other rules.
	var exclude_products_id: String?
	/// If an `exclude_products_id` was given, controls which subset of matched products is excluded from any discounts.  Default value: `LEAST_EXPENSIVE` See [ExcludeStrategy](#type-excludestrategy) for possible values
	var exclude_strategy: ExcludeStrategy?
	/// Unique ID for the `CatalogProductSet` that will be matched by this rule. A match rule matches within the entire cart, and can match multiple times. This field will always be set.
	var match_products_id: String?
	/// User-defined name for the pricing rule. For example, "Buy one get one free" or "10% off".
	var name: String?
	/// A list of unique IDs for the catalog time periods when this pricing rule is in effect. If left unset, the pricing rule is always in effect.
	var time_period_ids: [String]?
	/// Represents the date the Pricing Rule is valid from. Represented in RFC 3339 full-date format (YYYY-MM-DD).
	var valid_from_date: Timestamp?
	/// Represents the local time the pricing rule should be valid from. Represented in RFC 3339 partial-time format (HH:MM:SS). Partial seconds will be truncated.
	var valid_from_local_time: Timestamp?
	/// Represents the date the Pricing Rule is valid until. Represented in RFC 3339 full-date format (YYYY-MM-DD).
	var valid_until_date: Timestamp?
	/// Represents the local time the pricing rule should be valid until. Represented in RFC 3339 partial-time format (HH:MM:SS). Partial seconds will be truncated.
	var valid_until_local_time: Timestamp?
}

struct CreateCustomerResponse: Codable {
	/// The created customer.
	var customer: Customer?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

/// Indicates the associated currency for an amount of money. Values correspond to [ISO 4217](https://wikipedia.org/wiki/ISO_4217).
enum Currency: String, Content {
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

struct SearchCatalogObjectsResponse: Codable {
	/// The pagination cursor to be used in a subsequent request. If unset, this is the final response. See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
	var cursor: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// When the associated product catalog was last updated. Will match the value for `end_time` or `cursor` if either field is included in the `SearchCatalog` request.
	var latest_time: String?
	/// The CatalogObjects returned.
	var objects: [CatalogObject]?
	/// A list of CatalogObjects referenced by the objects in the `objects` field.
	var related_objects: [CatalogObject]?
}

struct SearchShiftsRequest: Codable {
	/// opaque cursor for fetching the next page.
	var cursor: String?
	/// number of resources in a page (200 by default).
	var limit: Int?
	/// Query filters.
	var query: ShiftQuery?
}

struct V1OrderHistoryEntry: Codable {
	/// The type of action performed on the order. See [V1OrderHistoryEntryAction](#type-v1orderhistoryentryaction) for possible values
	var action: V1OrderHistoryEntryAction?
	/// The time when the action was performed, in ISO 8601 format.
	var created_at: String?
}

struct CatalogQueryItemsForItemOptions: Codable {
	/// A set of `CatalogItemOption` IDs to be used to find associated `CatalogItem`s. All Items that contain all of the given Item Options (in any order) will be returned.
	var item_option_ids: [String]?
}

struct RetrieveCustomerSegmentRequest: Codable {
}

struct GetDeviceCodeResponse: Codable {
	/// The queried DeviceCode.
	var device_code: DeviceCode?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

/// Enumerates the possible assignment types the team member can have
enum TeamMemberAssignedLocationsAssignmentType: String, Content {
	/// The team member is assigned to all curent and future locations - the location_ids field is empty if the team member has this assignment type.
	case ALL_CURRENT_AND_FUTURE_LOCATIONS
	/// The team member is assigned to an explicit subset of locations - the location_ids field is the list of locations that the team member is assigned to.
	case EXPLICIT_LOCATIONS
}

struct CatalogQuerySet: Codable {
	/// The name of the attribute to be searched. Matching of the attribute name is exact.
	var attribute_name: String
	/// The desired values of the search attribute. Matching of the attribute values is exact and case insensitive. A maximum of 250 values may be searched in a request.
	var attribute_values: [String]
}

/// The status of the location, whether a location is active or inactive.
enum LocationStatus: String, Content {
	/// A location that is active for business.
	case ACTIVE
	/// A location that is not active for business. Inactive locations just provide historical information, so typically clients limit interaction with or hide these locations.
	case INACTIVE
}

struct ProcessingFee: Codable {
	/// The fee amount, which might be negative, that is assessed or adjusted by Square.  Positive values represent funds being assessed, while negative values represent funds being returned.
	var amount_money: Money?
	/// The timestamp of when the fee takes effect, in RFC 3339 format.
	var effective_at: Timestamp?
	/// The type of fee assessed or adjusted. The fee type can be `INITIAL` or `ADJUSTMENT`.
	var type: String?
}

struct V1Money: Codable {
	/// Amount in the lowest denominated value of this Currency. E.g. in USD these are cents, in JPY they are Yen (which do not have a 'cent' concept).
	var amount: Int?
	///  See [Currency](#type-currency) for possible values
	var currency_code: Currency?
}

struct ListDisputesResponse: Codable {
	/// The pagination cursor to be used in a subsequent request. If unset, this is the final response. For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
	var cursor: String?
	/// The list of disputes.
	var disputes: [Dispute]?
	/// Information about errors encountered during the request.
	var errors: [Error]?
}

struct AddGroupToCustomerResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct GetBankAccountRequest: Codable {
}

struct V1ListEmployeeRolesRequest: Codable {
	/// A pagination cursor to retrieve the next set of results for your original query to the endpoint.
	var batch_token: String?
	/// The maximum integer number of employee entities to return in a single response. Default 100, maximum 200.
	var limit: Int?
	/// The order in which employees are listed in the response, based on their created_at field.Default value: ASC See [SortOrder](#type-sortorder) for possible values
	var order: SortOrder?
}

struct MeasurementUnit: Codable {
	/// Represents a standard area unit. See [MeasurementUnitArea](#type-measurementunitarea) for possible values
	var area_unit: MeasurementUnitArea?
	/// A custom unit of measurement defined by the seller using the Point of Sale app or ad-hoc as an order line item.
	var custom_unit: MeasurementUnitCustom?
	/// Reserved for API integrations that lack the ability to specify a real measurement unit See [MeasurementUnitGeneric](#type-measurementunitgeneric) for possible values
	var generic_unit: MeasurementUnitGeneric?
	/// Represents a standard length unit. See [MeasurementUnitLength](#type-measurementunitlength) for possible values
	var length_unit: MeasurementUnitLength?
	/// Represents a standard unit of time. See [MeasurementUnitTime](#type-measurementunittime) for possible values
	var time_unit: MeasurementUnitTime?
	/// Represents the type of the measurement unit. See [MeasurementUnitUnitType](#type-measurementunitunittype) for possible values
	var type: MeasurementUnitUnitType?
	/// Represents a standard volume unit. See [MeasurementUnitVolume](#type-measurementunitvolume) for possible values
	var volume_unit: MeasurementUnitVolume?
	/// Represents a standard unit of weight or mass. See [MeasurementUnitWeight](#type-measurementunitweight) for possible values
	var weight_unit: MeasurementUnitWeight?
}

/// Unit of area used to measure a quantity.
enum MeasurementUnitArea: String, Content {
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

struct CatalogItemOptionValueForItemVariation: Codable {
	/// The unique id of an item option.
	var item_option_id: String?
	/// The unique id of the selected value for the item option.
	var item_option_value_id: String?
}

/// The schedule type of the pickup fulfillment.
enum OrderFulfillmentPickupDetailsScheduleType: String, Content {
	/// Indicates the fulfillment will be picked up at a scheduled pickup time.
	case SCHEDULED
	/// Indicates the fulfillment will be picked up as soon as possible and should be prepared immediately.
	case ASAP
}

struct RefundPaymentRequest: Codable {
	/// The amount of money to refund.  This amount cannot be more than the `total_money` value of the payment minus the total amount of all previously completed refunds for this payment.  This amount must be specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).  The currency code must match the currency associated with the business that is charging the card.
	var amount_money: Money
	/// The amount of money the developer contributes to help cover the refunded amount. This amount is specified in the smallest denomination of the applicable currency (for example,  US dollar amounts are specified in cents).  The value cannot be more than the `amount_money`.  You can specify this parameter in a refund request only if the same parameter was also included  when taking the payment. This is part of the application fee scenario the API supports. For more  information, see [Take Payments and Collect Fees](https://developer.squareup.com/docs/payments-api/take-payments-and-collect-fees).
	var app_fee_money: Money?
	///  A unique string that identifies this `RefundPayment` request. The key can be any valid string but must be unique for every `RefundPayment` request.  For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
	var idempotency_key: String
	/// The unique ID of the payment being refunded.
	var payment_id: String
	/// A description of the reason for the refund.
	var reason: String?
}

struct InventoryAdjustment: Codable {
	/// The Square generated ID of the `CatalogObject` being tracked.
	var catalog_object_id: String?
	/// The `CatalogObjectType` of the `CatalogObject` being tracked. Tracking is only supported for the `ITEM_VARIATION` type.
	var catalog_object_type: String?
	/// A read-only timestamp in RFC 3339 format that indicates when Square received the adjustment.
	let created_at: Timestamp?
	/// The Square ID of the `Employee` responsible for the inventory adjustment.
	var employee_id: String?
	/// The `InventoryState` of the related quantity of items before the adjustment. See [InventoryState](#type-inventorystate) for possible values
	var from_state: InventoryState?
	/// The read-only Square ID of the Square goods receipt that caused the adjustment. Only relevant for state transitions from the Square for Retail app.
	var goods_receipt_id: String?
	/// A unique ID generated by Square for the `InventoryAdjustment`.
	var id: String?
	/// The Square ID of the `Location` where the related quantity of items are being tracked.
	var location_id: String?
	/// A client-generated timestamp in RFC 3339 format that indicates when the adjustment took place. For write actions, the `occurred_at` timestamp cannot be older than 24 hours or in the future relative to the time of the request.
	var occurred_at: Timestamp?
	/// The read-only Square ID of the purchase order that caused the adjustment. Only relevant for state transitions from the Square for Retail app.
	var purchase_order_id: String?
	/// The number of items affected by the adjustment as a decimal string. Can support up to 5 digits after the decimal point.
	var quantity: String?
	/// An optional ID provided by the application to tie the `InventoryAdjustment` to an external system.
	var reference_id: String?
	/// The read-only Square ID of the [Refund][#type-refund] that caused the adjustment. Only relevant for refund-related state transitions.
	var refund_id: String?
	/// Read-only information about the application that caused the inventory adjustment.
	var source: SourceApplication?
	/// The `InventoryState` of the related quantity of items after the adjustment. See [InventoryState](#type-inventorystate) for possible values
	var to_state: InventoryState?
	/// The read-only total price paid for goods associated with the adjustment. Present if and only if `to_state` is `SOLD`. Always non-negative.
	var total_price_money: Money?
	/// The read-only Square ID of the [Transaction][#type-transaction] that caused the adjustment. Only relevant for payment-related state transitions.
	var transaction_id: String?
}

struct RetrieveCashDrawerShiftResponse: Codable {
	/// The cash drawer shift queried for.
	var cash_drawer_shift: CashDrawerShift?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct V1Fee: Codable {
	/// The type of adjustment the fee applies to a payment. Currently, this value is TAX for all fees. See [V1FeeAdjustmentType](#type-v1feeadjustmenttype) for possible values
	var adjustment_type: V1FeeAdjustmentType?
	/// If true, the fee applies to custom amounts entered into Square Point of Sale that are not associated with a particular item.
	var applies_to_custom_amounts: Bool?
	/// Forthcoming See [V1FeeCalculationPhase](#type-v1feecalculationphase) for possible values
	var calculation_phase: V1FeeCalculationPhase?
	/// If true, the fee is applied to all appropriate items. If false, the fee is not applied at all.
	var enabled: Bool?
	/// The fee's unique ID.
	var id: String?
	/// Whether the fee is ADDITIVE or INCLUSIVE. See [V1FeeInclusionType](#type-v1feeinclusiontype) for possible values
	var inclusion_type: V1FeeInclusionType?
	/// The fee's name.
	var name: String?
	/// The rate of the fee, as a string representation of a decimal number. A value of 0.07 corresponds to a rate of 7%.
	var rate: String?
	/// In countries with multiple classifications for sales taxes, indicates which classification the fee falls under. Currently relevant only to Canadian merchants. See [V1FeeType](#type-v1feetype) for possible values
	var type: V1FeeType?
	/// The ID of the CatalogObject in the Connect v2 API. Objects that are shared across multiple locations share the same v2 ID.
	var v2_id: String?
}

struct RemoveDisputeEvidenceRequest: Codable {
}

struct UpdateLocationRequest: Codable {
	/// The `Location` object with only the fields to update.
	var location: Location?
}

struct BatchRetrieveInventoryCountsRequest: Codable {
	/// The filter to return results by `CatalogObject` ID. The filter is applicable only when set.  The default is null.
	var catalog_object_ids: [String]?
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query.  See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
	var cursor: String?
	/// The filter to return results by `Location` ID.  This filter is applicable only when set. The default is null.
	var location_ids: [String]?
	/// The filter to return results by `InventoryState`. The filter is only applicable when set. Ignored are untracked states of `NONE`, `SOLD`, and `UNLINKED_RETURN`. The default is null. See [InventoryState](#type-inventorystate) for possible values
	var states: InventoryState?
	/// The filter to return results with their `calculated_at` value  after the given time as specified in an RFC 3339 timestamp.  The default value is the UNIX epoch of (`1970-01-01T00:00:00Z`).
	var updated_after: Timestamp?
}

struct ListBreakTypesResponse: Codable {
	///  A page of `BreakType` results.
	var break_types: [BreakType]?
	/// Value supplied in the subsequent request to fetch the next next page of Break Type results.
	var cursor: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct CancelInvoiceRequest: Codable {
	/// The version of the `invoice` to cancel. If you do not know the version, you can call  `GetInvoice](#endpoint-Invoices-GetInvoice) or [ListInvoices`.
	var version: Int
}

struct ChargeResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The created transaction.
	var transaction: Transaction?
}

struct CreateLoyaltyRewardRequest: Codable {
	/// A unique string that identifies this `CreateLoyaltyReward` request.  Keys can be any valid string, but must be unique for every request.
	var idempotency_key: String
	/// The reward to create.
	var reward: LoyaltyReward
}

struct UpdateBreakTypeResponse: Codable {
	/// The response object.
	var break_type: BreakType?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct TerminalCheckoutQuerySort: Codable {
	/// The order in which results are listed. - `ASC` - oldest to newest - `DESC` - newest to oldest (default).
	var sort_order: String?
}

struct OrderLineItemModifier: Codable {
	/// The base price for the modifier.  `base_price_money` is required for ad hoc modifiers. If both `catalog_object_id` and `base_price_money` are set, `base_price_money` will override the predefined `CatalogModifier` price.
	var base_price_money: Money?
	/// The catalog object id referencing `CatalogModifier`.
	var catalog_object_id: String?
	/// The name of the item modifier.
	var name: String?
	/// The total price of the item modifier for its line item. This is the modifier's `base_price_money` multiplied by the line item's quantity.
	let total_price_money: Money?
	/// Unique ID that identifies the modifier only within this order.
	var uid: String?
}

struct Checkout: Codable {
	/// Additional recipients (other than the merchant) receiving a portion of this checkout. For example, fees assessed on the purchase by a third party integration.
	var additional_recipients: [AdditionalRecipient]?
	/// If `true`, Square Checkout will collect shipping information on your behalf and store that information with the transaction information in your Square Dashboard.  Default: `false`.
	var ask_for_shipping_address: Bool?
	/// The URL that the buyer's browser should be redirected to after the checkout is completed.
	var checkout_page_url: String?
	/// The time when the checkout was created, in RFC 3339 format.
	let created_at: Timestamp?
	/// ID generated by Square Checkout when a new checkout is requested.
	var id: String?
	/// The email address to display on the Square Checkout confirmation page and confirmation email that the buyer can use to contact the merchant.  If this value is not set, the confirmation page and email will display the primary email address associated with the merchant's Square account.  Default: none; only exists if explicitly set.
	var merchant_support_email: String?
	/// Order to be checked out.
	var order: Order?
	/// If provided, the buyer's email is pre-populated on the checkout page as an editable text field.  Default: none; only exists if explicitly set.
	var pre_populate_buyer_email: String?
	/// If provided, the buyer's shipping info is pre-populated on the checkout page as editable text fields.  Default: none; only exists if explicitly set.
	var pre_populate_shipping_address: Address?
	/// The URL to redirect to after checkout is completed with `checkoutId`, Square's `orderId`, `transactionId`, and `referenceId` appended as URL parameters. For example, if the provided redirect_url is `http://www.example.com/order-complete`, a successful transaction redirects the customer to:  <pre><code>http://www.example.com/order-complete?checkoutId=xxxxxx&amp;orderId=xxxxxx&amp;referenceId=xxxxxx&amp;transactionId=xxxxxx</code></pre>  If you do not provide a redirect URL, Square Checkout will display an order confirmation page on your behalf; however Square strongly recommends that you provide a redirect URL so you can verify the transaction results and finalize the order through your existing/normal confirmation workflow.
	var redirect_url: String?
}

struct AcceptDisputeRequest: Codable {
}

struct GetEmployeeWageResponse: Codable {
	/// The requested `EmployeeWage` object.
	var employee_wage: EmployeeWage?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct OrderLineItemPricingBlocklists: Codable {
	/// A list of discounts blocked from applying to the line item.  Discounts can be blocked by the `discount_uid` (for ad-hoc discounts) or  the `discount_catalog_object_id` (for catalog discounts).
	var blocked_discounts: [OrderLineItemPricingBlocklistsBlockedDiscount]?
	/// A list of taxes blocked from applying to the line item.  Taxes can be blocked by the `tax_uid` (for ad-hoc taxes) or  the `tax_catalog_object_id` (for catalog taxes).
	var blocked_taxes: [OrderLineItemPricingBlocklistsBlockedTax]?
}

struct CreateMobileAuthorizationCodeResponse: Codable {
	/// Generated authorization code that connects a mobile application instance to a Square account.
	var authorization_code: String?
	/// An error object that provides details about how creation of authorization code failed.
	var error: Error?
	/// The timestamp when `authorization_code` expires in [RFC 3339](https://tools.ietf.org/html/rfc3339) format, e.g., "2016-09-04T23:59:33.123Z".
	var expires_at: Timestamp?
}

struct UpdateInvoiceRequest: Codable {
	/// The list of fields to clear. For examples, see [Update an invoice](https://developer.squareup.com/docs/docs/invoices-api/overview#update-an-invoice).
	var fields_to_clear: [String]?
	/// A unique string that identifies the `UpdateInvoice` request. If you do not provide `idempotency_key` (or provide an empty string as the value), the endpoint treats each request as independent.  For more information, see [Idempotency](https://developer.squareup.com/docs/docs/working-with-apis/idempotency).
	var idempotency_key: String?
	/// The invoice fields to update.  The current invoice version must be specified in the `version` field. For more information, see [Update an invoice](https://developer.squareup.com/docs/docs/invoices-api/overview#update-an-invoice).
	var invoice: Invoice
}

/// Object types to inline under their respective parent object in certain connect v2 responses
enum InlineTypes: String, Content {
	/// 
	case INLINE_NONE
	/// 
	case INLINE_VARIATIONS
	/// 
	case INLINE_ALL
}

struct SearchOrdersRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query. See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
	var cursor: String?
	/// Maximum number of results to be returned in a single page. It is possible to receive fewer results than the specified limit on a given page.  Default: `500`
	var limit: Int?
	/// The location IDs for the orders to query. All locations must belong to the same merchant.  Min: 1 location IDs.  Max: 10 location IDs.
	var location_ids: [String]?
	/// Query conditions used to filter or sort the results. Note that when fetching additional pages using a cursor, the query must be equal to the query used to fetch the first page of results.
	var query: SearchOrdersQuery?
	/// Boolean that controls the format of the search results. If `true`, SearchOrders will return ``OrderEntry`` objects. If `false`, SearchOrders will return complete Order objects.  Default: `false`.
	var return_entries: Bool?
}

struct EmployeeWage: Codable {
	/// The `Employee` that this wage is assigned to.
	var employee_id: String?
	/// Can be a custom-set hourly wage or the calculated effective hourly wage based on annual wage and hours worked per week.
	var hourly_rate: Money?
	/// UUID for this object.
	var id: String?
	/// The job title that this wage relates to.
	var title: String?
}

struct TipSettings: Codable {
	/// Indicates whether tipping is enabled for this checkout. Defaults to false.
	var allow_tipping: Bool?
	/// Indicates whether custom tip amounts are allowed during the checkout flow. Defaults to false.
	var custom_tip_field: Bool?
	/// Indicates whether tip options should be presented on their own screen before presenting the signature screen during card payment. Defaults to false.
	var separate_tip_screen: Bool?
	/// Enables the "Smart Tip Amounts" behavior described in https://squareup.com/help/us/en/article/5069-accept-tips-with-the-square-app. Exact tipping options depend on the region the Square seller is active in.  In the United States and Canada, tipping options will be presented in whole dollar amounts for payments under 10 USD/CAD respectively.  If set to true, the tip_percentages settings is ignored. Defaults to false.
	var smart_tipping: Bool?
	/// A list of tip percentages that should be presented during the checkout flow. Specified as up to 3 non-negative integers from 0 to 100 (inclusive). Defaults to [15, 20, 25]
	var tip_percentages: [Int]?
}

struct UpdateCustomerGroupRequest: Codable {
	/// The `CustomerGroup` object including all the updates you want to make.
	var group: CustomerGroup
}

struct RenewTokenRequest: Codable {
	/// The token you want to renew.
	var access_token: String?
}

struct RetrieveInventoryAdjustmentResponse: Codable {
	/// The requested `InventoryAdjustment`.
	var adjustment: InventoryAdjustment?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct ListLocationsRequest: Codable {
}

struct V1ListCashDrawerShiftsResponse: Codable {
	var items: [V1CashDrawerShift]?
}

struct Break: Codable {
	/// The `BreakType` this `Break` was templated on.
	var break_type_id: String
	/// RFC 3339; follows same timezone info as `Shift`. Precision up to the minute is respected; seconds are truncated.
	var end_at: Timestamp?
	/// Format: RFC-3339 P[n]Y[n]M[n]DT[n]H[n]M[n]S. The expected length of the break.
	var expected_duration: Timestamp
	/// UUID for this object
	var id: String?
	/// Whether this break counts towards time worked for compensation purposes.
	var is_paid: Bool
	/// A human-readable name.
	var name: String
	/// RFC 3339; follows same timezone info as `Shift`. Precision up to the minute is respected; seconds are truncated.
	var start_at: Timestamp
}

struct V1CreateFeeRequest: Codable {
	/// An object containing the fields to POST for the request.  See the corresponding object definition for field details.
	var body: V1Fee?
}

struct OrderFulfillment: Codable {
	/// Application-defined data attached to this fulfillment. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (personally identifiable information, card details, etc.).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries may also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a max length of 255 characters.  An application may have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  See [Metadata](https://developer.squareup.com/docs/build-basics/metadata) for more information.
	var metadata: String?
	/// Contains details for a pickup fulfillment. Required when fulfillment type is `PICKUP`.
	var pickup_details: OrderFulfillmentPickupDetails?
	/// Contains details for a shipment fulfillment. Required when fulfillment type is `SHIPMENT`.  A shipment fulfillment's relationship to fulfillment `state`: `PROPOSED`: A shipment is requested. `RESERVED`: Fulfillment accepted. Shipment processing. `PREPARED`: Shipment packaged. Shipping label created. `COMPLETED`: Package has been shipped. `CANCELED`: Shipment has been canceled. `FAILED`: Shipment has failed.
	var shipment_details: OrderFulfillmentShipmentDetails?
	/// The state of the fulfillment. See [OrderFulfillmentState](#type-orderfulfillmentstate) for possible values
	var state: OrderFulfillmentState?
	/// The type of the fulfillment. See [OrderFulfillmentType](#type-orderfulfillmenttype) for possible values
	var type: OrderFulfillmentType?
	/// Unique ID that identifies the fulfillment only within this order.
	var uid: String?
}

/// 
enum V1ModifierListSelectionType: String, Content {
	/// 
	case SINGLE
	/// 
	case MULTIPLE
}

struct CreateDisputeEvidenceTextRequest: Codable {
	/// The evidence string.
	var evidence_text: String
	/// The type of evidence you are uploading. See [DisputeEvidenceType](#type-disputeevidencetype) for possible values
	var evidence_type: DisputeEvidenceType?
	/// The Unique ID. For more information, see [Idempotency](https://developer.squareup.com/docs/docs/working-with-apis/idempotency).
	var idempotency_key: String
}

/// Types of daily appointment limits.
enum BusinessAppointmentSettingsMaxAppointmentsPerDayLimitType: String, Content {
	/// The maximum number of daily appointments is set on a per team member basis.
	case PER_TEAM_MEMBER
	/// The maximum number of daily appointments is set on a per location basis.
	case PER_LOCATION
}

struct OrderMoneyAmounts: Codable {
	/// Money associated with discounts.
	var discount_money: Money?
	/// Money associated with service charges.
	var service_charge_money: Money?
	/// Money associated with taxes.
	var tax_money: Money?
	/// Money associated with tips.
	var tip_money: Money?
	/// Total money.
	var total_money: Money?
}

struct SearchTerminalRefundsResponse: Codable {
	/// The pagination cursor to be used in a subsequent request. If empty, this is the final response.  See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
	var cursor: String?
	/// Information on errors encountered during the request.
	var errors: [Error]?
	/// The requested search result of `TerminalRefund`s.
	var refunds: [TerminalRefund]?
}

struct V1CreateCategoryRequest: Codable {
	/// An object containing the fields to POST for the request.  See the corresponding object definition for field details.
	var body: V1Category?
}

/// Defines the possible types for a custom attribute.
enum CatalogCustomAttributeDefinitionType: String, Content {
	/// A free-form string containing up to 255 characters.
	case STRING
	/// A `true` or `false` value.
	case BOOLEAN
	/// A decimal string representation of a number. Can support up to 5 digits after the decimal point.
	case NUMBER
	/// One or more choices from `allowed_selections`.
	case SELECTION
}

struct V1CashDrawerEvent: Codable {
	/// The time when the event occurred, in ISO 8601 format.
	var created_at: String?
	/// An optional description of the event, entered by the employee that created it.
	var description: String?
	/// The ID of the employee that created the event.
	var employee_id: String?
	/// The amount of money that was added to or removed from the cash drawer because of the event. This value can be positive (for added money) or negative (for removed money).
	var event_money: V1Money?
	/// The type of event that occurred. See [V1CashDrawerEventEventType](#type-v1cashdrawereventeventtype) for possible values
	var event_type: V1CashDrawerEventEventType?
	/// The event's unique ID.
	var id: String?
}

struct V1ListPagesResponse: Codable {
	var items: [V1Page]?
}

struct CreateBreakTypeResponse: Codable {
	/// The `BreakType` that was created by the request.
	var break_type: BreakType?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct ListDisputeEvidenceResponse: Codable {
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The list of evidence previously uploaded to the specified dispute.
	var evidence: [DisputeEvidence]?
}

struct CancelTerminalCheckoutResponse: Codable {
	/// The canceled `TerminalCheckout`
	var checkout: TerminalCheckout?
	/// Information on errors encountered during the request.
	var errors: [Error]?
}

struct BusinessAppointmentSettings: Codable {
	/// The time unit of the service duration for bookings.
	var alignment_time: BusinessAppointmentSettingsAlignmentTime?
	/// Indicates whether a customer can choose from all available time slots and have a staff member assigned automatically (`true`) or not (`false`).
	var any_team_member_booking_enabled: Bool?
	/// The flat-fee ammount charged for a no-show booking.
	var cancellation_fee_money: Money?
	/// The cancellation policy adopted by the seller.
	var cancellation_policy: BusinessAppointmentSettingsCancellationPolicy?
	/// The free-form text of the seller's cancellation policy.
	var cancellation_policy_text: String?
	/// The cut-off time in seconds for allowing clients to cancel or reschedule an appointment.
	var cancellation_window_seconds: Int?
	/// Types of the location allowed for bookings.
	var location_types: [BusinessAppointmentSettingsBookingLocationType]?
	/// The maximum number of daily appointments per team member or per location.
	var max_appointments_per_day_limit: Int?
	/// Indicates whether the daily appointment limit applies to team members or to business locations.
	var max_appointments_per_day_limit_type: BusinessAppointmentSettingsMaxAppointmentsPerDayLimitType?
	/// The maximum lead time in seconds before a service can be booked. Bookings must be created at most this far ahead of the booking's starting time.
	var max_booking_lead_time_seconds: Int?
	/// The minimum lead time in seconds before a service can be booked. Bookings must be created at least this far ahead of the booking's starting time.
	var min_booking_lead_time_seconds: Int?
	/// Indicates whether a customer can book multiple services in a single online booking.
	var multiple_service_booking_enabled: Bool?
	/// Indicates whether customers has an assigned staff member (`true`) or can select s staff member of their choice (`false`).
	var skip_booking_flow_staff_selection: Bool?
}

struct CatalogItemModifierListInfo: Codable {
	/// If `true`, enable this `CatalogModifierList`. The default value is `true`.
	var enabled: Bool?
	/// If 0 or larger, the largest number of `CatalogModifier`s that can be selected from this `CatalogModifierList`.
	var max_selected_modifiers: Int?
	/// If 0 or larger, the smallest number of `CatalogModifier`s that must be selected from this `CatalogModifierList`.
	var min_selected_modifiers: Int?
	/// The ID of the `CatalogModifierList` controlled by this `CatalogModifierListInfo`.
	var modifier_list_id: String
	/// A set of `CatalogModifierOverride` objects that override whether a given `CatalogModifier` is enabled by default.
	var modifier_overrides: [CatalogModifierOverride]?
}

struct CatalogItemOptionValue: Codable {
	/// The HTML-supported hex color for the item option (e.g., "#ff8d4e85"). Only displayed if `show_colors` is enabled on the parent `ItemOption`. When left unset, `color` defaults to white ("#ffffff") when `show_colors` is enabled on the parent `ItemOption`.
	var color: String?
	/// A human-readable description for the option value. This is a searchable attribute for use in applicable query filters.
	var description: String?
	/// Unique ID of the associated item option.
	var item_option_id: String?
	/// Name of this item option value. This is a searchable attribute for use in applicable query filters.
	var name: String?
	/// Determines where this option value appears in a list of option values.
	var ordinal: Int?
}

struct SegmentFilter: Codable {
	/// The ID of the `CatalogItemVariation` representing the service booked in this segment.
	var service_variation_id: String
	/// A query expression specifying which team members satisfy the condition. Supported expressions are - `ANY`: include team members whose IDs match any member of the specified list. - `NONE`: exclude team members whose IDs match members of the specified list.  The `ALL` expression is not supported in the Bookings API. When no expression is specified, any service-providing team member is eligible to fulfill the Booking.
	var team_member_id_filter: FilterValue?
}

/// The type of discount the reward tier offers. DEPRECATED at version 2020-12-16. Discount details are now defined using a catalog pricing rule and other catalog objects. For more information, see [Get discount details for the reward](https://developer.squareup.com/docs/docs/loyalty-api/overview#get-discount-details).
enum LoyaltyProgramRewardDefinitionType: String, Content {
	/// The fixed amount discounted.
	case FIXED_AMOUNT
	/// The fixed percentage discounted.
	case FIXED_PERCENTAGE
}

struct BatchUpsertCatalogObjectsResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The mapping between client and server IDs for this upsert.
	var id_mappings: [CatalogIdMapping]?
	/// The created successfully created CatalogObjects.
	var objects: [CatalogObject]?
	/// The database [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) of this update in RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z".
	var updated_at: Timestamp?
}

struct ListDisputesRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query. For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
	var cursor: String?
	/// The ID of the location for which to return a list of disputes. If not specified, the endpoint returns all open disputes (the dispute status is not `INQUIRY_CLOSED`, `WON`, or `LOST`) associated with all locations.
	var location_id: String?
	/// The dispute states to filter the result. If not specified, the endpoint returns all open disputes (the dispute status is not `INQUIRY_CLOSED`, `WON`, or `LOST`). See [DisputeState](#type-disputestate) for possible values
	var states: DisputeState?
}

struct PayOrderResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The paid, updated `order`.
	var order: Order?
}

struct V1DeletePageCellRequest: Codable {
	/// The column of the cell to clear. Always an integer between 0 and 4, inclusive. Column 0 is the leftmost column.
	var column: String?
	/// The row of the cell to clear. Always an integer between 0 and 4, inclusive. Row 0 is the top row.
	var row: String?
}

struct OrderCreated: Codable {
	/// Timestamp for when the order was created in RFC 3339 format.
	let created_at: Timestamp?
	/// The ID of the merchant location this order is associated with.
	var location_id: String?
	/// The order's unique ID.
	var order_id: String?
	/// The state of the order. See [OrderState](#type-orderstate) for possible values
	var state: OrderState?
	/// Version number which is incremented each time an update is committed to the order. Orders that were not created through the API will not include a version and thus cannot be updated.  [Read more about working with versions](https://developer.squareup.com/docs/docs/orders-api/manage-orders#update-orders)
	var version: Int?
}

struct V1ListEmployeesResponse: Codable {
	var items: [V1Employee]?
}

struct CreateSubscriptionResponse: Codable {
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The newly created subscription.   For more information, see  [Subscription object](https://developer.squareup.com/docs/docs/subscriptions-api/overview#subscription-object).
	var subscription: Subscription?
}

struct CompletePaymentResponse: Codable {
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The successfully completed payment.
	var payment: Payment?
}

struct CreateLocationRequest: Codable {
	/// The initial values of the location being created. The `name` field is required. All other fields are optional. Unspecified fields will be set to default values using existing location data.
	var location: Location?
}

/// 
enum V1BankAccountType: String, Content {
	/// 
	case BUSINESS_CHECKING
	/// 
	case CHECKING
	/// 
	case INVESTMENT
	/// 
	case LOAN
	/// 
	case SAVINGS
	/// 
	case OTHER
}

struct V1UpdateItemRequest: Codable {
	/// An object containing the fields to POST for the request.  See the corresponding object definition for field details.
	var body: V1Item
}

struct GetPaymentRefundResponse: Codable {
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The requested `PaymentRefund`.
	var refund: PaymentRefund?
}

struct InvoiceSort: Codable {
	/// The field to sort on. See [InvoiceSortField](#type-invoicesortfield) for possible values
	var field: InvoiceSortField
	/// The order to use for sorting the results. See [SortOrder](#type-sortorder) for possible values
	var order: SortOrder?
}

/// 
enum ProductType: String, Content {
	/// 
	case TERMINAL_API
}

struct UpdateCustomerRequest: Codable {
	/// The physical address associated with the customer profile.
	var address: Address?
	/// The birthday associated with the customer profile, in RFC 3339 format. Year is optional, timezone and times are not allowed. For example: `0000-09-01T00:00:00-00:00` indicates a birthday on September 1st. `1998-09-01T00:00:00-00:00` indications a birthday on September 1st __1998__.
	var birthday: Timestamp?
	/// A business name associated with the customer profile.
	var company_name: String?
	/// The email address associated with the customer profile.
	var email_address: String?
	/// The family (i.e., last) name associated with the customer profile.
	var family_name: String?
	/// The given (i.e., first) name associated with the customer profile.
	var given_name: String?
	/// A nickname for the customer profile.
	var nickname: String?
	/// A custom note associated with the customer profile.
	var note: String?
	/// The 11-digit phone number associated with the customer profile.
	var phone_number: String?
	/// An optional, second ID used to associate the customer profile with an entity in another system.
	var reference_id: String?
}

struct CatalogQuerySortedAttribute: Codable {
	/// The attribute whose value is used as the sort key.
	var attribute_name: String
	/// The first attribute value to be returned by the query. Ascending sorts will return only objects with this value or greater, while descending sorts will return only objects with this value or less. If unset, start at the beginning (for ascending sorts) or end (for descending sorts).
	var initial_attribute_value: String?
	/// The desired sort order, `"ASC"` (ascending) or `"DESC"` (descending). See [SortOrder](#type-sortorder) for possible values
	var sort_order: SortOrder?
}

struct V1DeleteItemRequest: Codable {
}

struct RetrieveInventoryChangesRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query.  See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
	var cursor: String?
	/// The `Location` IDs to look up as a comma-separated list. An empty list queries all locations.
	var location_ids: String?
}

struct BatchRetrieveInventoryCountsResponse: Codable {
	/// The current calculated inventory counts for the requested objects and locations.
	var counts: [InventoryCount]?
	/// The pagination cursor to be used in a subsequent request. If unset, this is the final response.  See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
	var cursor: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct UpdateWorkweekConfigRequest: Codable {
	/// The updated `WorkweekConfig` object.
	var workweek_config: WorkweekConfig
}

/// 
enum V1RefundType: String, Content {
	/// 
	case FULL
	/// 
	case PARTIAL
}

struct RetrieveObsMigrationProfileRequest: Codable {
}

/// Supported booking statuses.
enum BookingStatus: String, Content {
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

struct TeamMemberWage: Codable {
	/// Can be a custom-set hourly wage or the calculated effective hourly wage based on annual wage and hours worked per week.
	var hourly_rate: Money?
	/// UUID for this object.
	var id: String?
	/// The `Team Member` that this wage is assigned to.
	var team_member_id: String?
	/// The job title that this wage relates to.
	var title: String?
}

struct CatalogItem: Codable {
	/// The text of the item's display label in the Square Point of Sale app. Only up to the first five characters of the string are used. This attribute is searchable, and its value length is of Unicode code points.
	var abbreviation: String?
	/// If `true`, the item can be added to electronically fulfilled orders from the merchant's online store.
	var available_electronically: Bool?
	/// If `true`, the item can be added to pickup orders from the merchant's online store.
	var available_for_pickup: Bool?
	/// If `true`, the item can be added to shipping orders from the merchant's online store.
	var available_online: Bool?
	/// The ID of the item's category, if any.
	var category_id: String?
	/// The item's description. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	var description: String?
	/// List of item options IDs for this item. Used to manage and group item variations in a specified order.  Maximum: 6 item options.
	var item_options: [CatalogItemOptionForItem]?
	/// The color of the item's display label in the Square Point of Sale app. This must be a valid hex color code.
	var label_color: String?
	/// A set of `CatalogItemModifierListInfo` objects representing the modifier lists that apply to this item, along with the overrides and min and max limits that are specific to this item. Modifier lists may also be added to or deleted from an item using `UpdateItemModifierLists`.
	var modifier_list_info: [CatalogItemModifierListInfo]?
	/// The item's name. This is a searchable attribute for use in applicable query filters, its value must not be empty, and the length is of Unicode code points.
	var name: String?
	/// The product type of the item. May not be changed once an item has been created.  Only items of product type `REGULAR` or `APPOINTMENTS_SERVICE` may be created by this API; items with other product types are read-only. See [CatalogItemProductType](#type-catalogitemproducttype) for possible values
	var product_type: CatalogItemProductType?
	/// If `false`, the Square Point of Sale app will present the `CatalogItem`'s details screen immediately, allowing the merchant to choose `CatalogModifier`s before adding the item to the cart.  This is the default behavior.  If `true`, the Square Point of Sale app will immediately add the item to the cart with the pre-selected modifiers, and merchants can edit modifiers by drilling down onto the item's details.  Third-party clients are encouraged to implement similar behaviors.
	var skip_modifier_screen: Bool?
	/// A set of IDs indicating the taxes enabled for this item. When updating an item, any taxes listed here will be added to the item. Taxes may also be added to or deleted from an item using `UpdateItemTaxes`.
	var tax_ids: [String]?
	/// A list of CatalogObjects containing the `CatalogItemVariation`s for this item.
	var variations: [CatalogObject]?
}

/// Indicates whether this is a line item or order level tax.
enum OrderLineItemTaxScope: String, Content {
	/// Used for reporting only. The original transaction tax scope is currently not supported by the API.
	case OTHER_TAX_SCOPE
	/// The tax should be applied only to line items specified by the `OrderLineItemAppliedTax` reference records.
	case LINE_ITEM
	/// The tax should be applied to the entire order.
	case ORDER
}

struct V1CreateItemRequest: Codable {
	/// An object containing the fields to POST for the request.  See the corresponding object definition for field details.
	var body: V1Item?
}

struct Invoice: Codable {
	/// The timestamp when the invoice was created, in RFC 3339 format.
	let created_at: Timestamp?
	/// Additional seller-defined fields to render on the invoice. These fields are visible to sellers and buyers on the Square-hosted invoice page and in emailed or PDF copies of invoices. For more information, see [Custom fields](https://developer.squareup.com/docs/docs/invoices-api/overview#custom-fields).  Max: 2 custom fields
	var custom_fields: [InvoiceCustomField]?
	/// The description of the invoice. This is visible to the customer receiving the invoice.
	var description: String?
	/// The Square-assigned ID of the invoice.
	let id: String?
	/// A user-friendly invoice number. The value is unique within a location. If not provided when creating an invoice, Square assigns a value. It increments from 1 and padded with zeros making it 7 characters long for example, 0000001, 0000002.
	var invoice_number: String?
	/// The ID of the location that this invoice is associated with. This field is required when creating an invoice.
	var location_id: String?
	/// The current amount due for the invoice. In addition to the amount due on the next payment request, this also includes any overdue payment amounts.
	let next_payment_amount_money: Money?
	/// The ID of the `order` for which the invoice is created.  This order must be in the `OPEN` state and must belong to the `location_id` specified for this invoice. This field is required when creating an invoice.
	var order_id: String?
	/// The payment schedule for the invoice, represented by one or more payment requests that define payment settings, such as amount due and due date. You can specify a maximum of 13 payment requests, with up to 12 `INSTALLMENT` request types. For more information, see [Payment requests](https://developer.squareup.com/docs/docs/invoices-api/overview#payment-requests).  This field is required when creating an invoice. It must contain at least one payment request.
	var payment_requests: [InvoicePaymentRequest]?
	/// The customer who gets the invoice. Square uses the contact information to deliver the invoice. This field is required to publish an invoice.
	var primary_recipient: InvoiceRecipient?
	/// The URL of the Square-hosted invoice page. After you publish the invoice using the `PublishInvoice` endpoint, Square hosts the invoice page and returns the page URL in the response.
	let public_url: String?
	/// The timestamp when the invoice is scheduled for processing, in RFC 3339 format. After the invoice is published, Square processes the invoice on the specified date, based on the settings for the invoice payment requests.  If the field is not set, Square processes the invoice immediately after it is published.
	var scheduled_at: Timestamp?
	/// The status of the invoice. See [InvoiceStatus](#type-invoicestatus) for possible values
	let status: InvoiceStatus?
	/// The time zone of the date values (for example, `due_date`) specified in the invoice.
	let timezone: String?
	/// The title of the invoice.
	var title: String?
	/// The timestamp when the invoice was last updated, in RFC 3339 format.
	let updated_at: Timestamp?
	/// The Square-assigned version number, which is incremented each time an update is committed to the invoice.
	var version: Int?
}

struct V1UpdateCategoryRequest: Codable {
	/// An object containing the fields to POST for the request.  See the corresponding object definition for field details.
	var body: V1Category
}

struct AdjustLoyaltyPointsResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The resulting event data for adjusting points.
	var event: LoyaltyEvent?
}

/// 
enum V1SettlementEntryType: String, Content {
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
	/// 
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

struct BatchRetrieveInventoryChangesRequest: Codable {
	/// The filter to return results by `CatalogObject` ID. The filter is only applicable when set. The default value is null.
	var catalog_object_ids: [String]?
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query.  See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
	var cursor: String?
	/// The filter to return results by `Location` ID.  The filter is only applicable when set. The default value is null.
	var location_ids: [String]?
	/// The filter to return `ADJUSTMENT` query results by `InventoryState`. This filter is only applied when set. The default value is null. See [InventoryState](#type-inventorystate) for possible values
	var states: InventoryState?
	/// The filter to return results by `InventoryChangeType` values other than `TRANSFER`. The default value is `[PHYSICAL_COUNT, ADJUSTMENT]`. See [InventoryChangeType](#type-inventorychangetype) for possible values
	var types: InventoryChangeType?
	/// The filter to return results with their `calculated_at` value   after the given time as specified in an RFC 3339 timestamp.  The default value is the UNIX epoch of (`1970-01-01T00:00:00Z`).
	var updated_after: Timestamp?
	/// The filter to return results with their `created_at` or `calculated_at` value   strictly before the given time as specified in an RFC 3339 timestamp.  The default value is the UNIX epoch of (`1970-01-01T00:00:00Z`).
	var updated_before: Timestamp?
}

struct CaptureTransactionResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct BatchDeleteCatalogObjectsResponse: Codable {
	/// The database [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) of this deletion in RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z".
	var deleted_at: Timestamp?
	/// The IDs of all CatalogObjects deleted by this request.
	var deleted_object_ids: [String]?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct PaymentOptions: Codable {
	/// Indicates whether the Payment objects created from this `TerminalCheckout` will automatically be `COMPLETED` or left in an `APPROVED` state for later modification.
	var autocomplete: Bool?
}

struct CreatePaymentRequest: Codable {
	/// If set to `true` and charging a Square Gift Card, a payment might be returned with `amount_money` equal to less than what was requested. For example, a request for $20 when charging a Square Gift Card with a balance of $5 results in an APPROVED payment of $5. You might choose to prompt the buyer for an additional payment to cover the remainder or cancel the Gift Card payment. This field cannot be `true` when `autocomplete = true`.  For more information, see [Partial amount with Square Gift Cards](https://developer.squareup.com/docs/payments-api/take-payments#partial-payment-gift-card).  Default: false
	var accept_partial_authorization: Bool?
	/// The amount of money to accept for this payment, not including `tip_money`.  The amount must be specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).  The currency code must match the currency associated with the business that is accepting the payment.
	var amount_money: Money
	/// The amount of money that the developer is taking as a fee for facilitating the payment on behalf of the seller.  The amount cannot be more than 90% of the total amount of the payment.  The amount must be specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).  The fee currency code must match the currency associated with the seller that is accepting the payment. The application must be from a developer account in the same country and using the same currency code as the seller.  For more information about the application fee scenario, see [Take Payments and Collect Fees](https://developer.squareup.com/docs/payments-api/take-payments-and-collect-fees).
	var app_fee_money: Money?
	/// If set to `true`, this payment will be completed when possible. If set to `false`, this payment is held in an approved state until either explicitly completed (captured) or canceled (voided). For more information, see [Delayed capture](https://developer.squareup.com/docs/payments-api/take-payments#delayed-payments).  Default: true
	var autocomplete: Bool?
	/// The buyer's billing address.
	var billing_address: Address?
	/// The buyer's email address.
	var buyer_email_address: String?
	/// The `Customer` ID of the customer associated with the payment.  This is required if the `source_id` refers to a card on file created using the Customers API.
	var customer_id: String?
	/// The duration of time after the payment's creation when Square automatically cancels the payment. This automatic cancellation applies only to payments that do not reach a terminal state (COMPLETED, CANCELED, or FAILED) before the `delay_duration` time period.  This parameter should be specified as a time duration, in RFC 3339 format, with a minimum value of 1 minute.  Note: This feature is only supported for card payments. This parameter can only be set for a delayed capture payment (`autocomplete=false`).  Default:  - Card-present payments: "PT36H" (36 hours) from the creation time. - Card-not-present payments: "P7D" (7 days) from the creation time.
	var delay_duration: Timestamp?
	/// A unique string that identifies this `CreatePayment` request. Keys can be any valid string but must be unique for every `CreatePayment` request.  Max: 45 characters  Note: The number of allowed characters might be less than the stated maximum, if multi-byte characters are used.  For more information, see [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency).
	var idempotency_key: String
	/// The location ID to associate with the payment. If not specified, the default location is used.
	var location_id: String?
	/// An optional note to be entered by the developer when creating a payment.  Limit 500 characters.
	var note: String?
	/// Associates a previously created order with this payment.
	var order_id: String?
	/// A user-defined ID to associate with the payment.  You can use this field to associate the payment to an entity in an external system  (for example, you might specify an order ID that is generated by a third-party shopping cart).  Limit 40 characters.
	var reference_id: String?
	/// The buyer's shipping address.
	var shipping_address: Address?
	/// The ID for the source of funds for this payment. This can be a nonce generated by the Square payment form or a card on file made with the Customers API.
	var source_id: String
	/// Optional additional payment information to include on the customer's card statement as part of the statement description. This can be, for example, an invoice number, ticket number, or short description that uniquely identifies the purchase.  Note that the `statement_description_identifier` might get truncated on the statement description to fit the required information including the Square identifier (SQ *) and name of the seller taking the payment.
	var statement_description_identifier: String?
	/// The amount designated as a tip, in addition to `amount_money`.  The amount must be specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).  The currency code must match the currency associated with the business that is accepting the payment.
	var tip_money: Money?
	/// An identifying token generated by `SqPaymentForm.verifyBuyer()`. Verification tokens encapsulate customer device information and 3-D Secure challenge results to indicate that Square has verified the buyer identity.  For more information, see [SCA Overview](https://developer.squareup.com/docs/sca-overview).
	var verification_token: String?
}

/// Indicates the scope of the reward tier. DEPRECATED at version 2020-12-16. Discount details are now defined using a catalog pricing rule and other catalog objects. For more information, see [Get discount details for the reward](https://developer.squareup.com/docs/docs/loyalty-api/overview#get-discount-details).
enum LoyaltyProgramRewardDefinitionScope: String, Content {
	/// The discount applies to the entire order.
	case ORDER
	/// The discount applies only to specific item variations.
	case ITEM_VARIATION
	/// The discount applies only to items in the given categories.
	case CATEGORY
}

struct Booking: Codable {
	/// A list of appointment segments for this booking.
	var appointment_segments: [AppointmentSegment]?
	/// The timestamp specifying the creation time of this booking.
	let created_at: Timestamp?
	/// The ID of the `Customer` object representing the customer attending this booking
	var customer_id: String?
	/// The free-text field for the customer to supply notes about the booking. For example, the note can be preferences that cannot be expressed by supported attributes of a relevant `CatalogObject` instance.
	var customer_note: String?
	/// A unique ID of this object representing a booking.
	let id: String?
	/// The ID of the `Location` object representing the location where the booked service is provided.
	var location_id: String?
	/// The free-text field for the seller to supply notes about the booking. For example, the note can be preferences that cannot be expressed by supported attributes of a specific `CatalogObject` instance. This field should not be visible to customers.
	var seller_note: String?
	/// The timestamp specifying the starting time of this booking.
	var start_at: Timestamp?
	/// The status of the booking, describing where the booking stands with respect to the booking state machine. See [BookingStatus](#type-bookingstatus) for possible values
	let status: BookingStatus?
	/// The timestamp specifying the most recent update time of this booking.
	let updated_at: Timestamp?
	/// The revision number for the booking used for optimistic concurrency.
	var version: Int?
}

struct BatchRetrieveCatalogObjectsResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// A list of `CatalogObject`s returned.
	var objects: [CatalogObject]?
	/// A list of `CatalogObject`s referenced by the object in the `objects` field.
	var related_objects: [CatalogObject]?
}

struct V1UpdateModifierOptionRequest: Codable {
	/// An object containing the fields to POST for the request.  See the corresponding object definition for field details.
	var body: V1ModifierOption
}

/// Indicates the specific error that occurred during a request to a Square API.
enum ErrorCode: String, Content {
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
	/// An unexpected error occurred.
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

struct LoyaltyProgramRewardDefinition: Codable {
	/// The list of catalog objects to which this reward can be applied. They are either all item-variation ids or category ids, depending on the `type` field. DEPRECATED at version 2020-12-16. You can find this information in the `product_set_data.product_ids_any` field of the `PRODUCT_SET` catalog object referenced by the pricing rule.
	let catalog_object_ids: [String]?
	/// The type of discount the reward tier offers. DEPRECATED at version 2020-12-16. You can find this information in the `discount_data.discount_type` field of the `DISCOUNT` catalog object referenced by the pricing rule. See [LoyaltyProgramRewardDefinitionType](#type-loyaltyprogramrewarddefinitiontype) for possible values
	let discount_type: LoyaltyProgramRewardDefinitionType
	/// The amount of the discount. Present if `discount_type` is `FIXED_AMOUNT`. For example, $5 off. DEPRECATED at version 2020-12-16. You can find this information in the `discount_data.amount_money` field of the  `DISCOUNT` catalog object referenced by the pricing rule.
	let fixed_discount_money: Money?
	/// When `discount_type` is `FIXED_PERCENTAGE`, the maximum discount amount that can be applied. DEPRECATED at version 2020-12-16. You can find this information in the `discount_data.maximum_amount_money` field of the `DISCOUNT` catalog object referenced by the the pricing rule.
	let max_discount_money: Money?
	/// The fixed percentage of the discount. Present if `discount_type` is `FIXED_PERCENTAGE`. For example, a 7.25% off discount will be represented as "7.25". DEPRECATED at version 2020-12-16. You can find this information in the `discount_data.percentage` field of the `DISCOUNT` catalog object referenced by the pricing rule.
	let percentage_discount: String?
	/// Indicates the scope of the reward tier. DEPRECATED at version 2020-12-16. You can find this information in the `discount_target_scope` field of the `PRICING_RULE` catalog object and the `product_set_data` field of the `PRODUCT_SET` catalog object referenced by the pricing rule. For `ORDER` scopes, the target scope is `WHOLE_PURCHASE` and `all_products` is true. For `ITEM_VARIATION` and `CATEGORY` scopes, the target scope is `LINE_ITEM` and `product_ids_any` is a list of catalog object IDs of the given type. See [LoyaltyProgramRewardDefinitionScope](#type-loyaltyprogramrewarddefinitionscope) for possible values
	let scope: LoyaltyProgramRewardDefinitionScope
}

struct SearchCustomersRequest: Codable {
	/// Include the pagination cursor in subsequent calls to this endpoint to retrieve the next set of results associated with the original query.  See the [Pagination guide](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
	var cursor: String?
	/// A limit on the number of results to be returned in a single page. The limit is advisory - the implementation may return more or fewer results. If the supplied limit is negative, zero, or is higher than the maximum limit of 100, it will be ignored.
	var limit: Int?
	/// Query customers based on the given conditions and sort order. Calling SearchCustomers without an explicit query parameter will return all customers ordered alphabetically based on `given_name` and `family_name`.
	var query: CustomerQuery?
}

/// 
enum V1CreateRefundRequestType: String, Content {
	/// 
	case FULL
	/// 
	case PARTIAL
}

/// Indicates how the tax is applied to the associated line item or order.
enum OrderLineItemTaxType: String, Content {
	/// Used for reporting only. The original transaction tax type is currently not supported by the API.
	case UNKNOWN_TAX
	/// The tax is an additive tax. The tax amount is added on top of the price. For example, an item with a cost of 1.00 USD and a 10% additive tax would have a total cost to the buyer of 1.10 USD.
	case ADDITIVE
	/// The tax is an inclusive tax. Inclusive taxes are already included in the line item price or order total. For example, an item with cost 1.00 USD with a 10% inclusive tax would have a pre-tax cost of 0.91 USD (91 cents) and a 0.09 (9 cents) tax for a total cost of 1.00 USD to the buyer.
	case INCLUSIVE
}

struct LoyaltyEventOrderFilter: Codable {
	/// The ID of the `order` associated with the event.
	var order_id: String
}

struct V1DeleteCategoryRequest: Codable {
}

struct CreateMobileAuthorizationCodeRequest: Codable {
	/// The Square location ID the authorization code should be tied to.
	var location_id: String?
}

/// Specifies which timestamp to use to sort SearchOrder results.
enum SearchOrdersSortField: String, Content {
	/// Time when the order was created in RFC-3339 format. If you are also filtering for a time range in this query, you must set the `CREATED_AT` field in your DateTimeFilter.
	case CREATED_AT
	/// Time when the order last updated in RFC-3339 format. If you are also filtering for a time range in this query, you must set the `UPDATED_AT` field in your DateTimeFilter.
	case UPDATED_AT
	/// Time when the order was closed in RFC-3339 format. If you use this value, you must also set a StateFilter with closed states. If you are also filtering for a time range in this query, you must set the `CLOSED_AT` field in your DateTimeFilter.
	case CLOSED_AT
}

struct VoidTransactionRequest: Codable {
}

struct CatalogQueryRange: Codable {
	/// The desired maximum value for the search attribute (inclusive).
	var attribute_max_value: Int?
	/// The desired minimum value for the search attribute (inclusive).
	var attribute_min_value: Int?
	/// The name of the attribute to be searched.
	var attribute_name: String
}

struct GetBankAccountByV1IdRequest: Codable {
}

/// Indicates how the discount is applied to the associated line item or order.
enum OrderLineItemDiscountType: String, Content {
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

struct SearchSubscriptionsResponse: Codable {
	/// When a response is truncated, it includes a cursor that you can  use in a subsequent request to fetch the next set of subscriptions.  If empty, this is the final response.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	var cursor: String?
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The search result.
	var subscriptions: [Subscription]?
}

struct LoyaltyAccountMapping: Codable {
	/// The timestamp when the mapping was created, in RFC 3339 format.
	let created_at: Timestamp?
	/// The Square-assigned ID of the mapping.
	let id: String?
	/// The type of mapping. See [LoyaltyAccountMappingType](#type-loyaltyaccountmappingtype) for possible values
	var type: LoyaltyAccountMappingType
	/// The phone number, in E.164 format. For example, "+14155551111".
	var value: String
}

struct V1DeleteTimecardRequest: Codable {
}

struct OrderEntry: Codable {
	/// The location id the Order belongs to.
	var location_id: String?
	/// The id of the Order
	var order_id: String?
	/// Version number which is incremented each time an update is committed to the order. Orders that were not created through the API will not include a version and thus cannot be updated.  [Read more about working with versions](https://developer.squareup.com/docs/orders-api/manage-orders#update-orders).
	let version: Int?
}

struct CatalogIdMapping: Codable {
	/// The client-supplied temporary `#`-prefixed ID for a new `CatalogObject`.
	var client_object_id: String?
	/// The permanent ID for the CatalogObject created by the server.
	var object_id: String?
}

struct TerminalRefundQueryFilter: Codable {
	/// Timestamp for the beginning of the reporting period, in RFC 3339 format. Inclusive. Default: The current time minus one day.
	var created_at: TimeRange?
	/// `TerminalRefund`s associated with a specific device. If no device is specified then all `TerminalRefund`s for the signed in account will be displayed.
	var device_id: String?
	/// Filtered results with the desired status of the `TerminalRefund` Options: `PENDING`, `IN_PROGRESS`, `CANCEL_REQUESTED`, `CANCELED`, `COMPLETED`
	var status: String?
}

struct BusinessHours: Codable {
	/// The list of time periods during which the business is open. There may be at most 10 periods per day.
	var periods: [BusinessHoursPeriod]?
}

struct LoyaltyProgramTerminology: Codable {
	/// A singular unit for a point (for example, 1 point is called 1 star).
	let one: String
	/// A plural unit for point (for example, 10 points is called 10 stars).
	let other: String
}

struct V1ListItemsResponse: Codable {
	var items: [V1Item]?
}

struct BulkCreateTeamMembersResponse: Codable {
	/// The errors that occurred during the request.
	var errors: [Error]?
	/// The successfully created `TeamMember` objects. Each key is the `idempotency_key` that maps to the `CreateTeamMemberRequest`.
	var team_members: CreateTeamMemberResponse?
}

struct CreateCheckoutResponse: Codable {
	/// The newly created checkout. If the same request was made with the same idempotency_key, this will be the checkout created with the idempotency_key.
	var checkout: Checkout?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct RetrieveInventoryCountRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query.  See the [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination) guide for more information.
	var cursor: String?
	/// The `Location` IDs to look up as a comma-separated list. An empty list queries all locations.
	var location_ids: String?
}

struct SearchLoyaltyAccountsRequest: Codable {
	/// A pagination cursor returned by a previous call to  this endpoint. Provide this to retrieve the next set of  results for the original query.  For more information,  see [Pagination](https://developer.squareup.com/docs/docs/basics/api101/pagination).
	var cursor: String?
	/// The maximum number of results to include in the response.
	var limit: Int?
	/// The search criteria for the request.
	var query: SearchLoyaltyAccountsRequestLoyaltyAccountQuery?
}

/// 
enum MeasurementUnitGeneric: String, Content {
	/// The generic unit.
	case UNIT
}

struct V1Employee: Codable {
	/// The IDs of the locations the employee is allowed to clock in at.
	var authorized_location_ids: [String]?
	/// The time when the employee entity was created, in ISO 8601 format.
	var created_at: String?
	/// The employee's email address.
	var email: String?
	/// An ID the merchant can set to associate the employee with an entity in another system.
	var external_id: String?
	/// The employee's first name.
	var first_name: String
	/// The employee's unique ID.
	var id: String?
	/// The employee's last name.
	var last_name: String
	/// The ids of the employee's associated roles. Currently, you can specify only one or zero roles per employee.
	var role_ids: [String]?
	/// CWhether the employee is ACTIVE or INACTIVE. Inactive employees cannot sign in to Square Register.Merchants update this field from the Square Dashboard. See [V1EmployeeStatus](#type-v1employeestatus) for possible values
	var status: V1EmployeeStatus?
	/// The time when the employee entity was most recently updated, in ISO 8601 format.
	var updated_at: String?
}

/// 
enum V1PageCellObjectType: String, Content {
	/// 
	case ITEM
	/// 
	case DISCOUNT
	/// 
	case CATEGORY
	/// 
	case PLACEHOLDER
}

struct CreateTerminalRefundResponse: Codable {
	/// Information on errors encountered during the request.
	var errors: [Error]?
	/// The created `TerminalRefund`
	var refund: TerminalRefund?
}

struct ListBankAccountsRequest: Codable {
	/// The pagination cursor returned by a previous call to this endpoint. Use it in the next `ListBankAccounts` request to retrieve the next set  of results.  See the [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination) guide for more information.
	var cursor: String?
	/// Upper limit on the number of bank accounts to return in the response.  Currently, 1000 is the largest supported limit. You can specify a limit  of up to 1000 bank accounts. This is also the default limit.
	var limit: Int?
	/// Location ID. You can specify this optional filter  to retrieve only the linked bank accounts belonging to a specific location.
	var location_id: String?
}

struct V1PaymentSurcharge: Codable {
	/// The amount of the surcharge as a Money object. Exactly one of rate or amount_money should be set.
	var amount_money: V1Money?
	/// The amount of money applied to the order as a result of the surcharge.
	var applied_money: V1Money?
	/// The name of the surcharge.
	var name: String?
	/// The amount of the surcharge as a percentage. The percentage is provided as a string representing the decimal equivalent of the percentage. For example, "0.7" corresponds to a 7% surcharge. Exactly one of rate or amount_money should be set.
	var rate: String?
	/// A Square-issued unique identifier associated with the surcharge.
	var surcharge_id: String?
	/// Indicates whether the surcharge is taxable.
	var taxable: Bool?
	/// The list of taxes that should be applied to the surcharge.
	var taxes: [V1PaymentTax]?
	/// Indicates the source of the surcharge. For example, if it was applied as an automatic gratuity for a large group. See [V1PaymentSurchargeType](#type-v1paymentsurchargetype) for possible values
	var type: V1PaymentSurchargeType?
}

struct V1BankAccount: Codable {
	/// The last few digits of the bank account number.
	var account_number_suffix: String?
	/// The name of the bank that manages the account.
	var bank_name: String?
	/// The currency code of the currency associated with the bank account, in ISO 4217 format. For example, the currency code for US dollars is USD.
	var currency_code: String?
	/// The bank account's Square-issued ID.
	var id: String?
	/// The Square-issued ID of the merchant associated with the bank account.
	var merchant_id: String?
	/// The name associated with the bank account.
	var name: String?
	/// The bank account's routing number.
	var routing_number: String?
	/// The bank account's type (for example, savings or checking). See [V1BankAccountType](#type-v1bankaccounttype) for possible values
	var type: V1BankAccountType?
}

/// Indicates whether the price of a CatalogItemVariation should be entered manually at the time of sale.
enum CatalogPricingType: String, Content {
	/// The catalog item variation's price is fixed.
	case FIXED_PRICING
	/// The catalog item variation's price is entered at the time of sale.
	case VARIABLE_PRICING
}

struct V1UpdateFeeRequest: Codable {
	/// An object containing the fields to POST for the request.  See the corresponding object definition for field details.
	var body: V1Fee
}

struct LoyaltyProgram: Codable {
	/// Defines how buyers can earn loyalty points.
	let accrual_rules: [LoyaltyProgramAccrualRule]
	/// The timestamp when the program was created, in RFC 3339 format.
	let created_at: Timestamp
	/// If present, details for how points expire.
	let expiration_policy: LoyaltyProgramExpirationPolicy?
	/// The Square-assigned ID of the loyalty program. Updates to  the loyalty program do not modify the identifier.
	let id: String
	/// The `locations` at which the program is active.
	let location_ids: [String]
	/// The list of rewards for buyers, sorted by ascending points.
	let reward_tiers: [LoyaltyProgramRewardTier]
	/// Whether the program is currently active. See [LoyaltyProgramStatus](#type-loyaltyprogramstatus) for possible values
	let status: LoyaltyProgramStatus
	/// A cosmetic name for the “points” currency.
	let terminology: LoyaltyProgramTerminology
	/// The timestamp when the reward was last updated, in RFC 3339 format.
	let updated_at: Timestamp
}

struct Address: Codable {
	/// The first line of the address.  Fields that start with `address_line` provide the address's most specific details, like street number, street name, and building name. They do *not* provide less specific details like city, state/province, or country (these details are provided in other fields).
	var address_line_1: String?
	/// The second line of the address, if any.
	var address_line_2: String?
	/// The third line of the address, if any.
	var address_line_3: String?
	/// A civil entity within the address's country. In the US, this is the state.
	var administrative_district_level_1: String?
	/// A civil entity within the address's `administrative_district_level_1`. In the US, this is the county.
	var administrative_district_level_2: String?
	/// A civil entity within the address's `administrative_district_level_2`, if any.
	var administrative_district_level_3: String?
	/// The address's country, in ISO 3166-1-alpha-2 format. See [Country](#type-country) for possible values
	var country: Country?
	/// Optional first name when it's representing recipient.
	var first_name: String?
	/// Optional last name when it's representing recipient.
	var last_name: String?
	/// The city or town of the address.
	var locality: String?
	/// Optional organization name when it's representing recipient.
	var organization: String?
	/// The address's postal code.
	var postal_code: String?
	/// A civil region within the address's `locality`, if any.
	var sublocality: String?
	/// A civil region within the address's `sublocality`, if any.
	var sublocality_2: String?
	/// A civil region within the address's `sublocality_2`, if any.
	var sublocality_3: String?
}

/// The types of events on a CashDrawerShift. Each event type represents an employee action on the actual cash drawer represented by a CashDrawerShift.
enum CashDrawerEventType: String, Content {
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

struct CashDrawerShiftEvent: Codable {
	/// The event time in ISO 8601 format.
	let created_at: String?
	/// An optional description of the event, entered by the employee that created the event.
	var description: String?
	/// The ID of the employee that created the event.
	var employee_id: String?
	/// The amount of money that was added to or removed from the cash drawer in the event. The amount can be positive (for added money), negative (for removed money), or zero (for other tender type payments).
	var event_money: Money?
	/// The type of cash drawer shift event. See [CashDrawerEventType](#type-cashdrawereventtype) for possible values
	var event_type: CashDrawerEventType?
	/// The unique ID of the event.
	var id: String?
}

/// 
enum MerchantStatus: String, Content {
	/// A fully operational merchant account. The merchant can interact with Square products and APIs.
	case ACTIVE
	/// A functionally limited merchant account. The merchant can only have limited interaction via Square APIs. The merchant cannot access the seller dashboard.
	case INACTIVE
}

struct WageSetting: Codable {
	/// The timestamp in RFC 3339 format describing when the wage setting object was created. Ex: "2018-10-04T04:00:00-07:00" or "2019-02-05T12:00:00Z"
	let created_at: Timestamp?
	/// Whether the team member is exempt from the overtime rules of the seller country.
	var is_overtime_exempt: Bool?
	/// <b>Required</b> The ordered list of jobs that the team member is assigned to. The first job assignment is considered the team member's "Primary Job". <br> <b>Min Length 1    Max Length 12</b>
	var job_assignments: [JobAssignment]?
	/// The unique ID of the `TeamMember` whom this wage setting describes.
	var team_member_id: String?
	/// The timestamp in RFC 3339 format describing when the wage setting object was last updated. Ex: "2018-10-04T04:00:00-07:00" or "2019-02-05T12:00:00Z"
	let updated_at: Timestamp?
	/// Used for resolving concurrency issues; request will fail if version provided does not match server version at time of request. If not provided, Square executes a blind write, potentially overwriting data from another write. Read about [optimistic concurrency](https://developer.squareup.com/docs/docs/working-with-apis/optimistic-concurrency) in Square APIs for more information.
	var version: Int?
}

/// Defines the visibility of a custom attribute to sellers in Square client applications, Square APIs or in Square UIs (including Square Point of Sale applications and Square Dashboard).
enum CatalogCustomAttributeDefinitionSellerVisibility: String, Content {
	/// Sellers cannot read this custom attribute in Square client applications or Square APIs.
	case SELLER_VISIBILITY_HIDDEN
	/// Sellers can read and write this custom attribute value in catalog objects, but cannot edit the custom attribute definition.
	case SELLER_VISIBILITY_READ_WRITE_VALUES
}

/// 
enum V1EmployeeStatus: String, Content {
	/// 
	case ACTIVE
	/// 
	case INACTIVE
}

struct UpdateShiftRequest: Codable {
	/// The updated `Shift` object.
	var shift: Shift
}

/// 
enum V1PaymentTaxInclusionType: String, Content {
	/// 
	case ADDITIVE
	/// 
	case INCLUSIVE
}

/// Indicates which products matched by a CatalogPricingRule will be excluded if the pricing rule uses an exclude set.
enum ExcludeStrategy: String, Content {
	/// The least expensive matched products are excluded from the pricing. If the pricing rule is set to exclude one product and multiple products in the match set qualify as least expensive, then one will be excluded at random.  Excluding the least expensive product gives the best discount value to the buyer.
	case LEAST_EXPENSIVE
	/// The most expensive matched product is excluded from the pricing rule. If multiple products have the same price and all qualify as least expensive, one will be excluded at random.  This guarantees that the most expensive product is purchased at full price.
	case MOST_EXPENSIVE
}

struct V1RetrieveOrderRequest: Codable {
}

struct V1RetrieveSettlementRequest: Codable {
}

struct OrderFulfillmentUpdatedUpdate: Codable {
	/// Unique ID that identifies the fulfillment only within this order.
	var fulfillment_uid: String?
	/// The state of the fulfillment after the change. May be equal to old_state if a non-state field was changed on the fulfillment (e.g. tracking number). See [OrderFulfillmentState](#type-orderfulfillmentstate) for possible values
	var new_state: OrderFulfillmentState?
	/// The state of the fulfillment before the change. Will not be populated if the fulfillment is created with this new Order version. See [OrderFulfillmentState](#type-orderfulfillmentstate) for possible values
	var old_state: OrderFulfillmentState?
}

struct LoyaltyEventLocationFilter: Codable {
	/// The `location` IDs for loyalty events to query. If multiple values are specified, the endpoint uses  a logical OR to combine them.
	var location_ids: [String]
}

/// 
enum V1DiscountColor: String, Content {
	case x_9da2a6 = "9da2a6"
	case x_4ab200 = "4ab200"
	case x_0b8000 = "0b8000"
	case x_2952cc = "2952cc"
	case x_a82ee5 = "a82ee5"
	case x_e5457a = "e5457a"
	case x_b21212 = "b21212"
	case x_593c00 = "593c00"
	case x_e5BF00 = "e5BF00"
}

struct RetrieveCatalogObjectRequest: Codable {
	/// Requests objects as of a specific version of the catalog. This allows you to retrieve historical versions of objects. The value to retrieve a specific version of an object can be found in the version field of `CatalogObject`s.
	var catalog_version: Int?
	/// If `true`, the response will include additional objects that are related to the requested object, as follows:  If the `object` field of the response contains a `CatalogItem`, its associated `CatalogCategory`, `CatalogTax`, `CatalogImage` and `CatalogModifierList` objects will be returned in the `related_objects` field of the response. If the `object` field of the response contains a `CatalogItemVariation`, its parent `CatalogItem` will be returned in the `related_objects` field of the response.  Default value: `false`
	var include_related_objects: Bool?
}

struct CalculateLoyaltyPointsRequest: Codable {
	/// The `order` ID for which to calculate the points. Specify this field if your application uses the Orders API to process orders. Otherwise, specify the `transaction_amount`.
	var order_id: String?
	/// The purchase amount for which to calculate the points.  Specify this field if your application does not use the Orders API to process orders. Otherwise, specify the `order_id`.
	var transaction_amount_money: Money?
}

struct V1DeleteModifierListRequest: Codable {
}

struct DeleteShiftResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct BatchRetrieveOrdersRequest: Codable {
	/// The ID of the location for these orders. This field is optional: omit it to retrieve orders within the scope of the current authorization's merchant ID.
	var location_id: String?
	/// The IDs of the orders to retrieve. A maximum of 100 orders can be retrieved per request.
	var order_ids: [String]
}

struct SearchTeamMembersQuery: Codable {
	/// The options to filter by.
	var filter: SearchTeamMembersFilter?
}

struct SubmitEvidenceResponse: Codable {
	/// The `Dispute` for which evidence was submitted.
	var dispute: Dispute?
	/// Information about errors encountered during the request.
	var errors: [Error]?
}

struct FilterValue: Codable {
	/// A list of terms that must be present on the field of the resource.
	var all: [String]?
	/// A list of terms where at least one of them must be present on the field of the resource.
	var any: [String]?
	/// A list of terms that must not be present on the field the resource
	var none: [String]?
}

/// Time units of a service duration for bookings.
enum BusinessAppointmentSettingsAlignmentTime: String, Content {
	/// The service duration unit is one visit of a fixed time interval specified by the seller.
	case SERVICE_DURATION
	/// The service duration unit is a 15-minute interval. Bookings can be scheduled every quarter hour.
	case QUARTER_HOURLY
	/// The service duration unit is a 30-minute interval. Bookings can be scheduled every half hour.
	case HALF_HOURLY
	/// The service duration unit is a 60-minute interval. Bookings can be scheduled every hour.
	case HOURLY
}

struct V1UpdateEmployeeRoleRequest: Codable {
	/// An object containing the fields to POST for the request.  See the corresponding object definition for field details.
	var body: V1EmployeeRole
}

struct ShiftSort: Codable {
	/// The field to sort on. See [ShiftSortField](#type-shiftsortfield) for possible values
	var field: ShiftSortField?
	/// The order in which results are returned. Defaults to DESC. See [SortOrder](#type-sortorder) for possible values
	var order: SortOrder?
}

struct V1ListOrdersResponse: Codable {
	var items: [V1Order]?
}

struct RetrieveCustomerResponse: Codable {
	/// The requested customer.
	var customer: Customer?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct LoyaltyAccount: Codable {
	/// The available point balance in the loyalty account.    Your application should be able to handle loyalty accounts that have a negative point balance (`balance` is less than 0). This might occur if a seller makes a manual adjustment or as a result of a refund or exchange.
	let balance: Int?
	/// The timestamp when the loyalty account was created, in RFC 3339 format.
	let created_at: Timestamp?
	/// The Square-assigned ID of the `customer` that is associated with the account.
	var customer_id: String?
	/// The timestamp when enrollment occurred, in RFC 3339 format.
	let enrolled_at: Timestamp?
	/// The Square-assigned ID of the loyalty account.
	let id: String?
	/// The total points accrued during the lifetime of the account.
	let lifetime_points: Int?
	/// The list of mappings that the account is associated with.  Currently, a buyer can only be mapped to a loyalty account using  a phone number. Therefore, the list can only have one mapping.
	var mappings: [LoyaltyAccountMapping]
	/// The Square-assigned ID of the `loyalty program` to which the account belongs.
	var program_id: String
	/// The timestamp when the loyalty account was last updated, in RFC 3339 format.
	let updated_at: Timestamp?
}

struct Refund: Codable {
	/// Additional recipients (other than the merchant) receiving a portion of this refund. For example, fees assessed on a refund of a purchase by a third party integration.
	var additional_recipients: [AdditionalRecipient]?
	/// The amount of money refunded to the buyer.
	var amount_money: Money
	/// The timestamp for when the refund was created, in RFC 3339 format.
	let created_at: Timestamp?
	/// The refund's unique ID.
	var id: String
	/// The ID of the refund's associated location.
	var location_id: String
	/// The amount of Square processing fee money refunded to the *merchant*.
	var processing_fee_money: Money?
	/// The reason for the refund being issued.
	var reason: String
	/// The current status of the refund (`PENDING`, `APPROVED`, `REJECTED`, or `FAILED`). See [RefundStatus](#type-refundstatus) for possible values
	var status: RefundStatus
	/// The ID of the refunded tender.
	var tender_id: String
	/// The ID of the transaction that the refunded tender is part of.
	var transaction_id: String
}

struct ListInvoicesRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint.  Provide this cursor to retrieve the next set of results for your original query.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	var cursor: String?
	/// The maximum number of invoices to return (200 is the maximum `limit`).  If not provided, the server  uses a default limit of 100 invoices.
	var limit: Int?
	/// The ID of the location for which to list invoices.
	var location_id: String
}

struct LoyaltyProgramRewardTier: Codable {
	/// The timestamp when the reward tier was created, in RFC 3339 format.
	let created_at: Timestamp
	/// Provides details about the reward tier definition. DEPRECATED at version 2020-12-16. Replaced by the `pricing_rule_reference` field.
	let definition: LoyaltyProgramRewardDefinition
	/// The Square-assigned ID of the reward tier.
	let id: String
	/// The name of the reward tier.
	let name: String
	/// The points exchanged for the reward tier.
	let points: Int
	/// A reference to the specific version of a `PRICING_RULE` catalog object that contains information about the reward tier discount.  Use `object_id` and `catalog_version` with the `RetrieveCatalogObject` endpoint to get discount details. Make sure to set `include_related_objects` to true in the request to retrieve all catalog objects that define the discount. For more information, see [Get discount details for the reward](https://developer.squareup.com/docs/docs/loyalty-api/overview#get-discount-details).
	let pricing_rule_reference: CatalogObjectReference?
}

struct ItemVariationLocationOverrides: Codable {
	/// If the inventory quantity for the variation is less than or equal to this value and `inventory_alert_type` is `LOW_QUANTITY`, the variation displays an alert in the merchant dashboard.  This value is always an integer.
	var inventory_alert_threshold: Int?
	/// Indicates whether the `CatalogItemVariation` displays an alert when its inventory quantity is less than or equal to its `inventory_alert_threshold`. See [InventoryAlertType](#type-inventoryalerttype) for possible values
	var inventory_alert_type: InventoryAlertType?
	/// The ID of the `Location`.
	var location_id: String?
	/// The price of the `CatalogItemVariation` at the given `Location`, or blank for variable pricing.
	var price_money: Money?
	/// The pricing type (fixed or variable) for the `CatalogItemVariation` at the given `Location`. See [CatalogPricingType](#type-catalogpricingtype) for possible values
	var pricing_type: CatalogPricingType?
	/// If `true`, inventory tracking is active for the `CatalogItemVariation` at this `Location`.
	var track_inventory: Bool?
}

/// 
enum V1FeeCalculationPhase: String, Content {
	/// 
	case FEE_SUBTOTAL_PHASE
	/// 
	case OTHER
	/// 
	case FEE_TOTAL_PHASE
}

struct OrderReturnLineItemModifier: Codable {
	/// The base price for the modifier.  `base_price_money` is required for ad hoc modifiers. If both `catalog_object_id` and `base_price_money` are set, `base_price_money` will override the predefined `CatalogModifier` price.
	var base_price_money: Money?
	/// The catalog object id referencing `CatalogModifier`.
	var catalog_object_id: String?
	/// The name of the item modifier.
	var name: String?
	/// `uid` of the Modifier from the LineItem from the Order which contains the original sale of this line item modifier.
	var source_modifier_uid: String?
	/// The total price of the item modifier for its line item. This is the modifier's `base_price_money` multiplied by the line item's quantity.
	let total_price_money: Money?
	/// Unique ID that identifies the return modifier only within this order.
	var uid: String?
}

/// Defines whether the event was generated by the Square Point of Sale.
enum LoyaltyEventSource: String, Content {
	/// The event is generated by the Square Point of Sale (POS).
	case SQUARE
	/// The event is generated by something other than the Square Point of Sale that used the Loyalty API.
	case LOYALTY_API
}

struct V1CreateRefundRequest: Codable {
	/// The ID of the payment to refund. If you are creating a `PARTIAL` refund for a split tender payment, instead provide the id of the particular tender you want to refund.
	var payment_id: String
	/// The reason for the refund.
	var reason: String
	/// The amount of money to refund. Required only for PARTIAL refunds.
	var refunded_money: V1Money?
	/// An optional key to ensure idempotence if you issue the same PARTIAL refund request more than once.
	var request_idempotence_key: String?
	/// TThe type of refund (FULL or PARTIAL). See [V1CreateRefundRequestType](#type-v1createrefundrequesttype) for possible values
	var type: V1CreateRefundRequestType
}

struct Tender: Codable {
	/// Additional recipients (other than the merchant) receiving a portion of this tender. For example, fees assessed on the purchase by a third party integration.
	var additional_recipients: [AdditionalRecipient]?
	/// The total amount of the tender, including `tip_money`. If the tender has a `payment_id`, the `total_money` of the corresponding `Payment` will be equal to the `amount_money` of the tender.
	var amount_money: Money?
	/// The details of the card tender.  This value is present only if the value of `type` is `CARD`.
	var card_details: TenderCardDetails?
	/// The details of the cash tender.  This value is present only if the value of `type` is `CASH`.
	var cash_details: TenderCashDetails?
	/// The timestamp for when the tender was created, in RFC 3339 format.
	let created_at: Timestamp?
	/// If the tender is associated with a customer or represents a customer's card on file, this is the ID of the associated customer.
	var customer_id: String?
	/// The tender's unique ID.
	var id: String?
	/// The ID of the transaction's associated location.
	var location_id: String?
	/// An optional note associated with the tender at the time of payment.
	var note: String?
	/// The ID of the `Payment` that corresponds to this tender. This value is only present for payments created with the v2 Payments API.
	var payment_id: String?
	/// The amount of any Square processing fees applied to the tender.  This field is not immediately populated when a new transaction is created. It is usually available after about ten seconds.
	var processing_fee_money: Money?
	/// The tip's amount of the tender.
	var tip_money: Money?
	/// The ID of the tender's associated transaction.
	var transaction_id: String?
	/// The type of tender, such as `CARD` or `CASH`. See [TenderType](#type-tendertype) for possible values
	var type: TenderType
}

struct CreateTeamMemberResponse: Codable {
	/// The errors that occurred during the request.
	var errors: [Error]?
	/// The successfully created `TeamMember` object.
	var team_member: TeamMember?
}

struct ShiftWage: Codable {
	/// Can be a custom-set hourly wage or the calculated effective hourly wage based on annual wage and hours worked per week.
	var hourly_rate: Money?
	/// The name of the job performed during this shift. Square labor-reporting UIs may group shifts together by title.
	var title: String?
}

/// 
enum V1FeeAdjustmentType: String, Content {
	/// 
	case TAX
}

struct V1Discount: Codable {
	/// The amount of the discount. This amount is 0 if discount_type is VARIABLE_AMOUNT. This field is not included for rate-based discounts.
	var amount_money: V1Money?
	/// The color of the discount's display label in Square Point of Sale, if not the default color. The default color is 9da2a6. See [V1DiscountColor](#type-v1discountcolor) for possible values
	var color: V1DiscountColor?
	/// Indicates whether the discount is a FIXED value or entered at the time of sale. See [V1DiscountDiscountType](#type-v1discountdiscounttype) for possible values
	var discount_type: V1DiscountDiscountType?
	/// The discount's unique ID.
	var id: String?
	/// The discount's name.
	var name: String?
	/// Indicates whether a mobile staff member needs to enter their PIN to apply the discount to a payment.
	var pin_required: Bool?
	/// The rate of the discount, as a string representation of a decimal number. A value of 0.07 corresponds to a rate of 7%. This rate is 0 if discount_type is VARIABLE_PERCENTAGE.
	var rate: String?
	/// The ID of the CatalogObject in the Connect v2 API. Objects that are shared across multiple locations share the same v2 ID.
	var v2_id: String?
}

struct SearchInvoicesRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint.  Provide this cursor to retrieve the next set of results for your original query.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	var cursor: String?
	/// The maximum number of invoices to return (200 is the maximum `limit`).  If not provided, the server  uses a default limit of 100 invoices.
	var limit: Int?
	/// Describes the query criteria for searching invoices.
	var query: InvoiceQuery
}

struct V1UpdateOrderRequest: Codable {
	/// The action to perform on the order (COMPLETE, CANCEL, or REFUND). See [V1UpdateOrderRequestAction](#type-v1updateorderrequestaction) for possible values
	var action: V1UpdateOrderRequestAction
	/// A merchant-specified note about the canceling of the order. Only valid if action is CANCEL.
	var canceled_note: String?
	/// A merchant-specified note about the completion of the order. Only valid if action is COMPLETE.
	var completed_note: String?
	/// A merchant-specified note about the refunding of the order. Only valid if action is REFUND.
	var refunded_note: String?
	/// The tracking number of the shipment associated with the order. Only valid if action is COMPLETE.
	var shipped_tracking_number: String?
}

struct V1ListCategoriesResponse: Codable {
	var items: [V1Category]?
}

struct BatchChangeInventoryResponse: Codable {
	/// The current counts for all objects referenced in the request.
	var counts: [InventoryCount]?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct RetrieveInventoryAdjustmentRequest: Codable {
}

struct GetEmployeeWageRequest: Codable {
}

struct Coordinates: Codable {
	/// The latitude of the coordinate expressed in degrees.
	var latitude: Float?
	/// The longitude of the coordinate expressed in degrees.
	var longitude: Float?
}

struct InventoryPhysicalCount: Codable {
	/// The Square generated ID of the `CatalogObject` being tracked.
	var catalog_object_id: String?
	/// The `CatalogObjectType` of the `CatalogObject` being tracked. Tracking is only supported for the `ITEM_VARIATION` type.
	var catalog_object_type: String?
	/// A read-only timestamp in RFC 3339 format that indicates when Square received the physical count.
	let created_at: Timestamp?
	/// The Square ID of the `Employee` responsible for the physical count.
	var employee_id: String?
	/// A unique ID generated by Square for the `InventoryPhysicalCount`.
	var id: String?
	/// The Square ID of the `Location` where the related quantity of items are being tracked.
	var location_id: String?
	/// A client-generated timestamp in RFC 3339 format that indicates when the physical count took place. For write actions, the `occurred_at` timestamp cannot be older than 24 hours or in the future relative to the time of the request.
	var occurred_at: Timestamp?
	/// The number of items affected by the physical count as a decimal string. Can support up to 5 digits after the decimal point.
	var quantity: String?
	/// An optional ID provided by the application to tie the `InventoryPhysicalCount` to an external system.
	var reference_id: String?
	/// Read-only information about the application that submitted the physical count.
	var source: SourceApplication?
	/// The current `InventoryState` for the related quantity of items. See [InventoryState](#type-inventorystate) for possible values
	var state: InventoryState?
}

struct RetrieveBookingResponse: Codable {
	/// The booking that was requested.
	var booking: Booking?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct CatalogProductSet: Codable {
	/// If set to `true`, the product set will include every item in the catalog.  Only one of `product_ids_all`, `product_ids_any`, or `all_products` can be set.
	var all_products: Bool?
	/// User-defined name for the product set. For example, "Clearance Items" or "Winter Sale Items".
	var name: String?
	/// Unique IDs for any `CatalogObject` included in this product set. All objects in this set must be included in an order for a pricing rule to apply.  Only one of `product_ids_all`, `product_ids_any`, or `all_products` can be set.  Max: 500 catalog object IDs.
	var product_ids_all: [String]?
	///  Unique IDs for any `CatalogObject` included in this product set. Any number of these catalog objects can be in an order for a pricing rule to apply.  This can be used with `product_ids_all` in a parent `CatalogProductSet` to match groups of products for a bulk discount, such as a discount for an entree and side combo.  Only one of `product_ids_all`, `product_ids_any`, or `all_products` can be set.  Max: 500 catalog object IDs.
	var product_ids_any: [String]?
	/// If set, there must be exactly this many items from `products_any` or `products_all` in the cart for the discount to apply.  Cannot be combined with either `quantity_min` or `quantity_max`.
	var quantity_exact: Int?
	/// If set, the pricing rule will apply to a maximum of this many items from `products_any` or `products_all`.
	var quantity_max: Int?
	/// If set, there must be at least this many items from `products_any` or `products_all` in a cart for the discount to apply. See `quantity_exact`. Defaults to 0 if `quantity_exact`, `quantity_min` and `quantity_max` are all unspecified.
	var quantity_min: Int?
}

struct CatalogInfoRequest: Codable {
}

struct Location: Codable {
	/// The physical address of the location.
	var address: Address?
	/// The email of the location. This email is visible to the customers of the location. For example, the email appears on customer receipts.
	var business_email: String?
	///  Represents the hours of operation for the location.
	var business_hours: BusinessHours?
	/// The business name of the location This is the name visible to the customers of the location. For example, this name appears on customer receipts.
	var business_name: String?
	/// The Square features that are enabled for the location. See `LocationCapability` for possible values. See [LocationCapability](#type-locationcapability) for possible values
	let capabilities: LocationCapability?
	/// The physical coordinates (latitude and longitude) of the location.
	var coordinates: Coordinates?
	/// The country of the location, in ISO 3166-1-alpha-2 format.  See `Country` for possible values. See [Country](#type-country) for possible values
	let country: Country?
	/// The time when the location was created, in RFC 3339 format.
	let created_at: Timestamp?
	/// The currency used for all transactions at this location, in ISO 4217 format. See `Currency` for possible values. See [Currency](#type-currency) for possible values
	let currency: Currency?
	/// The description of the location.
	var description: String?
	/// The Facebook profile URL of the location. The URL should begin with 'facebook.com/'.
	var facebook_url: String?
	/// The URL of a full-format logo image for the location. The Seller must choose this logo in the Seller dashboard (Receipts section) for the logo to appear on transactions (such as receipts, invoices) that Square generates on behalf of the Seller. This image can have an aspect ratio of 2:1 or greater and is recommended to be at least 1280x648 pixels.
	let full_format_logo_url: String?
	/// The Square-issued ID of the location.
	let id: String?
	/// The Instagram username of the location without the '&#64;' symbol.
	var instagram_username: String?
	/// The language associated with the location, in [BCP 47 format](https://tools.ietf.org/html/bcp47#appendix-A).
	var language_code: String?
	/// The URL of the logo image for the location. The Seller must choose this logo in the Seller dashboard (Receipts section) for the logo to appear on transactions (such as receipts, invoices) that Square generates on behalf of the Seller. This image should have an aspect ratio close to 1:1 and is recommended to be at least 200x200 pixels.
	let logo_url: String?
	/// The merchant category code (MCC) of the location, as standardized by ISO 18245. The MCC describes the kind of goods or services sold at the location.
	var mcc: String?
	/// The ID of the merchant that owns the location.
	let merchant_id: String?
	/// The name of the location. This information appears in the dashboard as the nickname.
	var name: String?
	/// The phone number of the location in human readable format.
	var phone_number: String?
	/// The URL of the Point of Sale background image for the location.
	let pos_background_url: String?
	/// The status of the location, either active or inactive. See [LocationStatus](#type-locationstatus) for possible values
	var status: LocationStatus?
	/// The [IANA Timezone](https://www.iana.org/time-zones) identifier for the timezone of the location.
	var timezone: String?
	/// The Twitter username of the location without the '&#64;' symbol.
	var twitter_username: String?
	/// The type of the location, either physical or mobile. See [LocationType](#type-locationtype) for possible values
	var type: LocationType?
	/// The website URL of the location.
	var website_url: String?
}

struct V1ListFeesResponse: Codable {
	var items: [V1Fee]?
}

struct Merchant: Codable {
	/// The business name of the merchant.
	var business_name: String?
	/// The country code associated with the merchant account, in ISO 3166 format. See [Country](#type-country) for possible values
	var country: Country
	/// The currency associated with the merchant account, in ISO 4217 format. See [Currency](#type-currency) for possible values
	var currency: Currency?
	/// The Square-issued ID of the merchant.
	var id: String?
	/// The language code associated with the merchant account, in BCP 47 format.
	var language_code: String?
	/// The ID of the main `Location` for this merchant.
	var main_location_id: String?
	/// The merchant status, active or inactive. See [MerchantStatus](#type-merchantstatus) for possible values
	var status: MerchantStatus?
}

struct CustomAttributeFilter: Codable {
	/// A query expression to filter items or item variations by matching their custom attributes' `boolean_value` property values against the specified Boolean expression.
	var bool_filter: Bool?
	/// A query expression to filter items or item variations by matching their custom attributes' `custom_attribute_definition_id` property value against the the specified id.
	var custom_attribute_definition_id: String?
	/// A query expression to filter items or item variations by matching their custom attributes' `key` property value against the specified key.
	var key: String?
	/// A query expression to filter items or item variations with their custom attributes containing a number value within the specified range.
	var number_filter: Range?
	/// A query expression to filter items or item variations by matching  their custom attributes' `selection_uid_values` values against the specified selection uids.
	var selection_uids_filter: [String]?
	/// A query expression to filter items or item variations by matching their custom attributes' `string_value`  property value against the specified text.
	var string_filter: String?
}

/// Indicates the financial purpose of the bank account.
enum BankAccountType: String, Content {
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

struct PublishInvoiceRequest: Codable {
	/// A unique string that identifies the `PublishInvoice` request. If you do not  provide `idempotency_key` (or provide an empty string as the value), the endpoint  treats each request as independent.  For more information, see [Idempotency](https://developer.squareup.com/docs/docs/working-with-apis/idempotency).
	var idempotency_key: String?
	/// The version of the `Invoice` to publish. This must match the current version of the invoice, otherwise the request is rejected.
	var version: Int
}

struct Range: Codable {
	/// The upper bound of the number range.
	var max: String?
	/// The lower bound of the number range.
	var min: String?
}

struct RemoveGroupFromCustomerRequest: Codable {
}

/// Indicates which high-level category of error has occurred during a request to the Connect API.
enum ErrorCategory: String, Content {
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

struct RetrieveOrderResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The requested order.
	var order: Order?
}

struct V1Page: Codable {
	/// The cells included on the page.
	var cells: [V1PageCell]?
	/// The page's unique identifier.
	var id: String?
	/// The page's name, if any.
	var name: String?
	/// The page's position in the merchant's list of pages. Always an integer between 0 and 6, inclusive.
	var page_index: Int?
}

struct RetrieveLoyaltyRewardRequest: Codable {
}

struct SearchCustomersResponse: Codable {
	/// A pagination cursor that can be used during subsequent calls to SearchCustomers to retrieve the next set of results associated with the original query. Pagination cursors are only present when a request succeeds and additional results are available.  See the [Pagination guide](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
	var cursor: String?
	/// An array of `Customer` objects that match a query.
	var customers: [Customer]?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct GetInvoiceRequest: Codable {
}

struct CancelSubscriptionResponse: Codable {
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The canceled subscription.
	var subscription: Subscription?
}

struct ShiftQuery: Codable {
	/// Query filter options
	var filter: ShiftFilter?
	/// Sort order details
	var sort: ShiftSort?
}

struct RetrieveDisputeRequest: Codable {
}

struct SearchSubscriptionsQuery: Codable {
	/// A list of filtering criteria.
	var filter: SearchSubscriptionsFilter?
}

struct CatalogObjectReference: Codable {
	/// The version of the object.
	var catalog_version: Int?
	/// The ID of the referenced object.
	var object_id: String?
}

struct CreateRefundRequest: Codable {
	/// The amount of money to refund.  Note that you specify the amount in the __smallest denomination of the applicable currency__. For example, US dollar amounts are specified in cents. See [Working with monetary amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts) for details.  This amount cannot exceed the amount that was originally charged to the tender that corresponds to `tender_id`.
	var amount_money: Money
	/// A value you specify that uniquely identifies this refund among refunds you've created for the tender.  If you're unsure whether a particular refund succeeded, you can reattempt it with the same idempotency key without worrying about duplicating the refund.  See [Idempotency keys](#idempotencykeys) for more information.
	var idempotency_key: String
	/// A description of the reason for the refund.  Default value: `Refund via API`
	var reason: String?
	/// The ID of the tender to refund.  A ``Transaction`` has one or more `tenders` (i.e., methods of payment) associated with it, and you refund each tender separately with the Connect API.
	var tender_id: String
}

struct V1RemoveModifierListRequest: Codable {
}

struct DeleteCustomerGroupResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

/// The type of the loyalty event.
enum LoyaltyEventType: String, Content {
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

struct DeleteCustomerRequest: Codable {
}

/// Indicates where to render a custom field on the Square-hosted invoice page and in emailed or PDF  copies of the invoice.
enum InvoiceCustomFieldPlacement: String, Content {
	/// Render the custom field above the invoice line items.
	case ABOVE_LINE_ITEMS
	/// Render the custom field below the invoice line items.
	case BELOW_LINE_ITEMS
}

/// Indicates the specific day  of the week.
enum DayOfWeek: String, Content {
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

struct DateRange: Codable {
	/// String in `YYYY-MM-DD` format, e.g. `2017-10-31` per the ISO 8601 extended format for calendar dates. The end of a date range (inclusive)
	var end_date: String?
	/// String in `YYYY-MM-DD` format, e.g. `2017-10-31` per the ISO 8601 extended format for calendar dates. The beginning of a date range (inclusive)
	var start_date: String?
}

/// The type of a CatalogItem. Connect V2 only allows the creation of `REGULAR` or `APPOINTMENTS_SERVICE` items.
enum CatalogItemProductType: String, Content {
	/// An ordinary item.
	case REGULAR
	/// A Square gift card.
	case GIFT_CARD
	/// A service that can be booked using the Square Appointments app.
	case APPOINTMENTS_SERVICE
}

struct GetShiftResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The requested `Shift`.
	var shift: Shift?
}

/// Indicates a card's prepaid type, such as `NOT_PREPAID` or `PREPAID`.
enum CardPrepaidType: String, Content {
	/// 
	case UNKNOWN_PREPAID_TYPE
	/// 
	case NOT_PREPAID
	/// 
	case PREPAID
}

struct V1CreatePageRequest: Codable {
	/// An object containing the fields to POST for the request.  See the corresponding object definition for field details.
	var body: V1Page?
}

struct V1UpdatePageRequest: Codable {
	/// An object containing the fields to POST for the request.  See the corresponding object definition for field details.
	var body: V1Page
}

struct SearchCatalogItemsRequest: Codable {
	/// The category id query expression to return items containing the specified category IDs.
	var category_ids: [String]?
	/// The pagination token, returned in the previous response, used to fetch the next batch of pending results.
	var cursor: String?
	/// The customer-attribute filter to return items or item variations matching the specified custom attribute expressions. A maximum number of 10 custom attribute expressions are supported in a single call to the `SearchCatalogItems` endpoint.
	var custom_attribute_filters: [CustomAttributeFilter]?
	/// The enabled-location query expression to return items and item variations having specified enabled locations.
	var enabled_location_ids: [String]?
	/// The maximum number of results to return per page. The default value is 100.
	var limit: Int?
	/// The product types query expression to return items or item variations having the specified product types. See [CatalogItemProductType](#type-catalogitemproducttype) for possible values
	var product_types: CatalogItemProductType?
	/// The order to sort the results by item names. The default sort order is ascending (`ASC`). See [SortOrder](#type-sortorder) for possible values
	var sort_order: SortOrder?
	/// The stock-level query expression to return item variations with the specified stock levels. See [SearchCatalogItemsRequestStockLevel](#type-searchcatalogitemsrequeststocklevel) for possible values
	var stock_levels: SearchCatalogItemsRequestStockLevel?
	/// The text filter expression to return items or item variations containing specified text in the `name`, `description`, or `abbreviation` attribute value of an item, or in the `name`, `sku`, or `upc` attribute value of an item variation.
	var text_filter: String?
}

/// Indicates the Square product used to generate an inventory change.
enum Product: String, Content {
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

struct AcceptDisputeResponse: Codable {
	/// Details about the accepted dispute.
	var dispute: Dispute?
	/// Information about errors encountered during the request.
	var errors: [Error]?
}

struct CustomerCreationSourceFilter: Codable {
	/// Indicates whether a customer profile matching the filter criteria should be included in the result or excluded from the result.  Default: `INCLUDE`. See [CustomerInclusionExclusion](#type-customerinclusionexclusion) for possible values
	var rule: CustomerInclusionExclusion?
	/// The list of creation sources used as filtering criteria. See [CustomerCreationSource](#type-customercreationsource) for possible values
	var values: CustomerCreationSource?
}

struct BatchRetrieveInventoryChangesResponse: Codable {
	/// The current calculated inventory changes for the requested objects and locations.
	var changes: [InventoryChange]?
	/// The pagination cursor to be used in a subsequent request. If unset, this is the final response. See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
	var cursor: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct TimeRange: Codable {
	/// A datetime value in RFC 3339 format indicating when the time range ends.
	var end_at: Timestamp?
	/// A datetime value in RFC 3339 format indicating when the time range starts.
	var start_at: Timestamp?
}

struct UpdateBookingResponse: Codable {
	/// The booking that was updated.
	var booking: Booking?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

/// 
enum V1SettlementStatus: String, Content {
	/// 
	case FAILED
	/// 
	case SENT
}

struct OrderFulfillmentUpdated: Codable {
	/// Timestamp for when the order was created in RFC 3339 format.
	let created_at: Timestamp?
	/// The fulfillments that were updated with this version change.
	var fulfillment_update: [OrderFulfillmentUpdatedUpdate]?
	/// The ID of the merchant location this order is associated with.
	var location_id: String?
	/// The order's unique ID.
	var order_id: String?
	/// The state of the order. See [OrderState](#type-orderstate) for possible values
	var state: OrderState?
	/// Timestamp for when the order was last updated in RFC 3339 format.
	let updated_at: Timestamp?
	/// Version number which is incremented each time an update is committed to the order. Orders that were not created through the API will not include a version and thus cannot be updated.  [Read more about working with versions](https://developer.squareup.com/docs/docs/orders-api/manage-orders#update-orders)
	var version: Int?
}

struct V1CreateModifierOptionRequest: Codable {
	/// An object containing the fields to POST for the request.  See the corresponding object definition for field details.
	var body: V1ModifierOption?
}

/// Indicates a card's brand, such as `VISA` or `MASTERCARD`.
enum CardBrand: String, Content {
	/// 
	case OTHER_BRAND
	/// 
	case VISA
	/// 
	case MASTERCARD
	/// 
	case AMERICAN_EXPRESS
	/// 
	case DISCOVER
	/// 
	case DISCOVER_DINERS
	/// 
	case JCB
	/// 
	case CHINA_UNIONPAY
	/// 
	case SQUARE_GIFT_CARD
	/// 
	case SQUARE_CAPITAL_CARD
	/// 
	case INTERAC
	/// 
	case EFTPOS
	/// 
	case FELICA
}

struct V1ItemImage: Codable {
	/// The image's unique ID.
	var id: String?
	/// The image's publicly accessible URL.
	var url: String?
}

/// 
enum V1TenderType: String, Content {
	/// 
	case CREDIT_CARD
	/// 
	case CASH
	/// 
	case THIRD_PARTY_CARD
	/// 
	case NO_SALE
	/// 
	case SQUARE_WALLET
	/// 
	case SQUARE_GIFT_CARD
	/// 
	case UNKNOWN
	/// 
	case OTHER
}

struct V1Tender: Codable {
	/// The brand of credit card provided. See [V1TenderCardBrand](#type-v1tendercardbrand) for possible values
	var card_brand: V1TenderCardBrand?
	/// The amount of total_money returned to the buyer as change.
	var change_back_money: V1Money?
	/// The ID of the employee that processed the tender.
	var employee_id: String?
	/// The tender's unique ID. See [V1TenderEntryMethod](#type-v1tenderentrymethod) for possible values
	var entry_method: V1TenderEntryMethod?
	/// The tender's unique ID.
	var id: String?
	/// Indicates whether or not the tender is associated with an exchange. If is_exchange is true, the tender represents the value of goods returned in an exchange not the actual money paid. The exchange value reduces the tender amounts needed to pay for items purchased in the exchange.
	var is_exchange: Bool?
	/// A human-readable description of the tender.
	var name: String?
	/// The last four digits of the provided credit card's account number.
	var pan_suffix: String?
	/// Notes entered by the merchant about the tender at the time of payment, if any. Typically only present for tender with the type: OTHER.
	var payment_note: String?
	/// The URL of the receipt for the tender.
	var receipt_url: String?
	/// The total of all refunds applied to this tender. This amount is always negative or zero.
	var refunded_money: V1Money?
	/// The time when the tender was settled, in ISO 8601 format.
	var settled_at: String?
	/// The time when the tender was created, in ISO 8601 format.
	var tendered_at: String?
	/// The amount of total_money applied to the payment.
	var tendered_money: V1Money?
	/// The total amount of money provided in this form of tender.
	var total_money: V1Money?
	/// The type of tender. See [V1TenderType](#type-v1tendertype) for possible values
	var type: V1TenderType?
}

struct V1SettlementEntry: Codable {
	/// The total amount of money this entry contributes to the total settlement amount.
	var amount_money: V1Money?
	/// The amount of all Square fees associated with this settlement entry. This value is always negative or zero.
	var fee_money: V1Money?
	/// The settlement's unique identifier.
	var payment_id: String?
	/// The settlement's current status. See [V1SettlementEntryType](#type-v1settlemententrytype) for possible values
	var type: V1SettlementEntryType?
}

struct V1ListTimecardEventsRequest: Codable {
}

struct SearchAvailabilityFilter: Codable {
	/// The query expression to search for availabilities for an existing booking by matching the specified `booking_id` value. This is commonly used to reschedule an appointment. If this expression is specified, the `location_id` and `segment_filters` expressions are not allowed.
	var booking_id: String?
	/// The query expression to search for availabilities matching the specified seller location IDs. This query expression is not applicable when `booking_id` is present.
	var location_id: String?
	/// The list of segment filters to apply. A query with `n` segment filters returns availabilities with `n` segments per availability. It is not applicable when `booking_id` is present.
	var segment_filters: [SegmentFilter]?
	/// The query expression to search for availabilities matching the specified range of starting times. The range must be at least 24 hours and at most 31 days in length.
	var start_at_range: TimeRange
}

struct RetrieveTransactionRequest: Codable {
}

struct V1ListPaymentsResponse: Codable {
	var items: [V1Payment]?
}

struct UpdateWageSettingRequest: Codable {
	/// The new `WageSetting` object that will completely replace the existing one.
	var wage_setting: WageSetting
}

/// The status of the loyalty reward.
enum LoyaltyRewardStatus: String, Content {
	/// The reward is issued.
	case ISSUED
	/// The reward is redeemed.
	case REDEEMED
	/// The reward is deleted.
	case DELETED
}

struct TerminalCheckoutQueryFilter: Codable {
	/// Time range for the beginning of the reporting period. Inclusive. Default: The current time minus one day.
	var created_at: TimeRange?
	/// `TerminalCheckout`s associated with a specific device. If no device is specified then all `TerminalCheckout`s for the merchant will be displayed.
	var device_id: String?
	/// Filtered results with the desired status of the `TerminalCheckout` Options: PENDING, IN_PROGRESS, CANCELED, COMPLETED
	var status: String?
}

/// Indicates a card's type, such as `CREDIT` or `DEBIT`.
enum CardType: String, Content {
	/// 
	case UNKNOWN_CARD_TYPE
	/// 
	case CREDIT
	/// 
	case DEBIT
}

struct CreatePaymentResponse: Codable {
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The newly created payment.
	var payment: Payment?
}

struct SearchShiftsResponse: Codable {
	/// Opaque cursor for fetching the next page.
	var cursor: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// Shifts
	var shifts: [Shift]?
}

struct ListPaymentsResponse: Codable {
	/// The pagination cursor to be used in a subsequent request. If empty, this is the final response.  For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
	var cursor: String?
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The requested list of payments.
	var payments: [Payment]?
}

struct CashDrawerShift: Codable {
	/// The amount of money added to the cash drawer for reasons other than cash payments. It is computed by summing the events of type PAID_IN. The amount is always greater than or equal to zero.
	var cash_paid_in_money: Money?
	/// The amount of money removed from the cash drawer for reasons other than cash refunds. It is computed by summing the events of type PAID_OUT. The amount is always greater than or equal to zero.
	var cash_paid_out_money: Money?
	/// The amount of money added to the cash drawer from cash payments. This is computed by summing all events with the types CASH_TENDER_PAYMENT and CASH_TENDER_CANCELED_PAYMENT. The amount is always greater than or equal to zero.
	var cash_payment_money: Money?
	/// The amount of money removed from the cash drawer from cash refunds. It is computed by summing the events of type CASH_TENDER_REFUND. The amount is always greater than or equal to zero.
	var cash_refunds_money: Money?
	/// The time when the shift was closed, in ISO 8601 format.
	var closed_at: String?
	/// The amount of money found in the cash drawer at the end of the shift by an auditing employee. The amount should be positive.
	var closed_cash_money: Money?
	/// The ID of the employee that closed the cash drawer shift by auditing the cash drawer contents.
	var closing_employee_id: String?
	/// The free-form text description of a cash drawer by an employee.
	var description: String?
	/// The device running Square Point of Sale that was connected to the cash drawer.
	var device: CashDrawerDevice?
	/// The IDs of all employees that were logged into Square Point of Sale at any point while the cash drawer shift was open.
	var employee_ids: [String]?
	/// The time when the shift ended, in ISO 8601 format.
	var ended_at: String?
	/// The ID of the employee that ended the cash drawer shift.
	var ending_employee_id: String?
	/// The amount of money that should be in the cash drawer at the end of the shift, based on the shift's other money amounts. This can be negative if employees have not correctly recorded all the events on the cash drawer. cash_paid_out_money is a summation of amounts from cash_payment_money (zero or positive), cash_refunds_money (zero or negative), cash_paid_in_money (zero or positive), and cash_paid_out_money (zero or negative) event types.
	var expected_cash_money: Money?
	/// The shift unique ID.
	var id: String?
	/// The time when the shift began, in ISO 8601 format.
	var opened_at: String?
	/// The amount of money in the cash drawer at the start of the shift. The amount must be greater than or equal to zero.
	var opened_cash_money: Money?
	/// The ID of the employee that started the cash drawer shift.
	var opening_employee_id: String?
	/// The shift current state. See [CashDrawerShiftState](#type-cashdrawershiftstate) for possible values
	var state: CashDrawerShiftState?
}

struct UpdateCustomerResponse: Codable {
	/// The updated customer.
	var customer: Customer?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct SearchLoyaltyRewardsRequest: Codable {
	/// A pagination cursor returned by a previous call to  this endpoint. Provide this to retrieve the next set of  results for the original query. For more information,  see [Pagination](https://developer.squareup.com/docs/docs/basics/api101/pagination).
	var cursor: String?
	/// The maximum number of results to return in the response.
	var limit: Int?
	/// The search criteria for the request.  If empty, the endpoint retrieves all loyalty rewards in the loyalty program.
	var query: SearchLoyaltyRewardsRequestLoyaltyRewardQuery?
}

struct V1Category: Codable {
	/// The category's unique ID.
	var id: String?
	/// The category's name.
	var name: String?
	/// The ID of the CatalogObject in the Connect v2 API. Objects that are shared across multiple locations share the same v2 ID.
	var v2_id: String?
}

struct V1DeleteModifierOptionRequest: Codable {
}

struct ListCatalogResponse: Codable {
	/// The pagination cursor to be used in a subsequent request. If unset, this is the final response. See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
	var cursor: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The CatalogObjects returned.
	var objects: [CatalogObject]?
}

struct V1ListCategoriesRequest: Codable {
}

struct ListEmployeesRequest: Codable {
	/// The token required to retrieve the specified page of results.
	var cursor: String?
	/// The number of employees to be returned on each page.
	var limit: Int?
	var location_id: String?
	/// Specifies the EmployeeStatus to filter the employee by. See [EmployeeStatus](#type-employeestatus) for possible values
	var status: EmployeeStatus?
}

/// Whether to the tax amount should be additional to or included in the CatalogItem price.
enum TaxInclusionType: String, Content {
	/// The tax is an additive tax. The tax amount is added on top of the CatalogItemVariation price. For example, a $1.00 item with a 10% additive tax would have a total cost to the buyer of $1.10.
	case ADDITIVE
	/// The tax is an inclusive tax. The tax amount is included in the CatalogItemVariation price. For example, a $1.00 item with a 10% inclusive tax would have a total cost to the buyer of $1.00, with $0.91 (91 cents) of that total being the cost of the item and $0.09 (9 cents) being tax.
	case INCLUSIVE
}

struct OrderReward: Codable {
	/// The identifier of the reward.
	var id: String
	/// The identifier of the reward tier corresponding to this reward.
	var reward_tier_id: String
}

struct OrderUpdatedObject: Codable {
	/// Information about the updated order.
	var order_updated: OrderUpdated?
}

struct RetrieveCustomerGroupResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The retrieved customer group.
	var group: CustomerGroup?
}

struct DeleteLoyaltyRewardRequest: Codable {
}

struct OrderPricingOptions: Codable {
	/// The option to determine whether pricing rule-based discounts are automatically applied to an order.
	var auto_apply_discounts: Bool?
	/// The option to determine whether rule-based taxes are automatically applied to an order when the criteria of the corresponding rules are met.
	var auto_apply_taxes: Bool?
}

struct RemoveGroupFromCustomerResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct CreateCustomerCardResponse: Codable {
	/// The created card on file.
	var card: Card?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct UpdateTeamMemberResponse: Codable {
	/// The errors that occurred during the request.
	var errors: [Error]?
	/// The successfully updated `TeamMember` object.
	var team_member: TeamMember?
}

struct StandardUnitDescriptionGroup: Codable {
	/// IETF language tag.
	var language_code: String?
	/// List of standard (non-custom) measurement units in this description group.
	var standard_unit_descriptions: [StandardUnitDescription]?
}

struct OrderLineItemDiscount: Codable {
	/// The total declared monetary amount of the discount.  `amount_money` is not set for percentage-based discounts.
	var amount_money: Money?
	/// The amount of discount actually applied to the line item.  Represents the amount of money applied as a line item-scoped discount. When an amount-based discount is scoped to the entire order, the value of `applied_money` is different from `amount_money` because the total amount of the discount is distributed across all line items.
	var applied_money: Money?
	/// The catalog object id referencing `CatalogDiscount`.
	var catalog_object_id: String?
	/// Application-defined data attached to this discount. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (personally identifiable information, card details, etc.).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries may also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a max length of 255 characters.  An application may have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  See [Metadata](https://developer.squareup.com/docs/build-basics/metadata) for more information.
	var metadata: String?
	/// The discount's name.
	var name: String?
	/// The percentage of the discount, as a string representation of a decimal number. A value of `7.25` corresponds to a percentage of 7.25%.  `percentage` is not set for amount-based discounts.
	var percentage: String?
	/// The object identifier of a `pricing rule` to be applied automatically to this discount. The specification and application of the discounts, to which a `pricing_rule_id` is assigned, are completely controlled by the corresponding pricing rule.
	let pricing_rule_id: String?
	/// The reward identifiers corresponding to this discount. The application and specification of discounts that have `reward_ids` are completely controlled by the backing criteria corresponding to the reward tiers of the rewards that are added to the order through the Loyalty API. To manually unapply discounts that are the result of added rewards, the rewards must be removed from the order through the Loyalty API.
	let reward_ids: [String]?
	/// Indicates the level at which the discount applies. For `ORDER` scoped discounts, Square generates references in `applied_discounts` on all order line items that do not have them. For `LINE_ITEM` scoped discounts, the discount only applies to line items with a discount reference in their `applied_discounts` field.  This field is immutable. To change the scope of a discount you must delete the discount and re-add it as a new discount. See [OrderLineItemDiscountScope](#type-orderlineitemdiscountscope) for possible values
	var scope: OrderLineItemDiscountScope?
	/// The type of the discount.  Discounts that don't reference a catalog object ID must have a type of `FIXED_PERCENTAGE` or `FIXED_AMOUNT`. See [OrderLineItemDiscountType](#type-orderlineitemdiscounttype) for possible values
	var type: OrderLineItemDiscountType?
	/// Unique ID that identifies the discount only within this order.
	var uid: String?
}

struct Subscription: Codable {
	/// The subscription cancellation date, in YYYY-MM-DD format (for example, 2013-01-15). On this date, the subscription status changes  to `CANCELED` and the subscription billing stops.  If you don't set this field, the subscription plan dictates if and  when subscription ends.   You cannot update this field, you can only clear it.
	var canceled_date: String?
	/// The ID of the `customer](#type-customer) [card` that is charged for the subscription.
	var card_id: String?
	/// The timestamp when the subscription was created, in RFC 3339 format.
	let created_at: Timestamp?
	/// The ID of the associated `customer` profile.
	let customer_id: String?
	/// The Square-assigned ID of the subscription.
	let id: String?
	/// The IDs of the `invoices` created for the  subscription, listed in order when the invoices were created  (oldest invoices appear first).
	let invoice_ids: [String]?
	/// The ID of the location associated with the subscription.
	let location_id: String?
	/// The date up to which the customer is invoiced for the subscription, in YYYY-MM-DD format (for example, 2013-01-15).  After the invoice is paid for a given billing period, this date will be the last day of the billing period. For example, suppose for the month of May a customer gets an invoice (or charged the card) on May 1. For the monthly billing scenario, this date is then set to May 31.
	let paid_until_date: String?
	/// The ID of the associated `subscription plan`.
	let plan_id: String?
	/// A custom price to apply for the subscription. If specified,  it overrides the price configured by the subscription plan.
	var price_override_money: Money?
	/// The start date of the subscription, in YYYY-MM-DD format (for example, 2013-01-15).
	let start_date: String?
	/// The current status of the subscription. See [SubscriptionStatus](#type-subscriptionstatus) for possible values
	let status: SubscriptionStatus?
	/// The tax amount applied when billing the subscription. The percentage is expressed in decimal form, using a `'.'` as the decimal separator and without a `'%'` sign. For example, a value of `7.5` corresponds to 7.5%.
	var tax_percentage: String?
	/// Timezone that will be used in date calculations for the subscription. Defaults to the timezone of the location based on `location_id`. Format: the IANA Timezone Database identifier for the location timezone (for example, `America/Los_Angeles`).
	let timezone: String?
	/// The version of the object. When updating an object, the version supplied must match the version in the database, otherwise the write will be rejected as conflicting.
	var version: Int?
}

struct CancelTerminalRefundResponse: Codable {
	/// Information on errors encountered during the request.
	var errors: [Error]?
	/// The updated `TerminalRefund`
	var refund: TerminalRefund?
}

struct TeamMemberAssignedLocations: Codable {
	/// The current assignment type of the team member. See [TeamMemberAssignedLocationsAssignmentType](#type-teammemberassignedlocationsassignmenttype) for possible values
	var assignment_type: TeamMemberAssignedLocationsAssignmentType?
	/// The locations that the team member is assigned to.
	var location_ids: [String]?
}

struct InventoryCount: Codable {
	/// A read-only timestamp in RFC 3339 format that indicates when Square received the most recent physical count or adjustment that had an affect on the estimated count.
	var calculated_at: Timestamp?
	/// The Square generated ID of the `CatalogObject` being tracked.
	var catalog_object_id: String?
	/// The `CatalogObjectType` of the `CatalogObject` being tracked. Tracking is only supported for the `ITEM_VARIATION` type.
	var catalog_object_type: String?
	/// The Square ID of the `Location` where the related quantity of items are being tracked.
	var location_id: String?
	/// The number of items affected by the estimated count as a decimal string. Can support up to 5 digits after the decimal point.
	var quantity: String?
	/// The current `InventoryState` for the related quantity of items. See [InventoryState](#type-inventorystate) for possible values
	var state: InventoryState?
}

struct CreateCheckoutRequest: Codable {
	/// The basic primitive of multi-party transaction. The value is optional. The transaction facilitated by you can be split from here.  If you provide this value, the `amount_money` value in your additional_recipients must not be more than 90% of the `total_money` calculated by Square for your order. The `location_id` must be the valid location of the app owner merchant.  This field requires `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission.  This field is currently not supported in sandbox.
	var additional_recipients: [ChargeRequestAdditionalRecipient]?
	/// If `true`, Square Checkout will collect shipping information on your behalf and store that information with the transaction information in your Square Dashboard.  Default: `false`.
	var ask_for_shipping_address: Bool?
	/// A unique string that identifies this checkout among others you've created. It can be any valid string but must be unique for every order sent to Square Checkout for a given location ID.  The idempotency key is used to avoid processing the same order more than once. If you're unsure whether a particular checkout was created successfully, you can reattempt it with the same idempotency key and all the same other parameters without worrying about creating duplicates.  We recommend using a random number/string generator native to the language you are working in to generate strings for your idempotency keys.  See the [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency) guide for more information.
	var idempotency_key: String
	/// The email address to display on the Square Checkout confirmation page and confirmation email that the buyer can use to contact the merchant.  If this value is not set, the confirmation page and email will display the primary email address associated with the merchant's Square account.  Default: none; only exists if explicitly set.
	var merchant_support_email: String?
	/// An optional note to associate with the checkout object.  This value cannot exceed 60 characters.
	var note: String?
	/// The order including line items to be checked out.
	var order: CreateOrderRequest
	/// If provided, the buyer's email is pre-populated on the checkout page as an editable text field.  Default: none; only exists if explicitly set.
	var pre_populate_buyer_email: String?
	/// If provided, the buyer's shipping info is pre-populated on the checkout page as editable text fields.  Default: none; only exists if explicitly set.
	var pre_populate_shipping_address: Address?
	/// The URL to redirect to after checkout is completed with `checkoutId`, Square's `orderId`, `transactionId`, and `referenceId` appended as URL parameters. For example, if the provided redirect_url is `http://www.example.com/order-complete`, a successful transaction redirects the customer to:  <pre><code>http://www.example.com/order-complete?checkoutId=xxxxxx&amp;orderId=xxxxxx&amp;referenceId=xxxxxx&amp;transactionId=xxxxxx</code></pre>  If you do not provide a redirect URL, Square Checkout will display an order confirmation page on your behalf; however Square strongly recommends that you provide a redirect URL so you can verify the transaction results and finalize the order through your existing/normal confirmation workflow.  Default: none; only exists if explicitly set.
	var redirect_url: String?
}

struct CustomerFilter: Codable {
	/// A filter to select customers based on when they were created.
	var created_at: TimeRange?
	/// A filter to select customers based on their creation source.
	var creation_source: CustomerCreationSourceFilter?
	/// A filter to [select customers by email address](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#search-by-email-address)  visible to the seller.  This filter is case insensitive.  For [exact matching](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#exact-search-by-email-address), this filter causes the search to return customer profiles  whose `email_address` field value are identical to the email address provided in the query.  For [fuzzy matching](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#fuzzy-search-by-email-address),  this filter causes the search to return customer profiles  whose `email_address` field value has a token-wise partial match against the filtering  expression in the query. For example, with `Steven gmail` provided in a search query, the search returns customers whose email address can be `steven.johnson&#64;gmail.com`  or `mygmail&#64;stevensbakery.com`. Email addresses are tokenized by replacing, by spaces,  punctuations including periods (`.`), underscores (`_`), and the `&#64;` symbols. A match is found if a tokenized email address contains all the tokens in the search query,  irrespective of the token order.
	var email_address: CustomerTextFilter?
	/// A filter to select customers based on their group membership.  The `group_ids` is a JSON object of the following general format: ``` "group_ids": { "any":  ["{group_a_id}", "{group_b_id}", ...], "all":  ["{group_1_id}", "{group_2_id}", ...], 'none": ["{group_i_id}", "{group_ii_id}", ...] } ```  You can use any combination of the above `group_ids` fields (also known as `FilterValue` properties)  to specify how customers are selected based on their group membership.   With the `any` option, the search returns customers in Groups `A` or `B` or ... of the list. With the `all` option, the search returns customers in Groups `1` and `2` and ... of the list. With the `none` option, the search returns customers not in Groups `i` and not in `ii` and not in ... of the list.  If any of the search conditions are not met, including when an invalid or non-existent group ID is provided, the result is an empty list.   You can use the `group_ids` search filter with other available filters.   You cannot use the `group_ids` filter to select customers based on segment membership.
	var group_ids: FilterValue?
	/// A filter to [select customers by their phone numbers](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#search-by-phone-number) visible to the seller.  This filter is case insensitive.   For [exact matching](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#exact-search-by-phone-number),  this filter causes the search to return customers whose phone number matches the specified query expression. The number in the query must be of an E.164-compliant form. In particular, it must include the leading `+` sign followed by a contry code and then a subscriber number. The standard E.614 form of a US phone number is `+12061112222` of the domestic version or `+0012061112222` of the international version. The E.164-compliant variations include `+1 (206) 111-2222` or `+001 (206) 111-2222`, respectively. To match the query expression, stored customers' phone numbers are converted to the standard E.164 form of the national and internationalized versions.   For [fuzzy matching](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#fuzzy-search-by-phone-number),  this filter causes the search to return customers whose phone number matches partially  the token or tokens provided in the query expression. For example, if the search query contains  `415-123-45`, the filter selects those customers with phone numbers of `415-123-4567` or  `234-151-2345`. The search does not return customers with the phone number of `415-123-4678`. Similarly, if the search query contains `415` as part of the phone number, the search returns those customers with phone numbers of `(415)-123-4567`, `(123) 415-1567`, and `1 (415) 123-4567`.
	var phone_number: CustomerTextFilter?
	/// A filter to [select customers by their reference IDs](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#search-by-reference-id). This filter is case insensitive.  [Exact matching](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#exact-search-by-reference-id)  of a customer's reference ID against a query's reference ID is evaluated as exact match between two strings, character by character in the given order.  [Fuzzy matching](https://developer.squareup.com/docs/docs/customers-api/cookbook/search-customers#fuzzy-search-by-reference-id) of stored reference IDs against queried reference IDs works  exactly the same as fuzzy matching on email addresses. Non-alphanumeric characters  are replaced by spaces to tokenize stored and queried reference IDs. A match is found if a tokenized stored reference ID contains all tokens specified in any order in the query. For example, a query of `NYC M` will match customer profiles with the `reference_id` value of `NYC_M_35_JOHNSON` and `NYC_27_MURRAY`.
	var reference_id: CustomerTextFilter?
	/// A filter to select customers based on when they were updated.
	var updated_at: TimeRange?
}

/// Indicates a tender's type.
enum TenderType: String, Content {
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

struct CustomerTextFilter: Codable {
	/// Use the exact filter to select customers whose attributes match exactly the specified query.
	var exact: String?
	/// Use the fuzzy filter to select customers whose attributes match the specified query  in a fuzzy manner. When the fuzzy option is used, search queries are tokenized, and then  each query token must be matched somewhere in the searched attribute. For single token queries,  this is effectively the same behavior as a partial match operation.
	var fuzzy: String?
}

struct TerminalCheckout: Codable {
	/// The amount of money (including tax amount) that the Square Terminal device should try to collect.
	var amount_money: Money
	/// Present if the status is `CANCELED`. See [ActionCancelReason](#type-actioncancelreason) for possible values
	let cancel_reason: ActionCancelReason?
	/// The time when the `TerminalCheckout` was created as an RFC 3339 timestamp.
	let created_at: Timestamp?
	/// The duration as an RFC 3339 duration, after which the checkout will be automatically canceled. TerminalCheckouts that are `PENDING` will be automatically `CANCELED` and have a cancellation reason of `TIMED_OUT`.  Default: 5 minutes from creation  Maximum: 5 minutes
	var deadline_duration: Timestamp?
	/// Options to control the display and behavior of the Square Terminal device.
	var device_options: DeviceCheckoutOptions
	/// A unique ID for this `TerminalCheckout`
	let id: String?
	/// An optional note to associate with the checkout, as well any payments used to complete the checkout.
	var note: String?
	/// A list of ids for payments created by this `TerminalCheckout`.
	let payment_ids: [String]?
	/// An optional user-defined reference ID which can be used to associate this `TerminalCheckout` to another entity in an external system. For example, an order ID generated by a third-party shopping cart. Will also be associated with any payments used to complete the checkout.
	var reference_id: String?
	/// The status of the `TerminalCheckout`. Options: `PENDING`, `IN_PROGRESS`, `CANCEL_REQUESTED`, `CANCELED`, `COMPLETED`
	let status: String?
	/// The time when the `TerminalCheckout` was last updated as an RFC 3339 timestamp.
	let updated_at: Timestamp?
}

struct AppointmentSegment: Codable {
	/// The time span in minutes of an appointment segment.
	var duration_minutes: Int
	/// The ID of the `CatalogItemVariation` object representing the service booked in this segment.
	var service_variation_id: String
	/// The current version of the item variation representing the service booked in this segment.
	var service_variation_version: Int
	/// The ID of the `TeamMember` object representing the team member booked in this segment.
	var team_member_id: String
}

struct CreateCustomerRequest: Codable {
	/// The physical address associated with the customer profile.
	var address: Address?
	/// The birthday associated with the customer profile, in RFC 3339 format. Year is optional, timezone and times are not allowed. For example: `0000-09-01T00:00:00-00:00` indicates a birthday on September 1st. `1998-09-01T00:00:00-00:00` indications a birthday on September 1st __1998__.
	var birthday: Timestamp?
	/// A business name associated with the customer profile.
	var company_name: String?
	/// The email address associated with the customer profile.
	var email_address: String?
	/// The family (i.e., last) name associated with the customer profile.
	var family_name: String?
	/// The given (i.e., first) name associated with the customer profile.
	var given_name: String?
	/// The idempotency key for the request.	See the [Idempotency](https://developer.squareup.com/docs/working-with-apis/idempotency) guide for more information.
	var idempotency_key: String?
	/// A nickname for the customer profile.
	var nickname: String?
	/// A custom note associated with the customer profile.
	var note: String?
	/// The 11-digit phone number associated with the customer profile.
	var phone_number: String?
	/// An optional, second ID used to associate the customer profile with an entity in another system.
	var reference_id: String?
}

struct CatalogModifier: Codable {
	/// The ID of the `CatalogModifierList` associated with this modifier.
	var modifier_list_id: String?
	/// The modifier name.  This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	var name: String?
	/// Determines where this `CatalogModifier` appears in the `CatalogModifierList`.
	var ordinal: Int?
	/// The modifier price.
	var price_money: Money?
}

/// Indicates how the inventory change was applied to a tracked quantity of items.
enum InventoryChangeType: String, Content {
	/// The change occurred as part of a physical count update.
	case PHYSICAL_COUNT
	/// The change occurred as part of the normal lifecycle of goods (e.g., as an inventory adjustment).
	case ADJUSTMENT
	/// The change occurred as part of an inventory transfer.
	case TRANSFER
}

struct CheckAppointmentsOnboardedResponse: Codable {
	/// Indicates whether the seller has enabled the Square Appointments service (`true`) or not (`false`).
	var appointments_onboarded: Bool?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct V1UpdateVariationRequest: Codable {
	/// An object containing the fields to POST for the request.  See the corresponding object definition for field details.
	var body: V1Variation
}

struct ShiftFilter: Codable {
	/// Fetch shifts for the specified employees. DEPRECATED at version 2020-08-26. Use `team_member_ids` instead
	var employee_ids: [String]?
	/// Fetch the `Shift`s that end in the time range - Inclusive.
	var end: TimeRange?
	/// Fetch shifts for the specified location.
	var location_ids: [String]
	/// Fetch `Shift`s that start in the time range - Inclusive.
	var start: TimeRange?
	/// Fetch a `Shift` instance by `Shift.status`. See [ShiftFilterStatus](#type-shiftfilterstatus) for possible values
	var status: ShiftFilterStatus?
	/// Fetch shifts for the specified team members. Replaced `employee_ids` at version "2020-08-26"
	var team_member_ids: [String]
	/// Fetch the `Shift`s based on workday date range.
	var workday: ShiftWorkday?
}

struct ListCashDrawerShiftEventsResponse: Codable {
	/// Opaque cursor for fetching the next page. Cursor is not present in the last page of results.
	var cursor: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// All of the events (payments, refunds, etc.) for a cash drawer during the shift.
	var events: [CashDrawerShiftEvent]?
}

struct SearchInvoicesResponse: Codable {
	/// When a response is truncated, it includes a cursor that you can use in a  subsequent request to fetch the next set of invoices. If empty, this is the final  response.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	var cursor: String?
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The list of invoices returned by the search.
	var invoices: [Invoice]?
}

struct ListSubscriptionEventsRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	var cursor: String?
	/// The upper limit on the number of subscription events to return  in the response.   Default: `200`
	var limit: Int?
}

struct UpdateItemTaxesRequest: Codable {
	/// IDs for the CatalogItems associated with the CatalogTax objects being updated.
	var item_ids: [String]
	/// IDs of the CatalogTax objects to disable.
	var taxes_to_disable: [String]?
	/// IDs of the CatalogTax objects to enable.
	var taxes_to_enable: [String]?
}

struct CatalogObject: Codable {
	/// A list of locations where the object is not present, even if `present_at_all_locations` is `true`.
	var absent_at_location_ids: [String]?
	/// The Connect v1 IDs for this object at each location where it is present, where they differ from the object's Connect V2 ID. The field will only be present for objects that have been created or modified by legacy APIs.
	var catalog_v1_ids: [CatalogV1Id]?
	/// Structured data for a `CatalogCategory`, set for CatalogObjects of type `CATEGORY`.
	var category_data: CatalogCategory?
	/// Structured data for a `CatalogCustomAttributeDefinition`, set for CatalogObjects of type `CUSTOM_ATTRIBUTE_DEFINITION`.
	var custom_attribute_definition_data: CatalogCustomAttributeDefinition?
	/// A map (key-value pairs) of application-defined custom attribute values. The value of a key-value pair is a `CatalogCustomAttributeValue` object. The key is the `key` attribute value defined in the associated `CatalogCustomAttributeDefinition` object defined by the application making the request.  If the `CatalogCustomAttributeDefinition` object is defined by another application, the `CatalogCustomAttributeDefinition`'s key attribute value is prefixed by the defining application ID. For example, if the `CatalogCustomAttributeDefinition` has a `key` attribute of `"cocoa_brand"` and the defining application ID is `"abcd1234"`, the key in the map is `"abcd1234:cocoa_brand"` if the application making the request is different from the application defining the custom attribute definition. Otherwise, the key used in the map is simply `"cocoa_brand"`.  Application-defined custom attributes that are set at a global (location-independent) level. Custom attribute values are intended to store additional information about a catalog object or associations with an entity in another system. Do not use custom attributes to store any sensitive information (personally identifiable information, card details, etc.).
	var custom_attribute_values: CatalogCustomAttributeValue?
	/// Structured data for a `CatalogDiscount`, set for CatalogObjects of type `DISCOUNT`.
	var discount_data: CatalogDiscount?
	/// An identifier to reference this object in the catalog. When a new `CatalogObject` is inserted, the client should set the id to a temporary identifier starting with a "`#`" character. Other objects being inserted or updated within the same request may use this identifier to refer to the new object.  When the server receives the new object, it will supply a unique identifier that replaces the temporary identifier for all future references.
	var id: String
	/// Structured data for a `CatalogImage`, set for CatalogObjects of type `IMAGE`.
	var image_data: CatalogImage?
	/// Identifies the `CatalogImage` attached to this `CatalogObject`.
	var image_id: String?
	/// If `true`, the object has been deleted from the database. Must be `false` for new objects being inserted. When deleted, the `updated_at` field will equal the deletion time.
	var is_deleted: Bool?
	/// Structured data for a `CatalogItem`, set for CatalogObjects of type `ITEM`.
	var item_data: CatalogItem?
	/// Structured data for a `CatalogItemOption`, set for CatalogObjects of type `ITEM_OPTION`.
	var item_option_data: CatalogItemOption?
	/// Structured data for a `CatalogItemOptionValue`, set for CatalogObjects of type `ITEM_OPTION_VAL`.
	var item_option_value_data: CatalogItemOptionValue?
	/// Structured data for a `CatalogItemVariation`, set for CatalogObjects of type `ITEM_VARIATION`.
	var item_variation_data: CatalogItemVariation?
	/// Structured data for a `CatalogMeasurementUnit`, set for CatalogObjects of type `MEASUREMENT_UNIT`.
	var measurement_unit_data: CatalogMeasurementUnit?
	/// Structured data for a `CatalogModifier`, set for CatalogObjects of type `MODIFIER`.
	var modifier_data: CatalogModifier?
	/// Structured data for a `CatalogModifierList`, set for CatalogObjects of type `MODIFIER_LIST`.
	var modifier_list_data: CatalogModifierList?
	/// If `true`, this object is present at all locations (including future locations), except where specified in the `absent_at_location_ids` field. If `false`, this object is not present at any locations (including future locations), except where specified in the `present_at_location_ids` field. If not specified, defaults to `true`.
	var present_at_all_locations: Bool?
	/// A list of locations where the object is present, even if `present_at_all_locations` is `false`.
	var present_at_location_ids: [String]?
	/// Structured data for a `CatalogPricingRule`, set for CatalogObjects of type `PRICING_RULE`. A `CatalogPricingRule` object often works with a `CatalogProductSet` object or a `CatalogTimePeriod` object.
	var pricing_rule_data: CatalogPricingRule?
	/// Structured data for a `CatalogProductSet`, set for CatalogObjects of type `PRODUCT_SET`.
	var product_set_data: CatalogProductSet?
	/// Structured data for a `CatalogQuickAmountsSettings`, set for CatalogObjects of type `QUICK_AMOUNTS_SETTINGS`.
	var quick_amounts_settings_data: CatalogQuickAmountsSettings?
	/// Structured data for a `CatalogSubscriptionPlan`, set for CatalogObjects of type `SUBSCRIPTION_PLAN`.
	var subscription_plan_data: CatalogSubscriptionPlan?
	/// Structured data for a `CatalogTax`, set for CatalogObjects of type `TAX`.
	var tax_data: CatalogTax?
	/// Structured data for a `CatalogTimePeriod`, set for CatalogObjects of type `TIME_PERIOD`.
	var time_period_data: CatalogTimePeriod?
	/// The type of this object. Each object type has expected properties expressed in a structured format within its corresponding `*_data` field below. See [CatalogObjectType](#type-catalogobjecttype) for possible values
	var type: CatalogObjectType
	/// Last modification [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates) in RFC 3339 format, e.g., `"2016-08-15T23:59:33.123Z"` would indicate the UTC time (denoted by `Z`) of August 15, 2016 at 23:59:33 and 123 milliseconds.
	let updated_at: Timestamp?
	/// The version of the object. When updating an object, the version supplied must match the version in the database, otherwise the write will be rejected as conflicting.
	var version: Int?
}

struct BusinessHoursPeriod: Codable {
	/// The day of week for this time period. See [DayOfWeek](#type-dayofweek) for possible values
	var day_of_week: DayOfWeek?
	/// The end time of a business hours period, specified in local time using partial-time RFC 3339 format.
	var end_local_time: Timestamp?
	/// The start time of a business hours period, specified in local time using partial-time RFC 3339 format.
	var start_local_time: Timestamp?
}

/// The type of the accrual rule that defines how buyers can earn points.
enum LoyaltyProgramAccrualRuleType: String, Content {
	/// A visit-based accrual rule. A buyer earns points for each visit.  You can specify the minimum purchase required.
	case VISIT
	/// A spend-based accrual rule. A buyer earns points based on the amount  spent.
	case SPEND
	/// An accrual rule based on an item variation. For example, accrue  points for purchasing a coffee.
	case ITEM_VARIATION
	/// An accrual rule based on an item category. For example, accrue points  for purchasing any item in the "hot drink" category: coffee, tea, or hot cocoa.
	case CATEGORY
}

struct V1RemoveFeeRequest: Codable {
}

struct CatalogItemOption: Codable {
	/// The item option's human-readable description. Displayed in the Square Point of Sale app for the seller and in the Online Store or on receipts for the buyer. This is a searchable attribute for use in applicable query filters.
	var description: String?
	/// The item option's display name for the customer. This is a searchable attribute for use in applicable query filters.
	var display_name: String?
	/// The item option's display name for the seller. Must be unique across all item options. This is a searchable attribute for use in applicable query filters.
	var name: String?
	/// If true, display colors for entries in `values` when present.
	var show_colors: Bool?
	/// A list of CatalogObjects containing the `CatalogItemOptionValue`s for this item.
	var values: [CatalogObject]?
}

struct CreateCustomerGroupRequest: Codable {
	/// The customer group to create.
	var group: CustomerGroup
	/// The idempotency key for the request. See the [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency) guide for more information.
	var idempotency_key: String?
}

struct CreateTerminalCheckoutResponse: Codable {
	/// The created `TerminalCheckout`
	var checkout: TerminalCheckout?
	/// Information on errors encountered during the request.
	var errors: [Error]?
}

struct DisputedPayment: Codable {
	/// Square-generated unique ID of the payment being disputed.
	var payment_id: String?
}

struct CatalogTax: Codable {
	/// If `true`, the fee applies to custom amounts entered into the Square Point of Sale app that are not associated with a particular `CatalogItem`.
	var applies_to_custom_amounts: Bool?
	/// Whether the tax is calculated based on a payment's subtotal or total. See [TaxCalculationPhase](#type-taxcalculationphase) for possible values
	var calculation_phase: TaxCalculationPhase?
	/// A Boolean flag to indicate whether the tax is displayed as enabled (`true`) in the Square Point of Sale app or not (`false`).
	var enabled: Bool?
	/// Whether the tax is `ADDITIVE` or `INCLUSIVE`. See [TaxInclusionType](#type-taxinclusiontype) for possible values
	var inclusion_type: TaxInclusionType?
	/// The tax's name. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	var name: String?
	/// The percentage of the tax in decimal form, using a `'.'` as the decimal separator and without a `'%'` sign. A value of `7.5` corresponds to 7.5%.
	var percentage: String?
}

struct RetrieveBookingRequest: Codable {
}

struct V1RetrieveBankAccountRequest: Codable {
}

struct LoyaltyEventOther: Codable {
	/// The Square-assigned ID of the `loyalty program`.
	let loyalty_program_id: String
	/// The number of points added or removed.
	var points: Int
}

struct ListWorkweekConfigsResponse: Codable {
	/// Value supplied in the subsequent request to fetch the next page of Employee Wage results.
	var cursor: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// A page of Employee Wage results.
	var workweek_configs: [WorkweekConfig]?
}

struct WorkweekConfig: Codable {
	/// A read-only timestamp in RFC 3339 format; presented in UTC
	let created_at: Timestamp?
	/// UUID for this object
	var id: String?
	/// The local time at which a business week cuts over. Represented as a string in `HH:MM` format (`HH:MM:SS` is also accepted, but seconds are truncated).
	var start_of_day_local_time: String
	/// The day of the week on which a business week cuts over for compensation purposes. See [Weekday](#type-weekday) for possible values
	var start_of_week: Weekday
	/// A read-only timestamp in RFC 3339 format; presented in UTC
	let updated_at: Timestamp?
	/// Used for resolving concurrency issues; request will fail if version provided does not match server version at time of request. If not provided, Square executes a blind write; potentially overwriting data from another write.
	var version: Int?
}

struct BulkUpdateTeamMembersRequest: Codable {
	/// The data which will be used to update the `TeamMember` objects. Each key is the `team_member_id` that maps to the `UpdateTeamMemberRequest`.
	var team_members: UpdateTeamMemberRequest
}

struct CreateRefundResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The created refund.
	var refund: Refund?
}

struct CardPaymentDetails: Codable {
	/// For EMV payments, the cryptogram generated for the payment.
	var application_cryptogram: String?
	/// For EMV payments, the application ID identifies the EMV application used for the payment.
	var application_identifier: String?
	/// For EMV payments, the human-readable name of the EMV application used for the payment.
	var application_name: String?
	/// The status code returned by the card issuer that describes the payment's authorization status.
	var auth_result_code: String?
	/// The status code returned from the Address Verification System (AVS) check. The code can be `AVS_ACCEPTED`, `AVS_REJECTED`, or `AVS_NOT_CHECKED`.
	var avs_status: String?
	/// The credit card's non-confidential details.
	var card: Card?
	/// The status code returned from the Card Verification Value (CVV) check. The code can be `CVV_ACCEPTED`, `CVV_REJECTED`, or `CVV_NOT_CHECKED`.
	var cvv_status: String?
	/// Details about the device that took the payment.
	var device_details: DeviceDetails?
	/// The method used to enter the card's details for the payment. The method can be `KEYED`, `SWIPED`, `EMV`, `ON_FILE`, or `CONTACTLESS`.
	var entry_method: String?
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// Whether the card must be physically present for the payment to be refunded.  If set to `true`, the card must be present.
	var refund_requires_card_presence: Bool?
	/// The statement description sent to the card networks.  Note: The actual statement description varies and is likely to be truncated and appended with additional information on a per issuer basis.
	var statement_description: String?
	/// The card payment's current state. The state can be AUTHORIZED, CAPTURED, VOIDED, or FAILED.
	var status: String?
	/// For EMV payments, the method used to verify the cardholder's identity. The method can be `PIN`, `SIGNATURE`, `PIN_AND_SIGNATURE`, `ON_DEVICE`, or `NONE`.
	var verification_method: String?
	/// For EMV payments, the results of the cardholder verification. The result can be `SUCCESS`, `FAILURE`, or `UNKNOWN`.
	var verification_results: String?
}

struct LoyaltyEventDeleteReward: Codable {
	/// The ID of the `loyalty program`.
	let loyalty_program_id: String
	/// The number of points returned to the loyalty account.
	let points: Int
	/// The ID of the deleted `loyalty reward`. This field is returned only if the event source is `LOYALTY_API`.
	let reward_id: String?
}

struct OrderFulfillmentRecipient: Codable {
	/// The address of the fulfillment recipient.  If provided, overrides the value pulled from the customer profile indicated by `customer_id`.
	var address: Address?
	/// The Customer ID of the customer associated with the fulfillment.  If `customer_id` is provided, the fulfillment recipient's `display_name`, `email_address`, and `phone_number` are automatically populated from the targeted customer profile. If these fields are set in the request, the request values will override the information from the customer profile. If the targeted customer profile does not contain the necessary information and these fields are left unset, the request will result in an error.
	var customer_id: String?
	/// The display name of the fulfillment recipient.  If provided, overrides the value pulled from the customer profile indicated by `customer_id`.
	var display_name: String?
	/// The email address of the fulfillment recipient.  If provided, overrides the value pulled from the customer profile indicated by `customer_id`.
	var email_address: String?
	/// The phone number of the fulfillment recipient.  If provided, overrides the value pulled from the customer profile indicated by `customer_id`.
	var phone_number: String?
}

struct V1PaymentTax: Codable {
	/// The amount of money that this tax adds to the payment.
	var applied_money: V1Money?
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The ID of the tax, if available. Taxes applied in older versions of Square Register might not have an ID.
	var fee_id: String?
	/// Whether the tax is an ADDITIVE tax or an INCLUSIVE tax. See [V1PaymentTaxInclusionType](#type-v1paymenttaxinclusiontype) for possible values
	var inclusion_type: V1PaymentTaxInclusionType?
	/// The merchant-defined name of the tax.
	var name: String?
	/// The rate of the tax, as a string representation of a decimal number. A value of 0.07 corresponds to a rate of 7%.
	var rate: String?
}

struct CatalogMeasurementUnit: Codable {
	/// Indicates the unit used to measure the quantity of a catalog item variation.
	var measurement_unit: MeasurementUnit?
	/// An integer between 0 and 5 that represents the maximum number of positions allowed after the decimal in quantities measured with this unit. For example:  - if the precision is 0, the quantity can be 1, 2, 3, etc. - if the precision is 1, the quantity can be 0.1, 0.2, etc. - if the precision is 2, the quantity can be 0.01, 0.12, etc.  Default: 3
	var precision: Int?
}

struct RetrieveInventoryCountResponse: Codable {
	/// The current calculated inventory counts for the requested object and locations.
	var counts: [InventoryCount]?
	/// The pagination cursor to be used in a subsequent request. If unset, this is the final response.  See the [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination) guide for more information.
	var cursor: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct V1ListModifierListsRequest: Codable {
}

struct GetTerminalCheckoutResponse: Codable {
	/// The requested `TerminalCheckout`
	var checkout: TerminalCheckout?
	/// Information on errors encountered during the request.
	var errors: [Error]?
}

struct TerminalCheckoutQuery: Codable {
	/// Options for filtering returned `TerminalCheckout`s
	var filter: TerminalCheckoutQueryFilter?
	/// Option for sorting returned `TerminalCheckout`s
	var sort: TerminalCheckoutQuerySort?
}

/// Specifies customer attributes as the sort key to customer profiles returned from a search.
enum CustomerSortField: String, Content {
	/// Use the default sort key. By default, customers are sorted alphanumerically by concatenating their `given_name` and `family_name`. If neither name field is set, string comparison is performed using one of the remaining fields in the following order: `company_name`, `email`, `phone_number`.
	case DEFAULT
	/// Use the creation date attribute (`created_at`) of customer profiles as the sort key.
	case CREATED_AT
}

struct TenderCardDetails: Codable {
	/// The credit card's non-confidential details.
	var card: Card?
	/// The method used to enter the card's details for the transaction. See [TenderCardDetailsEntryMethod](#type-tendercarddetailsentrymethod) for possible values
	var entry_method: TenderCardDetailsEntryMethod?
	/// The credit card payment's current state (such as `AUTHORIZED` or `CAPTURED`). See `TenderCardDetailsStatus` for possible values. See [TenderCardDetailsStatus](#type-tendercarddetailsstatus) for possible values
	var status: TenderCardDetailsStatus?
}

struct CancelTerminalCheckoutRequest: Codable {
}

struct ListCashDrawerShiftsRequest: Codable {
	/// The inclusive start time of the query on opened_at, in ISO 8601 format.
	var begin_time: String?
	/// Opaque cursor for fetching the next page of results.
	var cursor: String?
	/// The exclusive end date of the query on opened_at, in ISO 8601 format.
	var end_time: String?
	/// Number of cash drawer shift events in a page of results (200 by default, 1000 max).
	var limit: Int?
	/// The ID of the location to query for a list of cash drawer shifts.
	var location_id: String
	/// The order in which cash drawer shifts are listed in the response, based on their opened_at field. Default value: ASC See [SortOrder](#type-sortorder) for possible values
	var sort_order: SortOrder?
}

struct ObtainTokenRequest: Codable {
	/// The Square-issued ID of your application, available from the [application dashboard](https://connect.squareup.com/apps).
	var client_id: String
	/// The Square-issued application secret for your application, available from the [application dashboard](https://connect.squareup.com/apps).
	var client_secret: String
	/// The authorization code to exchange. This is required if `grant_type` is set to `authorization_code`, to indicate that the application wants to exchange an authorization code for an OAuth access token.
	var code: String?
	/// Specifies the method to request an OAuth access token. Valid values are: `authorization_code`, `refresh_token`, and `migration_token`
	var grant_type: String
	/// Legacy OAuth access token obtained using a Connect API version prior to 2019-03-13. This parameter is required if `grant_type` is set to `migration_token` to indicate that the application wants to get a replacement OAuth access token. The response also returns a refresh token. For more information, see [Migrate to Using Refresh Tokens](https://developer.squareup.com/docs/authz/oauth/migration).
	var migration_token: String?
	/// The redirect URL assigned in the [application dashboard](https://connect.squareup.com/apps).
	var redirect_uri: String?
	/// A valid refresh token for generating a new OAuth access token. A valid refresh token is required if `grant_type` is set to `refresh_token` , to indicate the application wants a replacement for an expired OAuth access token.
	var refresh_token: String?
	/// __OPTIONAL__  A JSON list of strings representing the permissions the application is requesting. For example: "`["MERCHANT_PROFILE_READ","PAYMENTS_READ","BANK_ACCOUNTS_READ"]`" The access token returned in the response is granted the permissions that comprise the intersection between the requested list of permissions, and those that belong to the provided refresh token.
	var scopes: [String]?
	/// __OPTIONAL__  A boolean indicating a request for a short-lived access token. The short-lived access token returned in the response will expire in 24 hours.
	var short_lived: Bool?
}

/// Represents a phase in the process of calculating order totals. Service charges are applied __after__ the indicated phase.  [Read more about how order totals are calculated.](https://developer.squareup.com/docs/docs/orders-api/how-it-works#how-totals-are-calculated)
enum OrderServiceChargeCalculationPhase: String, Content {
	/// The service charge will be applied after discounts, but before taxes.
	case SUBTOTAL_PHASE
	/// The service charge will be applied after all discounts and taxes are applied.
	case TOTAL_PHASE
}

struct RetrieveDisputeResponse: Codable {
	/// Details about the requested `Dispute`.
	var dispute: Dispute?
	/// Information about errors encountered during the request.
	var errors: [Error]?
}

/// 
enum CatalogDiscountModifyTaxBasis: String, Content {
	/// Application of the discount will modify the tax basis.
	case MODIFY_TAX_BASIS
	/// Application of the discount will not modify the tax basis.
	case DO_NOT_MODIFY_TAX_BASIS
}

struct ListTeamMemberBookingProfilesRequest: Codable {
	/// Indicates whether to include only bookable team members in the returned result (`true`) or not (`false`).
	var bookable_only: Bool?
	/// The cursor for paginating through the results.
	var cursor: String?
	/// The maximum number of results to return.
	var limit: Int?
	/// Indicates whether to include only team members enabled at the given location in the returned result.
	var location_id: String?
}

struct UpdateWorkweekConfigResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The response object.
	var workweek_config: WorkweekConfig?
}

/// 
enum V1FeeType: String, Content {
	/// 
	case CA_GST
	/// 
	case CA_HST
	/// 
	case CA_PST
	/// 
	case CA_QST
	/// 
	case JP_CONSUMPTION_TAX
	/// 
	case CA_PEI_PST
	/// 
	case US_SALES_TAX
	/// 
	case OTHER
}

struct CreateInvoiceResponse: Codable {
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The newly created invoice.
	var invoice: Invoice?
}

struct Order: Codable {
	/// Timestamp for when the order reached a terminal [state](#property-state). In RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z".
	let closed_at: Timestamp?
	/// Timestamp for when the order was created. In RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z".
	let created_at: Timestamp?
	/// The `Customer` ID of the customer associated with the order.
	var customer_id: String?
	/// The list of all discounts associated with the order.  Discounts can be scoped to either `ORDER` or `LINE_ITEM`. For discounts scoped to `LINE_ITEM`, an `OrderLineItemAppliedDiscount` must be added to each line item that the discount applies to. For discounts with `ORDER` scope, the server will generate an `OrderLineItemAppliedDiscount` for every line item.  __IMPORTANT__: If `LINE_ITEM` scope is set on any discounts in this field, usage of the deprecated `line_items.discounts` field will result in an error. Please use `line_items.applied_discounts` instead.
	var discounts: [OrderLineItemDiscount]?
	/// Details on order fulfillment.  Orders can only be created with at most one fulfillment. However, orders returned by the API may contain multiple fulfillments.
	var fulfillments: [OrderFulfillment]?
	/// The order's unique ID.
	let id: String?
	/// The line items included in the order.
	var line_items: [OrderLineItem]?
	/// The ID of the merchant location this order is associated with.
	var location_id: String
	/// Application-defined data attached to this order. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (personally identifiable information, card details, etc.).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries may also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a max length of 255 characters.  An application may have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  See [Metadata](https://developer.squareup.com/docs/build-basics/metadata) for more information.
	var metadata: String?
	/// Net money amounts (sale money - return money).
	let net_amounts: OrderMoneyAmounts?
	/// Pricing options for an order. The options affect how the order's price is calculated. They can be used, for example, to apply automatic price adjustments that are based on pre-configured [pricing rules](https://developer.squareup.com/docs/reference/square/objects/CatalogPricingRule).
	var pricing_options: OrderPricingOptions?
	/// A client specified identifier to associate an entity in another system with this order.
	var reference_id: String?
	/// The Refunds that are part of this Order.
	let refunds: [Refund]?
	/// Rollup of returned money amounts.
	let return_amounts: OrderMoneyAmounts?
	/// Collection of items from sale Orders being returned in this one. Normally part of an Itemized Return or Exchange.  There will be exactly one `Return` object per sale Order being referenced.
	let returns: [OrderReturn]?
	/// A set-like list of rewards that have been added to the order.
	let rewards: [OrderReward]?
	/// A positive or negative rounding adjustment to the total of the order, commonly used to apply Cash Rounding when the minimum unit of account is smaller than the lowest physical denomination of currency.
	let rounding_adjustment: OrderRoundingAdjustment?
	/// A list of service charges applied to the order.
	var service_charges: [OrderServiceCharge]?
	/// The origination details of the order.
	var source: OrderSource?
	/// The current state of the order. `OPEN`,`COMPLETED`,`CANCELED` See [OrderState](#type-orderstate) for possible values
	var state: OrderState?
	/// The list of all taxes associated with the order.  Taxes can be scoped to either `ORDER` or `LINE_ITEM`. For taxes with `LINE_ITEM` scope, an `OrderLineItemAppliedTax` must be added to each line item that the tax applies to. For taxes with `ORDER` scope, the server will generate an `OrderLineItemAppliedTax` for every line item.  On reads, each tax in the list will include the total amount of that tax applied to the order.  __IMPORTANT__: If `LINE_ITEM` scope is set on any taxes in this field, usage of the deprecated `line_items.taxes` field will result in an error. Please use `line_items.applied_taxes` instead.
	var taxes: [OrderLineItemTax]?
	/// The Tenders which were used to pay for the Order.
	let tenders: [Tender]?
	/// The total discount amount of money to collect for the order.
	let total_discount_money: Money?
	/// The total amount of money to collect for the order.
	let total_money: Money?
	/// The total amount of money collected in service charges for the order.  Note: `total_service_charge_money` is the sum of `applied_money` fields for each individual service charge. Therefore, `total_service_charge_money` will only include inclusive tax amounts, not additive tax amounts.
	let total_service_charge_money: Money?
	/// The total tax amount of money to collect for the order.
	let total_tax_money: Money?
	/// The total tip amount of money to collect for the order.
	let total_tip_money: Money?
	/// Timestamp for when the order was last updated. In RFC 3339 format, e.g., "2016-09-04T23:59:33.123Z".
	let updated_at: Timestamp?
	/// Version number which is incremented each time an update is committed to the order. Orders that were not created through the API will not include a version and thus cannot be updated.  [Read more about working with versions](https://developer.squareup.com/docs/orders-api/manage-orders#update-orders).
	var version: Int?
}

struct V1ListDiscountsResponse: Codable {
	var items: [V1Discount]?
}

/// 
enum V1ItemType: String, Content {
	/// 
	case NORMAL
	/// 
	case GIFT_CARD
	/// 
	case OTHER
}

struct ListRefundsRequest: Codable {
	/// The beginning of the requested reporting period, in RFC 3339 format.  See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.  Default value: The current time minus one year.
	var begin_time: Timestamp?
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query.  See [Paginating results](#paginatingresults) for more information.
	var cursor: String?
	/// The end of the requested reporting period, in RFC 3339 format.  See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.  Default value: The current time.
	var end_time: Timestamp?
	/// The order in which results are listed in the response (`ASC` for oldest first, `DESC` for newest first).  Default value: `DESC` See [SortOrder](#type-sortorder) for possible values
	var sort_order: SortOrder?
}

struct V1ListPaymentsRequest: Codable {
	/// A pagination cursor to retrieve the next set of results for your original query to the endpoint.
	var batch_token: String?
	/// The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year.
	var begin_time: String?
	/// The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time.
	var end_time: String?
	/// Indicates whether or not to include partial payments in the response. Partial payments will have the tenders collected so far, but the itemizations will be empty until the payment is completed.
	var include_partial: Bool?
	/// The maximum number of payments to return in a single response. This value cannot exceed 200.
	var limit: Int?
	/// The order in which payments are listed in the response. See [SortOrder](#type-sortorder) for possible values
	var order: SortOrder?
}

struct ListPaymentRefundsResponse: Codable {
	/// The pagination cursor to be used in a subsequent request. If empty, this is the final response.  For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
	var cursor: String?
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The list of requested refunds.
	var refunds: [PaymentRefund]?
}

/// Indicates the card transaction's current status.
enum TenderCardDetailsStatus: String, Content {
	/// The card transaction has been authorized but not yet captured.
	case AUTHORIZED
	/// The card transaction was authorized and subsequently captured (i.e., completed).
	case CAPTURED
	/// The card transaction was authorized and subsequently voided (i.e., canceled).
	case VOIDED
	/// The card transaction failed.
	case FAILED
}

/// DeviceCode.Status enum.
enum DeviceCodeStatus: String, Content {
	/// The status cannot be determined or does not exist.
	case UNKNOWN
	/// The device code is just created and unpaired.
	case UNPAIRED
	/// The device code has been signed in and paired to a device.
	case PAIRED
	/// The device code was unpaired and expired before it was paired.
	case EXPIRED
}

struct ListPaymentsRequest: Codable {
	/// The timestamp for the beginning of the reporting period, in RFC 3339 format. Inclusive. Default: The current time minus one year.
	var begin_time: Timestamp?
	/// The brand of the payment card (for example, VISA).
	var card_brand: String?
	/// A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query.  For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
	var cursor: String?
	/// The timestamp for the end of the reporting period, in RFC 3339 format.  Default: The current time.
	var end_time: Timestamp?
	/// The last four digits of a payment card.
	var last_4: String?
	/// The maximum number of results to be returned in a single page. It is possible to receive fewer results than the specified limit on a given page.  The default value of 100 is also the maximum allowed value. If the provided value is  greater than 100, it is ignored and the default value is used instead.  Default: `100`
	var limit: Int?
	/// Limit results to the location supplied. By default, results are returned for the default (main) location associated with the seller.
	var location_id: String?
	/// The order in which results are listed: - `ASC` - Oldest to newest. - `DESC` - Newest to oldest (default).
	var sort_order: String?
	/// The exact amount in the `total_money` for a payment.
	var total: Int?
}

struct CreateTeamMemberRequest: Codable {
	/// A unique string that identifies this CreateTeamMember request. Keys can be any valid string but must be unique for every request. See [Idempotency keys](https://developer.squareup.com/docs/basics/api101/idempotency) for more information. <br> <b>Min Length 1    Max Length 45</b>
	var idempotency_key: String?
	/// <b>Required</b> The data which will be used to create the `TeamMember` object.
	var team_member: TeamMember?
}

struct V1CashDrawerShift: Codable {
	/// The amount of money added to the cash drawer for reasons other than cash payments.
	var cash_paid_in_money: V1Money?
	/// The amount of money removed from the cash drawer for reasons other than cash refunds.
	var cash_paid_out_money: V1Money?
	/// The amount of money added to the cash drawer from cash payments.
	var cash_payment_money: V1Money?
	/// The amount of money removed from the cash drawer from cash refunds. This value is always negative or zero.
	var cash_refunds_money: V1Money?
	/// The time when the shift was closed, in ISO 8601 format.
	var closed_at: String?
	/// The amount of money found in the cash drawer at the end of the shift by an auditing employee.
	var closed_cash_money: V1Money?
	/// The ID of the employee that closed the cash drawer shift by auditing the cash drawer's contents.
	var closing_employee_id: String?
	/// A description of the cash drawer shift.
	var description: String?
	/// The device running Square Register that was connected to the cash drawer.
	var device: Device?
	/// The IDs of all employees that were logged into Square Register at some point during the cash drawer shift.
	var employee_ids: [String]?
	/// The time when the shift ended, in ISO 8601 format.
	var ended_at: String?
	/// The ID of the employee that ended the cash drawer shift.
	var ending_employee_id: String?
	/// The shift's current state. See [V1CashDrawerShiftEventType](#type-v1cashdrawershifteventtype) for possible values
	var event_type: V1CashDrawerShiftEventType?
	/// All of the events (payments, refunds, and so on) that involved the cash drawer during the shift.
	var events: [V1CashDrawerEvent]?
	/// The amount of money that should be in the cash drawer at the end of the shift, based on the shift's other money amounts.
	var expected_cash_money: V1Money?
	/// The shift's unique ID.
	var id: String?
	/// The time when the shift began, in ISO 8601 format.
	var opened_at: String?
	/// The ID of the employee that started the cash drawer shift.
	var opening_employee_id: String?
	/// The amount of money in the cash drawer at the start of the shift.
	var starting_cash_money: V1Money?
}

struct Device: Codable {
	/// The device's Square-issued ID.
	var id: String?
	/// The device's merchant-specified name.
	var name: String?
}

/// 
enum V1ItemColor: String, Content {
	case x_9da2a6 = "9da2a6"
	case x_4ab200 = "4ab200"
	case x_0b8000 = "0b8000"
	case x_2952cc = "2952cc"
	case x_a82ee5 = "a82ee5"
	case x_e5457a = "e5457a"
	case x_b21212 = "b21212"
	case x_593c00 = "593c00"
	case x_e5BF00 = "e5BF00"
}

struct V1Variation: Codable {
	/// The item variation's unique ID.
	var id: String?
	/// If the inventory quantity for the variation is less than or equal to this value and inventory_alert_type is LOW_QUANTITY, the variation displays an alert in the merchant dashboard.
	var inventory_alert_threshold: Int?
	/// Indicates whether the item variation displays an alert when its inventory quantity is less than or equal to its inventory_alert_threshold. See [V1VariationInventoryAlertType](#type-v1variationinventoryalerttype) for possible values
	var inventory_alert_type: V1VariationInventoryAlertType?
	/// The ID of the variation's associated item.
	var item_id: String?
	/// The item variation's name.
	var name: String?
	/// Indicates the variation's list position when displayed in Square Point of Sale and the merchant dashboard. If more than one variation for the same item has the same ordinal value, those variations are displayed in alphabetical order
	var ordinal: Int?
	/// The item variation's price, if any.
	var price_money: V1Money?
	/// Indicates whether the item variation's price is fixed or determined at the time of sale. See [V1VariationPricingType](#type-v1variationpricingtype) for possible values
	var pricing_type: V1VariationPricingType?
	/// The item variation's SKU, if any.
	var sku: String?
	/// If true, inventory tracking is active for the variation.
	var track_inventory: Bool?
	/// Arbitrary metadata associated with the variation. Cannot exceed 255 characters.
	var user_data: String?
	/// The ID of the CatalogObject in the Connect v2 API. Objects that are shared across multiple locations share the same v2 ID.
	var v2_id: String?
}

struct SearchLoyaltyEventsRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query. For more information, see [Pagination](https://developer.squareup.com/docs/docs/basics/api101/pagination).
	var cursor: String?
	/// The maximum number of results to include in the response.  The last page might contain fewer events.  The default is 30 events.
	var limit: Int?
	/// A set of one or more predefined query filters to apply when  searching for loyalty events. The endpoint performs a logical AND to  evaluate multiple filters and performs a logical OR on arrays   that specifies multiple field values.
	var query: LoyaltyEventQuery?
}

struct CancelTerminalRefundRequest: Codable {
}

struct DeleteCustomerResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct CreateBookingResponse: Codable {
	/// The booking that was created.
	var booking: Booking?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct RetrieveDisputeEvidenceRequest: Codable {
}

struct CustomerQuery: Codable {
	/// A list of filtering criteria.
	var filter: CustomerFilter?
	/// Sorting criteria for query results. The default behavior is to sort  customers alphabetically by `given_name` and `family_name`.
	var sort: CustomerSort?
}

struct LoyaltyEventAdjustPoints: Codable {
	/// The Square-assigned ID of the `loyalty program`.
	let loyalty_program_id: String?
	/// The number of points added or removed.
	var points: Int
	/// The reason for the adjustment of points.
	var reason: String?
}

/// The unit of length used to measure a quantity.
enum MeasurementUnitLength: String, Content {
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

struct CancelSubscriptionRequest: Codable {
}

struct V1DeleteFeeRequest: Codable {
}

struct SearchOrdersQuery: Codable {
	/// Criteria to filter results by.
	var filter: SearchOrdersFilter?
	/// Criteria to sort results by.
	var sort: SearchOrdersSort?
}

struct CancelBookingResponse: Codable {
	/// The booking that was cancelled.
	var booking: Booking?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct ListCustomerGroupsResponse: Codable {
	/// A pagination cursor to retrieve the next set of results for your original query to the endpoint. This value is present only if the request succeeded and additional results are available.  See the [Pagination guide](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
	var cursor: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// A list of customer groups belonging to the current merchant.
	var groups: [CustomerGroup]?
}

struct DeviceCheckoutOptions: Codable {
	/// The unique ID of the device intended for this `TerminalCheckout`. A list of `DeviceCode` objects can be retrieved from the /v2/devices/codes endpoint. Match a `DeviceCode.device_id` value with `device_id` to get the associated device code.
	var device_id: String
	/// Instruct the device to skip the receipt screen. Defaults to false.
	var skip_receipt_screen: Bool?
	/// Tip specific settings
	var tip_settings: TipSettings?
}

struct CatalogItemVariation: Codable {
	/// If the `CatalogItem` that owns this item variation is of type `APPOINTMENTS_SERVICE`, a bool representing whether this service is available for booking.
	var available_for_booking: Bool?
	/// If the inventory quantity for the variation is less than or equal to this value and `inventory_alert_type` is `LOW_QUANTITY`, the variation displays an alert in the merchant dashboard.  This value is always an integer.
	var inventory_alert_threshold: Int?
	/// Indicates whether the item variation displays an alert when its inventory quantity is less than or equal to its `inventory_alert_threshold`. See [InventoryAlertType](#type-inventoryalerttype) for possible values
	var inventory_alert_type: InventoryAlertType?
	/// The ID of the `CatalogItem` associated with this item variation.
	var item_id: String?
	/// List of item option values associated with this item variation. Listed in the same order as the item options of the parent item.
	var item_option_values: [CatalogItemOptionValueForItemVariation]?
	/// Per-location price and inventory overrides.
	var location_overrides: [ItemVariationLocationOverrides]?
	/// ID of the ‘CatalogMeasurementUnit’ that is used to measure the quantity sold of this item variation. If left unset, the item will be sold in whole quantities.
	var measurement_unit_id: String?
	/// The item variation's name. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	var name: String?
	/// The order in which this item variation should be displayed. This value is read-only. On writes, the ordinal for each item variation within a parent `CatalogItem` is set according to the item variations's position. On reads, the value is not guaranteed to be sequential or unique.
	let ordinal: Int?
	/// The item variation's price, if fixed pricing is used.
	var price_money: Money?
	/// Indicates whether the item variation's price is fixed or determined at the time of sale. See [CatalogPricingType](#type-catalogpricingtype) for possible values
	var pricing_type: CatalogPricingType?
	/// If the `CatalogItem` that owns this item variation is of type `APPOINTMENTS_SERVICE`, then this is the duration of the service in milliseconds. For example, a 30 minute appointment would have the value `1800000`, which is equal to 30 (minutes) * 60 (seconds per minute) * 1000 (milliseconds per second).
	var service_duration: Int?
	/// The item variation's SKU, if any. This is a searchable attribute for use in applicable query filters.
	var sku: String?
	/// Tokens of employees that can perform the service represented by this variation. Only valid for variations of type `APPOINTMENTS_SERVICE`.
	var team_member_ids: [String]?
	/// If `true`, inventory tracking is active for the variation.
	var track_inventory: Bool?
	/// The universal product code (UPC) of the item variation, if any. This is a searchable attribute for use in applicable query filters.  The value of this attribute should be a number of 12-14 digits long.  This restriction is enforced on the Square Seller Dashboard,  Square Point of Sale or Retail Point of Sale apps, where this attribute shows in the GTIN field. If a non-compliant UPC value is assigned  to this attribute using the API, the value is not editable on the Seller Dashboard, Square Point of Sale or Retail Point of Sale apps  unless it is updated to fit the expected format.
	var upc: String?
	/// Arbitrary user metadata to associate with the item variation. This attribute value length is of Unicode code points.
	var user_data: String?
}

/// Possible subscription status values.
enum SubscriptionStatus: String, Content {
	/// 
	case DEFAULT_SUBSCRIPTION_STATUS_DO_NOT_USE
	/// The subscription starts in the future.
	case PENDING
	/// The subscription is active.
	case ACTIVE
	/// The subscription is canceled.
	case CANCELED
}

struct BulkUpdateTeamMembersResponse: Codable {
	/// The errors that occurred during the request.
	var errors: [Error]?
	/// The successfully updated `TeamMember` objects. Each key is the `team_member_id` that maps to the `UpdateTeamMemberRequest`.
	var team_members: UpdateTeamMemberResponse?
}

struct CatalogTimePeriod: Codable {
	/// An iCalendar (RFC 5545) [event](https://tools.ietf.org/html/rfc5545#section-3.6.1), which specifies the name, timing, duration and recurrence of this time period.  Example:  ``` DTSTART:20190707T180000 DURATION:P2H RRULE:FREQ=WEEKLY;BYDAY=MO,WE,FR ```  Only `SUMMARY`, `DTSTART`, `DURATION` and `RRULE` fields are supported. `DTSTART` must be in local (unzoned) time format. Note that while `BEGIN:VEVENT` and `END:VEVENT` is not required in the request. The response will always include them.
	var event: String?
}

struct V1PaymentModifier: Codable {
	/// The amount of money that this modifier option adds to the payment.
	var applied_money: V1Money?
	/// TThe ID of the applied modifier option, if available. Modifier options applied in older versions of Square Register might not have an ID.
	var modifier_option_id: String?
	/// The modifier option's name.
	var name: String?
}

struct ListCustomerSegmentsRequest: Codable {
	/// A pagination cursor returned by previous calls to __ListCustomerSegments__. Used to retrieve the next set of query results.  See the [Pagination guide](https://developer.squareup.com/docs/docs/working-with-apis/pagination) for more information.
	var cursor: String?
}

struct RetrieveMerchantRequest: Codable {
}

struct CancelPaymentResponse: Codable {
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The successfully canceled `Payment` object.
	var payment: Payment?
}

/// The current state of this fulfillment.
enum OrderFulfillmentState: String, Content {
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

struct RetrieveCashDrawerShiftRequest: Codable {
	/// The ID of the location to retrieve cash drawer shifts from.
	var location_id: String
}

struct TerminalRefundQuery: Codable {
	var filter: TerminalRefundQueryFilter?
	var sort: TerminalRefundQuerySort?
}

struct OrderFulfillmentShipmentDetails: Codable {
	/// A description of why the shipment was canceled.
	var cancel_reason: String?
	/// The [timestamp](#workingwithdates) indicating the shipment was canceled. Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	var canceled_at: Timestamp?
	/// The shipping carrier being used to ship this fulfillment e.g. UPS, FedEx, USPS, etc.
	var carrier: String?
	/// The [timestamp](#workingwithdates) indicating when the shipment is expected to be delivered to the shipping carrier. Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	var expected_shipped_at: Timestamp?
	/// The [timestamp](#workingwithdates) indicating when the shipment failed to be completed. Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	let failed_at: Timestamp?
	/// A description of why the shipment failed to be completed.
	var failure_reason: String?
	/// The [timestamp](#workingwithdates) indicating when this fulfillment was moved to the `RESERVED` state. Indicates that preparation of this shipment has begun. Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	let in_progress_at: Timestamp?
	/// The [timestamp](#workingwithdates) indicating when this fulfillment was moved to the `PREPARED` state. Indicates that the fulfillment is packaged. Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	let packaged_at: Timestamp?
	/// The [timestamp](#workingwithdates) indicating when the shipment was requested. Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	let placed_at: Timestamp?
	/// Information on the person meant to receive this shipment fulfillment.
	var recipient: OrderFulfillmentRecipient?
	/// The [timestamp](#workingwithdates) indicating when this fulfillment was moved to the `COMPLETED`state. Indicates that the fulfillment has been given to the shipping carrier. Must be in RFC 3339 timestamp format, e.g., "2016-09-04T23:59:33.123Z".
	let shipped_at: Timestamp?
	/// A note with additional information for the shipping carrier.
	var shipping_note: String?
	/// A description of the type of shipping product purchased from the carrier. e.g. First Class, Priority, Express
	var shipping_type: String?
	/// The reference number provided by the carrier to track the shipment's progress.
	var tracking_number: String?
	/// A link to the tracking webpage on the carrier's website.
	var tracking_url: String?
}

/// Defines the logic used to apply a workday filter.
enum ShiftWorkdayMatcher: String, Content {
	/// All shifts that start on or after the specified workday
	case START_AT
	/// All shifts that end on or before the specified workday
	case END_AT
	/// All shifts that start between the start and end workdays (inclusive)
	case INTERSECTION
}

struct SearchAvailabilityRequest: Codable {
	/// Query conditions used to filter results.
	var query: SearchAvailabilityQuery
}

struct CatalogCustomAttributeDefinitionNumberConfig: Codable {
	/// An integer between 0 and 5 that represents the maximum number of positions allowed after the decimal in number custom attribute values For example:  - if the precision is 0, the quantity can be 1, 2, 3, etc. - if the precision is 1, the quantity can be 0.1, 0.2, etc. - if the precision is 2, the quantity can be 0.01, 0.12, etc.  Default: 5
	var precision: Int?
}

struct CatalogCustomAttributeValue: Codable {
	/// A `true` or `false` value. Populated if `type` = `BOOLEAN`.
	var boolean_value: Bool?
	/// __Read-only.__ The id of the `CatalogCustomAttributeDefinition` this value belongs to.
	let custom_attribute_definition_id: String?
	/// __Read-only.__ A copy of key from the associated `CatalogCustomAttributeDefinition`.
	let key: String?
	/// The name of the custom attribute.
	var name: String?
	/// Populated if `type` = `NUMBER`. Contains a string representation of a decimal number, using a `.` as the decimal separator.
	var number_value: String?
	/// One or more choices from `allowed_selections`. Populated if `type` = `SELECTION`.
	var selection_uid_values: [String]?
	/// The string value of the custom attribute.  Populated if `type` = `STRING`.
	var string_value: String?
	/// __Read-only.__ A copy of type from the associated `CatalogCustomAttributeDefinition`. See [CatalogCustomAttributeDefinitionType](#type-catalogcustomattributedefinitiontype) for possible values
	let type: CatalogCustomAttributeDefinitionType?
}

struct CatalogCustomAttributeDefinitionStringConfig: Codable {
	/// If true, each Custom Attribute instance associated with this Custom Attribute Definition must have a unique value within the seller's catalog. For example, this may be used for a value like a SKU that should not be duplicated within a seller's catalog. May not be modified after the definition has been created.
	var enforce_uniqueness: Bool?
}

struct ListInvoicesResponse: Codable {
	/// When a response is truncated, it includes a cursor that you can use in a  subsequent request to fetch the next set of invoices. If empty, this is the final  response.  For more information, see [Pagination](https://developer.squareup.com/docs/docs/working-with-apis/pagination).
	var cursor: String?
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The invoices retrieved.
	var invoices: [Invoice]?
}

struct ChargeRequestAdditionalRecipient: Codable {
	/// The amount of money distributed to the recipient.
	var amount_money: Money
	/// The description of the additional recipient.
	var description: String
	/// The location ID for a recipient (other than the merchant) receiving a portion of the tender.
	var location_id: String
}

struct BreakType: Codable {
	/// A human-readable name for this type of break. Will be displayed to employees in Square products.
	var break_name: String
	/// A read-only timestamp in RFC 3339 format.
	let created_at: Timestamp?
	/// Format: RFC-3339 P[n]Y[n]M[n]DT[n]H[n]M[n]S. The expected length of this break. Precision below minutes is truncated.
	var expected_duration: Timestamp
	/// UUID for this object.
	var id: String?
	/// Whether this break counts towards time worked for compensation purposes.
	var is_paid: Bool
	/// The ID of the business location this type of break applies to.
	var location_id: String
	/// A read-only timestamp in RFC 3339 format.
	let updated_at: Timestamp?
	/// Used for resolving concurrency issues; request will fail if version provided does not match server version at time of request. If a value is not provided, Square's servers execute a "blind" write; potentially overwriting another writer's data.
	var version: Int?
}

struct ListPaymentRefundsRequest: Codable {
	/// The timestamp for the beginning of the requested reporting period, in RFC 3339 format.  Default: The current time minus one year.
	var begin_time: Timestamp?
	/// A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query.  For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
	var cursor: String?
	/// The timestamp for the end of the requested reporting period, in RFC 3339 format.  Default: The current time.
	var end_time: Timestamp?
	/// The maximum number of results to be returned in a single page.  It is possible to receive fewer results than the specified limit on a given page.  If the supplied value is greater than 100, no more than 100 results are returned.  Default: 100
	var limit: Int?
	/// Limit results to the location supplied. By default, results are returned for all locations associated with the seller.
	var location_id: String?
	/// The order in which results are listed: - `ASC` - Oldest to newest. - `DESC` - Newest to oldest (default).
	var sort_order: String?
	/// If provided, only refunds with the given source type are returned. - `CARD` - List refunds only for payments where `CARD` was specified as the payment source.  Default: If omitted, refunds are returned regardless of the source type.
	var source_type: String?
	/// If provided, only refunds with the given status are returned. For a list of refund status values, see `PaymentRefund`.  Default: If omitted, refunds are returned regardless of their status.
	var status: String?
}

struct InventoryChange: Codable {
	/// Contains details about the inventory adjustment when `type` is `ADJUSTMENT` and unset for all other types.
	var adjustment: InventoryAdjustment?
	/// Contains details about the physical count when `type` is `PHYSICAL_COUNT` and unset for all other types.
	var physical_count: InventoryPhysicalCount?
	/// Contains details about the inventory transfer when `type` is `TRANSFER` and unset for all other types.  _Note:_ An `InventoryTransfer` object is read-only and can only be present in a `RetrieveInventoryChangesResponse` and `BatchRetrieveInventoryChangesResponse` object.
	var transfer: InventoryTransfer?
	/// Indicates how the inventory change was applied. See `InventoryChangeType` for all possible values. See [InventoryChangeType](#type-inventorychangetype) for possible values
	var type: InventoryChangeType?
}

struct SearchCatalogObjectsRequest: Codable {
	/// Return objects modified after this [timestamp](https://developer.squareup.com/docs/build-basics/working-with-dates), in RFC 3339 format, e.g., `2016-09-04T23:59:33.123Z`. The timestamp is exclusive - objects with a timestamp equal to `begin_time` will not be included in the response.
	var begin_time: Timestamp?
	/// The pagination cursor returned in the previous response. Leave unset for an initial request. See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
	var cursor: String?
	/// If `true`, deleted objects will be included in the results. Deleted objects will have their `is_deleted` field set to `true`.
	var include_deleted_objects: Bool?
	/// If `true`, the response will include additional objects that are related to the requested object, as follows:  If a CatalogItem is returned in the object field of the response, its associated CatalogCategory, CatalogTax objects, CatalogImage objects and CatalogModifierList objects will be included in the `related_objects` field of the response.  If a CatalogItemVariation is returned in the object field of the response, its parent CatalogItem will be included in the `related_objects` field of the response.
	var include_related_objects: Bool?
	/// A limit on the number of results to be returned in a single page. The limit is advisory - the implementation may return more or fewer results. If the supplied limit is negative, zero, or is higher than the maximum limit of 1,000, it will be ignored.
	var limit: Int?
	/// The desired set of object types to appear in the search results. See [CatalogObjectType](#type-catalogobjecttype) for possible values
	var object_types: CatalogObjectType?
	/// A query to be used to filter or sort the results. If no query is specified, the entire catalog will be returned.
	var query: CatalogQuery?
}

struct V1ApplyModifierListRequest: Codable {
}

struct PaymentRefund: Codable {
	/// The amount of money refunded. This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents).
	var amount_money: Money
	/// The amount of money the application developer contributed to help cover the refunded amount. This amount is specified in the smallest denomination of the applicable currency (for example, US dollar amounts are specified in cents). For more information, see [Working with Monetary Amounts](https://developer.squareup.com/docs/build-basics/working-with-monetary-amounts).
	var app_fee_money: Money?
	/// The timestamp of when the refund was created, in RFC 3339 format.
	let created_at: Timestamp?
	/// The unique ID for this refund, generated by Square.
	var id: String
	/// The location ID associated with the payment this refund is attached to.
	var location_id: String?
	/// The ID of the order associated with the refund.
	var order_id: String?
	/// The ID of the payment assocated with this refund.
	var payment_id: String?
	/// Processing fees and fee adjustments assessed by Square for this refund.
	var processing_fee: [ProcessingFee]?
	/// The reason for the refund.
	var reason: String?
	/// The refund's status: - `PENDING` - Awaiting approval. - `COMPLETED` - Successfully completed. - `REJECTED` - The refund was rejected. - `FAILED` - An error occurred.
	var status: String?
	/// The timestamp of when the refund was last updated, in RFC 3339 format.
	let updated_at: Timestamp?
}

struct ListMerchantsRequest: Codable {
	/// The cursor generated by the previous response.
	var cursor: Int?
}

struct UpdateCustomerGroupResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The successfully updated customer group.
	var group: CustomerGroup?
}

struct LoyaltyEventExpirePoints: Codable {
	/// The Square-assigned ID of the `loyalty program`.
	let loyalty_program_id: String
	/// The number of points expired.
	var points: Int
}

/// 
enum ActionCancelReason: String, Content {
	/// A person canceled the `TerminalCheckout` from a Square device.
	case BUYER_CANCELED
	/// A client canceled the `TerminalCheckout` using the API.
	case SELLER_CANCELED
	/// The `TerminalCheckout` timed out (see `deadline_duration` on the `TerminalCheckout`).
	case TIMED_OUT
}

struct RetrieveCustomerSegmentResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The retrieved customer segment.
	var segment: CustomerSegment?
}

struct DeviceCode: Codable {
	/// The unique code that can be used to login.
	let code: String?
	/// When this DeviceCode was created. Timestamp in RFC 3339 format.
	let created_at: Timestamp?
	/// The unique id of the device that used this code. Populated when the device is paired up.
	let device_id: String?
	/// The unique id for this device code.
	let id: String?
	/// The location assigned to this code.
	var location_id: String?
	/// An optional user-defined name for the device code.
	var name: String?
	/// When this DeviceCode will expire and no longer login. Timestamp in RFC 3339 format.
	let pair_by: Timestamp?
	/// When this DeviceCode was paired. Timestamp in RFC 3339 format.
	let paired_at: Timestamp?
	/// The targeting product type of the device code. See [ProductType](#type-producttype) for possible values
	var product_type: ProductType
	/// The pairing status of the device code. See [DeviceCodeStatus](#type-devicecodestatus) for possible values
	let status: DeviceCodeStatus?
	/// When this DeviceCode's status was last changed. Timestamp in RFC 3339 format.
	let status_changed_at: Timestamp?
}

/// Unit of time used to measure a quantity (a duration).
enum MeasurementUnitTime: String, Content {
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

struct SearchOrdersCustomerFilter: Codable {
	/// List of customer IDs to filter by.  Max: 10 customer IDs.
	var customer_ids: [String]?
}

struct SearchTerminalCheckoutsRequest: Codable {
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for the original query. See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
	var cursor: String?
	/// Limit the number of results returned for a single request.
	var limit: Int?
	/// Queries terminal checkouts based on given conditions and sort order. Leaving this unset will return all checkouts with the default sort order.
	var query: TerminalCheckoutQuery?
}

struct V1RetrieveTimecardRequest: Codable {
}

/// 
enum V1OrderHistoryEntryAction: String, Content {
	/// 
	case ORDER_PLACED
	/// 
	case DECLINED
	/// 
	case PAYMENT_RECEIVED
	/// 
	case CANCELED
	/// 
	case COMPLETED
	/// 
	case REFUNDED
	/// 
	case EXPIRED
}

struct CatalogInfoResponseLimits: Codable {
	/// The maximum number of object IDs that may be included in a single `/v2/catalog/batch-delete` request.
	var batch_delete_max_object_ids: Int?
	/// The maximum number of object IDs that may appear in a `/v2/catalog/batch-retrieve` request.
	var batch_retrieve_max_object_ids: Int?
	/// The maximum number of objects that may appear within a single batch in a `/v2/catalog/batch-upsert` request.
	var batch_upsert_max_objects_per_batch: Int?
	/// The maximum number of objects that may appear across all batches in a `/v2/catalog/batch-upsert` request.
	var batch_upsert_max_total_objects: Int?
	/// The maximum number of results that may be returned in a page of a `/v2/catalog/search` response.
	var search_max_page_limit: Int?
	/// The maximum number of item IDs that may be included in a single `/v2/catalog/update-item-modifier-lists` request.
	var update_item_modifier_lists_max_item_ids: Int?
	/// The maximum number of modifier list IDs to be disabled that may be included in a single `/v2/catalog/update-item-modifier-lists` request.
	var update_item_modifier_lists_max_modifier_lists_to_disable: Int?
	/// The maximum number of modifier list IDs to be enabled that may be included in a single `/v2/catalog/update-item-modifier-lists` request.
	var update_item_modifier_lists_max_modifier_lists_to_enable: Int?
	/// The maximum number of item IDs that may be included in a single `/v2/catalog/update-item-taxes` request.
	var update_item_taxes_max_item_ids: Int?
	/// The maximum number of tax IDs to be disabled that may be included in a single `/v2/catalog/update-item-taxes` request.
	var update_item_taxes_max_taxes_to_disable: Int?
	/// The maximum number of tax IDs to be enabled that may be included in a single `/v2/catalog/update-item-taxes` request.
	var update_item_taxes_max_taxes_to_enable: Int?
}

struct BatchRetrieveCatalogObjectsRequest: Codable {
	/// The specific version of the catalog objects to be included in the response.  This allows you to retrieve historical versions of objects. The specified version value is matched against the `CatalogObject`s' `version` attribute.
	var catalog_version: Int?
	/// If `true`, the response will include additional objects that are related to the requested objects, as follows:  If the `objects` field of the response contains a CatalogItem, its associated CatalogCategory objects, CatalogTax objects, CatalogImage objects and CatalogModifierLists will be returned in the `related_objects` field of the response. If the `objects` field of the response contains a CatalogItemVariation, its parent CatalogItem will be returned in the `related_objects` field of the response.
	var include_related_objects: Bool?
	/// The IDs of the CatalogObjects to be retrieved.
	var object_ids: [String]
}

struct V1Refund: Codable {
	/// The time when the merchant initiated the refund for Square to process, in ISO 8601 format.
	var created_at: String?
	/// Indicates whether or not the refund is associated with an exchange. If is_exchange is true, the refund reflects the value of goods returned in the exchange not the total money refunded.
	var is_exchange: Bool?
	var merchant_id: String?
	/// A Square-issued ID associated with the refund. For single-tender refunds, payment_id is the ID of the original payment ID. For split-tender refunds, payment_id is the ID of the original tender. For exchange-based refunds (is_exchange == true), payment_id is the ID of the original payment ID even if the payment includes other tenders.
	var payment_id: String?
	/// The time when Square processed the refund on behalf of the merchant, in ISO 8601 format.
	var processed_at: String?
	/// The merchant-specified reason for the refund.
	var reason: String?
	/// All of the additive taxes associated with the refund.
	var refunded_additive_tax: [V1PaymentTax]?
	/// The amount of additive tax money refunded. This amount is always negative.
	var refunded_additive_tax_money: V1Money?
	/// The amount of discount money refunded. This amount is always positive.
	var refunded_discount_money: V1Money?
	/// All of the inclusive taxes associated with the refund.
	var refunded_inclusive_tax: [V1PaymentTax]?
	/// The amount of inclusive tax money refunded. This amount is always negative.
	var refunded_inclusive_tax_money: V1Money?
	/// The amount of money refunded. This amount is always negative.
	var refunded_money: V1Money?
	/// The amount of processing fee money refunded. This amount is always positive.
	var refunded_processing_fee_money: V1Money?
	/// The amount of surcharge money refunded. This amount is always negative.
	var refunded_surcharge_money: V1Money?
	/// A list of all surcharges associated with the refund.
	var refunded_surcharges: [V1PaymentSurcharge]?
	/// The total amount of tax money refunded. This amount is always negative.
	var refunded_tax_money: V1Money?
	/// The amount of tip money refunded. This amount is always negative.
	var refunded_tip_money: V1Money?
	/// The type of refund See [V1RefundType](#type-v1refundtype) for possible values
	var type: V1RefundType?
}

struct RetrieveObsMigrationProfileResponse: Codable {
	/// The text of the label of the CTA button beneath the banner.
	var banner_cta_text: String?
	/// The URL to link to when the CTA button is clicked.
	var banner_cta_url: String?
	/// Indicates whether the seller has enabled the COVID banner (`true`) or not (`false`).
	var banner_enabled: Bool?
	/// The text appearing on the COVID banner.
	var banner_text: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct SearchLoyaltyRewardsResponse: Codable {
	/// The pagination cursor to be used in a subsequent  request. If empty, this is the final response.
	var cursor: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The loyalty rewards that satisfy the search criteria. These are returned in descending order by `updated_at`.
	var rewards: [LoyaltyReward]?
}

struct Money: Codable {
	/// The amount of money, in the smallest denomination of the currency indicated by `currency`. For example, when `currency` is `USD`, `amount` is in cents. Monetary amounts can be positive or negative. See the specific field description to determine the meaning of the sign in a particular case.
	var amount: Int?
	/// The type of currency, in __ISO 4217 format__. For example, the currency code for US dollars is `USD`.  See `Currency` for possible values. See [Currency](#type-currency) for possible values
	var currency: Currency?
}

/// The type of fulfillment.
enum OrderFulfillmentType: String, Content {
	/// A fulfillment to be picked up from a physical `location` by a recipient.
	case PICKUP
	/// A fulfillment to be shipped by a shipping carrier.
	case SHIPMENT
}

struct SearchOrdersFilter: Codable {
	/// Filter by customers associated with the order.
	var customer_filter: SearchOrdersCustomerFilter?
	/// Filter for results within a time range.  __Important:__ If you filter for orders by time range, you must set SearchOrdersSort to sort by the same field. [Learn more about filtering orders by time range](https://developer.squareup.com/docs/orders-api/manage-orders#important-note-on-filtering-orders-by-time-range)
	var date_time_filter: SearchOrdersDateTimeFilter?
	/// Filter by fulfillment type or state.
	var fulfillment_filter: SearchOrdersFulfillmentFilter?
	/// Filter by source of order.
	var source_filter: SearchOrdersSourceFilter?
	/// Filter by ``OrderState``.
	var state_filter: SearchOrdersStateFilter?
}

struct GetTeamMemberWageRequest: Codable {
}

struct RetrieveInventoryPhysicalCountResponse: Codable {
	/// The requested `InventoryPhysicalCount`.
	var count: InventoryPhysicalCount?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct V1Settlement: Codable {
	/// The Square-issued unique identifier for the bank account associated with the settlement.
	var bank_account_id: String?
	/// The entries included in this settlement.
	var entries: [V1SettlementEntry]?
	/// The settlement's unique identifier.
	var id: String?
	/// The time when the settlement was submitted for deposit or withdrawal, in ISO 8601 format.
	var initiated_at: String?
	/// The settlement's current status. See [V1SettlementStatus](#type-v1settlementstatus) for possible values
	var status: V1SettlementStatus?
	/// The amount of money involved in the settlement. A positive amount indicates a deposit, and a negative amount indicates a withdrawal. This amount is never zero.
	var total_money: V1Money?
}

struct GetBreakTypeRequest: Codable {
}

struct CreateLocationResponse: Codable {
	/// Information on errors encountered during the request.
	var errors: [Error]?
	/// The newly created `Location`.
	var location: Location?
}

struct Transaction: Codable {
	/// If the transaction was created in the Square Point of Sale app, this value is the ID generated for the transaction by Square Point of Sale.  This ID has no relationship to the transaction's canonical `id`, which is generated by Square's backend servers. This value is generated for bookkeeping purposes, in case the transaction cannot immediately be completed (for example, if the transaction is processed in offline mode).  It is not currently possible with the Connect API to perform a transaction lookup by this value.
	var client_id: String?
	/// The timestamp for when the transaction was created, in RFC 3339 format.
	var created_at: Timestamp?
	/// The transaction's unique ID, issued by Square payments servers.
	var id: String?
	/// The ID of the transaction's associated location.
	var location_id: String?
	/// The order_id is an identifier for the order associated with this transaction, if any.
	var order_id: String?
	/// The Square product that processed the transaction. See [TransactionProduct](#type-transactionproduct) for possible values
	var product: TransactionProduct?
	/// If the transaction was created with the `Charge` endpoint, this value is the same as the value provided for the `reference_id` parameter in the request to that endpoint. Otherwise, it is not set.
	var reference_id: String?
	/// Refunds that have been applied to any tender in the transaction.
	var refunds: [Refund]?
	/// The shipping address provided in the request, if any.
	var shipping_address: Address?
	/// The tenders used to pay in the transaction.
	var tenders: [Tender]?
}

struct GetBreakTypeResponse: Codable {
	/// The response object.
	var break_type: BreakType?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct CatalogInfoResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// Limits that apply to this API.
	var limits: CatalogInfoResponseLimits?
	/// Names and abbreviations for standard units.
	var standard_unit_description_group: StandardUnitDescriptionGroup?
}

/// Enumerates the possible status of a `Shift`
enum ShiftStatus: String, Content {
	/// Employee started a work shift and the shift is not complete
	case OPEN
	/// Employee started and ended a work shift.
	case CLOSED
}

struct RefundPaymentResponse: Codable {
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The successfully created `PaymentRefund`.
	var refund: PaymentRefund?
}

struct CustomerPreferences: Codable {
	/// The customer has unsubscribed from receiving marketing campaign emails.
	var email_unsubscribed: Bool?
}

struct SearchTerminalCheckoutsResponse: Codable {
	/// The requested search result of `TerminalCheckout`s.
	var checkouts: [TerminalCheckout]?
	/// The pagination cursor to be used in a subsequent request. If empty, this is the final response.  See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
	var cursor: String?
	/// Information on errors encountered during the request.
	var errors: [Error]?
}

struct V1ListDiscountsRequest: Codable {
}

/// 
enum RiskEvaluationRiskLevel: String, Content {
	/// Indicates Square is still evaluating the payment.
	case PENDING
	/// Indicates payment risk is within the normal range.
	case NORMAL
	/// Indicates elevated risk level associated with the payment.
	case MODERATE
	/// Indicates significantly elevated risk level with the payment.
	case HIGH
}

struct RetrieveLocationRequest: Codable {
}

/// 
enum V1VariationInventoryAlertType: String, Content {
	/// 
	case LOW_QUANTITY
	/// 
	case NONE
	/// 
	case INVESTMENT
	/// 
	case LOAN
	/// 
	case SAVINGS
	/// 
	case OTHER
}

struct UpdateLocationResponse: Codable {
	/// Information on errors encountered during the request.
	var errors: [Error]?
	/// The updated `Location`.
	var location: Location?
}

/// 
enum V1PaymentSurchargeType: String, Content {
	/// 
	case UNKNOWN
	/// 
	case AUTO_GRATUITY
	/// 
	case CUSTOM
}

struct InvoiceRecipient: Codable {
	/// The recipient's physical address.
	let address: Address?
	/// The name of the recipient's company.
	let company_name: String?
	/// The ID of the customer. This is the customer profile ID that  you provide when creating a draft invoice.
	var customer_id: String?
	/// The recipient's email address.
	let email_address: String?
	/// The recipient's family (that is, last) name.
	let family_name: String?
	/// The recipient's given (that is, first) name.
	let given_name: String?
	/// The recipient's phone number.
	let phone_number: String?
}

struct OrderReturn: Codable {
	/// Aggregate monetary value being returned by this Return entry.
	var return_amounts: OrderMoneyAmounts?
	/// Collection of references to discounts being returned for an order, including the total applied discount amount to be returned. The discounts must reference a top-level discount ID from the source order.
	var return_discounts: [OrderReturnDiscount]?
	/// Collection of line items which are being returned.
	var return_line_items: [OrderReturnLineItem]?
	/// Collection of service charges which are being returned.
	let return_service_charges: [OrderReturnServiceCharge]?
	/// Collection of references to taxes being returned for an order, including the total applied tax amount to be returned. The taxes must reference a top-level tax ID from the source order.
	var return_taxes: [OrderReturnTax]?
	/// A positive or negative rounding adjustment to the total value being returned. Commonly used to apply Cash Rounding when the minimum unit of account is smaller than the lowest physical denomination of currency.
	var rounding_adjustment: OrderRoundingAdjustment?
	/// Order which contains the original sale of these returned line items. This will be unset for unlinked returns.
	var source_order_id: String?
	/// Unique ID that identifies the return only within this order.
	var uid: String?
}

/// Indicates the state of a tracked item quantity in the lifecycle of goods.
enum InventoryState: String, Content {
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

struct GetInvoiceResponse: Codable {
	/// Information about errors encountered during the request.
	var errors: [Error]?
	/// The invoice requested.
	var invoice: Invoice?
}

struct CatalogQueryExact: Codable {
	/// The name of the attribute to be searched. Matching of the attribute name is exact.
	var attribute_name: String
	/// The desired value of the search attribute. Matching of the attribute value is case insensitive and can be partial. For example, if a specified value of "sma", objects with the named attribute value of "Small", "small" are both matched.
	var attribute_value: String
}

struct V1ListRefundsRequest: Codable {
	/// A pagination cursor to retrieve the next set of results for your original query to the endpoint.
	var batch_token: String?
	/// The beginning of the requested reporting period, in ISO 8601 format. If this value is before January 1, 2013 (2013-01-01T00:00:00Z), this endpoint returns an error. Default value: The current time minus one year.
	var begin_time: String?
	/// The end of the requested reporting period, in ISO 8601 format. If this value is more than one year greater than begin_time, this endpoint returns an error. Default value: The current time.
	var end_time: String?
	/// The approximate number of refunds to return in a single response. Default: 100. Max: 200. Response may contain more results than the prescribed limit when refunds are made simultaneously to multiple tenders in a payment or when refunds are generated in an exchange to account for the value of returned goods.
	var limit: Int?
	/// TThe order in which payments are listed in the response. See [SortOrder](#type-sortorder) for possible values
	var order: SortOrder?
}

struct CustomerSort: Codable {
	///  Use one or more customer attributes as the sort key to sort searched customer profiles.  For example, use creation date (`created_at`) of customers or default attributes as the sort key.   Default: `DEFAULT`. See [CustomerSortField](#type-customersortfield) for possible values
	var field: CustomerSortField?
	/// Indicates the order in which results should be sorted based on the sort field value. Strings use standard alphabetic comparison to determine order. Strings representing numbers are sorted as strings.  Default: `ASC`. See [SortOrder](#type-sortorder) for possible values
	var order: SortOrder?
}

struct CatalogQueryItemsForTax: Codable {
	/// A set of `CatalogTax` IDs to be used to find associated `CatalogItem`s.
	var tax_ids: [String]
}

struct SearchTeamMembersFilter: Codable {
	/// When present, filter by team members assigned to the specified locations. When empty, include team members assigned to any location.
	var location_ids: [String]?
	/// When present, filter by team members who match the given status. When empty, include team members of all statuses. See [TeamMemberStatus](#type-teammemberstatus) for possible values
	var status: TeamMemberStatus?
}

struct CreateLoyaltyRewardResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The loyalty reward created.
	var reward: LoyaltyReward?
}

struct ListDisputeEvidenceRequest: Codable {
}

struct CreateBookingRequest: Codable {
	/// The details of the booking to be created.
	var booking: Booking
	/// A unique key to make this request an idempotent operation.
	var idempotency_key: String?
}

struct ListCashDrawerShiftsResponse: Codable {
	/// Opaque cursor for fetching the next page of results. Cursor is not present in the last page of results.
	var cursor: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// A collection of CashDrawerShiftSummary objects for shifts that match the query.
	var items: [CashDrawerShiftSummary]?
}

struct ListCustomersResponse: Codable {
	/// A pagination cursor to retrieve the next set of results for the original query. Only present if the request succeeded and additional results are available.  See the [Pagination guide](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
	var cursor: String?
	/// An array of `Customer` objects that match the provided query.
	var customers: [Customer]?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct LoyaltyEventDateTimeFilter: Codable {
	/// The `created_at` date time range used to filter the result.
	var created_at: TimeRange
}

struct CancelPaymentByIdempotencyKeyResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct AccumulateLoyaltyPointsRequest: Codable {
	/// The points to add to the account.  If you are using the Orders API to manage orders, you   specify the order ID. Otherwise, specify the  points to add.
	var accumulate_points: LoyaltyEventAccumulatePoints
	/// A unique string that identifies the `AccumulateLoyaltyPoints` request.  Keys can be any valid string but must be unique for every request.
	var idempotency_key: String
	/// The `location` where the purchase was made.
	var location_id: String
}

/// Indicates whether this is a line item or order level discount.
enum OrderLineItemDiscountScope: String, Content {
	/// Used for reporting only. The original transaction discount scope is currently not supported by the API.
	case OTHER_DISCOUNT_SCOPE
	/// The discount should be applied to only line items specified by `OrderLineItemAppliedDiscount` reference records.
	case LINE_ITEM
	/// The discount should be applied to the entire order.
	case ORDER
}

struct V1Order: Codable {
	/// For Bitcoin transactions, the price of the buyer's order in satoshi (100 million satoshi equals 1 BTC).
	var btc_price_satoshi: Float?
	/// For Bitcoin transactions, the address that the buyer sent Bitcoin to.
	var btc_receive_address: String?
	/// The email address of the order's buyer.
	var buyer_email: String?
	/// A note provided by the buyer when the order was created, if any.
	var buyer_note: String?
	/// A note provided by the merchant when the order's state was set to CANCELED, if any.
	var canceled_note: String?
	/// A note provided by the merchant when the order's state was set to COMPLETED, if any
	var completed_note: String?
	/// The time when the order was created, in ISO 8601 format.
	var created_at: String?
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The time when the order expires if no action is taken, in ISO 8601 format.
	var expires_at: String?
	/// The order's unique identifier.
	var id: String?
	/// The history of actions associated with the order.
	var order_history: [V1OrderHistoryEntry]?
	/// The unique identifier of the payment associated with the order.
	var payment_id: String?
	/// The promo code provided by the buyer, if any.
	var promo_code: String?
	/// The name of the order's buyer.
	var recipient_name: String?
	/// The phone number to use for the order's delivery.
	var recipient_phone_number: String?
	/// A note provided by the merchant when the order's state was set to REFUNDED, if any.
	var refunded_note: String?
	/// The address to ship the order to.
	var shipping_address: Address?
	/// Whether the tax is an ADDITIVE tax or an INCLUSIVE tax. See [V1OrderState](#type-v1orderstate) for possible values
	var state: V1OrderState?
	/// The amount of all items purchased in the order, before taxes and shipping.
	var subtotal_money: V1Money?
	/// The tender used to pay for the order.
	var tender: V1Tender?
	/// The total of all discounts applied to the order.
	var total_discount_money: V1Money?
	/// The total cost of the order.
	var total_price_money: V1Money?
	/// The shipping cost for the order.
	var total_shipping_money: V1Money?
	/// The total of all taxes applied to the order.
	var total_tax_money: V1Money?
	/// The time when the order was last modified, in ISO 8601 format.
	var updated_at: String?
}

struct TenderCashDetails: Codable {
	/// The total amount of cash provided by the buyer, before change is given.
	var buyer_tendered_money: Money?
	/// The amount of change returned to the buyer.
	var change_back_money: Money?
}

struct V1DeleteVariationRequest: Codable {
}

struct V1TimecardEvent: Codable {
	/// The time the employee clocked in, in ISO 8601 format.
	var clockin_time: String?
	/// The time the employee clocked out, in ISO 8601 format.
	var clockout_time: String?
	/// The time when the event was created, in ISO 8601 format.
	var created_at: String?
	/// The ID of the timecard to list events for. See [V1TimecardEventEventType](#type-v1timecardeventeventtype) for possible values
	var event_type: V1TimecardEventEventType?
	/// The event's unique ID.
	var id: String?
}

struct ListCatalogRequest: Codable {
	/// The specific version of the catalog objects to be included in the response.  This allows you to retrieve historical versions of objects. The specified version value is matched against the `CatalogObject`s' `version` attribute.
	var catalog_version: Int?
	/// The pagination cursor returned in the previous response. Leave unset for an initial request. See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
	var cursor: String?
	/// An optional case-insensitive, comma-separated list of object types to retrieve, for example `ITEM,ITEM_VARIATION,CATEGORY,IMAGE`.  The legal values are taken from the CatalogObjectType enum: `ITEM`, `ITEM_VARIATION`, `CATEGORY`, `DISCOUNT`, `TAX`, `MODIFIER`, `MODIFIER_LIST`, or `IMAGE`.
	var types: String?
}

struct V1PaymentDiscount: Codable {
	/// The amount of money that this discount adds to the payment (note that this value is always negative or zero).
	var applied_money: V1Money?
	/// The ID of the applied discount, if available. Discounts applied in older versions of Square Register might not have an ID.
	var discount_id: String?
	/// The discount's name.
	var name: String?
}

struct CreateSubscriptionRequest: Codable {
	/// The date when the subscription should be canceled, in  YYYY-MM-DD format (for example, 2025-02-29). This overrides the plan configuration  if it comes before the date the subscription would otherwise end.
	var canceled_date: String?
	/// The ID of the `customer](#type-customer) [card` to charge. If not specified, Square sends an invoice via email. For an example to create a customer and add a card on file, see [Subscriptions Walkthrough](https://developer.squareup.com/docs/docs/subscriptions-api/walkthrough).
	var card_id: String?
	/// The ID of the `customer` profile.
	var customer_id: String
	/// A unique string that identifies this `CreateSubscription` request. If you do not provide a unique string (or provide an empty string as the value), the endpoint treats each request as independent.  For more information, see [Idempotency keys](https://developer.squareup.com/docs/docs/working-with-apis/idempotency).
	var idempotency_key: String
	/// The ID of the location the subscription is associated with.
	var location_id: String
	/// The ID of the subscription plan. For more information, see  [Subscription Plan Overview](https://developer.squareup.com/docs/docs/subscriptions/overview).
	var plan_id: String
	/// A custom price to apply for the subscription. If specified,  it overrides the price configured by the subscription plan.
	var price_override_money: Money?
	/// The start date of the subscription, in YYYY-MM-DD format. For example, 2013-01-15. If the start date is left empty, the subscription begins  immediately.
	var start_date: String?
	/// The tax to add when billing the subscription. The percentage is expressed in decimal form, using a `'.'` as the decimal separator and without a `'%'` sign. For example, a value of 7.5 corresponds to 7.5%.
	var tax_percentage: String?
	/// The timezone that is used in date calculations for the subscription. If unset, defaults to the location timezone. If a timezone is not configured for the location, defaults to "America/New_York". Format: the IANA Timezone Database identifier for the location timezone. For a list of time zones, see [List of tz database time zones](https://en.wikipedia.org/wiki/List_of_tz_database_time_zones).
	var timezone: String?
}

struct V1ModifierOption: Codable {
	/// The modifier option's unique ID.
	var id: String?
	/// The ID of the modifier list the option belongs to.
	var modifier_list_id: String?
	/// The modifier option's name.
	var name: String?
	/// If true, the modifier option is the default option in a modifier list for which selection_type is SINGLE.
	var on_by_default: Bool?
	/// Indicates the modifier option's list position when displayed in Square Point of Sale and the merchant dashboard. If more than one modifier option in the same modifier list has the same ordinal value, those options are displayed in alphabetical order.
	var ordinal: Int?
	/// The modifier option's price.
	var price_money: V1Money?
	/// The ID of the CatalogObject in the Connect v2 API. Objects that are shared across multiple locations share the same v2 ID.
	var v2_id: String?
}

struct OrderServiceCharge: Codable {
	/// The amount of a non-percentage based service charge.  Exactly one of `percentage` or `amount_money` should be set.
	var amount_money: Money?
	/// The amount of money applied to the order by the service charge, including any inclusive tax amounts, as calculated by Square.  - For fixed-amount service charges, `applied_money` is equal to `amount_money`. - For percentage-based service charges, `applied_money` is the money calculated using the percentage.
	let applied_money: Money?
	/// The list of references to taxes applied to this service charge. Each `OrderLineItemAppliedTax` has a `tax_uid` that references the `uid` of a top-level `OrderLineItemTax` that is being applied to this service charge. On reads, the amount applied is populated.  An `OrderLineItemAppliedTax` will be automatically created on every taxable service charge for all `ORDER` scoped taxes that are added to the order. `OrderLineItemAppliedTax` records for `LINE_ITEM` scoped taxes must be added in requests for the tax to apply to any taxable service charge.  Taxable service charges have the `taxable` field set to true and calculated in the `SUBTOTAL_PHASE`.  To change the amount of a tax, modify the referenced top-level tax.
	var applied_taxes: [OrderLineItemAppliedTax]?
	/// The calculation phase at which to apply the service charge. See [OrderServiceChargeCalculationPhase](#type-orderservicechargecalculationphase) for possible values
	var calculation_phase: OrderServiceChargeCalculationPhase?
	/// The catalog object ID referencing the service charge `CatalogObject`.
	var catalog_object_id: String?
	/// Application-defined data attached to this service charge. Metadata fields are intended to store descriptive references or associations with an entity in another system or store brief information about the object. Square does not process this field; it only stores and returns it in relevant API calls. Do not use metadata to store any sensitive information (personally identifiable information, card details, etc.).  Keys written by applications must be 60 characters or less and must be in the character set `[a-zA-Z0-9_-]`. Entries may also include metadata generated by Square. These keys are prefixed with a namespace, separated from the key with a ':' character.  Values have a max length of 255 characters.  An application may have up to 10 entries per metadata field.  Entries written by applications are private and can only be read or modified by the same application.  See [Metadata](https://developer.squareup.com/docs/build-basics/metadata) for more information.
	var metadata: String?
	/// The name of the service charge.
	var name: String?
	/// The service charge percentage as a string representation of a decimal number. For example, `"7.25"` indicates a service charge of 7.25%.  Exactly 1 of `percentage` or `amount_money` should be set.
	var percentage: String?
	/// Indicates whether the service charge can be taxed. If set to `true`, order-level taxes automatically apply to the service charge. Note that service charges calculated in the `TOTAL_PHASE` cannot be marked as taxable.
	var taxable: Bool?
	/// The total amount of money to collect for the service charge.  __Note__: if an inclusive tax is applied to the service charge, `total_money` __does not__ equal `applied_money` plus `total_tax_money` since the inclusive tax amount will already be included in both `applied_money` and `total_tax_money`.
	let total_money: Money?
	/// The total amount of tax money to collect for the service charge.
	let total_tax_money: Money?
	/// Unique ID that identifies the service charge only within this order.
	var uid: String?
}

struct RetrieveSubscriptionRequest: Codable {
}

struct CatalogQuickAmountsSettings: Codable {
	/// Represents a set of Quick Amounts at this location.
	var amounts: [CatalogQuickAmount]?
	/// Represents location's eligibility for auto amounts The boolean should be consistent with whether there are AUTO amounts in the `amounts`.
	var eligible_for_auto_amounts: Bool?
	/// Represents the option seller currently uses on Quick Amounts. See [CatalogQuickAmountsSettingsOption](#type-catalogquickamountssettingsoption) for possible values
	var option: CatalogQuickAmountsSettingsOption
}

struct CatalogCategory: Codable {
	/// The category name. This is a searchable attribute for use in applicable query filters, and its value length is of Unicode code points.
	var name: String?
}

struct JobAssignment: Codable {
	/// The total pay amount for a 12 month period on the job. Set if the job `PayType` is `SALARY`.
	var annual_rate: Money?
	/// The hourly pay rate of the job.
	var hourly_rate: Money?
	/// The title of the job.
	var job_title: String
	/// The current pay type for the job assignment used to calculate the pay amount in a pay period. See [JobAssignmentPayType](#type-jobassignmentpaytype) for possible values
	var pay_type: JobAssignmentPayType
	/// The planned hours per week for the job. Set if the job `PayType` is `SALARY`.
	var weekly_hours: Int?
}

struct CalculateLoyaltyPointsResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The points that the buyer can earn from a specified purchase.
	var points: Int?
}

struct SearchOrdersSourceFilter: Codable {
	/// Filters by `Source` `name`. Will return any orders with with a `source.name` that matches any of the listed source names.  Max: 10 source names.
	var source_names: [String]?
}

struct UpdateOrderRequest: Codable {
	/// The [dot notation paths](https://developer.squareup.com/docs/orders-api/manage-orders#on-dot-notation) fields to clear. For example, `line_items[uid].note` [Read more about Deleting fields](https://developer.squareup.com/docs/orders-api/manage-orders#delete-fields).
	var fields_to_clear: [String]?
	/// A value you specify that uniquely identifies this update request  If you're unsure whether a particular update was applied to an order successfully, you can reattempt it with the same idempotency key without worrying about creating duplicate updates to the order. The latest order version will be returned.  See [Idempotency](https://developer.squareup.com/docs/basics/api101/idempotency) for more information.
	var idempotency_key: String?
	/// The [sparse order](https://developer.squareup.com/docs/orders-api/manage-orders#sparse-order-objects) containing only the fields to update and the version the update is being applied to.
	var order: Order?
}

struct LoyaltyEventTypeFilter: Codable {
	/// The loyalty event types used to filter the result. If multiple values are specified, the endpoint uses a  logical OR to combine them. See [LoyaltyEventType](#type-loyaltyeventtype) for possible values
	var types: LoyaltyEventType
}

struct OrderReturnDiscount: Codable {
	/// The total declared monetary amount of the discount.  `amount_money` is not set for percentage-based discounts.
	var amount_money: Money?
	/// The amount of discount actually applied to this line item. When an amount-based discount is at order-level, this value is different from `amount_money` because the discount is distributed across the line items.
	var applied_money: Money?
	/// The catalog object id referencing `CatalogDiscount`.
	var catalog_object_id: String?
	/// The discount's name.
	var name: String?
	/// The percentage of the tax, as a string representation of a decimal number. A value of `7.25` corresponds to a percentage of 7.25%.  `percentage` is not set for amount-based discounts.
	var percentage: String?
	/// Indicates the level at which the `OrderReturnDiscount` applies. For `ORDER` scoped discounts, the server will generate references in `applied_discounts` on all `OrderReturnLineItem`s. For `LINE_ITEM` scoped discounts, the discount will only apply to `OrderReturnLineItem`s with references in their `applied_discounts` field. See [OrderLineItemDiscountScope](#type-orderlineitemdiscountscope) for possible values
	var scope: OrderLineItemDiscountScope?
	/// `uid` of the Discount from the Order which contains the original application of this discount.
	var source_discount_uid: String?
	/// The type of the discount. If it is created by API, it would be either `FIXED_PERCENTAGE` or `FIXED_AMOUNT`.  Discounts that don't reference a catalog object ID must have a type of `FIXED_PERCENTAGE` or `FIXED_AMOUNT`. See [OrderLineItemDiscountType](#type-orderlineitemdiscounttype) for possible values
	var type: OrderLineItemDiscountType?
	/// Unique ID that identifies the return discount only within this order.
	var uid: String?
}

struct UpdateShiftResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The updated `Shift`.
	var shift: Shift?
}

struct GetTeamMemberWageResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The requested `TeamMemberWage` object.
	var team_member_wage: TeamMemberWage?
}

/// 
enum V1FeeInclusionType: String, Content {
	/// 
	case ADDITIVE
	/// 
	case INCLUSIVE
}

struct UpdateWageSettingResponse: Codable {
	/// The errors that occurred during the request.
	var errors: [Error]?
	/// The successfully updated `WageSetting` object.
	var wage_setting: WageSetting?
}

/// The brand of a credit card.
enum V1TenderCardBrand: String, Content {
	/// 
	case OTHER_BRAND
	/// 
	case VISA
	/// 
	case MASTER_CARD
	/// 
	case AMERICAN_EXPRESS
	/// 
	case DISCOVER
	/// 
	case DISCOVER_DINERS
	/// 
	case JCB
	/// 
	case CHINA_UNIONPAY
	/// 
	case SQUARE_GIFT_CARD
}

struct DeviceDetails: Codable {
	/// The Square-issued ID of the device.
	var device_id: String?
	/// The Square-issued installation ID for the device.
	var device_installation_id: String?
	/// The name of the device set by the seller.
	var device_name: String?
}

/// Indicates the current verification status of a `BankAccount` object.
enum BankAccountStatus: String, Content {
	/// Indicates that the verification process has started. Some features (for example, creditable or debitable) may be provisionally enabled on the bank account.
	case VERIFICATION_IN_PROGRESS
	/// Indicates that the bank account was successfully verified.
	case VERIFIED
	/// Indicates that the bank account is disabled and is permanently unusable for funds transfer. A bank account can be disabled because of a failed verification attempt or a failed deposit attempt.
	case DISABLED
}

struct LoyaltyEventLoyaltyAccountFilter: Codable {
	/// The ID of the `loyalty account` associated with loyalty events.
	var loyalty_account_id: String
}

/// 
enum V1PaymentItemizationItemizationType: String, Content {
	/// 
	case ITEM
	/// 
	case CUSTOM_AMOUNT
	/// 
	case GIFT_CARD_ACTIVATION
	/// 
	case GIFT_CARD_RELOAD
	/// 
	case GIFT_CARD_UNKNOWN
	/// 
	case OTHER
}

/// The status of a payment request reminder.
enum InvoicePaymentReminderStatus: String, Content {
	/// The reminder is to be sent on the `relative_scheduled_date` (if the invoice is published).
	case PENDING
	/// The reminder is not applicable and is not sent. The following are examples of when reminders are not applicable and are not sent: - You schedule a reminder to be sent before the invoice is published. - The invoice is configured with multiple payment requests and a payment request reminder is configured to be sent after the next payment request `due_date`. - Two reminders (for different payment requests) are configured to be sent on the same date. Therefore, only one reminder is sent. - You configure a reminder to be sent on the date that the invoice is scheduled to be sent. - The payment request is already paid. - The invoice status is `CANCELED` or `FAILED`.
	case NOT_APPLICABLE
	/// The reminder is sent.
	case SENT
}

struct V1ListInventoryRequest: Codable {
	/// A pagination cursor to retrieve the next set of results for your original query to the endpoint.
	var batch_token: String?
	/// The maximum number of inventory entries to return in a single response. This value cannot exceed 1000.
	var limit: Int?
}

struct V1RetrievePaymentRequest: Codable {
}

struct CancelPaymentRequest: Codable {
}

/// 
enum V1ListEmployeesRequestStatus: String, Content {
	/// 
	case ACTIVE
	/// 
	case INACTIVE
}

struct GetBankAccountByV1IdResponse: Codable {
	/// The requested `BankAccount` object.
	var bank_account: BankAccount?
	/// Information on errors encountered during the request.
	var errors: [Error]?
}

struct DisputeEvidence: Codable {
	/// The ID of the dispute the evidence is associated with.
	var dispute_id: String?
	/// The Square-generated ID of the evidence.
	var evidence_id: String?
	/// The type of the evidence. See [DisputeEvidenceType](#type-disputeevidencetype) for possible values
	var evidence_type: DisputeEvidenceType?
	/// The time when the next action is due, in RFC 3339 format.
	var uploaded_at: Timestamp?
}

struct OrderQuantityUnit: Codable {
	/// A `MeasurementUnit` that represents the unit of measure for the quantity.
	var measurement_unit: MeasurementUnit?
	/// For non-integer quantities, represents the number of digits after the decimal point that are recorded for this quantity.  For example, a precision of 1 allows quantities like `"1.0"` and `"1.1"`, but not `"1.01"`.  Min: 0. Max: 5.
	var precision: Int?
}

struct CreateDeviceCodeResponse: Codable {
	/// The created DeviceCode object containing the device code string.
	var device_code: DeviceCode?
	/// Any errors that occurred during the request.
	var errors: [Error]?
}

struct SearchOrdersSort: Codable {
	/// The field to sort by.  __Important:__ When using a `DateTimeFilter`, `sort_field` must match the timestamp field that the DateTimeFilter uses to filter. For example, If you set your `sort_field` to `CLOSED_AT` and you use a DateTimeFilter, your DateTimeFilter must filter for orders by their `CLOSED_AT` date. If this field does not match the timestamp field in `DateTimeFilter`, SearchOrders will return an error.  Default: `CREATED_AT`. See [SearchOrdersSortField](#type-searchorderssortfield) for possible values
	var sort_field: SearchOrdersSortField
	/// The chronological order in which results are returned. Defaults to `DESC`. See [SortOrder](#type-sortorder) for possible values
	var sort_order: SortOrder?
}

struct ListLoyaltyProgramsRequest: Codable {
}

struct UpdateItemModifierListsResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The database [timestamp](https://developer.squareup.com/docs/build-basics/working-with-date) of this update in RFC 3339 format, e.g., `2016-09-04T23:59:33.123Z`.
	var updated_at: Timestamp?
}

/// Indicates the status of an invoice.
enum InvoiceStatus: String, Content {
	/// The invoice is a draft. You must publish a draft invoice before Square can process it. A draft invoice has no `public_url`, so it is not available to customers.
	case DRAFT
	/// The invoice is published but not yet paid.
	case UNPAID
	/// The invoice is scheduled to be processed. On the scheduled date, Square sends the invoice, initiates an automatic payment, or takes no action, depending on the settings for the invoice payment requests. Square also sets the invoice status to the appropriate state: `UNPAID`, `PAID`, `PARTIALLY_PAID`, or `PAYMENT_PENDING`.
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

struct RetrieveTeamMemberBookingProfileResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The returned team member booking profile.
	var team_member_booking_profile: TeamMemberBookingProfile?
}

struct DeleteInvoiceResponse: Codable {
	/// Information about errors encountered during the request.
	var errors: [Error]?
}

struct V1UpdateModifierListRequest: Codable {
	/// The modifier list's name.
	var name: String?
	/// Indicates whether multiple options from the modifier list can be applied to a single item. See [V1UpdateModifierListRequestSelectionType](#type-v1updatemodifierlistrequestselectiontype) for possible values
	var selection_type: V1UpdateModifierListRequestSelectionType?
}

struct CustomerSegment: Codable {
	/// The timestamp when the segment was created, in RFC 3339 format.
	let created_at: Timestamp?
	/// Unique Square-generated ID for the segment.
	let id: String?
	/// Name of the segment.
	let name: String
	/// The timestamp when the segment was last updated, in RFC 3339 format.
	let updated_at: Timestamp?
}

struct RetrieveCatalogObjectResponse: Codable {
	/// Any errors that occurred during the request.
	var errors: [Error]?
	/// The `CatalogObject`s returned.
	var object: CatalogObject?
	/// A list of `CatalogObject`s referenced by the object in the `object` field.
	var related_objects: [CatalogObject]?
}

struct ListTransactionsRequest: Codable {
	/// The beginning of the requested reporting period, in RFC 3339 format.  See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.  Default value: The current time minus one year.
	var begin_time: Timestamp?
	/// A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query.  See [Paginating results](#paginatingresults) for more information.
	var cursor: String?
	/// The end of the requested reporting period, in RFC 3339 format.  See [Date ranges](#dateranges) for details on date inclusivity/exclusivity.  Default value: The current time.
	var end_time: Timestamp?
	/// The order in which results are listed in the response (`ASC` for oldest first, `DESC` for newest first).  Default value: `DESC` See [SortOrder](#type-sortorder) for possible values
	var sort_order: SortOrder?
}

/// The transaction type used in the disputed payment.
enum TransactionType: String, Content {
	/// 
	case DEBIT
	/// 
	case CREDIT
}

struct RetrieveWageSettingRequest: Codable {
}

/// Indicates the Square product used to process a transaction.
enum TransactionProduct: String, Content {
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

struct V1ListEmployeesRequest: Codable {
	/// A pagination cursor to retrieve the next set of results for your original query to the endpoint.
	var batch_token: String?
	/// If filtering results by their created_at field, the beginning of the requested reporting period, in ISO 8601 format.
	var begin_created_at: String?
	/// If filtering results by their updated_at field, the beginning of the requested reporting period, in ISO 8601 format
	var begin_updated_at: String?
	/// If filtering results by their created_at field, the end of the requested reporting period, in ISO 8601 format.
	var end_created_at: String?
	/// If filtering results by there updated_at field, the end of the requested reporting period, in ISO 8601 format.
	var end_updated_at: String?
	/// If provided, the endpoint returns only employee entities with the specified external_id.
	var external_id: String?
	/// The maximum integer number of employee entities to return in a single response. Default 100, maximum 200.
	var limit: Int?
	/// The order in which employees are listed in the response, based on their created_at field.      Default value: ASC See [SortOrder](#type-sortorder) for possible values
	var order: SortOrder?
	/// If provided, the endpoint returns only employee entities with the specified status (ACTIVE or INACTIVE). See [V1ListEmployeesRequestStatus](#type-v1listemployeesrequeststatus) for possible values
	var status: V1ListEmployeesRequestStatus?
}

/// Indicates the method used to create the customer profile.
enum CustomerCreationSource: String, Content {
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

struct SearchOrdersResponse: Codable {
	/// The pagination cursor to be used in a subsequent request. If unset, this is the final response. See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
	var cursor: String?
	/// `Errors` encountered during the search.
	var errors: [Error]?
	/// List of `OrderEntries` that fit the query conditions. Populated only if `return_entries` was set to `true` in the request.
	var order_entries: [OrderEntry]?
	/// List of `Order` objects that match query conditions. Populated only if `return_entries` in the request is set to `false`.
	var orders: [Order]?
}

