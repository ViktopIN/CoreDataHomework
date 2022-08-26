//
//  AppDelegate.swift
//  CoreDataHomework
//
//  Created by Виктор on 25/08/2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let profileAddingScene = ProfileAddingView()
        
        let navigationController = UINavigationController(rootViewController: profileAddingScene)
        setupNavigationBar()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
}

