import SwiftUI

struct ContentListView: View {
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
