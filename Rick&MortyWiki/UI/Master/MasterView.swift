import SwiftUI

struct MasterView<CharactersScreen: View, LocationsScreen: View, EpisodesScreen: View>: View {
    private let makeCharactersScreen: () -> CharactersScreen
    private let makeLocationsScreen: () -> LocationsScreen
    private let makeEpiosdesScreen: () -> EpisodesScreen
   
    
    init(makeCharactersScreen: @escaping () -> CharactersScreen,
         makeLocationsScreen: @escaping () -> LocationsScreen,
         makeEpiosdesScreen: @escaping () -> EpisodesScreen) {
        
        self.makeCharactersScreen = makeCharactersScreen
        self.makeLocationsScreen = makeLocationsScreen
        self.makeEpiosdesScreen = makeEpiosdesScreen
    }
    var body: some View {
        TabView {
            makeCharactersScreen()
                .tabItem {
                    Image(systemName: "person.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 10)
                    Text("Characters")
                }
            makeEpiosdesScreen()
                .tabItem {
                    
                    Image(systemName: "play.square.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 10)
                    Text("Episodes")
                }
            makeLocationsScreen()
                .tabItem {
                    Image(systemName: "location.square.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 10)
                    Text("Locations")
                }
        }
    }
}

struct MasterView_Previews: PreviewProvider {
    static var previews: some View {
        MasterView( makeCharactersScreen: {CharactersScreen(viewModel: CharactersViewModel(charactersRemoteAPI: CharactersRemoteAPILive(networkClient: URLSessionNetworkClient())))} ,
                    makeLocationsScreen: {LocationsScreen(viewModel: LocationsViewModel(locationsRemoteAPI: LocationsRemoteAPILive(networkClient: URLSessionNetworkClient())))},
                    makeEpiosdesScreen: {EpisodesScreen(viewModel: EpisodesViewModel(episodesRemoteAPI: EpisodesRemoteAPILive(networkClient: URLSessionNetworkClient())))})
    }
}
