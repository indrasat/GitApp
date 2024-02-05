//
//  AppFlowCoordinator.swift
//  GitApp
//
//  Created by Indra Kurniawan on 16/01/24.
//

import UIKit

final class AppFlowCoordinator {
    private let navigationController: UINavigationController

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let viewController = UserListViewController()
        navigationController.setViewControllers([viewController], animated: false)
    }
}
