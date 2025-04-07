import Foundation

class WatchedVideosManager {
  static let shared = WatchedVideosManager()
  private let key = "watchedVideos"
  
  private init() {}
  
  func markAsWatched(_ videoId: String) {
    var current = getWatchedVideos()
    current.insert(videoId)
    UserDefaults.standard.set(Array(current), forKey: key)
  }
  
  func unmarkAsWatched(_ videoId: String) {
    var current = getWatchedVideos()
    current.remove(videoId)
    UserDefaults.standard.set(Array(current), forKey: key)
  }
  
  func isWatched(_ videoId: String) -> Bool {
    return getWatchedVideos().contains(videoId)
  }
  
  private func getWatchedVideos() -> Set<String> {
    let array = UserDefaults.standard.stringArray(forKey: key) ?? []
    return Set(array)
  }
}
