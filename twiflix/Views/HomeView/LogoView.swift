import SwiftUI

struct LogoView: View {
  var body: some View {
    ZStack {
      Color.black
      Image(.twiflixLogo)
        .resizable()
        .scaledToFit()
    }
    .ignoresSafeArea()
  }
}

#Preview {
    LogoView()
}
