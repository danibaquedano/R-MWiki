import Foundation
//Control de errores para las llamadas del servicio.
enum NetworkError: LocalizedError {

    case badUrl
    case badRequest
    case mappingToDTO
    case other
    
    var errorDescription: String? {
        switch self {
        case .badUrl:
            return  "networkError_description_badURL".localized()
        case .badRequest:
            return "networkError_description_badRequest".localized()
        case .mappingToDTO:
            return "networkError_description_mappingToDTO".localized()
        case .other:
            return "networkError_description_others".localized()
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .badUrl:
            return  "networkError_suggestion_badURL".localized()
        case .badRequest:
            return "networkError_suggestion_badRequest".localized()
        case .mappingToDTO:
            return "networkError_suggestion_mappingToDTO".localized()
        case .other:
            return "networkError_suggestion_others".localized()
        }
    }
}
