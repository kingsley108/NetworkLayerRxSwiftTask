import RxSwift
import NetworkInterfaces

public class NetworkImplementationService: NetworkService {
    fileprivate let session: URLSession
    
    public init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    public func request<T: Decodable>(_ type: T.Type, _ endpoint: Endpoint) -> Single<T> {
        #warning("Why do you use create and not deferred?")
        return Single.create { [weak self] single in
            #warning("Why do you need weak self here?")
            guard let request = self?.buildRequest(from: endpoint) else {
                #warning("Why are you returning unknown error here?")
                single(.failure(RxError.unknown))
                return Disposables.create()
            }

            #warning("What is the difference between data and response? What are their purposes?")
            let task = self?.session.dataTask(with: request) { data, response, error in
                if let err = error {
                    single(.failure(err))
                    return
                }
                
                guard let _ = response else {
                    #warning("How did you understand that the problem is in the invalidURL?")
                    single(.failure(NetworkError.invalidUrl))
                    return
                }
                
                guard let data = data else {
                    single(.failure(NetworkError.noData))
                    return
                }
                
                #warning("Why optional try?")
                #warning("Why to recreate JSONDecoder every time?")
                #warning("What should we do if some responses use snake_case and others camelCase?")
                #warning("What should we do if some responses use iso8601 for date and others some custom format?")
                guard let decoded = try? JSONDecoder().decode(T.self, from: data) else {
                    single(.failure(NetworkError.decodingError))
                    return
                }

                single(.success(decoded))
            }
            task?.resume()

            let disposable = Disposables.create {
                #warning("Why do we need this?")
                task?.cancel()
            }
            return disposable
        }
    }

    private func buildRequest(from endpoint: Endpoint) -> URLRequest? {
        guard let url = URL(string: endpoint.baseURL) else { return nil }
        var request = URLRequest(url: url.appendingPathComponent(endpoint.path))
        request.httpMethod = endpoint.method.rawValue
        request.allHTTPHeaderFields = endpoint.headers
        return request
    }
}
