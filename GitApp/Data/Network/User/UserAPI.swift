//
//  UserAPI.swift
//  GitApp
//
//  Created by Indra Kurniawan on 11/01/24.
//

import Moya

enum UserAPI {
    case fetchUsers
}

extension UserAPI: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }

    var path: String {
        switch self {
        case .fetchUsers:
            return "/users"
        }
    }

    var method: Moya.Method {
        switch self {
        case .fetchUsers:
            return .get
        }
    }

    var task: Task {
        switch self {
        case .fetchUsers:
            return .requestPlain
        }
    }

    var headers: [String: String]? {
        return ["Content-type": "application/json"]
    }
}
