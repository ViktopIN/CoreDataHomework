//
//  ProfileAddingPresenter.swift
//  CoreDataHomework
//
//  Created by Виктор on 28/08/2022.
//

import UIKit
import CoreData

protocol ProfileAddingPresenterProtocol {
    init(view: ProfileAddingViewProtocol,
         container: NSPersistentContainer,
         router: CoreDataRouterInputProtocol)
    func addingNewName(name: String)
    func deleteRow(delete data: NSManagedObject)
    func getEditView(name: String) -> UIViewController
}

class ProfileAddingPresenter: ProfileAddingPresenterProtocol {
// MARK: - Properties
    private var view: ProfileAddingViewProtocol!
    private var container: NSPersistentContainer!
    private var router: CoreDataRouterInputProtocol!
    private var gettingName: String!
    
// MARK: - Initialize
    required init(view: ProfileAddingViewProtocol, container: NSPersistentContainer, router: CoreDataRouterInputProtocol) {
        self.view = view
        self.container = container
        self.router = router
    }
    
// MARK: - Methods
    func addingNewName(name: String) {
        for (num, char) in name.enumerated() {
            if char == " " && num > 0 {
                if name[name.index(name.startIndex,
                                   offsetBy: num - 1)] ==
                    " " || name[name.index(name.startIndex,
                                           offsetBy: num + 1)] == " " {
                    return
                }
            }
        }
        let managedContext = container.viewContext
        let entity = NSEntityDescription.entity(forEntityName: "Person",
                                   in: managedContext)!
        let person = NSManagedObject(entity: entity,
                                   insertInto: managedContext)
        person.setValue(name, forKeyPath: "name")
        

        do {
            try managedContext.save()
            view.reloadTableView(person: person)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    func deleteRow(delete data: NSManagedObject) {
        container.viewContext.delete(data)
        do {
            try container.viewContext.save()
        } catch {
            let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        }
    }
    
    func getEditView(name: String) -> UIViewController {
        let view = router.recieveEditSceneView()
        router.getName(name: name)
        return view
    }
}

