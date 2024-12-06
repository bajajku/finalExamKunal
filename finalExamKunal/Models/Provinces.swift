import Foundation
struct Provinces : Codable {
	let name : String?
	let capitalCity : CapitalCity?
	let population : Int?
	let description : String?

	enum CodingKeys: String, CodingKey {
        
		case name = "name"
		case capitalCity = "capitalCity"
		case population = "population"
		case description = "description"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		capitalCity = try values.decodeIfPresent(CapitalCity.self, forKey: .capitalCity)
		population = try values.decodeIfPresent(Int.self, forKey: .population)
		description = try values.decodeIfPresent(String.self, forKey: .description)
	}

}
