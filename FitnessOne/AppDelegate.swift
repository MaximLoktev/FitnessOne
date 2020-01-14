//
//  AppDelegate.swift
//  FitnessOne
//
//  Created by Максим Локтев on 15/12/2019.
//  Copyright © 2019 Максим Локтев. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let rootViewController = RootViewController()
        let window = UIWindow()
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        
        self.window = window
        
        return true
    }

}

