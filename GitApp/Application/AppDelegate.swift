//
//  AppDelegate.swift
//  GitApp
//
//  Created by Indra Kurniawan on 11/01/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UserListViewController()
        window?.makeKeyAndVisible()
        return true
    }

}

