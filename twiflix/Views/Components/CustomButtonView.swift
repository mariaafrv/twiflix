import SwiftUI

struct CustomButtonView: View {
  
  let buttonHeight: CGFloat = 80
  @State private var buttonOffset: CGFloat = 0
  @State private var showContentScreen = false
  
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
          Capsule()
            .fill(Color(hex: "#FA5C9E"))
            .frame(width: buttonOffset + buttonHeight)
          
          Spacer()
        }
        
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
        
        // Animation
        
        .offset(x: buttonOffset)
        .gesture(
          DragGesture()
            .onChanged({ gesture in
              if gesture.translation.width >= 0 && buttonOffset <= (geometry.size.width - 60) - 80 {
                withAnimation(.easeInOut(duration: 0.25)) {
                  buttonOffset = gesture.translation.width
                }
              }
            })
          
            .onEnded({ _ in
              if buttonOffset > (geometry.size.width - 60) / 2 {
                showContentScreen = true
              } else {
                withAnimation(.easeInOut(duration: 0.25)) {
                  buttonOffset = 0
                }
              }
            })
        )
      }
      .frame(width: geometry.size.width - 60, height: buttonHeight)
      .frame(maxWidth: .infinity)
    }
    .fullScreenCover(isPresented: $showContentScreen) {
      ContentListView()
    }
  }
}

#Preview {
  CustomButtonView()
}
