//
//  EditDataClass.swift
//  CoreDataHomework
//
//  Created by Виктор on 02/09/2022.
//

import UIKit
import CoreData

class EditDataClass {
    static func fetchData() -> [NSManagedObject] {
        guard let appDelegate  = UIApplication.shared.delegate as? AppDelegate else {
            return []
        }
        
        let container = appDelegate.persistentContainer
        
        let managedContext = container.viewContext

        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Person")
        fetchRequest.returnsObjectsAsFaults = false
        
        var persons: [NSManagedObject]!

        do {
            persons = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
          print("Could not fetch. \(error), \(error.userInfo)")
        }
        return persons
    }
    
    static func saveData() {
        guard let appDelegate  = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let container = appDelegate.persistentContainer
        
        do {
            try container.viewContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
    
    static func getObject(id: NSManagedObjectID) -> NSManagedObject? {
        guard let appDelegate  = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        
        let container = appDelegate.persistentContainer
        let object = container.viewContext.object(with: id)
        
        return object
    }
    
    static func getNewObject(name: String) -> NSManagedObject? {
        guard let appDelegate  = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
            
        let container = appDelegate.persistentContainer
            
        let managedContext = container.viewContext
            
        let entity = NSEntityDescription.entity(forEntityName: "Person",
                                       in: managedContext)!
        let person = NSManagedObject(entity: entity,
                                       insertInto: managedContext)
        person.setValue(name, forKeyPath: "name")
        
        saveData()
        
        return person
    }
    
    static func deleteData(data: NSManagedObject) {
        guard let appDelegate  = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
            
        let container = appDelegate.persistentContainer
        container.viewContext.delete(data)
    }
}
