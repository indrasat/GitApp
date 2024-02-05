//
//  ImageService.swift
//  GitApp
//
//  Created by Indra Kurniawan on 11/01/24.
//

import Moya
import Combine

public enum ImageService {
    case downloadImage(url: String)
}

extension ImageService: TargetType {
    public var baseURL: URL {
        // Use an appropriate base URL or leave it empty
        return URL(string: "https://avatars.githubusercontent.com/u/")!
    }

    public var path: String {
        switch self {
        case .downloadImage(let url):
            var newURL = url
            let path = newURL.replacingOccurrences(of: "https://avatars.githubusercontent.com/u/", with: "")
            if let userId = path.components(separatedBy: "?").first {
                return userId
            }
            return ""
        }
    }

    public var method: Moya.Method {
        .get
    }

    public var task: Task {
        switch self {
            case .downloadImage(let url):
                var newURL = url
                let path = newURL.replacingOccurrences(of: "https://avatars.githubusercontent.com/u/", with: "")
                if let params = path.components(separatedBy: "?").last {
                    let version = params.components(separatedBy: "=").last ?? ""
                    return .requestParameters(parameters: ["v":version], encoding: URLEncoding.default)
                }
                return .requestParameters(parameters: ["v":""], encoding: URLEncoding.default)
        }
    }

    public var headers: [String: String]? {
        nil
    }

    public var validationType: ValidationType {
        .successCodes
    }
}

