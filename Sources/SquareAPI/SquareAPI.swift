#if VAPOR
import Vapor
#else
import Foundation
///public typealias Content = Codable
public enum HTTPMethod: String {
	case GET,POST,PUT,DELETE
}
#endif

public typealias Timestamp = String		// for now we'll do strings but later make dates
public typealias Duration = String

public extension Duration {
	static func fromSeconds(_ seconds: Int) -> Duration {
		if seconds == 0 { return "PT0S" }
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

enum DecodeError: Error {
	case message(String)
}

enum UsageError: Error {
	case message(String)
}

//extension Timestamp {
//	var date3339: Date? { return iso3339.date(from: self) }
//}
public struct StringNumber: Codable, Equatable {
	public var rawValue: String
	
	public var floatValue: Float? {
		set {
			if let nv = newValue { rawValue = "\(nv)" }
			else { rawValue = "" }
		}
		get {
			return Float(rawValue)
		}
	}

	public var intValue: Int? {
		set {
			if let nv = newValue { rawValue = "\(nv)" }
			else { rawValue = "" }
		}
		get {
			return Int(rawValue)
		}
	}

	public init(from decoder: Decoder) throws {
		let container = try decoder.singleValueContainer()
		if let strValue = try? container.decode(String.self) {
			rawValue = strValue
		}
		else if let fltValue = try? container.decode(Float.self) {
			rawValue = "\(fltValue)"
		}
		else if let intValue = try? container.decode(Int.self) {
			rawValue = "\(intValue)"
		}
		else {
			throw DecodeError.message( "Cannot get value even trying String, Float, and Int" )
		}
	}
	
	public func encode(to encoder: Encoder) throws {
		var container = encoder.singleValueContainer()
		try container.encode(rawValue)
	}
}


/// protocol for Square Endpoint definitions
public protocol SquareAPIEndpoint {
	associatedtype inputType: Codable
	associatedtype outputType: Codable
	associatedtype paramType
	static func endpoint(for inputs: paramType) throws -> String
	static var method: HTTPMethod { get }	// default is post, override if needed
}

extension SquareAPIEndpoint {
	public static var method: HTTPMethod { return .POST }		// default method
}
