protocol LocationsRemoteAPI {
    func getLocations(pageIndex: Int, name: String) async throws -> GetLocationsReponse
}
