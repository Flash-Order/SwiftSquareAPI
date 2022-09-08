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


/// The current state of this fulfillment.
public enum OrderFulfillmentState_ALPHA: String, Codable {
	/// Indicates that the fulfillment has been proposed.
	case PROPOSED
	/// Indicates that the fulfillment has been reserved.
	case RESERVED
	/// Indicates that the fulfillment has been prepared.
	case PREPARED
	/// Indicates that the fulfillment was successfully completed.
	case COMPLETED
	/// Indicates that the fulfillment was canceled.
	case CANCELED
	/// Indicates that the fulfillment failed to be completed, but was not explicitly canceled.
	case FAILED
	/// ????
	case OPEN
}
