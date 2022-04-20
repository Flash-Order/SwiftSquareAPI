/// Returns a list of invoices for a given location. The response  is paginated. If truncated, the response includes a `cursor` that you     use in a subsequent request to retrieve the next set of invoices.
public struct ListInvoices: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListInvoicesResponse
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let cursor: String?
		let limit: Int?
		/// Returns a list of invoices for a given location. The response  is paginated. If truncated, the response includes a `cursor` that you     use in a subsequent request to retrieve the next set of invoices.
		/// - Parameters:
		///   - location_id: The ID of the location for which to list invoices.
		///   - cursor: A pagination cursor returned by a previous call to this endpoint.  Provide this cursor to retrieve the next set of results for your original query.  For more information, see [Pagination](https://developer.squareup.com/docs/working-with-apis/pagination).
		///   - limit: The maximum number of invoices to return (200 is the maximum `limit`).  If not provided, the server uses a default limit of 100 invoices.
		public init(location_id: String, cursor: String? = nil, limit: Int? = nil) {
			self.location_id = location_id
			self.cursor = cursor
			self.limit = limit
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/invoices"
		var queries = [String]()
		queries.append("location_id=\(inputs.location_id)")
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

/// Creates a draft [invoice](https://developer.squareup.com/reference/square_2022-04-20/objects/Invoice)  for an order created using the Orders API.  A draft invoice remains in your account and no action is taken.  You must publish the invoice before Square can process it (send it to the customer's email address or charge the customer’s card on file).
public struct CreateInvoice: SquareAPIEndpoint {
	public typealias inputType = CreateInvoiceRequest
	public typealias outputType = CreateInvoiceResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/invoices"
	}
}

/// Searches for invoices from a location specified in  the filter. You can optionally specify customers in the filter for whom to  retrieve invoices. In the current implementation, you can only specify one location and  optionally one customer.  The response is paginated. If truncated, the response includes a `cursor`  that you use in a subsequent request to retrieve the next set of invoices.
public struct SearchInvoices: SquareAPIEndpoint {
	public typealias inputType = SearchInvoicesRequest
	public typealias outputType = SearchInvoicesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/invoices/search"
	}
}

/// Retrieves an invoice by invoice ID.
public struct GetInvoice: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = GetInvoiceResponse
	public typealias paramType = Params
	public struct Params {
		let invoice_id: String
		/// Retrieves an invoice by invoice ID.
		/// - Parameters:
		///   - invoice_id: The ID of the invoice to retrieve.
		public init(invoice_id: String) {
			self.invoice_id = invoice_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/invoices/\(inputs.invoice_id)"
		return url
	}
}

/// Updates an invoice by modifying fields, clearing fields, or both. For most updates, you can use a sparse  `Invoice` object to add fields or change values and use the `fields_to_clear` field to specify fields to clear.  However, some restrictions apply. For example, you cannot change the `order_id` or `location_id` field and you  must provide the complete `custom_fields` list to update a custom field. Published invoices have additional restrictions.
public struct UpdateInvoice: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = UpdateInvoiceRequest
	public typealias outputType = UpdateInvoiceResponse
	public typealias paramType = Params
	public struct Params {
		let invoice_id: String
		/// Updates an invoice by modifying fields, clearing fields, or both. For most updates, you can use a sparse  `Invoice` object to add fields or change values and use the `fields_to_clear` field to specify fields to clear.  However, some restrictions apply. For example, you cannot change the `order_id` or `location_id` field and you  must provide the complete `custom_fields` list to update a custom field. Published invoices have additional restrictions.
		/// - Parameters:
		///   - invoice_id: The ID of the invoice to update.
		public init(invoice_id: String) {
			self.invoice_id = invoice_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/invoices/\(inputs.invoice_id)"
		return url
	}
}

/// Deletes the specified invoice. When an invoice is deleted, the  associated order status changes to CANCELED. You can only delete a draft  invoice (you cannot delete a published invoice, including one that is scheduled for processing).
public struct DeleteInvoice: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteInvoiceResponse
	public typealias paramType = Params
	public struct Params {
		let invoice_id: String
		let version: Int?
		/// Deletes the specified invoice. When an invoice is deleted, the  associated order status changes to CANCELED. You can only delete a draft  invoice (you cannot delete a published invoice, including one that is scheduled for processing).
		/// - Parameters:
		///   - invoice_id: The ID of the invoice to delete.
		///   - version: The version of the [invoice](https://developer.squareup.com/reference/square_2022-04-20/objects/Invoice) to delete. If you do not know the version, you can call [GetInvoice](https://developer.squareup.com/reference/square_2022-04-20/invoices-api/get-invoice) or  [ListInvoices](https://developer.squareup.com/reference/square_2022-04-20/invoices-api/list-invoices).
		public init(invoice_id: String, version: Int? = nil) {
			self.invoice_id = invoice_id
			self.version = version
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/invoices/\(inputs.invoice_id)"
		var queries = [String]()
		if let v = inputs.version { queries.append("version=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Cancels an invoice. The seller cannot collect payments for  the canceled invoice.  You cannot cancel an invoice in the `DRAFT` state or in a terminal state: `PAID`, `REFUNDED`, `CANCELED`, or `FAILED`.
public struct CancelInvoice: SquareAPIEndpoint {
	public typealias inputType = CancelInvoiceRequest
	public typealias outputType = CancelInvoiceResponse
	public typealias paramType = Params
	public struct Params {
		let invoice_id: String
		/// Cancels an invoice. The seller cannot collect payments for  the canceled invoice.  You cannot cancel an invoice in the `DRAFT` state or in a terminal state: `PAID`, `REFUNDED`, `CANCELED`, or `FAILED`.
		/// - Parameters:
		///   - invoice_id: The ID of the [invoice](https://developer.squareup.com/reference/square_2022-04-20/objects/Invoice) to cancel.
		public init(invoice_id: String) {
			self.invoice_id = invoice_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/invoices/\(inputs.invoice_id)/cancel"
		return url
	}
}

/// Publishes the specified draft invoice.   After an invoice is published, Square  follows up based on the invoice configuration. For example, Square  sends the invoice to the customer's email address, charges the customer's card on file, or does  nothing. Square also makes the invoice available on a Square-hosted invoice page.   The invoice `status` also changes from `DRAFT` to a status  based on the invoice configuration. For example, the status changes to `UNPAID` if  Square emails the invoice or `PARTIALLY_PAID` if Square charge a card on file for a portion of the  invoice amount.
public struct PublishInvoice: SquareAPIEndpoint {
	public typealias inputType = PublishInvoiceRequest
	public typealias outputType = PublishInvoiceResponse
	public typealias paramType = Params
	public struct Params {
		let invoice_id: String
		/// Publishes the specified draft invoice.   After an invoice is published, Square  follows up based on the invoice configuration. For example, Square  sends the invoice to the customer's email address, charges the customer's card on file, or does  nothing. Square also makes the invoice available on a Square-hosted invoice page.   The invoice `status` also changes from `DRAFT` to a status  based on the invoice configuration. For example, the status changes to `UNPAID` if  Square emails the invoice or `PARTIALLY_PAID` if Square charge a card on file for a portion of the  invoice amount.
		/// - Parameters:
		///   - invoice_id: The ID of the invoice to publish.
		public init(invoice_id: String) {
			self.invoice_id = invoice_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/invoices/\(inputs.invoice_id)/publish"
		return url
	}
}

