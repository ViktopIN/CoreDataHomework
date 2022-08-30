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
    func editName() -> String
}

class EditScenePresenter: EditScenePresenterProtocol {
// MARK: - Properties
    private var router: CoreDataRouterOutputProtocol!
    private var view: EditSceneViewProtocol!
    private var container: NSPersistentContainer!
    
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
    
    func editName() -> String {
        return router.recieveName()
    }
}
