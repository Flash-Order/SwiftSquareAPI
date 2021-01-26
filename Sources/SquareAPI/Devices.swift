/// Lists all DeviceCodes associated with the merchant.
public struct ListDeviceCodes: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListDeviceCodesResponse
	public typealias paramType = Params
	public struct Params {
		let cursor: String?
		let location_id: String?
		let product_type: String?
		let status: String?
		/// Lists all DeviceCodes associated with the merchant.
		/// - Parameters:
		///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query.  See [Paginating results](#paginatingresults) for more information.
		///   - location_id: If specified, only returns DeviceCodes of the specified location. Returns DeviceCodes of all locations if empty.
		///   - product_type: If specified, only returns DeviceCodes targeting the specified product type. Returns DeviceCodes of all product types if empty.
		///   - status: If specified, returns DeviceCodes with the specified statuses. Returns DeviceCodes of status `PAIRED` and `UNPAIRED` if empty.
		public init(cursor: String? = nil, location_id: String? = nil, product_type: String? = nil, status: String? = nil) {
			self.cursor = cursor
			self.location_id = location_id
			self.product_type = product_type
			self.status = status
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/devices/codes"
		var queries = [String]()
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if let v = inputs.location_id { queries.append("location_id=\(v)") }
		if let v = inputs.product_type { queries.append("product_type=\(v)") }
		if let v = inputs.status { queries.append("status=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Creates a DeviceCode that can be used to login to a Square Terminal device to enter the connected terminal mode.
public struct CreateDeviceCode: SquareAPIEndpoint {
	public typealias inputType = CreateDeviceCodeRequest
	public typealias outputType = CreateDeviceCodeResponse
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
		let url = "/v2/devices/codes/\(inputs.id)"
		return url
	}
}

