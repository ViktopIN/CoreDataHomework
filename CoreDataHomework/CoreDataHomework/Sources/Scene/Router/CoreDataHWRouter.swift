//
//  CoreDataHWRouter.swift
//  CoreDataHomework
//
//  Created by Виктор on 29/08/2022.
//

import UIKit
import CoreData

protocol CoreDataRouterOutputProtocol {
    init(container: NSPersistentContainer, getView: UIViewController)
    func getContainer() -> NSPersistentContainer
    func recieveName() -> String
}

protocol CoreDataRouterInputProtocol {
    func recieveEditSceneView() -> UIViewController
    func getName(name: String)
}

class CoreDataRouter: CoreDataRouterOutputProtocol {
// MARK: - Properties
    var container: NSPersistentContainer!
    var view: UIViewController!
    var name: String!
    
//MARK: - Initialize
    required init(container: NSPersistentContainer, getView: UIViewController) {
        self.container = container
        self.view = getView
    }
//MARK: - Methods
    func getContainer() -> NSPersistentContainer {
        return container
    }
    
    func recieveName() -> String {
        return name
    }
}

// MARK: - Extension
extension CoreDataRouter: CoreDataRouterInputProtocol {
    func recieveEditSceneView() -> UIViewController {
        return view
    }
    
    func getName(name: String) {
        self.name = name
    }
}
