import Foundation
import NetworkInterfaces

struct PodcastsEndpoint: Endpoint {
    var baseURL = "https://api.jsonbin.io"
    var path = "/v3/qs/647df8a19d312622a36ad118"
    let method: HTTPMethod = .get
    var headers: [String: String]? = nil
    let parameters: [String: Any]? = nil
}
