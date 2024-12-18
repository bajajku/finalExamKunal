// Kunal, 991648986

import Foundation
struct Provinces : Codable, Hashable, Equatable, Identifiable{
    let id = UUID()
	let name : String?
	let capitalCity : CapitalCity?
	let population : Int?
	let description : String?

	
    
    // Hashable and Equatable conformance for navigation
    func hash(into hasher: inout Hasher) {
            hasher.combine(name)
        }
        
    static func == (lhs: Provinces, rhs: Provinces) -> Bool {
            return lhs.name == rhs.name
        }

}
