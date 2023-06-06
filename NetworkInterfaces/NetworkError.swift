import Foundation

public enum NetworkError: Error {
    case invalidUrl
    case noData
    case decodingError
    case networkReachabilityError
}

