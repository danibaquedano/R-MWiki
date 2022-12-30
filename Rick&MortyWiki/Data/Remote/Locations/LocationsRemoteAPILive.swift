import Foundation

class  LocationsRemoteAPILive: LocationsRemoteAPI {

    private let networkClient: NetworkClient
    
    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }
    
    func getLocations(pageIndex: Int, name: String) async throws -> GetLocationsReponse {
        let request = Request(endpoint: .getAllLocations(pageIndex: pageIndex, name: name))
        return try await networkClient.call(for: request)
    }
}
