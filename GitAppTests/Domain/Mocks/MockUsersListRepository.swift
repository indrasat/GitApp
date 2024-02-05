//
//  MockUsersListRepository.swift
//  GitAppTests
//
//  Created by Indra Kurniawan on 11/01/24.
//

import Combine
import Moya
@testable import GitApp

final class MockUsersListRepository: UsersListRepository {
    var result: Result<[User], MoyaError>

    init(result: Result<[User], MoyaError>) {
        self.result = result
    }

    func fetchUsers() -> AnyPublisher<[User], MoyaError> {
        return result.publisher.eraseToAnyPublisher()
    }
}
