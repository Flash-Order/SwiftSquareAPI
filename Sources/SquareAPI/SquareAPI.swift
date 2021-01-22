#if VAPOR
import Vapor
#else
import Foundation
///public typealias Content = Codable
public enum HTTPMethod: String {
	case GET,POST,PUT
}
#endif

public typealias Timestamp = String		// for now we'll do strings but later make dates
public typealias Duration = String

extension Duration {
	static func fromSeconds(_ seconds: Int) -> Duration {
		let hours = seconds / 3600
		let minutes = (seconds - hours*3600) / 60
		let seconds = seconds - hours*3600 - minutes*60
		var str = "PT"
		if hours > 0 { str += "\(hours)H" }
		if minutes > 0 { str += "\(minutes)M" }
		if seconds > 0 { str += "\(seconds)S" }
		return str
	}
}

//extension Timestamp {
//	var date3339: Date? { return iso3339.date(from: self) }
//}


let kSquareHost = "connect.squareup.com"

public protocol SQCodable: Codable {}

extension Array: SQCodable where Element: SQCodable {}

/// protocol for Square Endpoint definitions
public protocol SquareAPIEndpoint {
	associatedtype inputType: SQCodable
	associatedtype outputType: SQCodable
	associatedtype paramType
	static func endpoint(for inputs: paramType) throws -> String
	//static func post(_ inputs: inputType, token: String, req: Request) -> EventLoopFuture<outputType>
	static var method: HTTPMethod { get }	// default is post, override if needed
}

extension SquareAPIEndpoint {
	public static var method: HTTPMethod { return .POST }		// default method
}

public struct Empty: SQCodable {
	public init() { }
}

/*
extension SquareAPIEndpoint where paramType == Empty {
	static func post(_ inputs: inputType, token: String) {//}, req: Request) -> EventLoopFuture<outputType> {
	}
}

extension SquareAPIEndpoint {
	static func post(_ params: paramType, _ inputs: inputType, token: String) {//}, req: Request) -> EventLoopFuture<outputType> {
	}
}
*/

struct SquareAPI {
    var text = "Hello, World!"
	
	var order = Order(location_id: "asdf", closed_at: "asfa", version: 5)

	func a() {
//		var fup = OrderFulfillmentUpdated()
//		fup.location_id = "asdfasfa"
//		fup.version = 5
		
	}
}
