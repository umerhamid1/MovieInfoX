
import Foundation

struct SpokenLanguages: Codable {

  var englishName : String? = nil
  var iso6391     : String? = nil
  var name        : String? = nil

  enum CodingKeys: String, CodingKey {

    case englishName = "english_name"
    case iso6391     = "iso_639_1"
    case name        = "name"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    englishName = try values.decodeIfPresent(String.self , forKey: .englishName )
    iso6391     = try values.decodeIfPresent(String.self , forKey: .iso6391     )
    name        = try values.decodeIfPresent(String.self , forKey: .name        )
 
  }

  init() {

  }

}