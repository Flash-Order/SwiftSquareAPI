//
//  File.swift
//  
//
//  Created by Jon Lund on 8/21/24.
//

import Foundation

extension Order {
	internal init(id: String, location_id: String, version: Int?) {
		self.id = id
		self.location_id = location_id
		self.version = version
		self.closed_at = nil
		self.created_at = nil
		self.dining_option = nil
		self.net_amount_due_money = nil
		self.net_amounts = nil
		self.refunds = nil
		self.return_amounts = nil
		self.returns = nil
		self.rewards = nil
		self.rounding_adjustment = nil
		self.tenders = nil
		self.total_discount_money = nil
		self.total_money = nil
		self.total_service_charge_money = nil
		self.total_tax_money = nil
		self.total_tip_money = nil
		self.updated_at = nil
	}
	
	public func sparse() throws -> Order {
		guard let id = self.id else { throw UsageError.message("Cannot make sparse order with nil id") }
		return Order(id: id, location_id: self.location_id, version: self.version)
	}
}

//extension Money: CustomStringConvertible {
//	
//}

//extension Optional where Wrapped == Money {
//	
//}
