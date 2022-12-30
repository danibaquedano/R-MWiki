struct GetCharactersReponse: Decodable {
    let info: InfoDTO
    let results: [CharacterDTO]
}
