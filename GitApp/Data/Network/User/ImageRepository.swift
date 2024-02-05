//
//  ImageRepository.swift
//  GitApp
//
//  Created by Indra Kurniawan on 11/01/24.
//

import Moya
import Combine

protocol ImageRepositoryProtocol {
    func fetchImage(from url: String) -> AnyPublisher<UIImage?, Never>
}

class ImageRepository: ImageRepositoryProtocol {
    private let provider: MoyaProvider<ImageService>

    init(provider: MoyaProvider<ImageService> = MoyaProvider<ImageService>()) {
        self.provider = provider
    }

    func fetchImage(from url: String) -> AnyPublisher<UIImage?, Never> {
        provider.requestPublisher(.downloadImage(url: url))
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .eraseToAnyPublisher()
    }
}
