import SwiftUI

//Filtro del listado de personajes
struct CharacterFilterView: View {
    
    enum StatusCharacter: String, CaseIterable {
        case alive = "Alive"
        case dead =  "Dead"
        case unknown = "unknown"
    }

    enum GenderCharacter: String, CaseIterable {
        case female = "Female"
        case male = "Male"
        case genderless = "Genderless"
        case unknown = "unknown"
    }
    
    @Environment(\.dismiss) private var dismiss
    @State var name: String
    @State var status: String
    @State var gender: String
    let onButtonTapFilter: (String, String, String) -> Void
        
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Name")
                TextField("Name", text: $name)
                Text("Gender")
                HStack {
                    ForEach(GenderCharacter.allCases, id: \.rawValue) { item in
                        FilterItemView(nameLabel: item.rawValue, nameValue: $gender)
                    }
                }
                Text("Status")
                HStack {
                        ForEach(StatusCharacter.allCases, id: \.rawValue) { item in
                            FilterItemView(nameLabel: item.rawValue, nameValue: $status)
                        }
                    }
            }.padding()
        }
        .overlay(
                Text("FILTER")
                    .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
                    .background(Color.init(uiColor: .label))
                    .foregroundColor(.init(uiColor: .systemBackground))
                    .padding()
                    .onTapGesture {
                        onButtonTapFilter(name, status, gender)
                        dismiss()
                    }
                , alignment: .bottom)
    }
}

struct CharacterFilterView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterFilterView(name: "Name", status: "", gender: "", onButtonTapFilter: { name, status, gender in
        })
    }
}
