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
         router: CoreDataRouterInputProtocol)
    func getTableViewHeight(count: Int,
                            height: CGFloat) -> CGFloat
    func saveNewName(textField: UITextField) -> String?
    func addingNewName(name: String)
    func deleteRow(delete data: NSManagedObject)
    func getEditView(name: NSManagedObjectID) -> UIViewController
}

class ProfileAddingPresenter: ProfileAddingPresenterProtocol {
// MARK: - Properties
    private var view: ProfileAddingViewProtocol!
    private var router: CoreDataRouterInputProtocol!
    private var gettingName: String!
    
// MARK: - Initialize
    required init(view: ProfileAddingViewProtocol,
                  router: CoreDataRouterInputProtocol) {
        self.view = view
        self.router = router
    }
    
// MARK: - Methods
    func getTableViewHeight(count: Int,
                            height: CGFloat) -> CGFloat {
        var tableHeight = CGFloat()
        if count < 11 {
            tableHeight = CGFloat(count) * height
        } else {
            tableHeight = ProfileAddingView.Metrics.tableViewMaxHeight
        }
        
        return tableHeight
    }
    
    func saveNewName(textField: UITextField) -> String? {
        var name = String()
        if let text = textField.text {
            name = text
            textField.text = nil
            return name
        } else {
            return nil
        }
    }
    
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
        
        if name == "" || name == " " {
            return
        }
        
        view.reloadTableView(person: EditDataClass.getNewObject(name: name)!)
    }
    
    func deleteRow(delete data: NSManagedObject) {
        EditDataClass.deleteData(data: data)
        EditDataClass.saveData()
    }
    
    func getEditView(name: NSManagedObjectID) -> UIViewController {
        let view = router.recieveEditSceneView()
        router.getName(name: name)
        return view
    }
}

