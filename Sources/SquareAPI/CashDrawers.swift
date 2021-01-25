/// Provides the details for all of the cash drawer shifts for a location in a date range.
public struct ListCashDrawerShifts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCashDrawerShiftsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/cash-drawers/shifts"
	}
}

/// Provides the summary details for a single cash drawer shift. See [ListCashDrawerShiftEvents](#endpoint-CashDrawers-ListCashDrawerShiftEvents) for a list of cash drawer shift events.
public struct RetrieveCashDrawerShift: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveCashDrawerShiftResponse
	public typealias paramType = Params
	public struct Params {
		let shift_id: String
		/// Provides the summary details for a single cash drawer shift. See [ListCashDrawerShiftEvents](#endpoint-CashDrawers-ListCashDrawerShiftEvents) for a list of cash drawer shift events.
		/// - Parameters:
		///   - shift_id: The shift ID.
		public init(shift_id: String) {
			self.shift_id = shift_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/cash-drawers/shifts/\(inputs.shift_id)"
	}
}

/// Provides a paginated list of events for a single cash drawer shift.
public struct ListCashDrawerShiftEvents: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCashDrawerShiftEventsResponse
	public typealias paramType = Params
	public struct Params {
		let shift_id: String
		/// Provides a paginated list of events for a single cash drawer shift.
		/// - Parameters:
		///   - shift_id: The shift ID.
		public init(shift_id: String) {
			self.shift_id = shift_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/cash-drawers/shifts/\(inputs.shift_id)/events"
	}
}

