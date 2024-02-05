//
//  UserService.swift
//  GitApp
//
//  Created by Indra Kurniawan on 11/01/24.
//

import Moya
import Combine

class UserService {
    let provider = MoyaProvider<UserAPI>()

    func fetchUsers() -> AnyPublisher<[User], MoyaError> {
        provider.requestPublisher(.fetchUsers)
            .map([User].self)
            .eraseToAnyPublisher()
    }
}
