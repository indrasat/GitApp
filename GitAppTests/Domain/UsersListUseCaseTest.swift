//
//  UseCases.swift
//  GitAppTests
//
//  Created by Indra Kurniawan on 11/01/24.
//
import XCTest
import Combine
import Moya
@testable import GitApp

class UsersListUseCaseTest: XCTestCase {

    private var cancellables: Set<AnyCancellable>!

    override func setUp() {
        super.setUp()
        cancellables = []
    }

    override func tearDown() {
        cancellables = nil
        super.tearDown()
    }

    func testFetchUsersSuccess() {
        let mockUsers = [User.stub()]
        let repository = MockUsersListRepository(result: .success(mockUsers))
        let useCase = FetchUsersListUseCase(repository: repository)

        let expectation = XCTestExpectation(description: "Successfully fetched users")

        useCase.execute()
            .sink(receiveCompletion: { completion in
                switch completion {
                case .failure:
                    XCTFail("Expected success but received failure")
                case .finished:
                    break
                }
            }, receiveValue: { users in
                XCTAssertEqual(users.count, mockUsers.count, "User count should match")
                XCTAssertEqual(users.first?.login, mockUsers.first?.login, "User details should match")
                expectation.fulfill()
            })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }

    func testFetchUsersFailure() {
        let expectation = XCTestExpectation(description: "Failed to fetch users")
        
        let mockError = MoyaError.statusCode(Response(statusCode: 404, data: Data()))
        let repository = MockUsersListRepository(result: .failure(mockError))
        let useCase = FetchUsersListUseCase(repository: repository)

        useCase.execute()
            .sink(receiveCompletion: { completion in
                if case let .failure(receivedError) = completion, case let MoyaError.statusCode(response) = receivedError {
                    XCTAssertEqual(response.statusCode, 404, "Status code should be 404")
                    expectation.fulfill()
                } else {
                    XCTFail("Expected failure with specific MoyaError but received different error or success")
                }
            }, receiveValue: { _ in
                XCTFail("Expected no users but received some")
            })
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 1.0)
    }
}

