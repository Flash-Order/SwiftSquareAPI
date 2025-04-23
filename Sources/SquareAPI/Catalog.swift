/// Deletes a set of [CatalogItem](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogItem)s based on the provided list of target IDs and returns a set of successfully deleted IDs in the response. Deletion is a cascading event such that all children of the targeted object are also deleted. For example, deleting a CatalogItem will also delete all of its [CatalogItemVariation](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogItemVariation) children.  `BatchDeleteCatalogObjects` succeeds even if only a portion of the targeted IDs can be deleted. The response will only include IDs that were actually deleted.  To ensure consistency, only one delete request is processed at a time per seller account. While one (batch or non-batch) delete request is being processed, other (batched and non-batched) delete requests are rejected with the `429` error code.
public struct BatchDeleteCatalogObjects: SquareAPIEndpoint {
	public typealias inputType = BatchDeleteCatalogObjectsRequest
	public typealias outputType = BatchDeleteCatalogObjectsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/batch-delete"
	}
}

/// Returns a set of objects based on the provided ID. Each [CatalogItem](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogItem) returned in the set includes all of its child information including: all of its [CatalogItemVariation](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogItemVariation) objects, references to its [CatalogModifierList](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogModifierList) objects, and the ids of any [CatalogTax](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogTax) objects that apply to it.
public struct BatchRetrieveCatalogObjects: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveCatalogObjectsRequest
	public typealias outputType = BatchRetrieveCatalogObjectsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/batch-retrieve"
	}
}

/// Creates or updates up to 10,000 target objects based on the provided list of objects. The target objects are grouped into batches and each batch is inserted/updated in an all-or-nothing manner. If an object within a batch is malformed in some way, or violates a database constraint, the entire batch containing that item will be disregarded. However, other batches in the same request may still succeed. Each batch may contain up to 1,000 objects, and batches will be processed in order as long as the total object count for the request (items, variations, modifier lists, discounts, and taxes) is no more than 10,000.  To ensure consistency, only one update request is processed at a time per seller account. While one (batch or non-batch) update request is being processed, other (batched and non-batched) update requests are rejected with the `429` error code.
public struct BatchUpsertCatalogObjects: SquareAPIEndpoint {
	public typealias inputType = BatchUpsertCatalogObjectsRequest
	public typealias outputType = BatchUpsertCatalogObjectsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/batch-upsert"
	}
}

/// Uploads an image file to be represented by a [CatalogImage](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogImage) object that can be linked to an existing [CatalogObject](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogObject) instance. The resulting `CatalogImage` is unattached to any `CatalogObject` if the `object_id` is not specified.  This `CreateCatalogImage` endpoint accepts HTTP multipart/form-data requests with a JSON part and an image file part in JPEG, PJPEG, PNG, or GIF format. The maximum file size is 15MB.
public struct CreateCatalogImage: SquareAPIEndpoint {
	public typealias inputType = Empty  // actual type not supported yet
	public typealias outputType = CreateCatalogImageResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/images"
	}
}

/// Uploads a new image file to replace the existing one in the specified [CatalogImage](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogImage) object.  This `UpdateCatalogImage` endpoint accepts HTTP multipart/form-data requests with a JSON part and an image file part in JPEG, PJPEG, PNG, or GIF format. The maximum file size is 15MB.
public struct UpdateCatalogImage: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .PUT }
	public typealias inputType = Empty  // actual type not supported yet
	public typealias outputType = UpdateCatalogImageResponse
	public typealias paramType = Params
	public struct Params {
		let image_id: String
		/// Uploads a new image file to replace the existing one in the specified [CatalogImage](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogImage) object.  This `UpdateCatalogImage` endpoint accepts HTTP multipart/form-data requests with a JSON part and an image file part in JPEG, PJPEG, PNG, or GIF format. The maximum file size is 15MB.
		/// - Parameters:
		///   - image_id: The ID of the `CatalogImage` object to update the encapsulated image file.
		public init(image_id: String) {
			self.image_id = image_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/catalog/images/\(inputs.image_id)"
		return url
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

/// Returns a list of all [CatalogObject](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogObject)s of the specified types in the catalog.  The `types` parameter is specified as a comma-separated list of the [CatalogObjectType](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogObjectType) values, for example, "`ITEM`, `ITEM_VARIATION`, `MODIFIER`, `MODIFIER_LIST`, `CATEGORY`, `DISCOUNT`, `TAX`, `IMAGE`".  __Important:__ ListCatalog does not return deleted catalog items. To retrieve deleted catalog items, use [SearchCatalogObjects](api-endpoint:Catalog-SearchCatalogObjects) and set the `include_deleted_objects` attribute value to `true`.
public struct ListCatalog: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCatalogResponse
	public typealias paramType = Params
	public struct Params {
		let cursor: String?
		let types: String?
		let catalog_version: Int?
		/// Returns a list of all [CatalogObject](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogObject)s of the specified types in the catalog.  The `types` parameter is specified as a comma-separated list of the [CatalogObjectType](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogObjectType) values, for example, "`ITEM`, `ITEM_VARIATION`, `MODIFIER`, `MODIFIER_LIST`, `CATEGORY`, `DISCOUNT`, `TAX`, `IMAGE`".  __Important:__ ListCatalog does not return deleted catalog items. To retrieve deleted catalog items, use [SearchCatalogObjects](api-endpoint:Catalog-SearchCatalogObjects) and set the `include_deleted_objects` attribute value to `true`.
		/// - Parameters:
		///   - cursor: The pagination cursor returned in the previous response. Leave unset for an initial request. The page size is currently set to be 100. See [Pagination](https://developer.squareup.com/docs/build-basics/common-api-patterns/pagination) for more information.
		///   - types: An optional case-insensitive, comma-separated list of object types to retrieve.  The valid values are defined in the [CatalogObjectType](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogObjectType) enum, for example, `ITEM`, `ITEM_VARIATION`, `CATEGORY`, `DISCOUNT`, `TAX`, `MODIFIER`, `MODIFIER_LIST`, `IMAGE`, etc.  If this is unspecified, the operation returns objects of all the top level types at the version of the Square API used to make the request. Object types that are nested onto other object types are not included in the defaults.  At the current API version the default object types are: ITEM, CATEGORY, TAX, DISCOUNT, MODIFIER_LIST,  PRICING_RULE, PRODUCT_SET, TIME_PERIOD, MEASUREMENT_UNIT, SUBSCRIPTION_PLAN, ITEM_OPTION, CUSTOM_ATTRIBUTE_DEFINITION, QUICK_AMOUNT_SETTINGS.
		///   - catalog_version: The specific version of the catalog objects to be included in the response. This allows you to retrieve historical versions of objects. The specified version value is matched against the [CatalogObject](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogObject)s' `version` attribute.  If not included, results will be from the current version of the catalog.
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

/// Creates a new or updates the specified [CatalogObject](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogObject).  To ensure consistency, only one update request is processed at a time per seller account. While one (batch or non-batch) update request is being processed, other (batched and non-batched) update requests are rejected with the `429` error code.
public struct UpsertCatalogObject: SquareAPIEndpoint {
	public typealias inputType = UpsertCatalogObjectRequest
	public typealias outputType = UpsertCatalogObjectResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/object"
	}
}

/// Returns a single [CatalogItem](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogItem) as a [CatalogObject](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogObject) based on the provided ID. The returned object includes all of the relevant [CatalogItem](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogItem) information including: [CatalogItemVariation](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogItemVariation) children, references to its [CatalogModifierList](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogModifierList) objects, and the ids of any [CatalogTax](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogTax) objects that apply to it.
public struct RetrieveCatalogObject: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveCatalogObjectResponse
	public typealias paramType = Params
	public struct Params {
		let object_id: String
		let include_related_objects: Bool?
		let catalog_version: Int?
		let include_category_path_to_root: Bool?
		/// Returns a single [CatalogItem](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogItem) as a [CatalogObject](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogObject) based on the provided ID. The returned object includes all of the relevant [CatalogItem](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogItem) information including: [CatalogItemVariation](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogItemVariation) children, references to its [CatalogModifierList](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogModifierList) objects, and the ids of any [CatalogTax](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogTax) objects that apply to it.
		/// - Parameters:
		///   - object_id: The object ID of any type of catalog objects to be retrieved.
		///   - include_related_objects: If `true`, the response will include additional objects that are related to the requested objects. Related objects are defined as any objects referenced by ID by the results in the `objects` field of the response. These objects are put in the `related_objects` field. Setting this to `true` is helpful when the objects are needed for immediate display to a user. This process only goes one level deep. Objects referenced by the related objects will not be included. For example,  if the `objects` field of the response contains a CatalogItem, its associated CatalogCategory objects, CatalogTax objects, CatalogImage objects and CatalogModifierLists will be returned in the `related_objects` field of the response. If the `objects` field of the response contains a CatalogItemVariation, its parent CatalogItem will be returned in the `related_objects` field of the response.  Default value: `false`
		///   - catalog_version: Requests objects as of a specific version of the catalog. This allows you to retrieve historical versions of objects. The value to retrieve a specific version of an object can be found in the version field of [CatalogObject](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogObject)s. If not included, results will be from the current version of the catalog.
		///   - include_category_path_to_root: Specifies whether or not to include the `path_to_root` list for each returned category instance. The `path_to_root` list consists of `CategoryPathToRootNode` objects and specifies the path that starts with the immediate parent category of the returned category and ends with its root category. If the returned category is a top-level category, the `path_to_root` list is empty and is not returned in the response payload.
		public init(object_id: String, include_related_objects: Bool? = nil, catalog_version: Int? = nil, include_category_path_to_root: Bool? = nil) {
			self.object_id = object_id
			self.include_related_objects = include_related_objects
			self.catalog_version = catalog_version
			self.include_category_path_to_root = include_category_path_to_root
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/catalog/object/\(inputs.object_id)"
		var queries = [String]()
		if let v = inputs.include_related_objects { queries.append("include_related_objects=\(v)") }
		if let v = inputs.catalog_version { queries.append("catalog_version=\(v)") }
		if let v = inputs.include_category_path_to_root { queries.append("include_category_path_to_root=\(v)") }
		if queries.count > 0 {
			let query = queries.joined(separator: "&")
			let encoded = query.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
			return url + "?" + (encoded ?? query)
		}
		return url
	}
}

/// Deletes a single [CatalogObject](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogObject) based on the provided ID and returns the set of successfully deleted IDs in the response. Deletion is a cascading event such that all children of the targeted object are also deleted. For example, deleting a [CatalogItem](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogItem) will also delete all of its [CatalogItemVariation](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogItemVariation) children.  To ensure consistency, only one delete request is processed at a time per seller account. While one (batch or non-batch) delete request is being processed, other (batched and non-batched) delete requests are rejected with the `429` error code.
public struct DeleteCatalogObject: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteCatalogObjectResponse
	public typealias paramType = Params
	public struct Params {
		let object_id: String
		/// Deletes a single [CatalogObject](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogObject) based on the provided ID and returns the set of successfully deleted IDs in the response. Deletion is a cascading event such that all children of the targeted object are also deleted. For example, deleting a [CatalogItem](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogItem) will also delete all of its [CatalogItemVariation](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogItemVariation) children.  To ensure consistency, only one delete request is processed at a time per seller account. While one (batch or non-batch) delete request is being processed, other (batched and non-batched) delete requests are rejected with the `429` error code.
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

/// Searches for [CatalogObject](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogObject) of any type by matching supported search attribute values, excluding custom attribute values on items or item variations, against one or more of the specified query filters.  This (`SearchCatalogObjects`) endpoint differs from the [SearchCatalogItems](api-endpoint:Catalog-SearchCatalogItems) endpoint in the following aspects:  - `SearchCatalogItems` can only search for items or item variations, whereas `SearchCatalogObjects` can search for any type of catalog objects. - `SearchCatalogItems` supports the custom attribute query filters to return items or item variations that contain custom attribute values, where `SearchCatalogObjects` does not. - `SearchCatalogItems` does not support the `include_deleted_objects` filter to search for deleted items or item variations, whereas `SearchCatalogObjects` does. - The both endpoints have different call conventions, including the query filter formats.
public struct SearchCatalogObjects: SquareAPIEndpoint {
	public typealias inputType = SearchCatalogObjectsRequest
	public typealias outputType = SearchCatalogObjectsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/search"
	}
}

/// Searches for catalog items or item variations by matching supported search attribute values, including custom attribute values, against one or more of the specified query filters.  This (`SearchCatalogItems`) endpoint differs from the [SearchCatalogObjects](api-endpoint:Catalog-SearchCatalogObjects) endpoint in the following aspects:  - `SearchCatalogItems` can only search for items or item variations, whereas `SearchCatalogObjects` can search for any type of catalog objects. - `SearchCatalogItems` supports the custom attribute query filters to return items or item variations that contain custom attribute values, where `SearchCatalogObjects` does not. - `SearchCatalogItems` does not support the `include_deleted_objects` filter to search for deleted items or item variations, whereas `SearchCatalogObjects` does. - The both endpoints use different call conventions, including the query filter formats.
public struct SearchCatalogItems: SquareAPIEndpoint {
	public typealias inputType = SearchCatalogItemsRequest
	public typealias outputType = SearchCatalogItemsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/search-catalog-items"
	}
}

/// Updates the [CatalogModifierList](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogModifierList) objects that apply to the targeted [CatalogItem](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogItem) without having to perform an upsert on the entire item.
public struct UpdateItemModifierLists: SquareAPIEndpoint {
	public typealias inputType = UpdateItemModifierListsRequest
	public typealias outputType = UpdateItemModifierListsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/update-item-modifier-lists"
	}
}

/// Updates the [CatalogTax](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogTax) objects that apply to the targeted [CatalogItem](https://developer.squareup.com/reference/square_yyyy-mm-dd/objects/CatalogItem) without having to perform an upsert on the entire item.
public struct UpdateItemTaxes: SquareAPIEndpoint {
	public typealias inputType = UpdateItemTaxesRequest
	public typealias outputType = UpdateItemTaxesResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/update-item-taxes"
	}
}

