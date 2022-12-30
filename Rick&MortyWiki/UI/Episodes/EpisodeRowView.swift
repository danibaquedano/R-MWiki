import SwiftUI

struct EpisodeRowView: View {
    
    var episode: EpisodeDTO
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Text(episode.episode)
                
                Spacer()
                Text(episode.air_date)
            } .font(.footnote)
            Text(episode.name)
                .font(.headline)
                .lineLimit(1)
            
        }.padding()
            .background(RoundedRectangle(cornerRadius: 10)
                .fill(Color(UIColor.systemGray6))
                .shadow(color: Color(UIColor.systemGray3), radius: 4, x:0, y:3)
            )
    }
}

struct EpisodeRowView_Previews: PreviewProvider {
    static var previews: some View {
        EpisodeRowView(episode: EpisodeDTO(id: 1, name: "Episodes", air_date: "AIR DATE", episode: "0102", characters: ["1"]))
    }
}
