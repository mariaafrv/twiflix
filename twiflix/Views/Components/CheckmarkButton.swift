import SwiftUI

struct CheckmarkButton: View {
  var videoId: String
  @State private var isWatched = false
  
  var body: some View {
    Button(action: {
      isWatched.toggle()
      if isWatched {
        WatchedVideosManager.shared.markAsWatched(videoId)
      } else {
        WatchedVideosManager.shared.unmarkAsWatched(videoId)
      }
    }) {
      Circle()
        .fill(isWatched ? Color.green.opacity(0.9) : Color.white.opacity(0.8))
        .frame(width: 30, height: 30)
        .overlay(
          Image(systemName: "checkmark")
            .foregroundColor(isWatched ? .white : .green)
        )
    }
    .padding(8)
    .onAppear {
      isWatched = WatchedVideosManager.shared.isWatched(videoId)
    }
  }
}
