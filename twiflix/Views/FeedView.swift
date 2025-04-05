import SwiftUI

struct FeedView: View {
  
  @State private var videos = [Video]()
  @State private var selectedVideo: Video?
  
    var body: some View {
        List(videos) { vid in
          VideoRowView(video: vid)
            .onTapGesture {
              selectedVideo = vid
            }
            .listRowSeparator(.hidden)
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        .padding()
        
        .task {
          self.videos = await DataService().getVideos()
        }
        .sheet(item: $selectedVideo) { vid in
          VideoDetailView(video: vid)
        }
      }
  
}

#Preview {
    FeedView()
}
