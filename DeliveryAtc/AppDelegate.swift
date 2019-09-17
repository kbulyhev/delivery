//
//  AppDelegate.swift
//  DeliveryAtc
//
//  Created by Kirill Bulychev on 06/09/2019.
//  Copyright © 2019 Kirill Bulychev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let navigationModule = TabBarRouter.createNavigationModule()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationModule
        window?.makeKeyAndVisible()
        
        return true
    }

}

