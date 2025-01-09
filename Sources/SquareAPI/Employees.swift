@available(*,deprecated)
public struct ListEmployees: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListEmployeesResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String?
		let status: EmployeeStatus?
		let limit: Int?
		let cursor: String?
		public init(location_id: String? = nil, status: EmployeeStatus? = nil, limit: Int? = nil, cursor: String? = nil) {
			self.location_id = location_id
			self.status = status
			self.limit = limit
			self.cursor = cursor
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/employees"
		var queries = [String]()
		if let v = inputs.location_id { queries.append("location_id=\(v)") }
		if let v = inputs.status { queries.append("status=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

@available(*,deprecated)
public struct RetrieveEmployee: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveEmployeeResponse
	public typealias paramType = Params
	public struct Params {
		let id: String
		public init(id: String) {
			self.id = id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/employees/\(inputs.id)"
		return url
	}
}

