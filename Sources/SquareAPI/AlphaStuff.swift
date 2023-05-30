//
//  AlphaStuff.swift
//  
//
//  Created by Jon Lund on 2/26/21.
//

import Foundation

// this is a place where many of Square's mistakes can be repaired without making special casses in the parser

public typealias CatalogSubscriptionPlan = AnyCodable
public typealias BuyNowPayLaterDetails = AnyCodable
//public typealias Info = SubscriptionEventInfo
//public typealias InfoCode = String
//public typealias GANSource = GiftCardGANSource
////public typealias Reason = GiftCardActivityAdjustDecrement
//public typealias Reason = String
//
//

/// (Alpha) How they want their order
public struct DiningOption: Codable, Equatable {
	public let catalog_object_id: String?
	public let catalog_version: Int
	public let name: String
	public let id: String?
	public let ordinal: Int?
}
