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
    func configuration() -> UIViewController {
        //Configure project here
        let profileAddingScene = ProfileAddingView()
        let editSceneView = EditSceneView()
                
        let router = CoreDataRouter(getView: editSceneView)
        let profileAddingScenePresenter = ProfileAddingPresenter(view: profileAddingScene,
                                                                 router: router)
        profileAddingScene.presenter = profileAddingScenePresenter
        
        let editScenePresenter = EditScenePresenter(view: editSceneView, router: router)
        editSceneView.presenter = editScenePresenter
        
        return profileAddingScene
    }
}
