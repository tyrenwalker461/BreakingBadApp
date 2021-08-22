import Foundation

struct TVShow: Decodable, Identifiable {
    var id: Int
    var name: String
    var img: URL
    var status: String
    var nickname: String
    
    enum CodingKeys: String, CodingKey{
        case id = "char_id"
        case name = "name"
        case img = "img"
        case status = "status"
        case nickname = "nickname"
    }
}
