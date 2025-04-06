import SwiftUI

struct ListView: View {
  
  var playlistId: String
  @State private var videos = [Video]()
  @State private var selectedVideo: Video?
  
    var body: some View {
      ZStack {
        Color.black.ignoresSafeArea()
        List(videos) { vid in
          VideoRowView(video: vid)
            .onTapGesture {
              selectedVideo = vid
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
        .sheet(item: $selectedVideo) { vid in
          VideoDetailView(video: vid)
        }
      }

      }
  
}

#Preview {
  ListView(playlistId: "PLIKwOGKJJyIERk1mvm2AaOEVSpxYpCHiC")
}
