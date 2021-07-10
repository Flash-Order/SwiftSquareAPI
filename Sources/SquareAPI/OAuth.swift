/// `RenewToken` is deprecated. For information about refreshing OAuth access tokens, see [Migrate from Renew to Refresh OAuth Tokens](https://developer.squareup.com/docs/oauth-api/migrate-to-refresh-tokens).   Renews an OAuth access token before it expires.  OAuth access tokens besides your application's personal access token expire after __30 days__. You can also renew expired tokens within __15 days__ of their expiration. You cannot renew an access token that has been expired for more than 15 days. Instead, the associated user must re-complete the OAuth flow from the beginning.  __Important:__ The `Authorization` header for this endpoint must have the following format:  ``` Authorization: Client APPLICATION_SECRET ```  Replace `APPLICATION_SECRET` with the application secret on the Credentials page in the [developer dashboard](https://developer.squareup.com/apps).
@available(*,deprecated)
public struct RenewToken: SquareAPIEndpoint {
	public typealias inputType = RenewTokenRequest
	public typealias outputType = RenewTokenResponse
	public typealias paramType = Params
	public struct Params {
		let client_id: String
		/// `RenewToken` is deprecated. For information about refreshing OAuth access tokens, see [Migrate from Renew to Refresh OAuth Tokens](https://developer.squareup.com/docs/oauth-api/migrate-to-refresh-tokens).   Renews an OAuth access token before it expires.  OAuth access tokens besides your application's personal access token expire after __30 days__. You can also renew expired tokens within __15 days__ of their expiration. You cannot renew an access token that has been expired for more than 15 days. Instead, the associated user must re-complete the OAuth flow from the beginning.  __Important:__ The `Authorization` header for this endpoint must have the following format:  ``` Authorization: Client APPLICATION_SECRET ```  Replace `APPLICATION_SECRET` with the application secret on the Credentials page in the [developer dashboard](https://developer.squareup.com/apps).
		/// - Parameters:
		///   - client_id: Your application ID, available from the [developer dashboard](https://developer.squareup.com/apps).
		public init(client_id: String) {
			self.client_id = client_id
		}
	}
	public static func endpoint(for inputs: Params) throws -> String {
		let url = "/oauth2/clients/\(inputs.client_id)/access-token/renew"
		return url
	}
}

/// Revokes an access token generated with the OAuth flow.  If an account has more than one OAuth access token for your application, this endpoint revokes all of them, regardless of which token you specify. When an OAuth access token is revoked, all of the active subscriptions associated with that OAuth token are canceled immediately.  __Important:__ The `Authorization` header for this endpoint must have the following format:  ``` Authorization: Client APPLICATION_SECRET ```  Replace `APPLICATION_SECRET` with the application secret on the OAuth page in the [developer dashboard](https://developer.squareup.com/apps).
public struct RevokeToken: SquareAPIEndpoint {
	public typealias inputType = RevokeTokenRequest
	public typealias outputType = RevokeTokenResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/oauth2/revoke"
	}
}

/// Returns an OAuth access token.  The endpoint supports distinct methods of obtaining OAuth access tokens. Applications specify a method by adding the `grant_type` parameter in the request and also provide relevant information.  __Note:__ Regardless of the method application specified, the endpoint always returns two items; an OAuth access token and a refresh token in the response.  __OAuth tokens should only live on secure servers. Application clients should never interact directly with OAuth tokens__.
public struct ObtainToken: SquareAPIEndpoint {
	public typealias inputType = ObtainTokenRequest
	public typealias outputType = ObtainTokenResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/oauth2/token"
	}
}

