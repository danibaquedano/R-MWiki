import Foundation

class CharactersViewModel : ObservableObject {
    
    private let charactersRemoteAPI : CharactersRemoteAPI
    
    @Published var characters: [CharacterDTO] = []
    @Published var filterName: String = ""
    @Published var filterStatus: String = ""
    @Published var filterGender: String = ""
    @Published var getCharactersError: Error?
    
    var numResults: Int = 0
    private var currentPage: Int = 1
    private var maxPage: Int = 0
    
    var isFiltered: Bool {
        filterName != "" || filterGender != "" || filterStatus != ""
    }
    
    init(charactersRemoteAPI: CharactersRemoteAPI) {
        self.charactersRemoteAPI = charactersRemoteAPI
    }
    
    @MainActor
    func getCharacters() {
        Task {
            do {
                currentPage = 1
                let charactersResponse = try await charactersRemoteAPI.getCharacters(pageIndex: currentPage, name: filterName, status: filterStatus, gender: filterGender)
                characters = charactersResponse.results
                numResults = charactersResponse.info.count
                maxPage = charactersResponse.info.pages
            } catch {
                getCharactersError = error
                characters = []
                numResults = 0
            }
        }
    }
    @MainActor
    func getMoreCharacters() {
        Task {
            if currentPage + 1 <= maxPage {
                currentPage = currentPage + 1
                let nextCharacters = try await charactersRemoteAPI.getCharacters(pageIndex: currentPage, name: filterName, status: filterStatus, gender: filterGender)
                characters.append(contentsOf: nextCharacters.results)
            }
        }
    }
}
