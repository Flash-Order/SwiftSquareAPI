/// Creates one or more [Vendor](https://developer.squareup.com/reference/square_2022-11-16/objects/Vendor) objects to represent suppliers to a seller.
public struct BulkCreateVendors: SquareAPIEndpoint {
	public typealias inputType = BulkCreateVendorsRequest
	public typealias outputType = BulkCreateVendorsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/vendors/bulk-create"
	}
}

/// Retrieves one or more vendors of specified [Vendor](https://developer.squareup.com/reference/square_2022-11-16/objects/Vendor) IDs.
public struct BulkRetrieveVendors: SquareAPIEndpoint {
	public typealias inputType = BulkRetrieveVendorsRequest
	public typealias outputType = BulkRetrieveVendorsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/vendors/bulk-retrieve"
	}
}

/// Updates one or more of existing [Vendor](https://developer.squareup.com/reference/square_2022-11-16/objects/Vendor) objects as suppliers to a seller.
public struct BulkUpdateVendors: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = BulkUpdateVendorsRequest
	public typealias outputType = BulkUpdateVendorsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/vendors/bulk-update"
	}
}

/// Creates a single [Vendor](https://developer.squareup.com/reference/square_2022-11-16/objects/Vendor) object to represent a supplier to a seller.
public struct CreateVendor: SquareAPIEndpoint {
	public typealias inputType = CreateVendorRequest
	public typealias outputType = CreateVendorResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/vendors/create"
	}
}

/// Searches for vendors using a filter against supported [Vendor](https://developer.squareup.com/reference/square_2022-11-16/objects/Vendor) properties and a supported sorter.
public struct SearchVendors: SquareAPIEndpoint {
	public typealias inputType = SearchVendorsRequest
	public typealias outputType = SearchVendorsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/vendors/search"
	}
}

/// Retrieves the vendor of a specified [Vendor](https://developer.squareup.com/reference/square_2022-11-16/objects/Vendor) ID.
public struct RetrieveVendor: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveVendorResponse
	public typealias paramType = Params
	public struct Params {
		let vendor_id: String
		/// Retrieves the vendor of a specified [Vendor](https://developer.squareup.com/reference/square_2022-11-16/objects/Vendor) ID.
		/// - Parameters:
		///   - vendor_id: (Beta) ID of the [Vendor](https://developer.squareup.com/reference/square_2022-11-16/objects/Vendor) to retrieve.
		public init(vendor_id: String) {
			self.vendor_id = vendor_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/vendors/\(inputs.vendor_id)"
		return url
	}
}

/// Updates an existing [Vendor](https://developer.squareup.com/reference/square_2022-11-16/objects/Vendor) object as a supplier to a seller.
public struct UpdateVendor: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateVendorRequest
	public typealias outputType = UpdateVendorResponse
	public typealias paramType = Params
	public struct Params {
		let vendor_id: String
		/// Updates an existing [Vendor](https://developer.squareup.com/reference/square_2022-11-16/objects/Vendor) object as a supplier to a seller.
		/// - Parameters:
		///   - vendor_id: 
		public init(vendor_id: String) {
			self.vendor_id = vendor_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/vendors/\(inputs.vendor_id)"
		return url
	}
}

