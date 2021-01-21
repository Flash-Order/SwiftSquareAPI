#if VAPOR
import Vapor
#else
import Foundation
typealias Content = Codable
enum HTTPMethod: String {
	case GET,POST,PUT
}
#endif

typealias Timestamp = String		// for now we'll do strings but later make dates
typealias Duration = String

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


/// protocol for Square Endpoint definitions
protocol SquareAPIEndpoint {
	associatedtype inputType: Content
	associatedtype outputType: Content
	associatedtype paramType
	static func endpoint(for inputs: paramType) throws -> String
	//static func post(_ inputs: inputType, token: String, req: Request) -> EventLoopFuture<outputType>
	static var method: HTTPMethod { get }	// default is post, override if needed
}

extension SquareAPIEndpoint {
	static var method: HTTPMethod { return .POST }		// default method
}

struct Empty: Content {}

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
	
	//var order = Order(closed_at: <#T##Timestamp?#>, created_at: <#T##Timestamp?#>, customer_id: <#T##String?#>, discounts: <#T##[OrderLineItemDiscount]?#>, fulfillments: <#T##[OrderFulfillment]?#>, id: <#T##String?#>, line_items: <#T##[OrderLineItem]?#>, location_id: <#T##String#>, metadata: <#T##String?#>, net_amounts: <#T##OrderMoneyAmounts?#>, pricing_options: <#T##OrderPricingOptions?#>, reference_id: <#T##String?#>, refunds: <#T##[Refund]?#>, return_amounts: <#T##OrderMoneyAmounts?#>, returns: <#T##[OrderReturn]?#>, rewards: <#T##[OrderReward]?#>, rounding_adjustment: <#T##OrderRoundingAdjustment?#>, service_charges: <#T##[OrderServiceCharge]?#>, source: <#T##OrderSource?#>, state: <#T##OrderState?#>, taxes: <#T##[OrderLineItemTax]?#>, tenders: <#T##[Tender]?#>, total_discount_money: <#T##Money?#>, total_money: <#T##Money?#>, total_service_charge_money: <#T##Money?#>, total_tax_money: <#T##Money?#>, total_tip_money: <#T##Money?#>, updated_at: <#T##Timestamp?#>, version: <#T##Int?#>)
	var order = Order(
		closed_at: nil,
		created_at: nil,
		customer_id: nil,
		discounts: nil,
		fulfillments: nil,
		id: nil,
		line_items: nil,
		location_id: "asdf",
		metadata: nil,
		net_amounts: nil,
		pricing_options: nil,
		reference_id: nil,
		refunds: nil,
		return_amounts: nil,
		returns: nil,
		rewards: nil,
		rounding_adjustment: nil,
		service_charges: nil,
		source: nil,
		state: nil,
		taxes: nil,
		tenders: nil,
		total_discount_money: nil,
		total_money: nil,
		total_service_charge_money: nil,
		total_tax_money: nil,
		total_tip_money: nil,
		updated_at: nil,
		version: nil)

	func a() {
//		var fup = OrderFulfillmentUpdated()
//		fup.location_id = "asdfasfa"
//		fup.version = 5
		
	}
}

/*
public struct CancelTerminalRefund: SquareAPIEndpoint {
static func endpoint(for inputs: Empty) throws -> String {
return "asdfasf"
}

typealias inputType = Empty
typealias outputType = Empty
typealias paramType = Empty
}

public struct CancelTerminalRefund2: SquareAPIEndpoint {
static func endpoint(for inputs: Input) throws -> String {
return "asfafda/\(inputs.a)/\(inputs.b)"
}

typealias inputType = Empty
typealias outputType = Empty
typealias paramType = Input

struct Input {
let a: String
let b: String
}
}

*/
