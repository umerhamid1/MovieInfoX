
import Foundation

struct BelongsToCollection: Codable {

  var id           : Int?    = nil
  var name         : String? = nil
  var posterPath   : String? = nil
  var backdropPath : String? = nil

  enum CodingKeys: String, CodingKey {

    case id           = "id"
    case name         = "name"
    case posterPath   = "poster_path"
    case backdropPath = "backdrop_path"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    id           = try values.decodeIfPresent(Int.self    , forKey: .id           )
    name         = try values.decodeIfPresent(String.self , forKey: .name         )
    posterPath   = try values.decodeIfPresent(String.self , forKey: .posterPath   )
    backdropPath = try values.decodeIfPresent(String.self , forKey: .backdropPath )
 
  }

  init() {

  }

}