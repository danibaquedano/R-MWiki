protocol CharactersRemoteAPI {
    func getCharacters(pageIndex: Int, name: String, status: String, gender: String) async throws -> GetCharactersReponse
}
