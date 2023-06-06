import Foundation
import NetworkInterfaces
import RxSwift

class PodcastLogicController: NetworkLogic {
    
    let networkController: NetworkService
    
    init(networkController: NetworkService) {
        self.networkController = networkController
    }
    
    func fetchResponse<T: Decodable>() -> Single<T> {
        let endpoint = PodcastsEndpoint()
        return networkController.request(T.self, endpoint)
    }
}
