import Foundation

struct Posts: Codable{
    let hits: [Post]
}

struct Post: Codable, Identifiable{
    var id: String{
        return objectID
    }
    let objectID: String
    let title: String
    let url: String?
    let points: Int
}
