//
//  File.swift
//  
//
//  Created by Jon Lund on 2/26/21.
//

import Foundation

public struct CashPaymentDetails: Codable {
	public var buyer_supplied_money: Money
	public var change_back_money: Money?
	
	/// Creates an ExternalPaymentDetails Object
	/// - Parameters:
	///   - type: Tye type of payment being recorded
	///   - source: A description of the source of the external payment
	///   - source_id: An ID to associate this payment to its originating source
	///   - source_fee_money: Record the total of fees paid to the source (amount_money - source_fee_money) = net money to the merchant
	public init(buyer_supplied_money: Money, change_back_money: Money? = nil) {
		self.buyer_supplied_money = buyer_supplied_money
		self.change_back_money = change_back_money
	}
}

public struct ExternalPaymentDetails: Codable {
	public enum ExternalPaymentType: String, Codable {
		case CHECK
		case BANK_TRANSFER
		case OTHER_GIFT_CARD
		case CRYPTO
		case SQUARE_CASH
		case SOCIAL
		case EMONEY
		case CARD
		case STORED_BALANCE
		case OTHER
	}
	
	public var type: ExternalPaymentType
	public var source: String
	public var source_id: String?
	public var source_fee_money: Money?
	
	/// Creates an ExternalPaymentDetails Object
	/// - Parameters:
	///   - type: Tye type of payment being recorded
	///   - source: A description of the source of the external payment
	///   - source_id: An ID to associate this payment to its originating source
	///   - source_fee_money: Record the total of fees paid to the source (amount_money - source_fee_money) = net money to the merchant
	public init(extType: ExternalPaymentType, source: String, source_id: String? = nil, source_fee_money: Money? = nil) {
		self.type = extType
		self.source = source
		self.source_id = source_id
		self.source_fee_money = source_fee_money
	}
}


/// Creates a payment from a provided source (such as a nonce or a card on file).  The `PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS` OAuth permission is required to enable application fees.  For more information, see [Payments and Refunds APIs Overview](/payments-api/overview).  For information about application fees in a payment, see [Take Payments and Collect Fees](/payments-api/take-payments-and-collect-fees).
public struct CreatePaymentRequestAlpha: Codable {
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
	
	/// *Alpha only
	public var external_details: ExternalPaymentDetails?
	public var cash_details: CashPaymentDetails?
	
	
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
	public init(amount_money: Money, idempotency_key: String, source_id: String, accept_partial_authorization: Bool? = nil, app_fee_money: Money? = nil, autocomplete: Bool? = nil, billing_address: Address? = nil, buyer_email_address: String? = nil, customer_id: String? = nil, delay_duration: Timestamp? = nil, location_id: String? = nil, note: String? = nil, order_id: String? = nil, reference_id: String? = nil, shipping_address: Address? = nil, statement_description_identifier: String? = nil, tip_money: Money? = nil, verification_token: String? = nil, external_details: ExternalPaymentDetails? = nil, cash_details: CashPaymentDetails? = nil) {
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
		self.external_details = external_details
		self.cash_details = cash_details
	}
}
