
import Foundation

struct ProductionCompanies: Codable {

  var id            : Int?    = nil
  var logoPath      : String? = nil
  var name          : String? = nil
  var originCountry : String? = nil

  enum CodingKeys: String, CodingKey {

    case id            = "id"
    case logoPath      = "logo_path"
    case name          = "name"
    case originCountry = "origin_country"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id            = try values.decodeIfPresent(Int.self    , forKey: .id            )
    logoPath      = try values.decodeIfPresent(String.self , forKey: .logoPath      )
    name          = try values.decodeIfPresent(String.self , forKey: .name          )
    originCountry = try values.decodeIfPresent(String.self , forKey: .originCountry )
 
  }

  init() {

  }

}