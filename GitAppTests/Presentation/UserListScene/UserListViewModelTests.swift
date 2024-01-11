//
//  UserListViewModelTests.swift
//  GitAppTests
//
//  Created by Indra Kurniawan on 11/01/24.
//

import XCTest
import Combine
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
    
    
    func testFetchUserSuccess() {
        let expectation = self.expectation(description: "Fetch users successfully")

        let users = ["user 1", "user 2"]
        viewModel = UsersListViewModel(users: users)
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
    
    func testFetchUserFailure() {
        let expectation = self.expectation(description: "Fetch users successfully")
        
        let users: [String] = []
        viewModel = UsersListViewModel(users: users)
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
}
