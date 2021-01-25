/// Lists all DeviceCodes associated with the merchant.
public struct ListDeviceCodes: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListDeviceCodesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/devices/codes"
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
		return "/v2/devices/codes/\(inputs.id)"
	}
}

