import SwiftUI

struct VideoRowView: View {
  var video: Video
  
  var body: some View {
    let videoId = video.snippet?.resourceId?.videoId ?? ""
    let isWatched = WatchedVideosManager.shared.isWatched(videoId)
    
    VStack(alignment: .leading, spacing: 8) {
      ZStack(alignment: .bottomTrailing) {
        if let url = URL(string: video.snippet?.thumbnails?.medium?.url ?? "") {
          AsyncImage(url: url) { image in
            image
              .resizable()
              .aspectRatio(contentMode: .fill)
              .frame(maxWidth: .infinity)
              .clipShape(RoundedRectangle(cornerRadius: 5))
          } placeholder: {
            ProgressView()
              .frame(height: 180)
              .frame(maxWidth: .infinity)
          }
        }
        
        if isWatched {
          Text("Watched")
            .font(.caption2)
            .bold()
            .foregroundColor(.white)
            .padding(.horizontal, 8)
            .padding(.vertical, 4)
            .background(Color.green.opacity(0.8))
            .clipShape(Capsule())
            .padding(8)
        }
      }
      
      Text(video.snippet?.title ?? "")
        .font(.title2)
        .bold()
        .foregroundStyle(Color(hex: "FFFFFF"))
        .lineLimit(2)
    }
    .frame(maxWidth: .infinity, alignment: .leading)
    .background(Color.black)
  }
}
