//
//  Configuration.swift
//  CoreDataHomework
//
//  Created by Виктор on 29/08/2022.
//

import Foundation
import UIKit
import CoreData

class ConfigurationProject {
    func configuration(container: NSPersistentContainer) -> UIViewController {
        //Configure project here
        let profileAddingScene = ProfileAddingView()
        let editSceneView = EditSceneView()
        
        profileAddingScene.container = container
        
        let router = CoreDataRouter(container: profileAddingScene.container,
                                    getView: editSceneView)
        let profileAddingScenePresenter = ProfileAddingPresenter(view: profileAddingScene,
                                                                 container: profileAddingScene.container,
                                                                 router: router)
        profileAddingScene.presenter = profileAddingScenePresenter
        
        let editScenePresenter = EditScenePresenter(view: editSceneView, router: router)
        editSceneView.presenter = editScenePresenter
        
        return profileAddingScene
    }
}
