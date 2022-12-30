import Foundation

struct LocationDTO: Decodable, Identifiable {
    let id: Int
    let name: String
    let type: String
    let dimension: String
    let residents: [String]
}

struct CharacterDTO: Decodable, Identifiable {
    let id: Int
    let name: String
    let status: String
    let species: String
    let type: String
    let gender: String
    let origin: ResumeLocationDTO
    let location: ResumeLocationDTO
    let image: String
    let episode: [String]
}

struct EpisodeDTO: Decodable, Identifiable{
    let id: Int
    let name: String
    let air_date: String
    let episode: String
    let characters: [String]
}

struct ResumeLocationDTO: Decodable {
    let name: String
    let url:  String
}

struct InfoDTO: Decodable {
    let count: Int
    let pages: Int
    let next: String?
    let prev: String?
}
