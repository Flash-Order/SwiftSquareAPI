/// Lists all the item categories for a given location.
@available(*,deprecated)
public struct V1ListCategories: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Category]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Lists all the item categories for a given location.
		/// - Parameters:
		///   - location_id: The ID of the location to list categories for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/categories"
		return url
	}
}

/// Creates an item category.
@available(*,deprecated)
public struct V1CreateCategory: SquareAPIEndpoint {
	public typealias inputType = V1Category
	public typealias outputType = V1Category
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Creates an item category.
		/// - Parameters:
		///   - location_id: The ID of the location to create an item for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/categories"
		return url
	}
}

/// Modifies the details of an existing item category.
@available(*,deprecated)
public struct V1UpdateCategory: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = V1Category
	public typealias outputType = V1Category
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let category_id: String
		/// Modifies the details of an existing item category.
		/// - Parameters:
		///   - location_id: The ID of the category's associated location.
		///   - category_id: The ID of the category to edit.
		public init(location_id: String, category_id: String) {
			self.location_id = location_id
			self.category_id = category_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/categories/\(inputs.category_id)"
		return url
	}
}

/// Deletes an existing item category.   __DeleteCategory__ returns nothing on success but Connect SDKs map the empty response to an empty `V1DeleteCategoryRequest` object as documented below.
@available(*,deprecated)
public struct V1DeleteCategory: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = V1Category
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let category_id: String
		/// Deletes an existing item category.   __DeleteCategory__ returns nothing on success but Connect SDKs map the empty response to an empty `V1DeleteCategoryRequest` object as documented below.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - category_id: The ID of the category to delete.
		public init(location_id: String, category_id: String) {
			self.location_id = location_id
			self.category_id = category_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/categories/\(inputs.category_id)"
		return url
	}
}

/// Lists all the discounts for a given location.
@available(*,deprecated)
public struct V1ListDiscounts: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Discount]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Lists all the discounts for a given location.
		/// - Parameters:
		///   - location_id: The ID of the location to list categories for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/discounts"
		return url
	}
}

/// Creates a discount.
@available(*,deprecated)
public struct V1CreateDiscount: SquareAPIEndpoint {
	public typealias inputType = V1Discount
	public typealias outputType = V1Discount
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Creates a discount.
		/// - Parameters:
		///   - location_id: The ID of the location to create an item for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/discounts"
		return url
	}
}

/// Modifies the details of an existing discount.
@available(*,deprecated)
public struct V1UpdateDiscount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = V1Discount
	public typealias outputType = V1Discount
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let discount_id: String
		/// Modifies the details of an existing discount.
		/// - Parameters:
		///   - location_id: The ID of the category's associated location.
		///   - discount_id: The ID of the discount to edit.
		public init(location_id: String, discount_id: String) {
			self.location_id = location_id
			self.discount_id = discount_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/discounts/\(inputs.discount_id)"
		return url
	}
}

/// Deletes an existing discount.   __DeleteDiscount__ returns nothing on success but Connect SDKs map the empty response to an empty `V1DeleteDiscountRequest` object as documented below.
@available(*,deprecated)
public struct V1DeleteDiscount: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = V1Discount
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let discount_id: String
		/// Deletes an existing discount.   __DeleteDiscount__ returns nothing on success but Connect SDKs map the empty response to an empty `V1DeleteDiscountRequest` object as documented below.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - discount_id: The ID of the discount to delete.
		public init(location_id: String, discount_id: String) {
			self.location_id = location_id
			self.discount_id = discount_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/discounts/\(inputs.discount_id)"
		return url
	}
}

/// Lists all the fees (taxes) for a given location.
@available(*,deprecated)
public struct V1ListFees: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Fee]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Lists all the fees (taxes) for a given location.
		/// - Parameters:
		///   - location_id: The ID of the location to list fees for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/fees"
		return url
	}
}

/// Creates a fee (tax).
@available(*,deprecated)
public struct V1CreateFee: SquareAPIEndpoint {
	public typealias inputType = V1Fee
	public typealias outputType = V1Fee
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Creates a fee (tax).
		/// - Parameters:
		///   - location_id: The ID of the location to create a fee for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/fees"
		return url
	}
}

/// Modifies the details of an existing fee (tax).
@available(*,deprecated)
public struct V1UpdateFee: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = V1Fee
	public typealias outputType = V1Fee
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let fee_id: String
		/// Modifies the details of an existing fee (tax).
		/// - Parameters:
		///   - location_id: The ID of the fee's associated location.
		///   - fee_id: The ID of the fee to edit.
		public init(location_id: String, fee_id: String) {
			self.location_id = location_id
			self.fee_id = fee_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/fees/\(inputs.fee_id)"
		return url
	}
}

/// Deletes an existing fee (tax).   __DeleteFee__ returns nothing on success but Connect SDKs map the empty response to an empty `V1DeleteFeeRequest` object as documented below.
@available(*,deprecated)
public struct V1DeleteFee: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = V1Fee
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let fee_id: String
		/// Deletes an existing fee (tax).   __DeleteFee__ returns nothing on success but Connect SDKs map the empty response to an empty `V1DeleteFeeRequest` object as documented below.
		/// - Parameters:
		///   - location_id: The ID of the fee's associated location.
		///   - fee_id: The ID of the fee to delete.
		public init(location_id: String, fee_id: String) {
			self.location_id = location_id
			self.fee_id = fee_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/fees/\(inputs.fee_id)"
		return url
	}
}

/// Provides inventory information for all inventory-enabled item variations.
@available(*,deprecated)
public struct V1ListInventory: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1InventoryEntry]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let limit: Int?
		let batch_token: String?
		/// Provides inventory information for all inventory-enabled item variations.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - limit: The maximum number of inventory entries to return in a single response. This value cannot exceed 1000.
		///   - batch_token: A pagination cursor to retrieve the next set of results for your original query to the endpoint.
		public init(location_id: String, limit: Int? = nil, batch_token: String? = nil) {
			self.location_id = location_id
			self.limit = limit
			self.batch_token = batch_token
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/inventory"
		var queries = [String]()
		if let v = inputs.limit { queries.append("limit=\(v)") }
		if let v = inputs.batch_token { queries.append("batch_token=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Adjusts the current available inventory of an item variation.
@available(*,deprecated)
public struct V1AdjustInventory: SquareAPIEndpoint {
	public typealias inputType = V1AdjustInventoryRequest
	public typealias outputType = V1InventoryEntry
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let variation_id: String
		/// Adjusts the current available inventory of an item variation.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - variation_id: The ID of the variation to adjust inventory information for.
		public init(location_id: String, variation_id: String) {
			self.location_id = location_id
			self.variation_id = variation_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/inventory/\(inputs.variation_id)"
		return url
	}
}

/// Provides summary information of all items for a given location.
@available(*,deprecated)
public struct V1ListItems: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Item]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let batch_token: String?
		/// Provides summary information of all items for a given location.
		/// - Parameters:
		///   - location_id: The ID of the location to list items for.
		///   - batch_token: A pagination cursor to retrieve the next set of results for your original query to the endpoint.
		public init(location_id: String, batch_token: String? = nil) {
			self.location_id = location_id
			self.batch_token = batch_token
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/items"
		var queries = [String]()
		if let v = inputs.batch_token { queries.append("batch_token=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Creates an item and at least one variation for it.    Item-related entities include fields you can use to associate them with entities in a non-Square system.  When you create an item-related entity, you can optionally specify `id`. This value must be unique among all IDs ever specified for the account, including those specified by other applications. You can never reuse an entity ID. If you do not specify an ID, Square generates one for the entity.  Item variations have a `user_data` string that lets you associate arbitrary metadata with the variation. The string cannot exceed 255 characters.
@available(*,deprecated)
public struct V1CreateItem: SquareAPIEndpoint {
	public typealias inputType = V1Item
	public typealias outputType = V1Item
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Creates an item and at least one variation for it.    Item-related entities include fields you can use to associate them with entities in a non-Square system.  When you create an item-related entity, you can optionally specify `id`. This value must be unique among all IDs ever specified for the account, including those specified by other applications. You can never reuse an entity ID. If you do not specify an ID, Square generates one for the entity.  Item variations have a `user_data` string that lets you associate arbitrary metadata with the variation. The string cannot exceed 255 characters.
		/// - Parameters:
		///   - location_id: The ID of the location to create an item for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/items"
		return url
	}
}

/// Provides the details for a single item, including associated modifier lists and fees.
@available(*,deprecated)
public struct V1RetrieveItem: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1Item
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let item_id: String
		/// Provides the details for a single item, including associated modifier lists and fees.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - item_id: The item's ID.
		public init(location_id: String, item_id: String) {
			self.location_id = location_id
			self.item_id = item_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/items/\(inputs.item_id)"
		return url
	}
}

/// Modifies the core details of an existing item.
@available(*,deprecated)
public struct V1UpdateItem: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = V1Item
	public typealias outputType = V1Item
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let item_id: String
		/// Modifies the core details of an existing item.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - item_id: The ID of the item to modify.
		public init(location_id: String, item_id: String) {
			self.location_id = location_id
			self.item_id = item_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/items/\(inputs.item_id)"
		return url
	}
}

/// Deletes an existing item and all item variations associated with it.   __DeleteItem__ returns nothing on success but Connect SDKs map the empty response to an empty `V1DeleteItemRequest` object as documented below.
@available(*,deprecated)
public struct V1DeleteItem: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = V1Item
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let item_id: String
		/// Deletes an existing item and all item variations associated with it.   __DeleteItem__ returns nothing on success but Connect SDKs map the empty response to an empty `V1DeleteItemRequest` object as documented below.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - item_id: The ID of the item to modify.
		public init(location_id: String, item_id: String) {
			self.location_id = location_id
			self.item_id = item_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/items/\(inputs.item_id)"
		return url
	}
}

/// Associates a fee with an item so the fee is automatically applied to the item in Square Point of Sale.
@available(*,deprecated)
public struct V1ApplyFee: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = Empty
	public typealias outputType = V1Item
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let item_id: String
		let fee_id: String
		/// Associates a fee with an item so the fee is automatically applied to the item in Square Point of Sale.
		/// - Parameters:
		///   - location_id: The ID of the fee's associated location.
		///   - item_id: The ID of the item to add the fee to.
		///   - fee_id: The ID of the fee to apply.
		public init(location_id: String, item_id: String, fee_id: String) {
			self.location_id = location_id
			self.item_id = item_id
			self.fee_id = fee_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/items/\(inputs.item_id)/fees/\(inputs.fee_id)"
		return url
	}
}

/// Removes a fee assocation from an item so the fee is no longer automatically applied to the item in Square Point of Sale.
@available(*,deprecated)
public struct V1RemoveFee: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = V1Item
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let item_id: String
		let fee_id: String
		/// Removes a fee assocation from an item so the fee is no longer automatically applied to the item in Square Point of Sale.
		/// - Parameters:
		///   - location_id: The ID of the fee's associated location.
		///   - item_id: The ID of the item to add the fee to.
		///   - fee_id: The ID of the fee to apply.
		public init(location_id: String, item_id: String, fee_id: String) {
			self.location_id = location_id
			self.item_id = item_id
			self.fee_id = fee_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/items/\(inputs.item_id)/fees/\(inputs.fee_id)"
		return url
	}
}

/// Associates a modifier list with an item so the associated modifier options can be applied to the item.
@available(*,deprecated)
public struct V1ApplyModifierList: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = Empty
	public typealias outputType = V1Item
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let item_id: String
		let modifier_list_id: String
		/// Associates a modifier list with an item so the associated modifier options can be applied to the item.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - item_id: The ID of the item to add the modifier list to.
		///   - modifier_list_id: The ID of the modifier list to apply.
		public init(location_id: String, item_id: String, modifier_list_id: String) {
			self.location_id = location_id
			self.item_id = item_id
			self.modifier_list_id = modifier_list_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/items/\(inputs.item_id)/modifier-lists/\(inputs.modifier_list_id)"
		return url
	}
}

/// Removes a modifier list association from an item so the modifier options from the list can no longer be applied to the item.
@available(*,deprecated)
public struct V1RemoveModifierList: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = V1Item
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let item_id: String
		let modifier_list_id: String
		/// Removes a modifier list association from an item so the modifier options from the list can no longer be applied to the item.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - item_id: The ID of the item to remove the modifier list from.
		///   - modifier_list_id: The ID of the modifier list to remove.
		public init(location_id: String, item_id: String, modifier_list_id: String) {
			self.location_id = location_id
			self.item_id = item_id
			self.modifier_list_id = modifier_list_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/items/\(inputs.item_id)/modifier-lists/\(inputs.modifier_list_id)"
		return url
	}
}

/// Creates an item variation for an existing item.
@available(*,deprecated)
public struct V1CreateVariation: SquareAPIEndpoint {
	public typealias inputType = V1Variation
	public typealias outputType = V1Variation
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let item_id: String
		/// Creates an item variation for an existing item.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - item_id: The item's ID.
		public init(location_id: String, item_id: String) {
			self.location_id = location_id
			self.item_id = item_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/items/\(inputs.item_id)/variations"
		return url
	}
}

/// Modifies the details of an existing item variation.
@available(*,deprecated)
public struct V1UpdateVariation: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = V1Variation
	public typealias outputType = V1Variation
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let item_id: String
		let variation_id: String
		/// Modifies the details of an existing item variation.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - item_id: The ID of the item to modify.
		///   - variation_id: The ID of the variation to modify.
		public init(location_id: String, item_id: String, variation_id: String) {
			self.location_id = location_id
			self.item_id = item_id
			self.variation_id = variation_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/items/\(inputs.item_id)/variations/\(inputs.variation_id)"
		return url
	}
}

/// Deletes an existing item variation from an item.   __DeleteVariation__ returns nothing on success but Connect SDKs map the empty response to an empty `V1DeleteVariationRequest` object as documented below.
@available(*,deprecated)
public struct V1DeleteVariation: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = V1Variation
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let item_id: String
		let variation_id: String
		/// Deletes an existing item variation from an item.   __DeleteVariation__ returns nothing on success but Connect SDKs map the empty response to an empty `V1DeleteVariationRequest` object as documented below.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - item_id: The ID of the item to delete.
		///   - variation_id: The ID of the variation to delete.
		public init(location_id: String, item_id: String, variation_id: String) {
			self.location_id = location_id
			self.item_id = item_id
			self.variation_id = variation_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/items/\(inputs.item_id)/variations/\(inputs.variation_id)"
		return url
	}
}

/// Lists all the modifier lists for a given location.
@available(*,deprecated)
public struct V1ListModifierLists: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1ModifierList]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Lists all the modifier lists for a given location.
		/// - Parameters:
		///   - location_id: The ID of the location to list modifier lists for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/modifier-lists"
		return url
	}
}

/// Creates an item modifier list and at least 1 modifier option for it.
@available(*,deprecated)
public struct V1CreateModifierList: SquareAPIEndpoint {
	public typealias inputType = V1ModifierList
	public typealias outputType = V1ModifierList
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Creates an item modifier list and at least 1 modifier option for it.
		/// - Parameters:
		///   - location_id: The ID of the location to create a modifier list for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/modifier-lists"
		return url
	}
}

/// Provides the details for a single modifier list.
@available(*,deprecated)
public struct V1RetrieveModifierList: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = V1ModifierList
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let modifier_list_id: String
		/// Provides the details for a single modifier list.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - modifier_list_id: The modifier list's ID.
		public init(location_id: String, modifier_list_id: String) {
			self.location_id = location_id
			self.modifier_list_id = modifier_list_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/modifier-lists/\(inputs.modifier_list_id)"
		return url
	}
}

/// Modifies the details of an existing item modifier list.
@available(*,deprecated)
public struct V1UpdateModifierList: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = V1UpdateModifierListRequest
	public typealias outputType = V1ModifierList
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let modifier_list_id: String
		/// Modifies the details of an existing item modifier list.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - modifier_list_id: The ID of the modifier list to edit.
		public init(location_id: String, modifier_list_id: String) {
			self.location_id = location_id
			self.modifier_list_id = modifier_list_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/modifier-lists/\(inputs.modifier_list_id)"
		return url
	}
}

/// Deletes an existing item modifier list and all modifier options associated with it.   __DeleteModifierList__ returns nothing on success but Connect SDKs map the empty response to an empty `V1DeleteModifierListRequest` object as documented below.
@available(*,deprecated)
public struct V1DeleteModifierList: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = V1ModifierList
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let modifier_list_id: String
		/// Deletes an existing item modifier list and all modifier options associated with it.   __DeleteModifierList__ returns nothing on success but Connect SDKs map the empty response to an empty `V1DeleteModifierListRequest` object as documented below.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - modifier_list_id: The ID of the modifier list to delete.
		public init(location_id: String, modifier_list_id: String) {
			self.location_id = location_id
			self.modifier_list_id = modifier_list_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/modifier-lists/\(inputs.modifier_list_id)"
		return url
	}
}

/// Creates an item modifier option and adds it to a modifier list.
@available(*,deprecated)
public struct V1CreateModifierOption: SquareAPIEndpoint {
	public typealias inputType = V1ModifierOption
	public typealias outputType = V1ModifierOption
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let modifier_list_id: String
		/// Creates an item modifier option and adds it to a modifier list.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - modifier_list_id: The ID of the modifier list to edit.
		public init(location_id: String, modifier_list_id: String) {
			self.location_id = location_id
			self.modifier_list_id = modifier_list_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/modifier-lists/\(inputs.modifier_list_id)/modifier-options"
		return url
	}
}

/// Modifies the details of an existing item modifier option.
@available(*,deprecated)
public struct V1UpdateModifierOption: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = V1ModifierOption
	public typealias outputType = V1ModifierOption
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let modifier_list_id: String
		let modifier_option_id: String
		/// Modifies the details of an existing item modifier option.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - modifier_list_id: The ID of the modifier list to edit.
		///   - modifier_option_id: The ID of the modifier list to edit.
		public init(location_id: String, modifier_list_id: String, modifier_option_id: String) {
			self.location_id = location_id
			self.modifier_list_id = modifier_list_id
			self.modifier_option_id = modifier_option_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/modifier-lists/\(inputs.modifier_list_id)/modifier-options/\(inputs.modifier_option_id)"
		return url
	}
}

/// Deletes an existing item modifier option from a modifier list.   __DeleteModifierOption__ returns nothing on success but Connect SDKs map the empty response to an empty `V1DeleteModifierOptionRequest` object.
@available(*,deprecated)
public struct V1DeleteModifierOption: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = V1ModifierOption
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let modifier_list_id: String
		let modifier_option_id: String
		/// Deletes an existing item modifier option from a modifier list.   __DeleteModifierOption__ returns nothing on success but Connect SDKs map the empty response to an empty `V1DeleteModifierOptionRequest` object.
		/// - Parameters:
		///   - location_id: The ID of the item's associated location.
		///   - modifier_list_id: The ID of the modifier list to delete.
		///   - modifier_option_id: The ID of the modifier list to edit.
		public init(location_id: String, modifier_list_id: String, modifier_option_id: String) {
			self.location_id = location_id
			self.modifier_list_id = modifier_list_id
			self.modifier_option_id = modifier_option_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/modifier-lists/\(inputs.modifier_list_id)/modifier-options/\(inputs.modifier_option_id)"
		return url
	}
}

/// Lists all Favorites pages (in Square Point of Sale) for a given location.
@available(*,deprecated)
public struct V1ListPages: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = [V1Page]
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Lists all Favorites pages (in Square Point of Sale) for a given location.
		/// - Parameters:
		///   - location_id: The ID of the location to list Favorites pages for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/pages"
		return url
	}
}

/// Creates a Favorites page in Square Point of Sale.
@available(*,deprecated)
public struct V1CreatePage: SquareAPIEndpoint {
	public typealias inputType = V1Page
	public typealias outputType = V1Page
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		/// Creates a Favorites page in Square Point of Sale.
		/// - Parameters:
		///   - location_id: The ID of the location to create an item for.
		public init(location_id: String) {
			self.location_id = location_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/pages"
		return url
	}
}

/// Modifies the details of a Favorites page in Square Point of Sale.
@available(*,deprecated)
public struct V1UpdatePage: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = V1Page
	public typealias outputType = V1Page
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let page_id: String
		/// Modifies the details of a Favorites page in Square Point of Sale.
		/// - Parameters:
		///   - location_id: The ID of the Favorites page's associated location
		///   - page_id: The ID of the page to modify.
		public init(location_id: String, page_id: String) {
			self.location_id = location_id
			self.page_id = page_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/pages/\(inputs.page_id)"
		return url
	}
}

/// Deletes an existing Favorites page and all of its cells.   __DeletePage__ returns nothing on success but Connect SDKs map the empty response to an empty `V1DeletePageRequest` object.
@available(*,deprecated)
public struct V1DeletePage: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = V1Page
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let page_id: String
		/// Deletes an existing Favorites page and all of its cells.   __DeletePage__ returns nothing on success but Connect SDKs map the empty response to an empty `V1DeletePageRequest` object.
		/// - Parameters:
		///   - location_id: The ID of the Favorites page's associated location.
		///   - page_id: The ID of the page to delete.
		public init(location_id: String, page_id: String) {
			self.location_id = location_id
			self.page_id = page_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/pages/\(inputs.page_id)"
		return url
	}
}

/// Modifies a cell of a Favorites page in Square Point of Sale.
@available(*,deprecated)
public struct V1UpdatePageCell: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = V1PageCell
	public typealias outputType = V1Page
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let page_id: String
		/// Modifies a cell of a Favorites page in Square Point of Sale.
		/// - Parameters:
		///   - location_id: The ID of the Favorites page's associated location.
		///   - page_id: The ID of the page the cell belongs to.
		public init(location_id: String, page_id: String) {
			self.location_id = location_id
			self.page_id = page_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/pages/\(inputs.page_id)/cells"
		return url
	}
}

/// Deletes a cell from a Favorites page in Square Point of Sale.   __DeletePageCell__ returns nothing on success but Connect SDKs map the empty response to an empty `V1DeletePageCellRequest` object as documented below.
@available(*,deprecated)
public struct V1DeletePageCell: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = V1Page
	public typealias paramType = Params
	public struct Params {
		let location_id: String
		let page_id: String
		let row: String?
		let column: String?
		/// Deletes a cell from a Favorites page in Square Point of Sale.   __DeletePageCell__ returns nothing on success but Connect SDKs map the empty response to an empty `V1DeletePageCellRequest` object as documented below.
		/// - Parameters:
		///   - location_id: The ID of the Favorites page's associated location.
		///   - page_id: The ID of the page to delete.
		///   - row: The row of the cell to clear. Always an integer between 0 and 4, inclusive. Row 0 is the top row.
		///   - column: The column of the cell to clear. Always an integer between 0 and 4, inclusive. Column 0 is the leftmost column.
		public init(location_id: String, page_id: String, row: String? = nil, column: String? = nil) {
			self.location_id = location_id
			self.page_id = page_id
			self.row = row
			self.column = column
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v1/\(inputs.location_id)/pages/\(inputs.page_id)/cells"
		var queries = [String]()
		if let v = inputs.row { queries.append("row=\(v)") }
		if let v = inputs.column { queries.append("column=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

