import Foundation
import RxSwift

public protocol NetworkService {
    func request<T: Decodable>(_ type: T.Type, _ endpoint: Endpoint) -> Single<T>
}

public protocol NetworkLogic {
    func fetchResponse<T: Decodable>() -> Single<T>
}

public protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
}

public enum HTTPMethod: String {
    case get = "GET"
}
