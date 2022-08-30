//
//  EditScenePresenter.swift
//  CoreDataHomework
//
//  Created by Виктор on 29/08/2022.
//

import UIKit
import CoreData

protocol EditScenePresenterProtocol {
    init(view: EditSceneViewProtocol,
         router: CoreDataRouterOutputProtocol)
    func saveOrEdit()
    func getNameFromProdileAddingScene() -> (name: String,
                                             birthDate: String,
                                             currentCity: String)
    func saveNewData(name: String,
                     birthDate: String,
                     currentCity: String)
}

class EditScenePresenter: EditScenePresenterProtocol {
// MARK: - Properties
    private var router: CoreDataRouterOutputProtocol!
    private var view: EditSceneViewProtocol!
    private var container: NSPersistentContainer!
    private var currentObject: NSManagedObject!
    
// MARK: - Initialize
    required init(view: EditSceneViewProtocol, router: CoreDataRouterOutputProtocol) {
        self.view = view
        self.router = router
        self.container = router.getContainer()
    }
// MARK: - Methods
    func saveOrEdit() {
        view.textEnable()
    }
    
    func getNameFromProdileAddingScene() -> (name: String,
                                             birthDate: String,
                                             currentCity: String) {
        var strings: (name: String,
                      birthDate: String,
                      currentCity: String)
        
        currentObject = container.viewContext.object(with: router.recieveName())
        strings.0 = currentObject.value(forKeyPath: "name") as? String ?? ""
        strings.1 = currentObject.value(forKeyPath: "birthDate") as? String ?? ""
        strings.2 = currentObject.value(forKeyPath: "currentCity") as? String ?? ""
        
        
        return strings
    }
    
    func saveNewData(name: String,
                     birthDate: String,
                     currentCity: String) {
        var mainName = name
        if mainName == "" || mainName == " " {
            mainName = "noName"
        }
        currentObject.setValue(mainName, forKey: "name")
        currentObject.setValue(birthDate, forKey: "birthDate")
        currentObject.setValue(currentCity, forKey: "currentCity")
        do {
            try container.viewContext.save()
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}
