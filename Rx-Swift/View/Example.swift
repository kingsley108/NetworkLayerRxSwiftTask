import Foundation
import RxSwift
import UIKit
import NetworkImplementation

class ExampleController: UIViewController {
#warning("Can you explain why you decided to have so many types to actually fetch the result?")
#warning("ExampleViewController -> API -> PodcastLogicController (NetworkLogic) -> NetworkService")
    let podcastAPI: API
    let disposeBag = DisposeBag()
    let logic = PodcastLogicController(networkController: NetworkImplementationService())
    
    init() {
        self.podcastAPI = API(logic: logic)
        super.init(nibName: nil, bundle: nil)
                                                            
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .yellow
        self.showPodcasts()
    }
    
    func showPodcasts() {
#warning("On which thread response will be returned?")
        let (result, error): (PodcastEpisode?, Error?) = podcastAPI.fetch()
        if let err = error {
            print("🚀\(err)")
        }
        
        guard let res = result else { return }
        print("🚀\(res)")
    }
}
