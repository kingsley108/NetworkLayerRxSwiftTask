import Foundation

class MockURLSessionDataTask: URLSessionDataTask {
    override init() {
        super.init()
    }
    
    var completionHandler: (() -> Void)?

    override func resume() {
        //
    }
    
    override func cancel() {
        //
    }
}
