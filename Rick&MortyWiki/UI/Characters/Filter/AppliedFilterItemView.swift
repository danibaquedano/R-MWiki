import SwiftUI

//Item del listado de filtros aplicados
struct AppliedFilterItemView: View {
    
    @Binding var value: String
    @Binding var refreshList: Bool
    
    var body: some View {
        HStack {
            Text(value)
                .padding(7)
            Image(systemName: "xmark")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 8, height: 8)
                .foregroundColor(.init(uiColor: .label))
                .padding(4)
                .background(
                    Circle()
                        .foregroundColor(.init(uiColor: .label))
                        .opacity(0.1)
                )
                .padding(.trailing , 10)
                .onTapGesture {
                    value = ""
                    refreshList.toggle()
                }
            
        }.frame(height: 40 , alignment: .center)
            .background(Color(UIColor.secondarySystemBackground))
            .clipShape(Capsule())
    }
}

struct AppliedFilterItemView_Previews: PreviewProvider {
    static var previews: some View {
        AppliedFilterItemView(value:  .constant("Rick"), refreshList: .constant(false))
    }
}
