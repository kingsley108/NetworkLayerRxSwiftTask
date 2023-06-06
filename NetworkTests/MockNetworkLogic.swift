import Foundation
import NetworkInterfaces
import RxSwift

class MockNetworkLogic: NetworkLogic {
    
    let networkController: NetworkService
    
    init(networkController: NetworkService) {
        self.networkController = networkController
    }
    
    func fetchResponse<T: Decodable>() -> Single<T> {
        let endpoint = MockEndpoint()
        return networkController.request(T.self, endpoint)
    }
    
    
}
