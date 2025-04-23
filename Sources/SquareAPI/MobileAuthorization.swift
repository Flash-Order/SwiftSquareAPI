/// __Note:__ This endpoint is used by the deprecated Reader SDK.  Developers should update their integration to use the [Mobile Payments SDK](https://developer.squareup.com/docs/mobile-payments-sdk), which includes its own authorization methods.   Generates code to authorize a mobile application to connect to a Square card reader.  Authorization codes are one-time-use codes and expire 60 minutes after being issued.  The `Authorization` header you provide to this endpoint must have the following format:  ``` Authorization: Bearer ACCESS_TOKEN ```  Replace `ACCESS_TOKEN` with a [valid production authorization credential](https://developer.squareup.com/docs/build-basics/access-tokens).
@available(*,deprecated)
public struct CreateMobileAuthorizationCode: SquareAPIEndpoint {
	public typealias inputType = CreateMobileAuthorizationCodeRequest
	public typealias outputType = CreateMobileAuthorizationCodeResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/mobile/authorization-code"
	}
}

