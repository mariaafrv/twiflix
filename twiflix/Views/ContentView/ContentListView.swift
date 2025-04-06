import SwiftUI

struct ContentListView: View {
  let posters: [PosterItem] = [
    PosterItem(id: "PLyo6W3g1j4QYag-QY_Im0OYoHijdxiXmb", imageName: "seize-the-light"),
    PosterItem(id: "PL1zdtDqQ51PuDL-MI4aCi6BxhYoag9sMA", imageName: "twice-tv"),
    PosterItem(id: "PLyo6W3g1j4QZ2qB1uRi-x3A0xCcc1w-C1", imageName: "time-to-twice"),
    PosterItem(id: "PLIKwOGKJJyIHJbwA7CqPcZsa9VkQ_9jNy", imageName: "twlog"),
    PosterItem(id: "PLIKwOGKJJyIHTA4Y6KbcsoxpO63zK07Od", imageName: "2wice-date"),
    PosterItem(id: "PLIKwOGKJJyIERk1mvm2AaOEVSpxYpCHiC", imageName: "melody-project")
  ]
  
  
  let columns = [
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible())
  ]
  
  var body: some View {
    NavigationStack {
      ZStack {
        Color.black.ignoresSafeArea()
        
        ScrollView {
          LazyVGrid(columns: columns, spacing: 16) {
            ForEach(posters) { item in
              NavigationLink(destination: ListView(playlistId: item.id)) {
                Image(item.imageName)
                  .resizable()
                  .scaledToFill()
                  .frame(width: 100, height: 150)
                  .clipped()
                  .cornerRadius(8)
              }
            }
          }
          .padding()
        }
      }
    }
  }
}

#Preview {
  ContentListView()
}
