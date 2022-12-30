import Foundation

class LocationsViewModel : ObservableObject {
    
    private let locationsRemoteAPI : LocationsRemoteAPI
    
    @Published var locations: [LocationDTO] = []
    @Published var nameFiltered: String = ""
    private var currentPage: Int = 1
    private var maxPage: Int = 0
    
    init(locationsRemoteAPI: LocationsRemoteAPI) {
        self.locationsRemoteAPI = locationsRemoteAPI
    }
    
    @MainActor
    func getLocations(name: String) {
        Task {
            currentPage = 1
            let locationsResponse = try await locationsRemoteAPI.getLocations(pageIndex: currentPage, name: name)
            locations = locationsResponse.results
            maxPage = locationsResponse.info.pages
        }
    }
    
    @MainActor
    func getMoreLocations(name: String) {
        Task {
            if currentPage + 1 <= maxPage {
                currentPage = currentPage + 1
                let nextEpisodes = try await locationsRemoteAPI.getLocations(pageIndex: currentPage, name: name)
                locations.append(contentsOf: nextEpisodes.results)
            }
        }
    }
}
