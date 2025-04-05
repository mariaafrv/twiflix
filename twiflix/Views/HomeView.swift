import SwiftUI

struct HomeView: View {
  
  @State private var buttonOffset: CGFloat = 0
  
  var body: some View {
    ZStack {
      Color.black
      VStack (alignment: .center, spacing: 180){
        Spacer()
        LogoView()
        Spacer()
        CustomButtonView()
      }
    }
    .ignoresSafeArea()
  }
}
    
#Preview {
      HomeView()
    }
