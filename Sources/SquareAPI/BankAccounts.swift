/// Returns a list of [BankAccount](#type-bankaccount) objects linked to a Square account.
public struct ListBankAccounts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListBankAccountsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/bank-accounts"
	}
}

/// Returns details of a [BankAccount](#type-bankaccount) identified by V1 bank account ID.
public struct GetBankAccountByV1Id: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetBankAccountByV1IdResponse
	public typealias paramType = Params
	public struct Params {
		let v1_bank_account_id: String
		/// Returns details of a [BankAccount](#type-bankaccount) identified by V1 bank account ID.
		/// - Parameters:
		///   - v1_bank_account_id: Connect V1 ID of the desired `BankAccount`. For more information, see  [Retrieve a bank account by using an ID issued by V1 Bank Accounts API](https://developer.squareup.com/docs/docs/bank-accounts-api#retrieve-a-bank-account-by-using-an-id-issued-by-v1-bank-accounts-api).
		public init(v1_bank_account_id: String) {
			self.v1_bank_account_id = v1_bank_account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bank-accounts/by-v1-id/\(inputs.v1_bank_account_id)"
	}
}

/// Returns details of a [BankAccount](#type-bankaccount)  linked to a Square account.
public struct GetBankAccount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetBankAccountResponse
	public typealias paramType = Params
	public struct Params {
		let bank_account_id: String
		/// Returns details of a [BankAccount](#type-bankaccount)  linked to a Square account.
		/// - Parameters:
		///   - bank_account_id: Square-issued ID of the desired `BankAccount`.
		public init(bank_account_id: String) {
			self.bank_account_id = bank_account_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/bank-accounts/\(inputs.bank_account_id)"
	}
}

