
import Foundation

struct ProductionCountries: Codable {

  var iso31661 : String? = nil
  var name     : String? = nil

  enum CodingKeys: String, CodingKey {

    case iso31661 = "iso_3166_1"
    case name     = "name"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    iso31661 = try values.decodeIfPresent(String.self , forKey: .iso31661 )
    name     = try values.decodeIfPresent(String.self , forKey: .name     )
 
  }

  init() {

  }

}