import Foundation

//Clase de construccion de la request para las llamadas de red
class Request {
    
    let baseURL = "https://rickandmortyapi.com/api/"
    
    enum Endpoint {
        case getAllEpisodes(pageIndex: Int, name: String)
        case getAllLocations(pageIndex: Int, name: String)
        case getCharacters(pageIndex: Int, name: String, status: String, gender: String)
    }
    
    enum HttpMethod: String {
        case get = "GET"
    }
    
    enum Api: String {
        case episode = "episode"
        case location = "location"
        case character = "character"
    }
    
    var httpMethod: HttpMethod?
    var urlParameters: [URLQueryItem]?
    var body: Data?
    var api: Api?
    var apiVersion = 1
    var id: String?
    
    
    init(endpoint: Endpoint) {
        switch endpoint {
        case .getAllEpisodes(let page, let name):
            getAllEpisodes(pageIndex: page, name: name)
        case .getAllLocations(let page, let name):
            getAllLocations(pageIndex: page, name: name)
        case .getCharacters(pageIndex: let pageIndex, name: let name, status: let status, gender: let gender):
            getCharactersFilter(pageIndex: pageIndex, name: name, status: status, gender: gender)
        }
    }
    
    private func getAllEpisodes(pageIndex: Int, name: String?) {
        httpMethod = .get
        api = .episode
        
        var newUrlParameters: [URLQueryItem] = []
        if name != "" {
            newUrlParameters.append(URLQueryItem(name: "name", value: name))
        }
        newUrlParameters.append(URLQueryItem(name: "page", value: pageIndex.formatted()))
        
        urlParameters = newUrlParameters
    }
    
    private func getAllLocations(pageIndex: Int, name: String?) {
        httpMethod = .get
        api = .location
        
        var newUrlParameters: [URLQueryItem] = []
        if name != "" {
            newUrlParameters.append(URLQueryItem(name: "name", value: name))
        }
        newUrlParameters.append(URLQueryItem(name: "page", value: pageIndex.formatted()))
        
        urlParameters = newUrlParameters
    }
    
    private func getCharactersFilter(pageIndex: Int, name: String?, status: String?, gender: String?) {
        httpMethod = .get
        api = .character
        
        var newUrlParameters: [URLQueryItem] = []
        newUrlParameters.append(URLQueryItem(name: "page", value: pageIndex.formatted()))
        
        if name != "" {
            newUrlParameters.append(URLQueryItem(name: "name", value: name))
        }
        if status != "" {
            newUrlParameters.append(URLQueryItem(name: "status", value: status))
        }
        if gender != "" {
            newUrlParameters.append(URLQueryItem(name: "gender", value: gender))
        }
        urlParameters = newUrlParameters
    }
}
