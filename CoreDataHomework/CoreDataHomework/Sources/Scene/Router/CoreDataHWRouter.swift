//
//  CoreDataHWRouter.swift
//  CoreDataHomework
//
//  Created by Виктор on 29/08/2022.
//

import UIKit
import CoreData

protocol CoreDataRouterOutputProtocol {
    init(getView: UIViewController)
    func recieveName() -> NSManagedObjectID
}

protocol CoreDataRouterInputProtocol {
    func recieveEditSceneView() -> UIViewController
    func getName(name: NSManagedObjectID)
}

class CoreDataRouter: CoreDataRouterOutputProtocol {
// MARK: - Properties
    var view: UIViewController!
    var name: NSManagedObjectID!
    
//MARK: - Initialize
    required init(getView: UIViewController) {
        self.view = getView
    }
//MARK: - Methods    
    func recieveName() -> NSManagedObjectID {
        return name
    }
}

// MARK: - Extension
extension CoreDataRouter: CoreDataRouterInputProtocol {
    func recieveEditSceneView() -> UIViewController {
        return view
    }
    
    func getName(name: NSManagedObjectID) {
        self.name = name
    }
}
