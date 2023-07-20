import Foundation
import NetworkInterfaces

public struct MockModel: Decodable, Equatable {
    public let value1: String
    public let value2: String
    
    public init(value1: String, value2: String) {
        self.value1 = value1
        self.value2 = value2
    }
}

public struct MockEndpoint: Endpoint {
    public let baseURL =  "https://api.example.com"
    public let path = "/feature/podcasts"
    public let method = HTTPMethod.get
    public let headers: [String: String]? = nil
    let body: Data? = nil
}

