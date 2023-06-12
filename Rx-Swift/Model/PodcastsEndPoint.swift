import Foundation
import NetworkInterfaces

#warning("What if we want to dynamically change testing, staging and production environments?")
#warning("How will we be able to do it with this approach to baseURL?")
struct PodcastsEndpoint: Endpoint {
    var baseURL = "https://api.jsonbin.io"
    var path = "/v3/qs/647df8a19d312622a36ad118"
    let method: HTTPMethod = .get
    var headers: [String: String]? = nil
    let parameters: [String: Any]? = nil
}
