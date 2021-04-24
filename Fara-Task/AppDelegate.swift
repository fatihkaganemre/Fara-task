//
//  AppDelegate.swift
//  Fara-Task
//
//  Created by Fatih Kagan Emre on 4/24/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if let _ = NSClassFromString("XCTest") {
            return true
        }
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let controller = ControllersBuilder().buildUserListController()
        window!.rootViewController = controller
        window!.makeKeyAndVisible()
        
        return true
    }
}

