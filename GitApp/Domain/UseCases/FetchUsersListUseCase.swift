//
//  FetchUsersListUseCase.swift
//  GitApp
//
//  Created by Indra Kurniawan on 11/01/24.
//

import Foundation
import Combine
import Moya

final class FetchUsersListUseCase {
    private let repository: UsersListRepository

    init(repository: UsersListRepository) {
        self.repository = repository
    }

    func execute() -> AnyPublisher<[User], MoyaError> {
        repository.fetchUsers()
    }
}
