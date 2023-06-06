import Foundation

public final class Helper {
    
    static func unwrapResult<T: Decodable>(value: Result<T, Error>) -> (T?, Error?) {
        switch value {
        case .success(let unwrappedValue):
            return (unwrappedValue, nil)
        case .failure(let error):
            return (nil, error)
        }
    }
}


