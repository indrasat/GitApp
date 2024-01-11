//
//  UserListViewModelTests.swift
//  GitAppTests
//
//  Created by Indra Kurniawan on 11/01/24.
//

import XCTest
import Combine
import Moya
@testable import GitApp

final class UserListViewModelTests: XCTestCase {
    
    var viewModel: UsersListViewModel!
    var cancellables: Set<AnyCancellable>!
    
    override func setUp() {
        super.setUp()
        cancellables = []
    }
    
    override func tearDown() {
        viewModel = nil
        cancellables = nil
        super.tearDown()
    }
    
    
    func testWhenFetchUserSuccess() {
        let expectation = self.expectation(description: "Fetch users successfully")
        let mockUsers = [User.stub(), User.stub()]
        let repository = MockUsersListRepository(result: .success(mockUsers))
        let useCase = FetchUsersListUseCase(repository: repository)
        
        viewModel = UsersListViewModel(fetchUsersListUseCase: useCase)
        viewModel.$users
            .sink { users in
                if !users.isEmpty {
                    XCTAssertEqual(users.count, 2, "Should have 2 users")
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        viewModel.fetchUsers()
        waitForExpectations(timeout: 2.0)
    }
    
    func testWhenFetchUserFailed() {
        let expectation = self.expectation(description: "Fetch users successfully")
        let mockUsers = [User.stub()]
        let repository = MockUsersListRepository(result: .failure(NSError(domain: "", code: 0, userInfo: nil) as! MoyaError ))
        let useCase = FetchUsersListUseCase(repository: repository)
        
        viewModel = UsersListViewModel(fetchUsersListUseCase: useCase)
        viewModel.$errorMessage
            .sink { errorMessage in
                if errorMessage != nil {
                    XCTAssertNotNil(errorMessage, "Error message should not be nil")
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.fetchUsers()
        waitForExpectations(timeout: 2.0)
    }
    
    func testWhenUsersContainsCorrectDataShouldBeEqual() {
        let expectation = self.expectation(description: "Fetch users successfully")
        let mockUsers = [User.stub()]
        let repository = MockUsersListRepository(result: .success(mockUsers))
        let useCase = FetchUsersListUseCase(repository: repository)
        
        viewModel = UsersListViewModel(fetchUsersListUseCase: useCase)
        viewModel.$users
            .sink { users in
                if !users.isEmpty {
                    XCTAssertEqual(users.first?.id, mockUsers.first?.id, "Users should be equal")
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.fetchUsers()
        waitForExpectations(timeout: 2.0)
    }
    
    
    func testWhenLoadingIsTrue() {
        let expectation = self.expectation(description: "Fetch users successfully")
        let mockUsers = [User.stub()]
        let repository = MockUsersListRepository(result: .success(mockUsers))
        let useCase = FetchUsersListUseCase(repository: repository)
        
        viewModel = UsersListViewModel(fetchUsersListUseCase: useCase)
        viewModel.$isLoading
            .sink { isLoading in
                if isLoading {
                    XCTAssertTrue(isLoading, "Loading should be true")
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.fetchUsers()
        waitForExpectations(timeout: 2.0)
    }
    
    func testWhenLoadingIsFalse() {
        let expectation = self.expectation(description: "Fetch users successfully")
        let mockUsers = [User.stub()]
        let repository = MockUsersListRepository(result: .failure(NSError(domain: "", code: 0, userInfo: nil) as! MoyaError ))
        let useCase = FetchUsersListUseCase(repository: repository)
        
        viewModel = UsersListViewModel(fetchUsersListUseCase: useCase)
        viewModel.$isLoading
            .sink { isLoading in
                if !isLoading {
                    XCTAssertFalse(isLoading, "Loading should be false")
                    expectation.fulfill()
                }
            }
            .store(in: &cancellables)
        
        viewModel.fetchUsers()
        waitForExpectations(timeout: 2.0)
    }
}
