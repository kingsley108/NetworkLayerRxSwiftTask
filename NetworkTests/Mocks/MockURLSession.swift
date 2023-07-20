import Foundation
import NetworkInterfaces

public typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void

public class MockURLSession: URLSession {
    public var data: Data?
    public var response: URLResponse?
    public var error: Error?

    public override func dataTask(with request: URLRequest, completionHandler: @escaping CompletionHandler) -> URLSessionDataTask {
        let task = MockURLSessionDataTask()
        completionHandler(self.data, self.response, self.error)
        return task
    }
}
