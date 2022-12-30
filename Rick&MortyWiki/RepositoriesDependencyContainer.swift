import Foundation

class RepositoriesDependencyContainer {
    private let networkClient: NetworkClient
    
    let episodesRemoteAPI: EpisodesRemoteAPI
    let charactersRemoteAPI: CharactersRemoteAPI
    let locationsRemoteAPI: LocationsRemoteAPI
    
    init() {
        networkClient = URLSessionNetworkClient()
        
        episodesRemoteAPI = EpisodesRemoteAPILive(networkClient: networkClient)
        charactersRemoteAPI = CharactersRemoteAPILive(networkClient: networkClient)
        locationsRemoteAPI = LocationsRemoteAPILive(networkClient: networkClient)
    }
}
