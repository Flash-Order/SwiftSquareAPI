

public struct OAuth {
	/// OAuth token permissions
	public enum Scope: String, Codable, CaseIterable {
		/// __HTTP Method__: `GET`  Grants write access for third-party Add-ons to read configurations of their Add-ons, for example, when calling `RetrieveConfiguration` endpoint.
		case ADDON_CONFIGURATIONS_READ
		/// __HTTP Method__: `POST`, `PUT`, `DELETE`  Grants write access for third-party Add-ons to store configurations of their Add-ons, for example, when calling `CreateConfiguration` endpoint.
		case ADDON_CONFIGURATIONS_WRITE
		/// __HTTP Method__: `GET`, `POST`  Grants read access to all of a seller's booking information, calendar, and business details. This permission must be accompanied by the `APPOINTMENTS_READ` permission.
		case APPOINTMENTS_ALL_READ
		/// __HTTP Method__: `POST`, `PUT`, `DELETE`  Grants write access to all booking details, including double-booking a seller. This permission must be accompanied by the `APPOINTMENTS_WRITE` permission.
		case APPOINTMENTS_ALL_WRITE
		/// __HTTP Method__: `GET`  Grants read access to booking business settings. For example, to call the ListTeamMemberBookingProfiles endpoint.
		case APPOINTMENTS_BUSINESS_SETTINGS_READ
		/// __HTTP Method__: `GET`, `POST`  Grants read access to booking information. For example, to call the RetrieveBooking endpoint.
		case APPOINTMENTS_READ
		/// __HTTP Method__: `POST`, `PUT`, `DELETE`  Grants write access to booking information. For example, to call the CreateBooking endpoint.
		case APPOINTMENTS_WRITE
		/// __HTTP Method__: `GET`  Grants read access to bank account information associated with the targeted Square account. For example, to call the Connect v1 ListBankAccounts endpoint.
		case BANK_ACCOUNTS_READ
		/// __HTTP Method__: `GET`  Grants read access to cash drawer shift information. For example, to call the ListCashDrawerShifts endpoint.
		case CASH_DRAWER_READ
		/// __HTTP Method__: `POST`  Grants write access to create channels, for example, when calling the `CreateChannel` endpoint.
		case CHANNELS_CREATE
		/// __HTTP Method__: `GET`  Grants read access to view channels, for example, when calling the `RetrieveChannel` endpoint.
		case CHANNELS_READ
		/// __HTTP Method__: `PUT`  Grants write access to update channels, for example, when calling the `UpdateChannel` endpoint.
		case CHANNELS_UPDATE
		/// __HTTP Method__: `GET`  Grants read access to customer information. For example, to call the ListCustomers endpoint.
		case CUSTOMERS_READ
		/// __HTTP Method__: `POST`, `PUT`, `DELETE`  Grants write access to customer information. For example, to create and update customer profiles.
		case CUSTOMERS_WRITE
		/// __HTTP Method__: `GET`  Grants read access to device information. For example, to call the `GetDevice` and `ListDevices` endpoints.
		case DEVICES_READ
		/// __HTTP Method__: `POST`, `GET`  Grants read/write access to device credentials information. For example, to call the CreateDeviceCode endpoint.
		case DEVICE_CREDENTIAL_MANAGEMENT
		/// __HTTP Method__: `GET`  Grants read access to dispute information. For example, to call the RetrieveDispute endpoint.
		case DISPUTES_READ
		/// __HTTP Method__: `POST`, `PUT`, `DELETE`  Grants write access to dispute information. For example, to call the SubmitEvidence endpoint.
		case DISPUTES_WRITE
		/// __HTTP Method__: `GET`  Grants read access to employee profile information. For example, to call the Connect v1 Employees API.
		case EMPLOYEES_READ
		/// __HTTP Method__: `POST`, `PUT`, `DELETE`  Grants write access to employee profile information. For example, to create and modify employee profiles.
		case EMPLOYEES_WRITE
		/// __HTTP Method__: `GET`, `POST`  Grants read access to gift card information. For example, to call the RetrieveGiftCard endpoint.
		case GIFTCARDS_READ
		/// __HTTP Method__: `POST`, `PUT`, `DELETE`  Grants write access to gift card information. For example, to call the CreateGiftCard endpoint.
		case GIFTCARDS_WRITE
		/// __HTTP Method__: `GET`  Grants read access to inventory information. For example, to call the RetrieveInventoryCount endpoint.
		case INVENTORY_READ
		/// __HTTP Method__:  `POST`, `PUT`, `DELETE`  Grants write access to inventory information. For example, to call the BatchChangeInventory endpoint.
		case INVENTORY_WRITE
		/// __HTTP Method__: `GET`, `POST`  Grants read access to invoice information. For example, to call the ListInvoices endpoint.
		case INVOICES_READ
		/// __HTTP Method__: `POST`, `PUT`, `DELETE`  Grants write access to invoice information. For example, to call the CreateInvoice endpoint.
		case INVOICES_WRITE
		/// __HTTP Method__: `GET`  Grants read access to product catalog information. For example, to obtain objects in a product catalog.
		case ITEMS_READ
		/// __HTTP Method__: `POST`, `PUT`, `DELETE`  Grants write access to product catalog information. For example, to modify or add to a product catalog.
		case ITEMS_WRITE
		/// __HTTP Method__: `GET`  Grants read access to loyalty information. For example, to call the ListLoyaltyPrograms endpoint.
		case LOYALTY_READ
		/// __HTTP Method__: `POST`, `PUT`, `DELETE`  Grants write access to loyalty information. For example, to call the CreateLoyaltyAccount endpoint.
		case LOYALTY_WRITE
		/// __HTTP Method__: `GET`  Grants read access to business and location information. For example, to obtain a location ID for subsequent activity.
		case MERCHANT_PROFILE_READ
		/// __HTTP Method__: `POST`, `PUT`  Grants write access to business and location information. For example, to create a new location or update the business hours at an existing location.
		case MERCHANT_PROFILE_WRITE
		/// __HTTP Method__: `GET`, `POST`  Read access to ECOM online store site details.
		case ONLINE_STORE_SITE_READ
		/// __HTTP Method__: `GET`, `POST`  Read access to ECOM online store snippets on published websites.
		case ONLINE_STORE_SNIPPETS_READ
		/// __HTTP Method__: `POST`, `PUT`, `DELETE`  Write access to ECOM online store snippets on published websites.
		case ONLINE_STORE_SNIPPETS_WRITE
		/// __HTTP Method__: `GET`  Grants read access to order information. For example, to call the BatchRetrieveOrders endpoint.
		case ORDERS_READ
		/// __HTTP Method__: `POST`, `PUT`, `DELETE`  Grants write access to order information. For example, to call the CreateCheckout endpoint.
		case ORDERS_WRITE
		/// __HTTP Method__: `GET`  Grants read access to transaction and refund information. For example, to call the RetrieveTransaction endpoint.
		case PAYMENTS_READ
		/// __HTTP Method__: `POST`, `PUT`, `DELETE`  Grants write access to transaction and refunds information. For example, to process payments with the Payments or Checkout API.
		case PAYMENTS_WRITE
		/// __HTTP Method__: `POST`, `PUT`, `DELETE`  Allow third party applications to deduct a portion of each transaction amount. __Required__ to use multiparty transaction functionality with the Payments API.
		case PAYMENTS_WRITE_ADDITIONAL_RECIPIENTS
		/// __HTTP Method__: `POST`, `PUT`, `DELETE`  Grants write access to payments and refunds information. For example, to process in-person payments.
		case PAYMENTS_WRITE_IN_PERSON
		/// __HTTP Method__: `POST`, `PUT`, `DELETE`  Allows the developer to process payments on behalf of a seller using a shared on file payment method.
		case PAYMENTS_WRITE_SHARED_ONFILE
		/// __HTTP Method__: `GET`  Grants read access to payouts and payout entries information. For example, to call the Connect v2 `ListPayouts` endpoint.
		case PAYOUTS_READ
		/// __HTTP Method__: `GET`  Grants read access to reservation information, for example, when calling the `RetrieveReservation` endpoint.
		case RESERVATIONS_READ
		/// __HTTP Method__:  `POST`, `PUT`, `DELETE`  Grants write access to reservation information, for example, when calling the `CreateReservation` endpoint.
		case RESERVATIONS_WRITE
		/// __HTTP Method__: `GET`  Grants read access to check information, for example, when calling the `RetrieveCheck` endpoint.
		case RESTAURANT_CHECKS_READ
		/// __HTTP Method__: `GET`  Grants read access to settlement (deposit) information. For example, to call the Connect v1 ListSettlements endpoint.
		case SETTLEMENTS_READ
		/// __HTTP Method__: `GET`, `POST`  Grants read access to subscription information. For example, to call the RetrieveSubscription endpoint.
		case SUBSCRIPTIONS_READ
		/// __HTTP Method__: `POST`, `PUT`, `DELETE`  Grants write access to subscription information. For example, to call the CreateSubscription endpoint.
		case SUBSCRIPTIONS_WRITE
		/// __HTTP Method__: `GET`  Grants read access to employee timecard information. For example, to call the Connect v2 SearchShifts endpoint.
		case TIMECARDS_READ
		/// __HTTP Method__: `GET`  Grants read access to employee timecard settings information. For example, to call the GetBreakType endpoint.
		case TIMECARDS_SETTINGS_READ
		/// __HTTP Method__: `POST`, `PUT`, `DELETE`  Grants write access to employee timecard settings information. For example, to call the UpdateBreakType endpoint.
		case TIMECARDS_SETTINGS_WRITE
		/// __HTTP Method__: `POST`, `PUT`, `DELETE`  Grants write access to employee shift information. For example, to create and modify employee shifts.
		case TIMECARDS_WRITE
		/// __HTTP Method__: `GET`, `POST`  Grants read access to vendor information, for example, when calling the `RetrieveVendor` endpoint.
		case VENDOR_READ
		/// __HTTP Method__:  `POST`, `PUT`, `DELETE`  Grants write access to vendor information, for example, when calling the `BulkUpdateVendors` endpoint.
		case VENDOR_WRITE
	}
}


/// Revokes an access token generated with the OAuth flow.  If an account has more than one OAuth access token for your application, this endpoint revokes all of them, regardless of which token you specify.   __Important:__ The `Authorization` header for this endpoint must have the following format:  ``` Authorization: Client APPLICATION_SECRET ```  Replace `APPLICATION_SECRET` with the application secret on the **OAuth** page for your application in the Developer Dashboard.
public struct RevokeToken: SquareAPIEndpoint {
	public typealias inputType = RevokeTokenRequest
	public typealias outputType = RevokeTokenResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/oauth2/revoke"
	}
}

/// Returns an OAuth access token and a refresh token unless the  `short_lived` parameter is set to `true`, in which case the endpoint  returns only an access token.  The `grant_type` parameter specifies the type of OAuth request. If  `grant_type` is `authorization_code`, you must include the authorization  code you received when a seller granted you authorization. If `grant_type`  is `refresh_token`, you must provide a valid refresh token. If you're using  an old version of the Square APIs (prior to March 13, 2019), `grant_type`  can be `migration_token` and you must provide a valid migration token.  You can use the `scopes` parameter to limit the set of permissions granted  to the access token and refresh token. You can use the `short_lived` parameter  to create an access token that expires in 24 hours.  __Note:__ OAuth tokens should be encrypted and stored on a secure server.  Application clients should never interact directly with OAuth tokens.
public struct ObtainToken: SquareAPIEndpoint {
	public typealias inputType = ObtainTokenRequest
	public typealias outputType = ObtainTokenResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/oauth2/token"
	}
}

/// Returns information about an [OAuth access token](https://developer.squareup.com/docs/build-basics/access-tokens#get-an-oauth-access-token) or an application’s [personal access token](https://developer.squareup.com/docs/build-basics/access-tokens#get-a-personal-access-token).  Add the access token to the Authorization header of the request.  __Important:__ The `Authorization` header you provide to this endpoint must have the following format:  ``` Authorization: Bearer ACCESS_TOKEN ```  where `ACCESS_TOKEN` is a [valid production authorization credential](https://developer.squareup.com/docs/build-basics/access-tokens).  If the access token is expired or not a valid access token, the endpoint returns an `UNAUTHORIZED` error.
public struct RetrieveTokenStatus: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = RetrieveTokenStatusResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/oauth2/token/status"
	}
}

