import Foundation
struct ProvinceData : Codable {
	let country : String?
	let provinces : [Provinces]?

	enum CodingKeys: String, CodingKey {
        
		case country = "country"
		case provinces = "provinces"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		provinces = try values.decodeIfPresent([Provinces].self, forKey: .provinces)
	}

}
