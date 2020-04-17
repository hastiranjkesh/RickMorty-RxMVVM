//
//  AppDelegate.swift
//  RickMorty-RxMVVM
//
//  Created by hasti on 4/16/20.
//  Copyright © 2020 hasti. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var appCoordinator = AppCoordinator()
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let episodesVC = appCoordinator.createEpisodesViewController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = episodesVC
        window?.makeKeyAndVisible()
        return true
    }
}

