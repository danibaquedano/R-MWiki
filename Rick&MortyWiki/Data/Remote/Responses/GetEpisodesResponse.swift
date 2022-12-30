struct GetEpisodesResponse: Decodable {
    let info: InfoDTO
    let results: [EpisodeDTO]
}
