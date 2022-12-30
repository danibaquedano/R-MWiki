import Foundation

class URLSessionNetworkClient: NetworkClient {
    
    func call<Output: Decodable>(for request: Request) async throws -> Output {
        
        guard
            var urlComponents = URLComponents(string: request.baseURL),
            let api = request.api,
            let httpMethod = request.httpMethod
        else {
            throw NetworkError.badUrl
        }
        
        urlComponents.path = "/api/\(api.rawValue)"
        
        if let id = request.id {
            urlComponents.path = "\(urlComponents.path)/\(id)"
        }
        
        if let urlParameters = request.urlParameters {
            urlComponents.queryItems = urlParameters
        }
        
        guard let requestUrl = urlComponents.url else {
            throw NetworkError.badUrl
        }
        var urlRequest = URLRequest(url: requestUrl)
        urlRequest.httpMethod = httpMethod.rawValue
        urlRequest.httpBody = request.body
        urlRequest.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let httpUrlResponse = response as? HTTPURLResponse, (200...299).contains(httpUrlResponse.statusCode) else {
            throw NetworkError.badRequest
        }
        
        do {
            if Output.self == EmptyResponse.self  {
                let emptyResponse: Output = EmptyResponse() as! Output
                return emptyResponse
            }

            let decodedResponseData = try JSONDecoder().decode(Output.self, from: data)
            return decodedResponseData
    
        } catch  {
            throw NetworkError.mappingToDTO
        }
    }
}
