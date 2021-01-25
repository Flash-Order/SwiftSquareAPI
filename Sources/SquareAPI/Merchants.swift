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

