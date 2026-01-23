/// Returns a list of [BankAccount](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/BankAccount) objects linked to a Square account.
public struct ListBankAccounts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListBankAccountsResponse
	public typealias paramType = Params
	public struct Params {
		let cursor: String?
		let limit: Int?
		let location_id: String?
		let customer_id: String?
		/// Returns a list of [BankAccount](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/BankAccount) objects linked to a Square account.
		/// - Parameters:
		///   - cursor: The pagination cursor returned by a previous call to this endpoint. Use it in the next `ListBankAccounts` request to retrieve the next set of results.  See the [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination) guide for more information.
		///   - limit: Upper limit on the number of bank accounts to return in the response. Currently, 1000 is the largest supported limit. You can specify a limit of up to 1000 bank accounts. This is also the default limit.
		///   - location_id: Location ID. You can specify this optional filter to retrieve only the linked bank accounts belonging to a specific location.
		///   - customer_id: Customer ID. You can specify this optional filter to retrieve only the linked bank accounts belonging to a specific customer.
		public init(cursor: String? = nil, limit: Int? = nil, location_id: String? = nil, customer_id: String? = nil) {
			self.cursor = cursor
			self.limit = limit
			self.location_id = location_id
			self.customer_id = customer_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bank-accounts"
		var queries = [String]()
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if let v = inputs.location_id { queries.append("location_id=\(v)") }
		if let v = inputs.customer_id { queries.append("customer_id=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Store a bank account on file for a square account
public struct CreateBankAccount: SquareAPIEndpoint {
	public typealias inputType = CreateBankAccountRequest
	public typealias outputType = CreateBankAccountResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bank-accounts"
	}
}

/// Returns details of a [BankAccount](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/BankAccount) identified by V1 bank account ID.
public struct GetBankAccountByV1Id: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetBankAccountByV1IdResponse
	public typealias paramType = Params
	public struct Params {
		let v1_bank_account_id: String
		/// Returns details of a [BankAccount](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/BankAccount) identified by V1 bank account ID.
		/// - Parameters:
		///   - v1_bank_account_id: Connect V1 ID of the desired `BankAccount`. For more information, see  [Retrieve a bank account by using an ID issued by V1 Bank Accounts API](https://developer.squareup.com/docs/bank-accounts-api#retrieve-a-bank-account-by-using-an-id-issued-by-v1-bank-accounts-api).
		public init(v1_bank_account_id: String) {
			self.v1_bank_account_id = v1_bank_account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bank-accounts/by-v1-id/\(inputs.v1_bank_account_id)"
		return url
	}
}

/// Retrieve details of a [BankAccount](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/BankAccount) bank account linked to a Square account.
public struct GetBankAccount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetBankAccountResponse
	public typealias paramType = Params
	public struct Params {
		let bank_account_id: String
		/// Retrieve details of a [BankAccount](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/BankAccount) bank account linked to a Square account.
		/// - Parameters:
		///   - bank_account_id: Square-issued ID of the desired `BankAccount`.
		public init(bank_account_id: String) {
			self.bank_account_id = bank_account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bank-accounts/\(inputs.bank_account_id)"
		return url
	}
}

/// Disable a bank account.
public struct DisableBankAccount: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = DisableBankAccountResponse
	public typealias paramType = Params
	public struct Params {
		let bank_account_id: String
		/// Disable a bank account.
		/// - Parameters:
		///   - bank_account_id: The ID of the bank account to disable.
		public init(bank_account_id: String) {
			self.bank_account_id = bank_account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/bank-accounts/\(inputs.bank_account_id)/disable"
		return url
	}
}

