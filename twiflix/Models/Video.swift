import Foundation

struct Video: Decodable, Identifiable {
  var id: String
  var snippet: Snippet?
}

struct Snippet: Decodable {
  var title: String
  var description: String
  var thumbnails: Thumbnails?
  var resourceId: ResourceId?
}

struct ResourceId: Decodable {
  var videoId: String
}

struct Thumbnails: Decodable {
  var medium: ThumbnailsSize?
}


struct ThumbnailsSize: Decodable {
  var url: String
  var width: Int
  var height: Int
}
