/// Activates a domain for use with Apple Pay on the Web and Square. A validation is performed on this domain by Apple to ensure that it is properly set up as an Apple Pay enabled domain.  This endpoint provides an easy way for platform developers to bulk activate Apple Pay on the Web with Square for merchants using their platform.  To learn more about Web Apple Pay, see [Add the Apple Pay on the Web Button](/docs/payment-form/add-digital-wallets/apple-pay).
public struct RegisterDomain: SquareAPIEndpoint {
	public typealias inputType = RegisterDomainRequest
	public typealias outputType = RegisterDomainResponse
	public typealias paramType = Empty
	public static func endpoint(for inputs: Empty) throws -> String {
		return "/v2/apple-pay/domains"
	}
}

