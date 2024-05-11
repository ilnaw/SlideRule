//
//  AppDelegate.swift
//  SlideRuler
//
//  Created by wl on 2024/5/7.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let vc = WaterViewController()
        let nav = UINavigationController(rootViewController: vc)
        window = UIWindow()
        window?.frame = UIScreen.main.bounds
        window?.rootViewController = nav
        window?.makeKeyAndVisible()
        return true
    }


}

