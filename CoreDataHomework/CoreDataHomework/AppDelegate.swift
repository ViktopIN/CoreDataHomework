//
//  AppDelegate.swift
//  CoreDataHomework
//
//  Created by Виктор on 25/08/2022.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
// TODO: - checking variables
        let profileAddingScene = ProfileAddingView()
        let editSceneView = EditSceneView()
        profileAddingScene.container = persistentContainer
        let router = CoreDataRouter(container: profileAddingScene.container,
                                    getView: editSceneView)
        let profileAddingScenePresenter = ProfileAddingPresenter(view: profileAddingScene,
                                                                 container: profileAddingScene.container,
                                                                 router: router)
        profileAddingScene.presenter = profileAddingScenePresenter
        
       
        let editScenePresenter = EditScenePresenter(view: editSceneView, router: router)
                
    
        let navigationController = UINavigationController(rootViewController: profileAddingScene)
        setupNavigationBar()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }
    
    // MARK: - Core Data stack
    lazy var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "CoreDataHomework")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()

    // MARK: - Core Data Saving support
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }

}

