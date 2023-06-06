import XCTest

@testable import NetworkInterfaces
@testable import NetworkImplementation
@testable import Rx_Swift
@testable import NetworkTests

final class NetworkManagerTests: XCTestCase {

    var networkManager: NetworkService!
    var mockSession: MockURLSession!
    var logic: NetworkLogic!
    var sut: API!

    override func setUp() {
        super.setUp()
        mockSession = MockURLSession()
        networkManager = NetworkImplementationService(session: mockSession)
        logic = MockNetworkLogic(networkController: networkManager)
        sut = API(logic: logic)
    }

    override func tearDown() {
        mockSession = nil
        networkManager = nil
        sut = nil
        super.tearDown()
    }

    func setMockResponse(data: Data?, response: URLResponse?, error: Error?) {
        mockSession.data = data
        mockSession.response = response
        mockSession.error = error
    }

    func testRequest_SuccessfulResponse_ReturnsDecodedModel() throws {
        let expectedData = """
            {
                "value1": "value1",
                "value2": "value2"
            }
            """.data(using: .utf8)

        let expectedModel = MockModel(value1: "value1", value2: "value2")

        setMockResponse(data: expectedData, response: HTTPURLResponse(), error: nil)

        var receivedModel: MockModel?
        
        let (res, _):(MockModel?, Error?) = sut.fetch()
        receivedModel = res
        
        XCTAssertNotNil(receivedModel)
        XCTAssertEqual(receivedModel, expectedModel)
    }

    func testRequest_InvalidURL_ReturnsError() throws {

        setMockResponse(data: nil, response: nil, error: nil)
        var receivedError: Error?
        let (_,err):(MockModel?, Error?) = sut.fetch()
        receivedError = err
        
        XCTAssertNotNil(receivedError)
        XCTAssertEqual(receivedError as? NetworkError, NetworkError.invalidUrl)
    }

    func testRequest_NoData_ReturnsError() throws {
        setMockResponse(data: nil, response: HTTPURLResponse(), error: nil)

        var receivedError: Error?
        let (_,err):(MockModel?, Error?) = sut.fetch()
        receivedError = err
        
        XCTAssertNotNil(receivedError)
        XCTAssertEqual(receivedError as? NetworkError, NetworkError.noData)
    }
    
    func testRequest_Unreachable_ReturnsError() throws {
        setMockResponse(data: nil, response: nil, error: NetworkError.networkReachabilityError)

        var receivedError: Error?
        let (_,err):(MockModel?, Error?) = sut.fetch()
        receivedError = err
        
        XCTAssertNotNil(receivedError)
        XCTAssertEqual(receivedError as? NetworkError, NetworkError.networkReachabilityError)
    }

}


