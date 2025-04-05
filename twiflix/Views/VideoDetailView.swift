import SwiftUI
import YouTubePlayerKit

struct VideoDetailView: View {
  
  var video: Video
  
    var body: some View {
      GeometryReader { proxy in
        VStack(alignment: .leading) {
          let ytbPlayer = YouTubePlayer(
            source: .video(id: video.snippet?.resourceId?.videoId ?? ""),
            parameters: .init( autoPlay: false )
          )
          
          YouTubePlayerView(ytbPlayer)
            .frame(width: proxy.size.width, height: proxy.size.height/1.77778)
          
          ScrollView {
            VStack(alignment: .leading, spacing: 30) {
              Text(video.snippet?.title ?? "")
                .font(.headline)
                .bold()
              
              Text(video.snippet?.description ?? "")
            }
          }
          .scrollIndicators(.hidden)
          .padding()
        }
      }
    }
}
