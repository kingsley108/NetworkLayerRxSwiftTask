import Foundation
import RxSwift

#warning("Why did you call it NetworkService?")
#warning("What happens if I pass wrong response type for provided endpoint?")
public protocol NetworkService {
    func request<T: Decodable>(_ type: T.Type, _ endpoint: Endpoint) -> Single<T>
}

#warning("What is the purpose of this protocol compared to NetworkService?")
public protocol NetworkLogic {
    func fetchResponse<T: Decodable>() -> Single<T>
}

#warning("Why endpoint is a protocol?")
public protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
}

public enum HTTPMethod: String {
    case get = "GET"
}
