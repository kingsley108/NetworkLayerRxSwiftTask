import Foundation
import NetworkInterfaces
import RxSwift

#warning("Can you explain the purpose of this class?")
final class API {
    let logic: NetworkLogic
    let disposeBag = DisposeBag()
    
    init(logic: NetworkLogic) {
        self.logic = logic
    }
    
    func fetch<T: Decodable>() -> (T?, Error?)  {
        var unwrapped: (T?, Error?) = (nil, nil)
        logic.fetchResponse().subscribe { result in
             unwrapped = Helper.unwrapResult(value: result)
        }.disposed(by: disposeBag)
        return unwrapped
    }
    
}
