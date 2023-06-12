import Foundation
import NetworkInterfaces

public typealias CompletionHandler = (Data?, URLResponse?, Error?) -> Void

#warning("Why did you decide to subclass URLSession for mocking? What are the pros and cons of this approach?")
public class MockURLSession: URLSession {
    var data: Data?
    var response: URLResponse?
    var error: Error?


    public override func dataTask(with request: URLRequest, completionHandler: @escaping CompletionHandler) -> URLSessionDataTask {
        let task = MockURLSessionDataTask()
        completionHandler(self.data, self.response, self.error)
        return task
    }
}
