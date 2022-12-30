import SwiftUI
import Kingfisher

// Item del listado de personajes.
struct CharacterRowView: View {
    
    var character: CharacterDTO
    
    var body: some View {
        ZStack(alignment: .bottom) {
            
            KFImage(URL(string: character.image)!)
                .resizable()
                .aspectRatio(1, contentMode: .fill)
                .cornerRadius(10)
                .clipped()
            
            VStack(alignment: .leading) {
                Text(character.name)
                    .foregroundColor(.white)
                    .lineLimit(1)
                    .padding(2)
            }.frame(maxWidth: .infinity)
                .background(.black)
                .opacity(0.7)
            
        }.cornerRadius(10)
            .clipped()
    }
}

//struct CharacterRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        CharacterRowView(character: CharacterDTO(id: 1, name: "name", status: "Status", species: "Species", type: "Type", gender: "Gender", origin: ResumeLocationDTO(name: "name", url: "url"), location: ResumeLocationDTO(name: "name", url: "Url"), image: "", episode: [""]))
//    }
//}
