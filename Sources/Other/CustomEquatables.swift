//
//  File.swift
//  
//
//  Created by Jon Lund on 2/10/23.
//
// These are less strict versions of equality tests for these objects


extension OrderLineItemModifier: Equatable {
	public static func == (lhs: OrderLineItemModifier, rhs: OrderLineItemModifier) -> Bool {
		guard lhs.base_price_money == rhs.base_price_money else { return false }
		guard lhs.catalog_object_id == rhs.catalog_object_id else { return false }
		guard lhs.name == rhs.name else { return false }
		guard lhs.total_price_money == rhs.total_price_money else { return false }
		guard lhs.uid == rhs.uid else { return false }
		return true
	}
}

extension OrderLineItem: Equatable {
	// crude version
	public static func == (lhs: OrderLineItem, rhs: OrderLineItem) -> Bool {
		guard lhs.quantity == rhs.quantity else { return false }
		guard lhs.total_money == rhs.total_money else { return false }
		guard lhs.name == rhs.name else { return false }
		guard lhs.modifiers == rhs.modifiers else { return false }
		guard lhs.catalog_object_id == rhs.catalog_object_id else { return false }
		guard lhs.base_price_money == rhs.base_price_money else { return false }
		guard lhs.item_type == rhs.item_type else { return false }
		return true
	}
}

extension OrderLineItemDiscount: Equatable {
	public static func == (lhs: OrderLineItemDiscount, rhs: OrderLineItemDiscount) -> Bool {
		guard lhs.amount_money == rhs.amount_money else { return false }
		guard lhs.catalog_object_id == rhs.catalog_object_id else { return false }
		guard lhs.catalog_version == rhs.catalog_version else { return false }
		guard lhs.name == rhs.name else { return false }
		guard lhs.percentage == rhs.percentage else { return false }
		guard lhs.pricing_rule_id == rhs.pricing_rule_id else { return false }
		guard lhs.reward_ids == rhs.reward_ids else { return false }
		guard lhs.scope == rhs.scope else { return false }
		guard lhs.type == rhs.type else { return false }
		guard lhs.uid == rhs.uid else { return false }
		return true
	}
}


extension Order: Equatable {
	
	/// evaluate if they are effectively the same *INCOMPLETE*
	public static func == (lhs: Order, rhs: Order) -> Bool {
		guard lhs.id == rhs.id else { return false }
		guard lhs.state == rhs.state else { return false }
		guard lhs.total_money == rhs.total_money else { return false }
		guard lhs.line_items == rhs.line_items else { return false }
		guard lhs.discounts == rhs.discounts else { return false }
		guard lhs.version == rhs.version else { return false }
		return true
	}
}
