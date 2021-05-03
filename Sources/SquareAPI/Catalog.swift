/// Returns a set of objects based on the provided ID. Each [CatalogItem](https://developer.squareup.com/reference/square_2021-04-21/objects/CatalogItem) returned in the set includes all of its child information including: all of its [CatalogItemVariation](https://developer.squareup.com/reference/square_2021-04-21/objects/CatalogItemVariation) objects, references to its [CatalogModifierList](https://developer.squareup.com/reference/square_2021-04-21/objects/CatalogModifierList) objects, and the ids of any [CatalogTax](https://developer.squareup.com/reference/square_2021-04-21/objects/CatalogTax) objects that apply to it.
public struct BatchRetrieveCatalogObjects: SquareAPIEndpoint {
	public typealias inputType = BatchRetrieveCatalogObjectsRequest
	public typealias outputType = BatchRetrieveCatalogObjectsResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/catalog/batch-retrieve"
	}
}


/// Returns a list of [CatalogObject](https://developer.squareup.com/reference/square_2021-04-21/objects/CatalogObject)s that includes all objects of a set of desired types (for example, all [CatalogItem](https://developer.squareup.com/reference/square_2021-04-21/objects/CatalogItem) and [CatalogTax](https://developer.squareup.com/reference/square_2021-04-21/objects/CatalogTax) objects) in the catalog. The `types` parameter is specified as a comma-separated list of valid [CatalogObject](https://developer.squareup.com/reference/square_2021-04-21/objects/CatalogObject) types: `ITEM`, `ITEM_VARIATION`, `MODIFIER`, `MODIFIER_LIST`, `CATEGORY`, `DISCOUNT`, `TAX`, `IMAGE`.  __Important:__ ListCatalog does not return deleted catalog items. To retrieve deleted catalog items, use [SearchCatalogObjects](https://developer.squareup.com/reference/square_2021-04-21/catalog-api/search-catalog-objects) and set the `include_deleted_objects` attribute value to `true`.
public struct ListCatalog: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = ListCatalogResponse
	public typealias paramType = Params
	public struct Params {
		let cursor: String?
		let types: String?
		let catalog_version: Int?
		/// Returns a list of [CatalogObject](https://developer.squareup.com/reference/square_2021-04-21/objects/CatalogObject)s that includes all objects of a set of desired types (for example, all [CatalogItem](https://developer.squareup.com/reference/square_2021-04-21/objects/CatalogItem) and [CatalogTax](https://developer.squareup.com/reference/square_2021-04-21/objects/CatalogTax) objects) in the catalog. The `types` parameter is specified as a comma-separated list of valid [CatalogObject](https://developer.squareup.com/reference/square_2021-04-21/objects/CatalogObject) types: `ITEM`, `ITEM_VARIATION`, `MODIFIER`, `MODIFIER_LIST`, `CATEGORY`, `DISCOUNT`, `TAX`, `IMAGE`.  __Important:__ ListCatalog does not return deleted catalog items. To retrieve deleted catalog items, use [SearchCatalogObjects](https://developer.squareup.com/reference/square_2021-04-21/catalog-api/search-catalog-objects) and set the `include_deleted_objects` attribute value to `true`.
		/// - Parameters:
		///   - cursor: The pagination cursor returned in the previous response. Leave unset for an initial request. See [Pagination](https://developer.squareup.com/docs/basics/api101/pagination) for more information.
		///   - types: An optional case-insensitive, comma-separated list of object types to retrieve, for example `ITEM,ITEM_VARIATION,CATEGORY,IMAGE`.  The legal values are taken from the CatalogObjectType enum: `ITEM`, `ITEM_VARIATION`, `CATEGORY`, `DISCOUNT`, `TAX`, `MODIFIER`, `MODIFIER_LIST`, or `IMAGE`.
		///   - catalog_version: (Beta) The specific version of the catalog objects to be included in the response.  This allows you to retrieve historical versions of objects. The specified version value is matched against the [CatalogObject](https://developer.squareup.com/reference/square_2021-04-21/objects/CatalogObject)s' `version` attribute.
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

