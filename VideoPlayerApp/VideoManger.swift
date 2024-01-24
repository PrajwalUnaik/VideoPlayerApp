import Foundation

enum Query: String , CaseIterable {
    case nature, animal , people , ocean , food
}
class VideoManager: ObservableObject {
    @Published private(set) var videos: [Video] = []
    @Published var selectedQuery: Query = Query.nature {
        didSet {
            Task.init {
                await findVideos(topic: selectedQuery)
            }
        }
    }
    
    init() {
        Task.init {
            await findVideos(topic: selectedQuery)
        }
    }
        func findVideos(topic: Query) async {
        do {
        guard let url = URL(string: "https://api.pexels.com/videos/search?query=\(topic)&per_page=10&orientation=portrait") else { fatalError("Missing URL") }
        
        var urlRequest = URLRequest(url: url)
                urlRequest.setValue("MFSyuTK50RxQApCHAONYsbGNoShYTewh82YdpkqaB7C6NsbTJ8UclFhL", forHTTPHeaderField: "Authorization")
        
            // Fetching the data
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            // Making sure the response is 200 OK before continuing
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            
            // Creating a JSONDecoder instance
            let decoder = JSONDecoder()
            
            // Allows us to convert the data from the API from snake_case to cameCase
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            
            // Decode into the ResponseBody struct below
            let decodedData = try decoder.decode(ResponceBody.self, from: data)
            
            // Setting the videos variable
            DispatchQueue.main.async {
                // Reset the videos (for when we're calling the API again)
                self.videos = []
                
                // Assigning the videos we fetched from the API
                self.videos = decodedData.videos
            }

        } catch {
            // If we run into an error, print the error in the console
            print("Error fetching data from Pexels: \(error)")
        }
    }
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
