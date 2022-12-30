import Foundation

class EpisodesRemoteAPILive: EpisodesRemoteAPI {
    
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getEpisodes(pageIndex: Int, name: String) async throws -> GetEpisodesResponse {
        let request = Request(endpoint: .getAllEpisodes(pageIndex: pageIndex, name: name))
        return try await networkClient.call(for: request)
    }
}
