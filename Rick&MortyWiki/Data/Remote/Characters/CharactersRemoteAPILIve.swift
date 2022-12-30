import Foundation

class CharactersRemoteAPILive: CharactersRemoteAPI {
    
    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getCharacters(pageIndex: Int, name: String, status: String, gender: String) async throws -> GetCharactersReponse {
        let request = Request(endpoint: .getCharacters(pageIndex: pageIndex,name: name, status: status, gender: gender))
        return try await networkClient.call(for: request)
    }
}
