import SwiftUI

//Item del filtro de genero y estado.
struct FilterItemView: View {
    var nameLabel: String
    @Binding var nameValue: String
    @State private var scale: CGFloat = 1
    
    var backgroundColor: Color {
        nameLabel == nameValue ? .init(uiColor: .black) : .init(UIColor.secondarySystemBackground)
    }

    var textColor: Color {
        nameLabel == nameValue ? .init(uiColor: .white) : .init(UIColor.label )
    }
    
    var body: some View {
        HStack {
            Text(nameLabel)
                .padding(7)
            
        }.frame(height: 40 , alignment: .center)
            .background(backgroundColor)
            .foregroundColor(textColor)
            .clipShape(Capsule())
            .scaleEffect(scale)
            .onTapGesture {
                withAnimation(.easeIn(duration: 0.25)) {
                    nameValue = nameValue == nameLabel ? "" : nameLabel
                    scale = 2
                }
                withAnimation(.easeInOut(duration: 0.25)) {
                    scale = 1
                }
            }
    }
}

struct FilterItemView_Previews: PreviewProvider {
  static var previews: some View {
        FilterItemView(nameLabel: "Female", nameValue: .constant("Female") )
    }
}
