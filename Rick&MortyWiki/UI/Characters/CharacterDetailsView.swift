import SwiftUI
import Kingfisher

//Pantalla de detalle de personaje
struct CharacterDetailsView: View {
    
    var character: CharacterDTO
    
    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: character.image)!)
                .resizable()
                .aspectRatio(1, contentMode: .fill)
        }
        HStack {
            VStack(alignment: .leading) {
                Text(character.name)
                    .font(.title)
                    .padding(.horizontal, 10)
                VStack(alignment: .leading) {
                    itemCharacterInfo(label: "Species", value: character.species)
                    
                    if character.type != "" {
                        itemCharacterInfo(label: "Type", value: character.type)
                    }
                    
                    itemCharacterInfo(label: "Gender", value: character.gender)
                    itemCharacterInfo(label: "Status", value: character.status)
                    itemCharacterInfo(label: "Origin location", value: character.origin.name)
                    itemCharacterInfo(label: "Last known location", value: character.location.name)
                }.padding(10)
            }
            Spacer()
        }
        Spacer()
    }
    
    func itemCharacterInfo(label: String, value: String) -> some View {
        VStack(alignment: .leading) {
            Text(label)
                .font(.headline)
            Text(value)
        }.padding(.vertical, 2)
    }
}

