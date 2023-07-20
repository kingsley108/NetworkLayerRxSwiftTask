import Foundation
import NetworkInterfaces
import RxSwift

public class MockNetworkLogic: NetworkLogic {
    
    let networkController: NetworkService
    
    public init(networkController: NetworkService) {
        self.networkController = networkController
    }
    
    public func fetchResponse<T: Decodable>() -> Single<T> {
        let endpoint = MockEndpoint()
        return networkController.request(T.self, endpoint)
    }
    
    
}
