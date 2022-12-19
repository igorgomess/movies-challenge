//
//  AppDelegate.swift
//  BlackMovieVC
//
//  Created by Igor Gomes on 10/08/22.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

        var window: UIWindow?
        func application(
            _ application: UIApplication,
            didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
        ) -> Bool {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.rootViewController = HomeFactory.make()
            window?.makeKeyAndVisible()
            return true
        }
}
