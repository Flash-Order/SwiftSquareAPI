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
		let url = "/v2/locations/\(inputs.location_id)/checkouts"
		return url
	}
}

