/// Provides summary information for all of a business's employees.
public struct V1ListEmployees: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Employee]
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/me/employees"
	}
}

///  Use the CreateEmployee endpoint to add an employee to a Square account. Employees created with the Connect API have an initial status of `INACTIVE`. Inactive employees cannot sign in to Square Point of Sale until they are activated from the Square Dashboard. Employee status cannot be changed with the Connect API.  Employee entities cannot be deleted. To disable employee profiles, set the employee's status to <code>INACTIVE</code>
public struct V1CreateEmployee: SquareAPIEndpoint {
	public typealias inputType = V1Employee
	public typealias outputType = V1Employee
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/me/employees"
	}
}

/// Provides the details for a single employee.
public struct V1RetrieveEmployee: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1Employee
	public typealias paramType = Params
	public struct Params {
		let employee_id: String
		/// Provides the details for a single employee.
		/// - Parameters:
		///   - employee_id: The employee's ID.
		public init(employee_id: String) {
			self.employee_id = employee_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/employees/\(inputs.employee_id)"
	}
}

public struct V1UpdateEmployee: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = V1Employee
	public typealias outputType = V1Employee
	public typealias paramType = Params
	public struct Params {
		let employee_id: String
		public init(employee_id: String) {
			self.employee_id = employee_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/employees/\(inputs.employee_id)"
	}
}

/// Provides summary information for all of a business's employee roles.
public struct V1ListEmployeeRoles: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1EmployeeRole]
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/me/roles"
	}
}

/// Creates an employee role you can then assign to employees.  Square accounts can include any number of roles that can be assigned to employees. These roles define the actions and permissions granted to an employee with that role. For example, an employee with a "Shift Manager" role might be able to issue refunds in Square Point of Sale, whereas an employee with a "Clerk" role might not.  Roles are assigned with the [V1UpdateEmployee](#endpoint-v1updateemployee) endpoint. An employee can have only one role at a time.  If an employee has no role, they have none of the permissions associated with roles. All employees can accept payments with Square Point of Sale.
public struct V1CreateEmployeeRole: SquareAPIEndpoint {
	public typealias inputType = Empty
	public typealias outputType = V1EmployeeRole
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/me/roles"
	}
}

/// Provides the details for a single employee role.
public struct V1RetrieveEmployeeRole: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1EmployeeRole
	public typealias paramType = Params
	public struct Params {
		let role_id: String
		/// Provides the details for a single employee role.
		/// - Parameters:
		///   - role_id: The role's ID.
		public init(role_id: String) {
			self.role_id = role_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/roles/\(inputs.role_id)"
	}
}

/// Modifies the details of an employee role.
public struct V1UpdateEmployeeRole: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = V1EmployeeRole
	public typealias outputType = V1EmployeeRole
	public typealias paramType = Params
	public struct Params {
		let role_id: String
		/// Modifies the details of an employee role.
		/// - Parameters:
		///   - role_id: The ID of the role to modify.
		public init(role_id: String) {
			self.role_id = role_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/roles/\(inputs.role_id)"
	}
}

/// Provides summary information for all of a business's employee timecards.
@available(*,deprecated)
public struct V1ListTimecards: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Timecard]
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/me/timecards"
	}
}

/// Creates a timecard for an employee and clocks them in with an `API_CREATE` event and a `clockin_time` set to the current time unless the request provides a different value.  To import timecards from another system (rather than clocking someone in). Specify the `clockin_time` and* `clockout_time` in the request.  Timecards correspond to exactly one shift for a given employee, bounded by the `clockin_time` and `clockout_time` fields. An employee is considered clocked in if they have a timecard that doesn't have a `clockout_time` set. An employee that is currently clocked in cannot be clocked in a second time.
@available(*,deprecated)
public struct V1CreateTimecard: SquareAPIEndpoint {
	public typealias inputType = V1Timecard
	public typealias outputType = V1Timecard
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v1/me/timecards"
	}
}

/// Provides the details for a single timecard.   Only approved accounts can manage their employees with Square. Unapproved accounts cannot use employee management features with the API.
@available(*,deprecated)
public struct V1RetrieveTimecard: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1Timecard
	public typealias paramType = Params
	public struct Params {
		let timecard_id: String
		/// Provides the details for a single timecard.   Only approved accounts can manage their employees with Square. Unapproved accounts cannot use employee management features with the API.
		/// - Parameters:
		///   - timecard_id: The timecard's ID.
		public init(timecard_id: String) {
			self.timecard_id = timecard_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/timecards/\(inputs.timecard_id)"
	}
}

/// Modifies the details of a timecard with an `API_EDIT` event for the timecard. Updating an active timecard with a `clockout_time` clocks the employee out.
@available(*,deprecated)
public struct V1UpdateTimecard: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = V1Timecard
	public typealias outputType = V1Timecard
	public typealias paramType = Params
	public struct Params {
		let timecard_id: String
		/// Modifies the details of a timecard with an `API_EDIT` event for the timecard. Updating an active timecard with a `clockout_time` clocks the employee out.
		/// - Parameters:
		///   - timecard_id: TThe ID of the timecard to modify.
		public init(timecard_id: String) {
			self.timecard_id = timecard_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/timecards/\(inputs.timecard_id)"
	}
}

/// Provides summary information for all events associated with a particular timecard.   Only approved accounts can manage their employees with Square. Unapproved accounts cannot use employee management features with the API.
@available(*,deprecated)
public struct V1ListTimecardEvents: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1TimecardEvent]
	public typealias paramType = Params
	public struct Params {
		let timecard_id: String
		/// Provides summary information for all events associated with a particular timecard.   Only approved accounts can manage their employees with Square. Unapproved accounts cannot use employee management features with the API.
		/// - Parameters:
		///   - timecard_id: The ID of the timecard to list events for.
		public init(timecard_id: String) {
			self.timecard_id = timecard_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/me/timecards/\(inputs.timecard_id)/events"
	}
}

/// Provides the details for all of a location's cash drawer shifts during a date range. The date range you specify cannot exceed 90 days.
@available(*,deprecated)
public struct V1ListCashDrawerShifts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1CashDrawerShift]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Provides the details for all of a location's cash drawer shifts during a date range. The date range you specify cannot exceed 90 days.
		/// - Parameters:
		///   - location_id: The ID of the location to list cash drawer shifts for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/cash-drawer-shifts"
	}
}

/// Provides the details for a single cash drawer shift, including all events that occurred during the shift.
@available(*,deprecated)
public struct V1RetrieveCashDrawerShift: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1CashDrawerShift
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let shift_id: String
		/// Provides the details for a single cash drawer shift, including all events that occurred during the shift.
		/// - Parameters:
		///   - location_id: The ID of the location to list cash drawer shifts for.
		///   - shift_id: The shift's ID.
		public init(location_id: String, shift_id: String) {
			self.location_id = location_id
			self.shift_id = shift_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v1/\(inputs.location_id)/cash-drawer-shifts/\(inputs.shift_id)"
	}
}

