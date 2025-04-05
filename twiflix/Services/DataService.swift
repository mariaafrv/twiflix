import Foundation

struct DataService {
  private let apiKey = Bundle.main.infoDictionary?["API_KEY"] as? String
  
  func getVideos() async -> [Video] {
    guard apiKey != nil else { return [Video]() }
    
    let urlString = "https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=PLyo6W3g1j4QZ2qB1uRi-x3A0xCcc1w-C1&maxResults=20&key=\(apiKey!)"
    let url = URL(string: urlString)
    
    if let url = url {
      let request = URLRequest(url: url)
      
      do {
        let (data, _) = try await URLSession.shared.data(for: request)
        
        let decoder = JSONDecoder()
        let playlist = try decoder.decode(Playlist.self, from: data)
        
        return playlist.items
      }
      catch {
        print("\(error)")
      }
    }
  
  
  return [Video]()
}
}
