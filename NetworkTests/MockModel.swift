import Foundation
import NetworkInterfaces

struct MockModel: Decodable, Equatable {
    let value1: String
    let value2: String
}

struct MockEndpoint: Endpoint {
    let baseURL =  "https://api.example.com"
    let path = "/feature/podcasts"
    let method = HTTPMethod.get
    let headers: [String: String]? = nil
    let body: Data? = nil
}

