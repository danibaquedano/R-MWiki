protocol EpisodesRemoteAPI {
    func getEpisodes(pageIndex: Int, name: String) async throws -> GetEpisodesResponse
}
