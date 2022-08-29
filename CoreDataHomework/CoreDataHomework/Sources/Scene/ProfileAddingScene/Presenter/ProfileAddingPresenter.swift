//
//  ProfileAddingPresenter.swift
//  CoreDataHomework
//
//  Created by Виктор on 28/08/2022.
//

import UIKit
import CoreData

protocol ProfileAddingPresenterProtocol {
    init(view: ProfileAddingViewProtocol, container: NSPersistentContainer)
    func addingNewName(name: String)
}

class ProfileAddingPresenter: ProfileAddingPresenterProtocol {
// MARK: - Properties
    private var view: ProfileAddingViewProtocol!
    private var container: NSPersistentContainer!
    
// MARK: - Initialize
    required init(view: ProfileAddingViewProtocol, container: NSPersistentContainer) {
        self.view = view
        self.container = container
    }
    
// MARK: - Methods
    func addingNewName(name: String) {
        for (num, char) in name.enumerated() {
            if char == " " && num > 0 {
                if name[name.index(name.startIndex,
                                   offsetBy: num - 1)] == " " || name[name.index(name.startIndex,
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
}
