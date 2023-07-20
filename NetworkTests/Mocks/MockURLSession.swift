import Foundation
import NetworkInterfaces

public typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void

public class MockURLSession: URLSession {
    public var data: Data?
    public var response: URLResponse?
    public var error: Error?
    
    public init(data: Data? = nil, response: URLResponse? = nil, error: Error? = nil) {
        self.data = data
        self.response = response
        self.error = error
    }

    public override func dataTask(with request: URLRequest, completionHandler: @escaping CompletionHandler) -> URLSessionDataTask {
        let task = MockURLSessionDataTask()
        completionHandler(self.data, self.response, self.error)
        return task
    }
}
