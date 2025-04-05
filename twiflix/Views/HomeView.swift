import SwiftUI

struct HomeView: View {
    var body: some View {
      TabView {
        FeedView()
          .tabItem {
            Image(systemName: "play.square.stack")
            Text("Feed")
          }
      }
      .ignoresSafeArea()
    }
}

#Preview {
  HomeView()
}
