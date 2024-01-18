/// List devices associated with the merchant. Currently, only Terminal API devices are supported.
public struct ListDevices: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListDevicesResponse
	public typealias paramType = Params
	public struct Params {
		let cursor: String?
		let sort_order: String?
		let limit: Int?
		let location_id: String?
		/// List devices associated with the merchant. Currently, only Terminal API devices are supported.
		/// - Parameters:
		///   - cursor: (Beta) A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query. See [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination) for more information.
		///   - sort_order: (Beta) The order in which results are listed. - `ASC` - Oldest to newest. - `DESC` - Newest to oldest (default).
		///   - limit: (Beta) The number of results to return in a single page.
		///   - location_id: (Beta) If present, only returns devices at the target location.
		public init(cursor: String? = nil, sort_order: String? = nil, limit: Int? = nil, location_id: String? = nil) {
			self.cursor = cursor
			self.sort_order = sort_order
			self.limit = limit
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/devices"
		var queries = [String]()
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if let v = inputs.sort_order { queries.append("sort_order=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if let v = inputs.location_id { queries.append("location_id=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

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
		///   - cursor: A pagination cursor returned by a previous call to this endpoint. Provide this to retrieve the next set of results for your original query.  See [Paginating results](https://developer.squareup.com/docs/working-with-apis/pagination) for more information.
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

/// Retrieves Device with the associated `device_id`.
public struct GetDevice: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetDeviceResponse
	public typealias paramType = Params
	public struct Params {
		let device_id: String
		/// Retrieves Device with the associated `device_id`.
		/// - Parameters:
		///   - device_id: (Beta) The unique ID for the desired `Device`.
		public init(device_id: String) {
			self.device_id = device_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/devices/\(inputs.device_id)"
		return url
	}
}

