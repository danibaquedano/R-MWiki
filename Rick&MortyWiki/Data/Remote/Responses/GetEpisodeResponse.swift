struct GetEpisodeResponse: Decodable {
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
}
