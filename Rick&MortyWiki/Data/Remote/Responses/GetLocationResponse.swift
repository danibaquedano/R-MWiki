struct GetLocationResponse: Decodable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
}
