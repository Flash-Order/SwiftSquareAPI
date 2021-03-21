/// Deletes a set of [CatalogItem](#type-catalogitem)s based on the provided list of target IDs and returns a set of successfully deleted IDs in the response. Deletion is a cascading event such that all children of the targeted object are also deleted. For example, deleting a CatalogItem will also delete all of its [CatalogItemVariation](#type-catalogitemvariation) children.  `BatchDeleteCatalogObjects` succeeds even if only a portion of the targeted IDs can be deleted. The response will only include IDs that were actually deleted.
public struct BatchDeleteCatalogObjects: SquareAPIEndpoint {
	public typealias inputType = BatchDeleteCatalogObjectsRequest
	public typealias outputType = BatchDeleteCatalogObjectsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/batch-delete"
	}
}

/// Returns a set of objects based on the provided ID. Each [CatalogItem](#type-catalogitem) returned in the set includes all of its child information including: all of its [CatalogItemVariation](#type-catalogitemvariation) objects, references to its [CatalogModifierList](#type-catalogmodifierlist) objects, and the ids of any [CatalogTax](#type-catalogtax) objects that apply to it.
public struct BatchRetrieveCatalogObjects: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveCatalogObjectsRequest
	public typealias outputType = BatchRetrieveCatalogObjectsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/batch-retrieve"
	}
}

/// Creates or updates up to 10,000 target objects based on the provided list of objects. The target objects are grouped into batches and each batch is inserted/updated in an all-or-nothing manner. If an object within a batch is malformed in some way, or violates a database constraint, the entire batch containing that item will be disregarded. However, other batches in the same request may still succeed. Each batch may contain up to 1,000 objects, and batches will be processed in order as long as the total object count for the request (items, variations, modifier lists, discounts, and taxes) is no more than 10,000.
public struct BatchUpsertCatalogObjects: SquareAPIEndpoint {
	public typealias inputType = BatchUpsertCatalogObjectsRequest
	public typealias outputType = BatchUpsertCatalogObjectsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/batch-upsert"
	}
}

/// Retrieves information about the Square Catalog API, such as batch size limits that can be used by the `BatchUpsertCatalogObjects` endpoint.
public struct CatalogInfo: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = CatalogInfoResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/info"
	}
}

/// Returns a list of [CatalogObject](#type-catalogobject)s that includes all objects of a set of desired types (for example, all [CatalogItem](#type-catalogitem) and [CatalogTax](#type-catalogtax) objects) in the catalog. The `types` parameter is specified as a comma-separated list of valid [CatalogObject](#type-catalogobject) types: `ITEM`, `ITEM_VARIATION`, `MODIFIER`, `MODIFIER_LIST`, `CATEGORY`, `DISCOUNT`, `TAX`, `IMAGE`.  __Important:__ ListCatalog does not return deleted catalog items. To retrieve deleted catalog items, use [SearchCatalogObjects](#endpoint-Catalog-SearchCatalogObjects) and set the `include_deleted_objects` attribute value to `true`.
public struct ListCatalog: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCatalogResponse
	public typealias paramType = Params
	public struct Params {
		let cursor: String?
		let types: String?
		let catalog_version: Int?
		/// Returns a list of [CatalogObject](#type-catalogobject)s that includes all objects of a set of desired types (for example, all [CatalogItem](#type-catalogitem) and [CatalogTax](#type-catalogtax) objects) in the catalog. The `types` parameter is specified as a comma-separated list of valid [CatalogObject](#type-catalogobject) types: `ITEM`, `ITEM_VARIATION`, `MODIFIER`, `MODIFIER_LIST`, `CATEGORY`, `DISCOUNT`, `TAX`, `IMAGE`.  __Important:__ ListCatalog does not return deleted catalog items. To retrieve deleted catalog items, use [SearchCatalogObjects](#endpoint-Catalog-SearchCatalogObjects) and set the `include_deleted_objects` attribute value to `true`.
		/// - Parameters:
		///   - cursor: The pagination cursor returned in the previous response. Leave unset for an initial request. See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
		///   - types: An optional case-insensitive, comma-separated list of object types to retrieve, for example `ITEM,ITEM_VARIATION,CATEGORY,IMAGE`.  The legal values are taken from the CatalogObjectType enum: `ITEM`, `ITEM_VARIATION`, `CATEGORY`, `DISCOUNT`, `TAX`, `MODIFIER`, `MODIFIER_LIST`, or `IMAGE`.
		///   - catalog_version: (Beta) The specific version of the catalog objects to be included in the response.  This allows you to retrieve historical versions of objects. The specified version value is matched against the `CatalogObject`s' `version` attribute.
		public init(cursor: String? = nil, types: String? = nil, catalog_version: Int? = nil) {
			self.cursor = cursor
			self.types = types
			self.catalog_version = catalog_version
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/catalog/list"
		var queries = [String]()
		if let v = inputs.cursor { queries.append("cursor=\(v)") }
		if let v = inputs.types { queries.append("types=\(v)") }
		if let v = inputs.catalog_version { queries.append("catalog_version=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Creates or updates the target [CatalogObject](#type-catalogobject).
public struct UpsertCatalogObject: SquareAPIEndpoint {
	public typealias inputType = UpsertCatalogObjectRequest
	public typealias outputType = UpsertCatalogObjectResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/object"
	}
}

/// Returns a single [CatalogItem](#type-catalogitem) as a [CatalogObject](#type-catalogobject) based on the provided ID. The returned object includes all of the relevant [CatalogItem](#type-catalogitem) information including: [CatalogItemVariation](#type-catalogitemvariation) children, references to its [CatalogModifierList](#type-catalogmodifierlist) objects, and the ids of any [CatalogTax](#type-catalogtax) objects that apply to it.
public struct RetrieveCatalogObject: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveCatalogObjectResponse
	public typealias paramType = Params
	public struct Params {
		let object_id: String
		let include_related_objects: Bool?
		let catalog_version: Int?
		/// Returns a single [CatalogItem](#type-catalogitem) as a [CatalogObject](#type-catalogobject) based on the provided ID. The returned object includes all of the relevant [CatalogItem](#type-catalogitem) information including: [CatalogItemVariation](#type-catalogitemvariation) children, references to its [CatalogModifierList](#type-catalogmodifierlist) objects, and the ids of any [CatalogTax](#type-catalogtax) objects that apply to it.
		/// - Parameters:
		///   - object_id: The object ID of any type of catalog objects to be retrieved.
		///   - include_related_objects: If `true`, the response will include additional objects that are related to the requested object, as follows:  If the `object` field of the response contains a `CatalogItem`, its associated `CatalogCategory`, `CatalogTax`, `CatalogImage` and `CatalogModifierList` objects will be returned in the `related_objects` field of the response. If the `object` field of the response contains a `CatalogItemVariation`, its parent `CatalogItem` will be returned in the `related_objects` field of the response.  Default value: `false`
		///   - catalog_version: (Beta) Requests objects as of a specific version of the catalog. This allows you to retrieve historical versions of objects. The value to retrieve a specific version of an object can be found in the version field of `CatalogObject`s.
		public init(object_id: String, include_related_objects: Bool? = nil, catalog_version: Int? = nil) {
			self.object_id = object_id
			self.include_related_objects = include_related_objects
			self.catalog_version = catalog_version
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/catalog/object/\(inputs.object_id)"
		var queries = [String]()
		if let v = inputs.include_related_objects { queries.append("include_related_objects=\(v)") }
		if let v = inputs.catalog_version { queries.append("catalog_version=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Deletes a single [CatalogObject](#type-catalogobject) based on the provided ID and returns the set of successfully deleted IDs in the response. Deletion is a cascading event such that all children of the targeted object are also deleted. For example, deleting a [CatalogItem](#type-catalogitem) will also delete all of its [CatalogItemVariation](#type-catalogitemvariation) children.
public struct DeleteCatalogObject: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteCatalogObjectResponse
	public typealias paramType = Params
	public struct Params {
		let object_id: String
		/// Deletes a single [CatalogObject](#type-catalogobject) based on the provided ID and returns the set of successfully deleted IDs in the response. Deletion is a cascading event such that all children of the targeted object are also deleted. For example, deleting a [CatalogItem](#type-catalogitem) will also delete all of its [CatalogItemVariation](#type-catalogitemvariation) children.
		/// - Parameters:
		///   - object_id: The ID of the catalog object to be deleted. When an object is deleted, other objects in the graph that depend on that object will be deleted as well (for example, deleting a catalog item will delete its catalog item variations).
		public init(object_id: String) {
			self.object_id = object_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/catalog/object/\(inputs.object_id)"
		return url
	}
}

/// Searches for [CatalogObject](#type-CatalogObject) of any type by matching supported search attribute values, excluding custom attribute values on items or item variations, against one or more of the specified query expressions.  This (`SearchCatalogObjects`) endpoint differs from the [SearchCatalogItems](#endpoint-Catalog-SearchCatalogItems) endpoint in the following aspects:  - `SearchCatalogItems` can only search for items or item variations, whereas `SearchCatalogObjects` can search for any type of catalog objects. - `SearchCatalogItems` supports the custom attribute query filters to return items or item variations that contain custom attribute values, where `SearchCatalogObjects` does not. - `SearchCatalogItems` does not support the `include_deleted_objects` filter to search for deleted items or item variations, whereas `SearchCatalogObjects` does. - The both endpoints have different call conventions, including the query filter formats.
public struct SearchCatalogObjects: SquareAPIEndpoint {
	public typealias inputType = SearchCatalogObjectsRequest
	public typealias outputType = SearchCatalogObjectsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/search"
	}
}

/// Searches for catalog items or item variations by matching supported search attribute values, including custom attribute values, against one or more of the specified query expressions.  This (`SearchCatalogItems`) endpoint differs from the [SearchCatalogObjects](#endpoint-Catalog-SearchCatalogObjects) endpoint in the following aspects:  - `SearchCatalogItems` can only search for items or item variations, whereas `SearchCatalogObjects` can search for any type of catalog objects. - `SearchCatalogItems` supports the custom attribute query filters to return items or item variations that contain custom attribute values, where `SearchCatalogObjects` does not. - `SearchCatalogItems` does not support the `include_deleted_objects` filter to search for deleted items or item variations, whereas `SearchCatalogObjects` does. - The both endpoints use different call conventions, including the query filter formats.
public struct SearchCatalogItems: SquareAPIEndpoint {
	public typealias inputType = SearchCatalogItemsRequest
	public typealias outputType = SearchCatalogItemsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/search-catalog-items"
	}
}

/// Updates the [CatalogModifierList](#type-catalogmodifierlist) objects that apply to the targeted [CatalogItem](#type-catalogitem) without having to perform an upsert on the entire item.
public struct UpdateItemModifierLists: SquareAPIEndpoint {
	public typealias inputType = UpdateItemModifierListsRequest
	public typealias outputType = UpdateItemModifierListsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/update-item-modifier-lists"
	}
}

/// Updates the [CatalogTax](#type-catalogtax) objects that apply to the targeted [CatalogItem](#type-catalogitem) without having to perform an upsert on the entire item.
public struct UpdateItemTaxes: SquareAPIEndpoint {
	public typealias inputType = UpdateItemTaxesRequest
	public typealias outputType = UpdateItemTaxesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/update-item-taxes"
	}
}

