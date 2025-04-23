/// Retrieves your snippet from a Square Online site. A site can contain snippets from multiple snippet applications, but you can retrieve only the snippet that was added by your application.  You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the sites that belong to a seller.   __Note:__ Square Online APIs are publicly available as part of an early access program. For more information, see [Early access program for Square Online APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
public struct RetrieveSnippet: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .GET }
	public typealias inputType = Empty
	public typealias outputType = RetrieveSnippetResponse
	public typealias paramType = Params
	public struct Params {
		let site_id: String
		/// Retrieves your snippet from a Square Online site. A site can contain snippets from multiple snippet applications, but you can retrieve only the snippet that was added by your application.  You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the sites that belong to a seller.   __Note:__ Square Online APIs are publicly available as part of an early access program. For more information, see [Early access program for Square Online APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
		/// - Parameters:
		///   - site_id: The ID of the site that contains the snippet.
		public init(site_id: String) {
			self.site_id = site_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/sites/\(inputs.site_id)/snippet"
		return url
	}
}

/// Adds a snippet to a Square Online site or updates the existing snippet on the site.  The snippet code is appended to the end of the `head` element on every page of the site, except checkout pages. A snippet application can add one snippet to a given site.   You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the sites that belong to a seller.   __Note:__ Square Online APIs are publicly available as part of an early access program. For more information, see [Early access program for Square Online APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
public struct UpsertSnippet: SquareAPIEndpoint {
	public typealias inputType = UpsertSnippetRequest
	public typealias outputType = UpsertSnippetResponse
	public typealias paramType = Params
	public struct Params {
		let site_id: String
		/// Adds a snippet to a Square Online site or updates the existing snippet on the site.  The snippet code is appended to the end of the `head` element on every page of the site, except checkout pages. A snippet application can add one snippet to a given site.   You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the sites that belong to a seller.   __Note:__ Square Online APIs are publicly available as part of an early access program. For more information, see [Early access program for Square Online APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
		/// - Parameters:
		///   - site_id: The ID of the site where you want to add or update the snippet.
		public init(site_id: String) {
			self.site_id = site_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/sites/\(inputs.site_id)/snippet"
		return url
	}
}

/// Removes your snippet from a Square Online site.  You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the sites that belong to a seller.   __Note:__ Square Online APIs are publicly available as part of an early access program. For more information, see [Early access program for Square Online APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
public struct DeleteSnippet: SquareAPIEndpoint {
	public static var method: HTTPMethod { return .DELETE }
	public typealias inputType = Empty
	public typealias outputType = DeleteSnippetResponse
	public typealias paramType = Params
	public struct Params {
		let site_id: String
		/// Removes your snippet from a Square Online site.  You can call [ListSites](api-endpoint:Sites-ListSites) to get the IDs of the sites that belong to a seller.   __Note:__ Square Online APIs are publicly available as part of an early access program. For more information, see [Early access program for Square Online APIs](https://developer.squareup.com/docs/online-api#early-access-program-for-square-online-apis).
		/// - Parameters:
		///   - site_id: The ID of the site that contains the snippet.
		public init(site_id: String) {
			self.site_id = site_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/v2/sites/\(inputs.site_id)/snippet"
		return url
	}
}

