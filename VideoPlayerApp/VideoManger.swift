import Foundation

enum Query: String , CaseIterable {
    case nature, animal , people , ocean , food
}

struct ResponceBody: Decodable {
    let page, perPage, totalResults: Int
    let url: String
    let videos: [Video]
}
struct Video: Identifiable, Decodable {
    let id: Int
    let image: String
    let duration: Int
    let user: User
    let videoFiles: [VideoFile]
    
    struct User: Identifiable, Decodable {
        let id: Int
        let name: String
        let url: String
    }
    struct VideoFile: Identifiable, Decodable {
        let id: Int
        let quality, fileType: String
        let link: String
    }
}
