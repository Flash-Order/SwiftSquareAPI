public struct ListChannels: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListChannelsResponse
	public typealias paramType = Params
	public struct Params {
		let reference_type: ReferenceType?
		let reference_id: String?
		let status: ChannelStatus?
		let cursor: String?
		let limit: Int?
		public init(reference_type: ReferenceType? = nil, reference_id: String? = nil, status: ChannelStatus? = nil, cursor: String? = nil, limit: Int? = nil) {
			self.reference_type = reference_type
			self.reference_id = reference_id
			self.status = status
			self.cursor = cursor
			self.limit = limit
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/channels"
		var queries = [String]()
		if let v = inputs.reference_type { queries.append("reference_type=\(v)") }
		if let v = inputs.reference_id { queries.append("reference_id=\(v)") }
		if let v = inputs.status { queries.append("status=\(v)") }
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

public struct BulkRetrieveChannels: SquareAPIEndpoint {
	public typealias inputType = BulkRetrieveChannelsRequest
	public typealias outputType = BulkRetrieveChannelsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/channels/bulk-retrieve"
	}
}

public struct RetrieveChannel: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveChannelResponse
	public typealias paramType = Params
	public struct Params {
		let channel_id: String
		public init(channel_id: String) {
			self.channel_id = channel_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/channels/\(inputs.channel_id)"
		return url
	}
}

