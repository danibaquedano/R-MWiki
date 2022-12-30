import SwiftUI

//Item del listado de localizaciones
struct LocationRowView: View {
    var location: LocationDTO
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(location.name)
                    .font(.headline)
                Text(location.dimension)
                    .font(.footnote)
                Text(location.type)
                    .font(.footnote)
            }
            Spacer()
        }.padding()
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.systemGray6))
                .shadow(color: Color(UIColor.systemGray3), radius: 4, x:0, y:3))
        Spacer()
    }
}

struct LocationRowView_Previews: PreviewProvider {
    static var previews: some View {
        LocationRowView(location: LocationDTO(id: 1, name: "Name", type: "Type", dimension: "Dimension", residents: ["1"]))
    }
}
