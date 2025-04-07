import SwiftUI

struct ProfileView: View {
  
  let columns = [
    GridItem(.flexible()),
    GridItem(.flexible()),
    GridItem(.flexible())
  ]
  
    var body: some View {
      ZStack {
        Color.black.ignoresSafeArea()
        
        ScrollView {
          LazyVGrid(columns: columns, spacing: 16) {
          }
        }
      }
    }
}

#Preview {
    ProfileView()
}
