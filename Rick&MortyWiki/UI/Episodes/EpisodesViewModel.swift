import Foundation

class EpisodesViewModel : ObservableObject {
    
    private let episodesRemoteAPI: EpisodesRemoteAPI
    
    @Published var episodes: [EpisodeDTO] = []
//    @Published var nameFiltered: DebouncedState<String> = DebouncedState(initialValue: "", delay:  3)
    private var currentPage: Int = 1
    private var maxPage: Int = 0
    
    init(episodesRemoteAPI: EpisodesRemoteAPI) {
        self.episodesRemoteAPI = episodesRemoteAPI
    }
    
    @MainActor
    func getEpisodes(name: String) {
 
        currentPage = 1
        Task {
            let episodesResponse = try await episodesRemoteAPI.getEpisodes(pageIndex: currentPage, name: name)
            episodes = episodesResponse.results
            maxPage = episodesResponse.info.pages
        }
    }
    
    @MainActor
    func getMoreEpisodes(name: String) {
        Task {
            if currentPage + 1 <= maxPage {
                currentPage = currentPage + 1
                let nextEpisodes = try await episodesRemoteAPI.getEpisodes(pageIndex: currentPage, name: name)
                episodes.append(contentsOf: nextEpisodes.results)
            }
        }
    }
}
