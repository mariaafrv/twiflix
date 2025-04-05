import SwiftUI

struct HomeView: View {
    var body: some View {
      TabView {
        FeedView()
      }
        .padding()
    }
}

#Preview {
  HomeView()
}
