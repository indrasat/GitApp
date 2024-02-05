//
//  ImageDownloadUseCase.swift
//  GitApp
//
//  Created by Indra Kurniawan on 11/01/24.
//

import Combine
import UIKit

class ImageDownloadUseCase {
    private let repository: ImageRepositoryProtocol

    init(repository: ImageRepositoryProtocol) {
        self.repository = repository
    }

    func execute(url: String) -> AnyPublisher<UIImage?, Never> {
        repository.fetchImage(from: url)
    }
}
