import SwiftUI

struct ListView: View {
  
  var playlistId: String
  @State private var videos = [Video]()
  // @State private var selectedVideo: Video?
  
  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()
        List(videos) { vid in
          NavigationLink(destination: VideoDetailView(video: vid)) {
            VideoRowView(video: vid)
              .padding(.trailing, -16)
          }
          .listRowSeparator(.hidden)
          .listRowBackground(Color.black)
        }
        .listStyle(.plain)
        .scrollIndicators(.hidden)
        .padding()
        .tint(.black)
        
        .task {
          self.videos = await DataService().getVideos(playlistId: playlistId)
        }
      }
    }
    
  }
  
}

#Preview {
  ListView(playlistId: "PLIKwOGKJJyIERk1mvm2AaOEVSpxYpCHiC")
}
