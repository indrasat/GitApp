//
//  DownloadImageUseCaseTests.swift
//  GitAppTests
//
//  Created by Indra Kurniawan on 11/01/24.
//

import XCTest
import Combine
import Moya
@testable import GitApp

class ImageDownloadTests: XCTestCase {
    var cancellables: Set<AnyCancellable> = []

    func testImageDownload() {
        let provider = MoyaProvider<ImageService>(endpointClosure: mockEndpointClosure)
        let repository = ImageRepository(provider: provider)
        let useCase = ImageDownloadUseCase(repository: repository)
        let expectation = XCTestExpectation(description: "Download image")

        useCase.execute(url: "path/to/image.jpg")
            .sink { image in
                XCTAssertNotNil(image)
                expectation.fulfill()
            }
            .store(in: &cancellables)

        wait(for: [expectation], timeout: 5.0)
    }

    private func mockEndpointClosure(target: ImageService) -> Endpoint {
        let sampleResponseClosure = { () -> EndpointSampleResponse in
            let image = UIImage(named: "TestImage")!
            return .networkResponse(200, image.pngData()!)
        }
        return Endpoint(url: URL(target: target).absoluteString,
                        sampleResponseClosure: sampleResponseClosure,
                        method: target.method,
                        task: target.task,
                        httpHeaderFields: target.headers)
    }
}
