struct GetLocationsReponse: Decodable {
    let info: InfoDTO
    let results: [LocationDTO]
}
