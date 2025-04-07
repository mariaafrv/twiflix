import SwiftUI
import YouTubePlayerKit

struct VideoDetailView: View {
  
  var video: Video
  
  var body: some View {
    ZStack {
      Color.black
      
      VStack(alignment: .leading, spacing: 0) {
        let videoId = video.snippet?.resourceId?.videoId ?? ""
        let ytbPlayer = YouTubePlayer(
          source: .video(id: videoId),
          parameters: .init(autoPlay: false)
        )
        
        YouTubePlayerView(ytbPlayer)
          .frame(height: UIScreen.main.bounds.width / 1.77778)
        
        ScrollView {
          VStack(alignment: .leading, spacing: 30) {
            HStack {
              Text(video.snippet?.title ?? "")
                .font(.title3)
                .bold()
                .foregroundStyle(Color(hex: "FFFFFF"))
              Spacer()
              CheckmarkButton(videoId: videoId)
            }
            
            Text(video.snippet?.description ?? "")
              .foregroundStyle(Color(hex: "FFFFFF"))
          }
          .padding()
        }
        .background(Color.black)
        .scrollIndicators(.hidden)
      }
    }
    .background(Color.black)
    .navigationTitle("")
    .navigationBarTitleDisplayMode(.inline)
  }
}
