protocol NetworkClient {
    func call<Output: Decodable>(for request: Request) async throws -> Output
}
