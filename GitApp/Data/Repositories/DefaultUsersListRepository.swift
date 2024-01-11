//
//  DefaultUsersListRepository.swift
//  GitApp
//
//  Created by Indra Kurniawan on 11/01/24.
//

import Foundation
import Combine
import Moya

protocol UsersListRepository {
    func fetchUsers() -> AnyPublisher<[User], MoyaError>
}

final class DefaultUsersListRepository: UsersListRepository {
    private let userService: UserService

    init(userService: UserService) {
        self.userService = userService
    }

    func fetchUsers() -> AnyPublisher<[User], MoyaError> {
        userService.fetchUsers()
            .mapError { $0 as MoyaError }
            .eraseToAnyPublisher()
    }
}
