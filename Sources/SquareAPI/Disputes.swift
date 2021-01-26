/// Returns a list of disputes associated with a particular account.
public struct ListDisputes: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListDisputesResponse
	public typealias paramType = Params
	public struct Params {
		let cursor: String?
		let states: String?
		let location_id: String?
		/// Returns a list of disputes associated with a particular account.
		/// - Parameters:
		///   - cursor: (Beta) A pagination cursor returned by a previous call to this endpoint. Provide this cursor to retrieve the next set of results for the original query. For more information, see [Pagination](https://developer.squareup.com/docs/basics/api101/pagination).
		///   - states: (Beta) The dispute states to filter the result. If not specified, the endpoint returns all open disputes (the dispute status is not `INQUIRY_CLOSED`, `WON`, or `LOST`).
		///   - location_id: (Beta) The ID of the location for which to return a list of disputes. If not specified, the endpoint returns all open disputes (the dispute status is not `INQUIRY_CLOSED`, `WON`, or `LOST`) associated with all locations.
		public init(cursor: String? = nil, states: String? = nil, location_id: String? = nil) {
			self.cursor = cursor
			self.states = states
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/disputes"
		var queries = [String]()
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if let v = inputs.states { queries.append("states=\(v)") }
		if let v = inputs.location_id { queries.append("location_id=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Returns details about a specific dispute.
public struct RetrieveDispute: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveDisputeResponse
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
		/// Returns details about a specific dispute.
		/// - Parameters:
		///   - dispute_id: (Beta) The ID of the dispute you want more details about.
		public init(dispute_id: String) {
			self.dispute_id = dispute_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/disputes/\(inputs.dispute_id)"
		return url
	}
}

/// Accepts the loss on a dispute. Square returns the disputed amount to the cardholder and updates the dispute state to ACCEPTED.  Square debits the disputed amount from the seller’s Square account. If the Square account does not have sufficient funds, Square debits the associated bank account.
public struct AcceptDispute: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = AcceptDisputeResponse
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
		/// Accepts the loss on a dispute. Square returns the disputed amount to the cardholder and updates the dispute state to ACCEPTED.  Square debits the disputed amount from the seller’s Square account. If the Square account does not have sufficient funds, Square debits the associated bank account.
		/// - Parameters:
		///   - dispute_id: (Beta) The ID of the dispute you want to accept.
		public init(dispute_id: String) {
			self.dispute_id = dispute_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/disputes/\(inputs.dispute_id)/accept"
		return url
	}
}

/// Returns a list of evidence associated with a dispute.
public struct ListDisputeEvidence: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListDisputeEvidenceResponse
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
		/// Returns a list of evidence associated with a dispute.
		/// - Parameters:
		///   - dispute_id: (Beta) The ID of the dispute.
		public init(dispute_id: String) {
			self.dispute_id = dispute_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/disputes/\(inputs.dispute_id)/evidence"
		return url
	}
}

/// Returns the specific evidence metadata associated with a specific dispute.  You must maintain a copy of the evidence you upload if you want to reference it later. You cannot download the evidence after you upload it.
public struct RetrieveDisputeEvidence: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveDisputeEvidenceResponse
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
		let evidence_id: String
		/// Returns the specific evidence metadata associated with a specific dispute.  You must maintain a copy of the evidence you upload if you want to reference it later. You cannot download the evidence after you upload it.
		/// - Parameters:
		///   - dispute_id: (Beta) The ID of the dispute that you want to retrieve evidence from.
		///   - evidence_id: (Beta) The ID of the evidence to retrieve.
		public init(dispute_id: String, evidence_id: String) {
			self.dispute_id = dispute_id
			self.evidence_id = evidence_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/disputes/\(inputs.dispute_id)/evidence/\(inputs.evidence_id)"
		return url
	}
}

/// Removes specified evidence from a dispute.  Square does not send the bank any evidence that is removed. Also, you cannot remove evidence after submitting it to the bank using [SubmitEvidence](/reference/square/disputes-api/submit-evidence).
public struct RemoveDisputeEvidence: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = RemoveDisputeEvidenceResponse
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
		let evidence_id: String
		/// Removes specified evidence from a dispute.  Square does not send the bank any evidence that is removed. Also, you cannot remove evidence after submitting it to the bank using [SubmitEvidence](/reference/square/disputes-api/submit-evidence).
		/// - Parameters:
		///   - dispute_id: (Beta) The ID of the dispute you want to remove evidence from.
		///   - evidence_id: (Beta) The ID of the evidence you want to remove.
		public init(dispute_id: String, evidence_id: String) {
			self.dispute_id = dispute_id
			self.evidence_id = evidence_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/disputes/\(inputs.dispute_id)/evidence/\(inputs.evidence_id)"
		return url
	}
}

/// Uploads text to use as evidence for a dispute challenge.
public struct CreateDisputeEvidenceText: SquareAPIEndpoint {
	public typealias inputType = CreateDisputeEvidenceTextRequest
	public typealias outputType = CreateDisputeEvidenceTextResponse
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
		/// Uploads text to use as evidence for a dispute challenge.
		/// - Parameters:
		///   - dispute_id: (Beta) The ID of the dispute you want to upload evidence for.
		public init(dispute_id: String) {
			self.dispute_id = dispute_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/disputes/\(inputs.dispute_id)/evidence_text"
		return url
	}
}

/// Submits evidence to the cardholder's bank.  Before submitting evidence, Square compiles all available evidence. This includes evidence uploaded using the [CreateDisputeEvidenceFile](/reference/square/disputes-api/create-dispute-evidence-file) and [CreateDisputeEvidenceText](/reference/square/disputes-api/create-dispute-evidence-text) endpoints and evidence automatically provided by Square, when available.
public struct SubmitEvidence: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = SubmitEvidenceResponse
	public typealias paramType = Params
	public struct Params {
		let dispute_id: String
		/// Submits evidence to the cardholder's bank.  Before submitting evidence, Square compiles all available evidence. This includes evidence uploaded using the [CreateDisputeEvidenceFile](/reference/square/disputes-api/create-dispute-evidence-file) and [CreateDisputeEvidenceText](/reference/square/disputes-api/create-dispute-evidence-text) endpoints and evidence automatically provided by Square, when available.
		/// - Parameters:
		///   - dispute_id: (Beta) The ID of the dispute that you want to submit evidence for.
		public init(dispute_id: String) {
			self.dispute_id = dispute_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/disputes/\(inputs.dispute_id)/submit-evidence"
		return url
	}
}

