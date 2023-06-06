import RxSwift
import NetworkInterfaces

public class NetworkImplementationService: NetworkService {
    fileprivate let session: URLSession
    
    public init(session: URLSession = URLSession(configuration: .default)) {
        self.session = session
    }
    
    public func request<T: Decodable>(_ type: T.Type, _ endpoint: Endpoint) -> Single<T> {
        return Single.create { [weak self] single in
            guard let request = self?.buildRequest(from: endpoint) else {
                single(.failure(RxError.unknown))
                return Disposables.create()
            }
            
            let task = self?.session.dataTask(with: request) { data, response, error in
                if let err = error {
                    single(.failure(err))
                    return
                }
                
                guard let _ = response else {
                    single(.failure(NetworkError.invalidUrl))
                    return
                }
                
                guard let data = data else {
                    single(.failure(NetworkError.noData))
                    return
                }
                
                
                guard let decoded = try? JSONDecoder().decode(T.self, from: data) else {
                    single(.failure(NetworkError.decodingError))
                    return
                }

                single(.success(decoded))
            }
            task?.resume()

            let disposable = Disposables.create {
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
