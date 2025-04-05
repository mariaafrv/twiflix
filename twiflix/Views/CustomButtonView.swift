import SwiftUI

struct CustomButtonView: View {
  
  let buttonHeight: CGFloat = 80
  
  var body: some View {
    GeometryReader { geometry in
      ZStack {
        Capsule()
          .fill(Color(hex: "#FA5C9E").opacity(0.2))
        Capsule()
          .fill(Color(hex: "#FA5C9E").opacity(0.2))
          .padding(8)
        Text("Watch now")
          .font(.title2)
          .bold()
          .offset(x: 20)
        HStack {
          ZStack {
            Circle()
              .fill(Color(hex: "#FA5C9E").opacity(0.2))
            Circle()
              .fill(Color(hex: "#FA5C9E"))
              .padding(8)
            Image(systemName: "chevron.right.2")
              .font(.system(size: 24))
              .bold()
          }
          Spacer()
        }
      }
      .frame(width: geometry.size.width - 60, height: buttonHeight)
      .frame(maxWidth: .infinity)
    }
  }
}

#Preview {
    CustomButtonView()
}
