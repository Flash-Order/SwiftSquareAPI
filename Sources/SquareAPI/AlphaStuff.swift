//
//  AlphaStuff.swift
//  
//
//  Created by Jon Lund on 2/26/21.
//

import Foundation

// this is a place where many of Square's mistakes can be repaired without making special casses in the parser

public typealias Info = SubscriptionEventInfo
public typealias InfoCode = String
public typealias GANSource = GiftCardGANSource
//public typealias Reason = GiftCardActivityAdjustDecrement
public typealias Reason = String


/// The Check resource contains the line items the customer has ordered (within the Order child object), the history of those line items, coursing and seating details, and other restaurant-specific information
public struct Check: Codable, Equatable {
	
	/// Unique id for the check
	public var id: String
	
	/// RFC 3339 timestamp
	public var created_at: Timestamp
	
	/// RFC 3339 timestamp
	public var updated_at: Timestamp?
	
	/// The check name
	public var name: String?
	
	/// https://developer.squareup.com/reference/square/objects/Order
	public var order: Order
	
	/// The id of the team member who owns the check.
	public var team_member_id: String?
	
	/// (Optional) The section name associated with the check, configured in the dashboard under Devices → Points of Sale → Sections. Also known as the “ticket group” in the predefined tickets context.
	public var section: String?
	
	/// (Optional) The table name associated with the check
	public var table_name: String?
	
	/// (Optional) Coursing details, including the course name and the events that have occurred at the course level.
	public var courses: [Course]?
	
	/// (Optional) Seating details
	public var seats: [Seat]?
	
	/// List of CheckLineItems, each of which point to a line item in the order and hold supplemental information relevant to restaurants, e.g. item event history
	public var line_items: [CheckLineItem]?
	
	/// The current cover count for the check
	public var covers: Int?
}


public struct Course: Codable, Equatable {
	public var uid: String
	public var name: String
	public var events: [CourseEvent]
	public var original_check_id: String?
	public var original_check_name: String?
}

public struct CourseEvent: Codable, Equatable {
	public enum EventType: String, Codable {
		case CREATED, SENT, ADDED, FIRED
	}
	
	public var uid: String
	public var created_at: Timestamp
	public var team_member_id: String
	public var event_type: EventType
}

public struct Seat: Codable, Equatable {
	public var uid: String
	public var created_at: Timestamp
	public var seat_number: Int
	public var original_check_id: String?
	public var original_check_name: String?
}

public struct CheckLineItem: Codable, Equatable {
	public var order_line_item_uid: String
	public var course_uid: String?
	public var seat_uids: [String]?
	public var events: [CheckLineItemEvent]?
	public var modifiers: [CheckLineItemModifier]?
	public var table_share: Bool?
}

public struct CheckLineItemEvent: Codable, Equatable {
	public enum LineItemType: String, Codable {
		case CREATED			// the line item was created
		case COMPED				// the line item was comped
		case VOIDED				// the line item was voided
		case UNCOMPED			// the line item is no longer comped
		case DELETED			// the line item was deleted
		case SPLIT				// the line item was part of an un-coalesce / itemization split
		case FIRED				// the line item was fired
		case SENT				// the line item was sent to the kitchen
		case DISCOUNTED			// the line item was discounted
		case UNDISCOUNTED		// a discount on the line item was removed
		case MOVED				// the item was moved from one check to another
		case REOPENED			// the check the item belongs to has been reopened
	}
	
	public var uid: String
	public var type: LineItemType
	public var created_at: Timestamp
	public var team_member_id: String?
	public var moved_data: MovedData?
	public var split_data: SplitData?
	public var reopened_data: ReopenedData?
}

public struct MovedData: Codable, Equatable {
	public var original_check_id: String
	public var original_line_item_uid: String
}

public struct SplitData: Codable, Equatable {
	public var original_check_id: String
	public var original_line_item_uid: String
	public var child_line_item_uids: [String]
}

public struct ReopenedData: Codable, Equatable {
	public enum ReopenType: String, Codable {
		case REFUNDED, AMENDED
	}
	public var original_check_id: String
	public var original_line_item_uid: String
}

public struct CheckLineItemModifier: Codable, Equatable {
	public enum ModifierMode: String, Codable {
		case ADD, EXTRA, SIDE, SUB, NO, ALLERGY
	}
	public var order_line_item_modifier_uid: String
	public var conversational_modes: [ModifierMode]
}

public struct RetrieveCheck: SquareAPIEndpoint {
	public static var method: SquareAPI.HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = Output
	public typealias paramType = Params
	public struct Params {
		let check_id: String
		public init(check_id: String) {
			self.check_id = check_id
		}
	}
	public struct Output: Codable {
		public let check: Check?
		public let errors: [SquareError]?
	}
	public static func endpoint(for inputs: Params) throws -> String {
		return "/v2/restaurant/checks/\(inputs.check_id)"
	}
}

public struct BatchRetrieveChecks: SquareAPIEndpoint {
	public static var method: SquareAPI.HTTPMethod { return .POST }
	public typealias inputType = Inputs
	public typealias outputType = Output
	public typealias paramType = Empty
	public struct Inputs: Codable {
		let check_ids: [String]
		public init(check_ids: [String]) {
			self.check_ids = check_ids
		}
	}
	public struct Output: Codable {
		public let checks: [Check]?
		public let errors: [SquareError]?
	}
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/restaurant/checks/batch-retrieve"
	}
}
